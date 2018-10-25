package com.trafficanalyzer.streams.entity;

import java.util.Map;

import org.apache.kafka.common.serialization.Deserializer;
import org.apache.kafka.common.serialization.Serde;
import org.apache.kafka.common.serialization.Serdes;
import org.apache.kafka.common.serialization.Serializer;
import org.apache.kafka.streams.kstream.TimeWindowedDeserializer;
import org.apache.kafka.streams.kstream.TimeWindowedSerializer;
import org.apache.kafka.streams.kstream.Windowed;

public class WindowedSerde<T> implements Serde<Windowed<T>> {

    private final Serde<Windowed<T>> inner;

    public WindowedSerde(Serde<T> serde) {
        inner = Serdes.serdeFrom(new TimeWindowedSerializer<>(serde.serializer()),
                new TimeWindowedDeserializer<>(serde.deserializer()));
    }

    @Override
    public Serializer<Windowed<T>> serializer() {
        return inner.serializer();
    }

    @Override
    public Deserializer<Windowed<T>> deserializer() {
        return inner.deserializer();
    }

    @Override
    public void configure(Map<String, ?> configs, boolean isKey) {
        inner.serializer().configure(configs, isKey);
        inner.deserializer().configure(configs, isKey);
    }

    @Override
    public void close() {
        inner.serializer().close();
        inner.deserializer().close();
    }
}