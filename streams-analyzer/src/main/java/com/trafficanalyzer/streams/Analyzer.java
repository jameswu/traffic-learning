package com.trafficanalyzer.streams;

import java.io.FileInputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import org.apache.kafka.common.serialization.Serde;
import org.apache.kafka.common.serialization.Serdes;
import org.apache.kafka.common.utils.Bytes;
import org.apache.kafka.streams.Consumed;
import org.apache.kafka.streams.KafkaStreams;
import org.apache.kafka.streams.KeyValue;
import org.apache.kafka.streams.StreamsBuilder;
import org.apache.kafka.streams.Topology;
import org.apache.kafka.streams.kstream.KStream;
import org.apache.kafka.streams.kstream.Materialized;
import org.apache.kafka.streams.kstream.Serialized;
import org.apache.kafka.streams.kstream.TimeWindowedKStream;
import org.apache.kafka.streams.kstream.TimeWindows;
import org.apache.kafka.streams.kstream.Window;
import org.apache.kafka.streams.kstream.Windowed;
import org.apache.kafka.streams.state.KeyValueIterator;
import org.apache.kafka.streams.state.QueryableStoreTypes;
import org.apache.kafka.streams.state.ReadOnlyWindowStore;
import org.apache.kafka.streams.state.WindowStore;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.trafficanalyzer.learning.Predictor;
import com.trafficanalyzer.streams.entity.JsonPOJOSerde;
import com.trafficanalyzer.streams.entity.PayloadCount;
import com.trafficanalyzer.streams.entity.TxLog;

/**
 * Hello world!
 *
 */
public class Analyzer {

    private static final float min_rate = 0.1f;
    private static final float max_rate = 2;
    private static Logger logger = LoggerFactory.getLogger(Analyzer.class);
    private static Logger alarmLogger = LoggerFactory.getLogger("alarm");

    private static ScheduledExecutorService threadPool = Executors.newScheduledThreadPool(2);

    private static Config config;

    private static KafkaStreams streams;
    private static Predictor model;

    public static void main(String[] args) throws IOException {
        if (args.length != 2) {
            System.out.println("usage: Launcher [config] [model-dir]");
            return;
        }

        final String modelDir = args[1];
        model = new Predictor(modelDir);
        model.init();

        final Properties configProperties = new Properties();
        configProperties.load(new FileInputStream(args[0]));

        config = new Config(configProperties);

        final Topology topology = buildTopology();
        streams = new KafkaStreams(topology, configProperties);
        streams.start();

        checkSizeProportaion();

        Runtime.getRuntime().addShutdownHook(new Thread(() -> {
            streams.close();
            model.close();
            threadPool.shutdown();
        }));
    }

    private static Topology buildTopology() {
        final Serde<String> stringSerde = Serdes.String();
        final Serde<Long> longSerde = Serdes.Long();
        final JsonPOJOSerde<TxLog> txLogSerde = new JsonPOJOSerde<TxLog>(TxLog.class);
        final JsonPOJOSerde<PayloadCount> plCountSerde = new JsonPOJOSerde<PayloadCount>(PayloadCount.class);

        final StreamsBuilder builder = new StreamsBuilder();
        final KStream<String, TxLog> origin = builder.stream("TxLog", Consumed.with(stringSerde, txLogSerde));

        final TimeWindowedKStream<String, TxLog> windowedStream = origin
                .groupBy((key, value) -> value == null ? null : value.getDeviceId(),
                        Serialized.with(stringSerde, txLogSerde))
                .windowedBy(TimeWindows.of(config.getTimeWindowInMs()).advanceBy(config.getTimeWindowStepInMs())
                        .until(config.getTimeWindowInMs() * 2));

        windowedStream.aggregate(() -> new PayloadCount(),
                (key, value, payloadCount) -> aggregatePayloadCount(key, value, payloadCount),
                Materialized.<String, PayloadCount, WindowStore<Bytes, byte[]>> as("Proportion")
                        .withValueSerde(plCountSerde));

        origin.groupBy((key, value) -> value == null ? null : value.getUri(), Serialized.with(stringSerde, txLogSerde))
                .windowedBy(TimeWindows.of(config.getTimeWindowInMs()).advanceBy(config.getTimeWindowStepInMs())
                        .until(config.getTimeWindowInMs() * 2))
                .count(Materialized.<String, Long, WindowStore<Bytes, byte[]>> as("URICount")
                        .withValueSerde(longSerde));

        final Topology topology = builder.build();
        logger.debug("Topology: {}", topology.describe());
        return topology;
    }

