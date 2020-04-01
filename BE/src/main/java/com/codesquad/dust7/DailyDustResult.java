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
        JSONArray dailyDustData = openApiGetData.getStationDailyDustInfo(stationName);
        ArrayList<OneHourDust> parseDailyDustData = new ArrayList<>();

        for (int i = 0; i < dailyDustData.length(); i++) {
            JSONObject oneHourDustData = dailyDustData.getJSONObject(i);
            String dataTime = oneHourDustData.get("dataTime").toString();
            String pm10Grade = oneHourDustData.get("pm10Grade").toString();
            String pm10Value = oneHourDustData.get("pm10Value").toString();
            OneHourDust oneHourDust = new OneHourDust(dataTime, pm10Grade, pm10Value);
            parseDailyDustData.add(oneHourDust);
        }
        return parseDailyDustData;
    }

    public ArrayList<DailyAirCondition> dailyAirConditionParser() throws IOException, JSONException {
        OpenApiGetData openApiGetData = new OpenApiGetData();
        JSONArray dailyAirConditionData = openApiGetData.getAirCondition();
        ArrayList<DailyAirCondition> parseDailyAirCondition = new ArrayList<>();

        JSONObject oneAirData = dailyAirConditionData.getJSONObject(1);
        String dataTime = oneAirData.get("dataTime").toString();
        String imageUrl1 = oneAirData.get("imageUrl1").toString();
        String imageUrl2 = oneAirData.get("imageUrl2").toString();
        String imageUrl3 = oneAirData.get("imageUrl3").toString();
        String gifFile = oneAirData.get("imageUrl7").toString();
        String informGrade = oneAirData.get("informGrade").toString();
        String informCause = oneAirData.get("informCause").toString();
        String informOverall = oneAirData.get("informOverall").toString();
        DailyAirCondition dailyAirCondition = new DailyAirCondition(dataTime,imageUrl1,imageUrl2,imageUrl3,gifFile,informGrade,informCause,informOverall);
        parseDailyAirCondition.add(dailyAirCondition);

        return parseDailyAirCondition;
    }

    public ArrayList<StationInformation> stationInformations(String coordinateWGS84) throws IOException, JSONException {
        OpenApiGetData openApiGetData = new OpenApiGetData();

        String coordX = coordinateWGS84.split(",")[0];
        String coordY = coordinateWGS84.split(",")[1];

        JSONObject transferResult = openApiGetData.kakaoTransferAPI(coordX,coordY);
        JSONArray stations = openApiGetData.getStationInformation(transferResult);
        ArrayList<StationInformation> parseStationInformation = new ArrayList<>();

        JSONObject nearestStation = stations.getJSONObject(0);
        String stationName = nearestStation.getString("stationName");
        String address = nearestStation.getString("addr");
        String length = nearestStation.getString("tm");
        StationInformation stationInformation = new StationInformation(stationName,address,length);
        parseStationInformation.add(stationInformation);

        return parseStationInformation;
    }

}
