package com.codesquad.dust7;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class OneHourDust {
    private String dataTime;
    private String pm10Grade;
    private String pm10Value;

    public OneHourDust(String dataTime, String pm10Grade, String pm10Value) {
        this.dataTime = dataTime;
        this.pm10Grade = pm10Grade;
        this.pm10Value = pm10Value;
    }
}
