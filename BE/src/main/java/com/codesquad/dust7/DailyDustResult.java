package com.codesquad.dust7;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

public class DailyDustResult {

    public ArrayList<OneHourDust> dailyDustParser(String stationName) throws IOException, JSONException {
        OpenApiGetData openApiGetData = new OpenApiGetData();
        JSONArray dailyDustData = openApiGetData.getDustInfo(stationName);
        ArrayList<OneHourDust> parseDailyDustData = new ArrayList<>();

        for (int i = 0; i < dailyDustData.length(); i++) {
            JSONObject oneHourDustData = dailyDustData.getJSONObject(i);
            String dataTime = oneHourDustData.get("dataTime").toString();
            String pm10Grade = oneHourDustData.get("pm10Grade").toString();
            String pm10Value = oneHourDustData.get("pm10Value").toString();
            OneHourDust oneHourDust = new OneHourDust(dataTime,pm10Grade,pm10Value);
            parseDailyDustData.add(oneHourDust);
        }
        return parseDailyDustData;
    }


}
