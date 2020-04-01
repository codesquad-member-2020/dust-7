package com.codesquad.dust7.parsedata;

import com.codesquad.dust7.domain.StationInfoData;
import com.codesquad.dust7.openapi.OpenApiGetData;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.util.ArrayList;

public class StationInfoParser {
    public ArrayList<StationInfoData> stationInformation(String coordinateWGS84) throws IOException, JSONException {
        OpenApiGetData openApiGetData = new OpenApiGetData();

        String coordX = coordinateWGS84.split(",")[0];
        String coordY = coordinateWGS84.split(",")[1];

        JSONObject transferResult = openApiGetData.kakaoTransferAPI(coordX,coordY);
        JSONArray stations = openApiGetData.getStationInformation(transferResult);
        ArrayList<StationInfoData> parseStationInformation = new ArrayList<>();

        JSONObject nearestStation = stations.getJSONObject(0);
        String stationName = nearestStation.getString("stationName");
        String address = nearestStation.getString("addr");
        String length = nearestStation.getString("tm");
        StationInfoData stationInformation = new StationInfoData(stationName,address,length);
        parseStationInformation.add(stationInformation);

        return parseStationInformation;
    }
}
