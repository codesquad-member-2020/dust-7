package com.codesquad.dust7.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DustData {
    private String dataTime;
    private String pm10Grade;
    private String pm10Value;
    private String pmMessage;

    public DustData(String dataTime, String pm10Grade, String pm10Value) {
        this.dataTime = dataTime;
        this.pm10Grade = pm10Grade;
        this.pm10Value = pm10Value;
        this.pmMessage = getPmMessage(pm10Grade);
    }

    public String getPmMessage(String pm10Grade) {
        switch (pm10Grade) {
            case "1":
                return "좋음";
            case "2":
                return "보통";
            case "3":
                return "나쁨";
            case "4":
                return "매우 나쁨";
            default:
                return "몰라";
        }

    }
}
