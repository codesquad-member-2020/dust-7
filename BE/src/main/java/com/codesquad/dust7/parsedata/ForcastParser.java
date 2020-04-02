package com.codesquad.dust7.parsedata;

import com.codesquad.dust7.domain.ForecastData;
import com.codesquad.dust7.openapi.OpenApiRequestData;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;

public class ForcastParser {
    public ArrayList<ForecastData> forcastDataParser() throws JSONException {
        JSONArray dailyAirConditionData = OpenApiRequestData.getforecastData();
        ArrayList<ForecastData> parseDailyAirCondition = new ArrayList<>();
        JSONObject oneAirData = dailyAirConditionData.getJSONObject(1);
        String dataTime = oneAirData.getString("dataTime");
        String imageUrl1 = oneAirData.getString("imageUrl1");
        String imageUrl2 = oneAirData.getString("imageUrl2");
        String imageUrl3 = oneAirData.getString("imageUrl3");
        String gifFile = oneAirData.getString("imageUrl7");
        String informGrade = oneAirData.getString("informGrade");
        String informCause = oneAirData.getString("informCause");
        String informOverall = oneAirData.getString("informOverall");
        String informData = oneAirData.getString("informData");
        ForecastData dailyAirCondition = new ForecastData(dataTime,imageUrl1,imageUrl2,imageUrl3,gifFile,informGrade,informCause,informOverall,informData);
        parseDailyAirCondition.add(dailyAirCondition);

        return parseDailyAirCondition;
    }
}