    private static PayloadCount aggregatePayloadCount(String key, TxLog value, PayloadCount payloadCount) {
        logger.debug("aggregate paylod count: key={}, value={}, payloadCount={}", key, value, payloadCount);

        if (value == null) {
            return null;
        }

        payloadCount.setDeviceId(key);

        payloadCount.increaseTotalCount();
        if (value.getPayloadSize() > config.getBigSizeThreshod()) {
            payloadCount.increaseBigCount();
        }
        if ("NIDD-MO".equals(value.getMessageType())) {
            payloadCount.increaseMoCount();
        }
        if ("NIDD-MT".equals(value.getMessageType())) {
            payloadCount.increaseMtCount();
        }
        if ("FAILED".equals(value.getResult())) {
            payloadCount.increaseErrorCount();
        }

        logger.debug("post aggregate: key={}, value={}, payloadCount={}", key, value, payloadCount);
        return payloadCount;
    }

    private static void checkSizeProportaion() {
        threadPool.scheduleAtFixedRate(() -> {
            try {
                final ReadOnlyWindowStore<String, PayloadCount> proportionStore = streams.store("Proportion",
                        QueryableStoreTypes.windowStore());
                if (proportionStore == null) {
                    logger.debug("state store is not available yet.");
                    return;
                }
                final ReadOnlyWindowStore<String, Long> uriCountStore = streams.store("URICount",
                        QueryableStoreTypes.windowStore());

                final long now = System.currentTimeMillis();
                final long timeFrom = now - config.getTimeWindowStepInMs() - config.getTimeWindowInMs();
                final long timeTo = now - config.getTimeWindowInMs();

                final KeyValueIterator<Windowed<String>, Long> allUriCounts = uriCountStore
                        .fetch("coap://10.255.8.101/mt", "coap://10.255.8.102/mt", timeFrom, timeTo);
                final KeyValueIterator<Windowed<String>, PayloadCount> allProportions = proportionStore.fetch("01",
                        "50", timeFrom, timeTo);

                allUriCounts.forEachRemaining(keyValue -> {
                    final Window window = keyValue.key.window();
                    final String key = keyValue.key.key();
                    final Long value = keyValue.value;

                    if (value >= config.getTpwThreshod()) {
                        raiseAlarm("uri[{}] tpm[{}] reach threshold[{}] in [{}]", key, value, config.getTpwThreshod(),
                                toString(window));
                    }
                });

                float totalCount = 0;
                final Map<PayloadCount, Window> counts = new HashMap<PayloadCount, Window>();

                while (allProportions.hasNext()) {
                    final KeyValue<Windowed<String>, PayloadCount> keyValue = allProportions.next();
                    final Window window = keyValue.key.window();
                    final String key = keyValue.key.key();
                    final PayloadCount value = keyValue.value;

                    if (value.getBigPayloadProportion() >= config.getProportionThreshod()) {
                        raiseAlarm("device[{}] big size payload rate [{}] reach threshold[{}] in [{}]", key,
                                value.proportionText(), config.getProportionThreshod(), toString(window));
                    }

                    //                    final float tps = (float) value.getTotalCount() / config.getTimeWindowInSecond();
                    //                    if (tps >= config.getTpwThreshod()) {
                    //                        raiseAlarm("device[{}] tpm[{}] reach threshold[{}] in [{}]", key, tps, config.getTpwThreshod(),
                    //                                toString(window));
                    //                    }

                    if (value.getTotalCount() > totalCount) {
                        totalCount = value.getTotalCount();
                    }
                    counts.put(value, window);
                }

                final float max = normalizeRate(totalCount / 60);
                counts.forEach((count, window) -> {
                    if (!model.predict(count, max)) {
                        raiseAlarm("device[{}] is detected abnormal in [{}]", count.getDeviceId(), toString(window));
                    }
                });
            } catch (Exception e) {
                logger.debug(e.getMessage());
            }
        }, 0, config.getTimeWindowStepInMs(), TimeUnit.MILLISECONDS);
    }

    private static float normalizeRate(float rate) {
        return (rate - min_rate) / (max_rate - min_rate);
    }

    private static void raiseAlarm(String msg, Object... objects) {
        alarmLogger.info("alarm: " + msg, objects);
    }

    private static String toString(Window window) {
        return toString(window.start()) + "->" + toString(window.end());
    }

    private static String toString(Long timestamp) {
        return new SimpleDateFormat("hh:mm:ss").format(new Date(timestamp));
    }

    private static class Config {
        private Properties properties;

        private Config(Properties properties) {
            this.properties = properties;
        }

        public int getBigSizeThreshod() {
            return Integer.valueOf(this.properties.getProperty("big.size.threshod"));
        }

        public float getProportionThreshod() {
            return Float.valueOf(this.properties.getProperty("big.size.proportion.threshod"));
        }

        public int getTimeWindowInSecond() {
            return Integer.valueOf(this.properties.getProperty("time.window.in.second"));
        }

        public int getTimeWindowInMs() {
            return this.getTimeWindowInSecond() * 1000;
        }

        public int getTimeWindowStepInSecond() {
            return Integer.valueOf(this.properties.getProperty("time.window.step.in.second"));
        }

        public int getTimeWindowStepInMs() {
            return this.getTimeWindowStepInSecond() * 1000;
        }

        public int getTpwThreshod() {
            return Integer.valueOf(this.properties.getProperty("tx.per.window.threshod"));
        }
    }
}
