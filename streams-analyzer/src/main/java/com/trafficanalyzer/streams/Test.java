package com.trafficanalyzer.streams;

import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;

import org.apache.kafka.common.serialization.Serde;
import org.apache.kafka.common.serialization.Serdes;
import org.apache.kafka.common.utils.Bytes;
import org.apache.kafka.streams.Consumed;
import org.apache.kafka.streams.KafkaStreams;
import org.apache.kafka.streams.KeyValue;
import org.apache.kafka.streams.StreamsBuilder;
import org.apache.kafka.streams.Topology;
import org.apache.kafka.streams.kstream.KStream;
import org.apache.kafka.streams.kstream.KTable;
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
import org.tensorflow.Graph;

import com.trafficanalyzer.streams.entity.JsonPOJOSerde;
import com.trafficanalyzer.streams.entity.PayloadCount;
import com.trafficanalyzer.streams.entity.SizeProportion;
import com.trafficanalyzer.streams.entity.TxLog;

/**
 * Hello world!
 *
 */
public class Test {

    private static final int TIME_WINDOW_IN_S = 60;
    private static final int TIME_WINIDOW = 1000 * TIME_WINDOW_IN_S;
    private static final int WINDOW_STEP = 1000 * 10;
    private static final int THRESHOLD = 5;

    private static boolean printing = true;

    private static Logger logger = LoggerFactory.getLogger(Test.class);
    private static Logger printLogger = LoggerFactory.getLogger("printer");
    private static Logger alarmLogger = LoggerFactory.getLogger("alarm");

    public static void main(String[] args) throws IOException {
        if (args.length != 1) {
            System.out.println("usage: Launcher [config]");
            return;
        }
        final Properties config = new Properties();
        config.load(new FileInputStream(args[0]));

        final Topology topology = buildTopology();
        final KafkaStreams streams = new KafkaStreams(topology, config);

        streams.start();

        print(streams);

        Runtime.getRuntime().addShutdownHook(new Thread(() -> {
            streams.close();
            printing = false;
        }));
    }

    private static Topology buildTopology() {
        final Serde<String> stringSerde = Serdes.String();
        final Serde<Integer> integerSerde = Serdes.Integer();
        final JsonPOJOSerde<TxLog> txLogSerde = new JsonPOJOSerde<TxLog>(TxLog.class);
        final JsonPOJOSerde<PayloadCount> plCountSerde = new JsonPOJOSerde<PayloadCount>(PayloadCount.class);
        final JsonPOJOSerde<SizeProportion> roportionSerde = new JsonPOJOSerde<SizeProportion>(SizeProportion.class);

        final StreamsBuilder builder = new StreamsBuilder();
        final KStream<String, TxLog> origin = builder.stream("TxLog", Consumed.with(stringSerde, txLogSerde));

        final TimeWindowedKStream<String, TxLog> windowedStream = origin
                .groupBy((key, value) -> value == null ? null : value.getDeviceId(),
                        Serialized.with(stringSerde, txLogSerde))
                .windowedBy(TimeWindows.of(TIME_WINIDOW).advanceBy(WINDOW_STEP));

        final KTable<Windowed<String>, PayloadCount> aggregate = windowedStream.aggregate(() -> new PayloadCount(),
                (key, value, payloadCount) -> aggregatePayloadCount(key, value, payloadCount),
                Materialized.<String, PayloadCount, WindowStore<Bytes, byte[]>> as("Proportion")
                        .withValueSerde(plCountSerde));

        aggregate.groupBy((key, value) -> test(key, value));
        //                        Materialized.<String, SizeProportion, WindowStore<Bytes, byte[]>> as("Proportion")
        //                                .withValueSerde(propSerde))
        //                .toStream().groupBy((key, value) -> key).aggregate(()->, aggregator);//.foreach((key, value) -> handleSizeProportion(key, value));

        windowedStream.count().toStream().foreach((key, value) -> handleCount(key, value));

        final Topology topology = builder.build();
        logger.debug("Topology: {}", topology.describe());
        return topology;
    }

    private static KeyValue<Windowed<String>, Integer> test(Windowed<String> key, PayloadCount value) {
        value.getMtCount();
        return new KeyValue<Windowed<String>, Integer>(key, value.getMtCount());
    }

    private static PayloadCount aggregatePayloadCount(String key, TxLog value, PayloadCount payloadCount) {
        logger.debug("aggregate paylod count: key={}, value={}, payloadCount={}", key, value, payloadCount);
        payloadCount.increaseTotalCount();
        if (value.getPayloadSize() > 200) {
            payloadCount.increaseBigCount();
        }
        logger.debug("post aggregate: key={}, value={}, payloadCount={}", key, value, payloadCount);
        return payloadCount;
    }

    private static SizeProportion handleSizeProportion(Windowed<String> key, SizeProportion value) {
        logger.debug("handle a size proportion: key={}, value={}", key, value);
        if (value != null && !value.isAlarmRaised() && value.getBigPayloadProportion() >= 50) {
            riseAlarm("device[" + key.key() + "] big size request[" + value.getBigPayload() + "/"
                    + value.getTotalCount() + "] reach 50%", key.window());
            value.setAlarmRaised(true);
        }
        return value;
    }

    private static void handleCount(Windowed<String> key, Long value) {
        logger.debug("handle counting: key={}, value={}", key, value);
        final long tps = value / TIME_WINDOW_IN_S;
        if (tps >= THRESHOLD) {
            riseAlarm("device[" + key.key() + "] tps[" + tps + "] reach threshold[" + THRESHOLD + "]", key.window());
        }
    }

    private static void riseAlarm(String msg, Window window) {
        alarmLogger.warn("raise alarm: {}, in time window [{} -> {}]", msg, toString(window.start()),
                toString(window.end()));
    }

    private static String toString(Long timestamp) {
        return new SimpleDateFormat("hh:mm:ss.SSS").format(new Date(timestamp));
    }

    private static void print(KafkaStreams streams) {
        new Thread(() -> {
            while (printing) {
                try {
                    printLogger.info("===================================================================");
                    final ReadOnlyWindowStore<String, Long> proportionStore = streams.store("Proportion",
                            QueryableStoreTypes.windowStore());
                    final long now = System.currentTimeMillis();
                    final KeyValueIterator<Windowed<String>, Long> allProportions = proportionStore.fetch("02", "02",
                            now - WINDOW_STEP - TIME_WINIDOW, now - TIME_WINIDOW);
                    while (allProportions.hasNext()) {
                        final KeyValue<Windowed<String>, Long> keyValue = allProportions.next();
                        final Window window = keyValue.key.window();
                        printLogger.info("key={}, window={} -> {}, value={}", keyValue.key.key(),
                                toString(window.start()), toString(window.end()), keyValue.value);
                    }
                } catch (Exception e) {
                    logger.debug(e.getMessage());
                }
                try {
                    Thread.sleep(5 * 1000);
                } catch (InterruptedException ie) {
                    // do nothing
                }
            }
        }).start();
    }

    private static void createModel() {
        final byte[] graphDef = readAllBytesOrExit(Paths.get("./", "model.pb"));
        final Graph g = new Graph();
        g.importGraphDef(graphDef);
    }

    private static byte[] readAllBytesOrExit(Path path) {
        try {
            return Files.readAllBytes(path);
        } catch (IOException e) {
            logger.error("Failed to read [{}]: {}", path, e.getMessage());
            System.exit(1);
        }
        return null;
    }
}
