package com.codesquad.dust7;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class StationInformation {
    private String stationName;
    private String address;
    private String length;

    public StationInformation(String stationName, String address, String length) {
        this.stationName = stationName;
        this.address = address;
        this.length = length;
    }
}
