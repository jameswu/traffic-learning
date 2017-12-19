package com.trafficanalyzer.streams.entity;

import org.apache.commons.lang3.builder.ToStringBuilder;

public class TxLog {

    private String deviceId;
    private String messageType;
    private String uri;
    private int payloadSize;
    private String result;
    private String timestamp;

    public String getDeviceId() {
        return deviceId;
    }

    public String getMessageType() {
        return messageType;
    }

    public int getPayloadSize() {
        return payloadSize;
    }

    public String getResult() {
        return result;
    }

    public String getTimestamp() {
        return timestamp;
    }

    public String getUri() {
        return uri;
    }

    public void setDeviceId(String deviceId) {
        this.deviceId = deviceId;
    }

    public void setMessageType(String txType) {
        this.messageType = txType;
    }

    public void setPayloadSize(int size) {
        this.payloadSize = size;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public void setTimestamp(String timestamp) {
        this.timestamp = timestamp;
    }

    public void setUri(String uri) {
        this.uri = uri;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
