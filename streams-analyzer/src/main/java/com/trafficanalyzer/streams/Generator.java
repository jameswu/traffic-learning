package com.trafficanalyzer.streams;

import java.io.FileInputStream;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Properties;
import java.util.Random;

import org.apache.kafka.clients.producer.KafkaProducer;
import org.apache.kafka.clients.producer.ProducerRecord;
import org.apache.kafka.common.serialization.Serde;
import org.apache.kafka.common.serialization.Serdes;

import com.trafficanalyzer.streams.entity.JsonPOJOSerde;
import com.trafficanalyzer.streams.entity.TxLog;

public class Generator {

    private static Random random = new Random();
    private static boolean running = true;

    public static void main(String[] args) throws IOException {
        if (args.length != 1) {
            System.out.println("usage: Generator [config]");
            return;
        }

        final Properties config = new Properties();
        config.load(new FileInputStream(args[0]));

        final Serde<String> stringSerde = Serdes.String();
        final JsonPOJOSerde<TxLog> txLogSerde = new JsonPOJOSerde<TxLog>(TxLog.class);

        final KafkaProducer<String, TxLog> producer = new KafkaProducer<String, TxLog>(config, stringSerde.serializer(),
                txLogSerde.serializer());

        while (running) {

            final TxLog value = new TxLog();
            final String deviceId = genDeviceId();
            value.setDeviceId(deviceId);
            value.setPayloadSize(genSize(deviceId));
            value.setMessageType(genTxType());
            value.setUri(genUri());
            value.setResult("SUCCESS");

            producer.send(new ProducerRecord<String, TxLog>("TxLog", value.getDeviceId(), value));

            try {
                Thread.sleep(50);
            } catch (InterruptedException e) {
                // do nothing
            }
        }

        Runtime.getRuntime().addShutdownHook(new Thread(() -> {
            running = false;
            producer.close();
            txLogSerde.close();
        }));
    }

    private static String genUri() {
        return "coap://10.255.8.1" + formatNumber("00/mt", random.nextInt(2) + 1);
    }

    private static String genTxType() {
        return random.nextInt(2) == 0 ? "NIDD-MO" : "NIDD-MT";
    }

    private static int genSize(String deviceId) {
        if ("02".equals(deviceId)) {
            return random.nextInt(400);
        }
        return random.nextInt(100);
    }

    private static String genDeviceId() {
        return formatNumber("00", random.nextInt(4) + 1);
    }

    private static String formatNumber(String pattern, int number) {
        return new DecimalFormat(pattern).format(number);
    }
}
