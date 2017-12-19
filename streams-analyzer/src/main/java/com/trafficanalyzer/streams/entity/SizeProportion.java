package com.trafficanalyzer.streams.entity;

import org.apache.commons.lang3.builder.ToStringBuilder;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class SizeProportion {

    private int totalCount;
    private int bigPayload;
    private boolean alarmRaised;

    public boolean isAlarmRaised() {
        return alarmRaised;
    }

    public void setAlarmRaised(boolean alarmRaised) {
        this.alarmRaised = alarmRaised;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getBigPayload() {
        return bigPayload;
    }

    public void setBigPayload(int bigPayload) {
        this.bigPayload = bigPayload;
    }

    @JsonIgnore
    public void increaseBigPayload() {
        this.bigPayload++;
    }

    @JsonIgnore
    public void increaseTotalCount() {
        this.totalCount++;
    }

    @JsonIgnore
    public int getBigPayloadProportion() {
        if (totalCount == 0) {
            return 0;
        }
        return 100 * bigPayload / totalCount;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
