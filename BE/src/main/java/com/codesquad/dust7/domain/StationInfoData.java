package com.codesquad.dust7.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class StationInfoData {
    private String stationName;
    private String address;
    private String length;

    public StationInfoData(String stationName, String address, String length) {
        this.stationName = stationName;
        this.address = address;
        this.length = length;
    }
}
