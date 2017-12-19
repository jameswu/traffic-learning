package com.trafficanalyzer.streams.entity;

import java.util.Map;

import org.apache.kafka.common.errors.SerializationException;
import org.apache.kafka.common.serialization.Deserializer;
import org.apache.kafka.common.serialization.Serde;
import org.apache.kafka.common.serialization.Serializer;

import com.fasterxml.jackson.databind.ObjectMapper;

public class JsonPOJOSerde<T> implements Serde<T> {

    private final ObjectMapper mapper = new ObjectMapper();
    private final Class<T> cls;

    public JsonPOJOSerde(Class<T> cls) {
        this.cls = cls;
    }

    @Override
    @SuppressWarnings("unused")
    public void configure(Map<String, ?> configs, boolean isKey) {
        // do nothing
    }

    @Override
    public void close() {
        // do nothing
    }

    @Override
    public Serializer<T> serializer() {
        return new Serializer<T>() {

            @Override
            @SuppressWarnings("unused")
            public void configure(Map<String, ?> configs, boolean isKey) {
                // do nothing
            }

            @Override
            @SuppressWarnings("unused")
            public byte[] serialize(String topic, T data) {
                try {
                    return mapper.writeValueAsBytes(data);
                } catch (Exception e) {
                    throw new SerializationException("Error serializing JSON message", e);
                }
            }

            @Override
            public void close() {
                // do nothing
            }
        };

    }

    @Override
    public Deserializer<T> deserializer() {
        return new Deserializer<T>() {
            @Override
            @SuppressWarnings("unused")
            public void configure(Map<String, ?> configs, boolean isKey) {
                // do nothing
            }

            @Override
            @SuppressWarnings("unused")
            public T deserialize(String topic, byte[] data) {
                T result = null;
                try {
                    if (data.length > 0) {
                        result = mapper.readValue(data, cls);
                    }
                } catch (Exception e) {
                    //                    throw new SerializationException(e);
                }

                return result;
            }

            @Override
            public void close() {
                // do nothing
            }
        };
    }
}