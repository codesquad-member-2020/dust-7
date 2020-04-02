package com.codesquad.dust7.parsedata;

import com.codesquad.dust7.domain.StationInfoData;
import com.codesquad.dust7.openapi.OpenApiRequestData;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;

public class StationInfoParser {
    public ArrayList<StationInfoData> stationInformation(String coordinateWGS84) throws JSONException {
        String coordX = coordinateWGS84.split(",")[0];
        String coordY = coordinateWGS84.split(",")[1];
        final int STATION_INDEX = 0;

        JSONObject transferResult = OpenApiRequestData.getWGS84Coordinate(coordX, coordY);
        JSONArray stations = OpenApiRequestData.getStationInformation(transferResult);
        ArrayList<StationInfoData> parseStationInformation = new ArrayList<>();

        JSONObject nearestStation = stations.getJSONObject(STATION_INDEX);
        String stationName = nearestStation.getString("stationName");
        String address = nearestStation.getString("addr");
        String length = nearestStation.getString("tm");
        StationInfoData stationInformation = new StationInfoData(stationName, address, length);
        parseStationInformation.add(stationInformation);

        return parseStationInformation;
    }
}
