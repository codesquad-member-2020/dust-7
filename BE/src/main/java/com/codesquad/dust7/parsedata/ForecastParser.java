package com.codesquad.dust7.parsedata;

import com.codesquad.dust7.domain.ForecastData;
import com.codesquad.dust7.openapi.OpenApiRequestData;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.*;

public class ForecastParser {
    public ArrayList<ForecastData> forcastDataParser() throws JSONException {
        final int TOMMOROW_FORCAST_INDEX = 1;
        JSONArray allForecastData = OpenApiRequestData.getforecastData();
        ArrayList<ForecastData> parseTommorowForecastData = new ArrayList<>();
        JSONObject TommorowForecastData = allForecastData.getJSONObject(TOMMOROW_FORCAST_INDEX);
        String dataTime = TommorowForecastData.getString("dataTime");
        String imageUrl1 = TommorowForecastData.getString("imageUrl1");
        String imageUrl2 = TommorowForecastData.getString("imageUrl2");
        String imageUrl3 = TommorowForecastData.getString("imageUrl3");
        String gifFile = TommorowForecastData.getString("imageUrl7");
        String informGrade = TommorowForecastData.getString("informGrade");
        String informCause = TommorowForecastData.getString("informCause");
        String informOverall = TommorowForecastData.getString("informOverall");
        String informData = TommorowForecastData.getString("informData");
        ForecastData dailyAirCondition = new ForecastData(dataTime, imageUrl1, imageUrl2, imageUrl3, gifFile, informGrade, informCause, informOverall, informData);
        parseTommorowForecastData.add(dailyAirCondition);
        return parseTommorowForecastData;
    }
}
