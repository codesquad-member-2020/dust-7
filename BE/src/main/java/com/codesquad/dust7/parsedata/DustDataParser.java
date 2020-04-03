package com.codesquad.dust7.parsedata;

import com.codesquad.dust7.domain.DustData;
import com.codesquad.dust7.openapi.OpenApiRequestData;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

public class DustDataParser {

    public List<DustData> DustDataParser(String stationName) throws JSONException {
        JSONArray dailyDustData = OpenApiRequestData.getdustData(stationName);
        List<DustData> parseDailyDustData = new ArrayList<>();

        for (int i = 0; i < dailyDustData.length(); i++) {
            JSONObject oneHourDustData = dailyDustData.getJSONObject(i);
            String dataTime = oneHourDustData.get("dataTime").toString();
            String pm10Grade = oneHourDustData.get("pm10Grade1h").toString();
            String pm10Value = oneHourDustData.get("pm10Value").toString();
            DustData oneHourDust = new DustData(dataTime, pm10Grade, pm10Value);
            parseDailyDustData.add(oneHourDust);
        }
        return parseDailyDustData;
    }


}
