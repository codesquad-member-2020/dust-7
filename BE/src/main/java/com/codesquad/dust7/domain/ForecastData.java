package com.codesquad.dust7.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ForecastData {
    private String dataTime;
    private String imageUrl1;
    private String imageUrl2;
    private String imageUrl3;
    private String gifFile;
    private String informGrade;
    private String informCause;
    private String informOverall;
    private String informData;

    public ForecastData(String dataTime, String imageUrl1, String imageUrl2, String imageUrl3, String gifFile, String informGrade, String informCause, String informOverall, String informData) {
        this.dataTime = dataTime;
        this.imageUrl1 = imageUrl1;
        this.imageUrl2 = imageUrl2;
        this.imageUrl3 = imageUrl3;
        this.gifFile = gifFile;
        this.informGrade = informGrade;
        this.informCause = informCause;
        this.informOverall = informOverall;
        this.informData = informData;
    }
}
