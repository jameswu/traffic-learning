package com.trafficanalyzer.streams.entity;

import org.apache.commons.lang3.builder.ToStringBuilder;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class PayloadCount {

    private String deviceId;
    private int totalCount;
    private int bigCount;
    private int mtCount;
    private int moCount;
    private int errorCount;

    public String getDeviceId() {
        return deviceId;
    }

    public void setDeviceId(String deviceId) {
        this.deviceId = deviceId;
    }

    public int getErrorCount() {
        return errorCount;
    }

    public void setErrorCount(int errorCount) {
        this.errorCount = errorCount;
    }

    public int getMtCount() {
        return mtCount;
    }

    public void setMtCount(int mtCount) {
        this.mtCount = mtCount;
    }

    public int getMoCount() {
        return moCount;
    }

    public void setMoCount(int moCount) {
        this.moCount = moCount;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getBigCount() {
        return bigCount;
    }

    public void setBigCount(int bigPayload) {
        this.bigCount = bigPayload;
    }

    @JsonIgnore
    public void increaseBigCount() {
        this.bigCount++;
    }

    @JsonIgnore
    public void increaseMtCount() {
        this.mtCount++;
    }

    @JsonIgnore
    public void increaseMoCount() {
        this.moCount++;
    }

    @JsonIgnore
    public void increaseErrorCount() {
        this.errorCount++;
    }

    @JsonIgnore
    public void increaseTotalCount() {
        this.totalCount++;
    }

    @JsonIgnore
    public float getBigPayloadProportion() {
        if (totalCount == 0) {
            return 0;
        }
        return (float) bigCount / totalCount;
    }

    @JsonIgnore
    public float getErrorRate() {
        if (errorCount == 0) {
            return 0;
        }
        return (float) errorCount / totalCount;
    }

    @JsonIgnore
    public String proportionText() {
        return bigCount + "/" + totalCount + "=" + this.getBigPayloadProportion();
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
