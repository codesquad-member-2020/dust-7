package com.codesquad.dust7.openapi;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class OpenApiGetData {


    public JSONArray getStationDailyDustInfo(String stationName) throws IOException {
        URL url = OpenApiRequestURL.dustDataRequestURL(stationName);
        System.out.println(url.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode()); // logger로 변경 할 것
        BufferedReader rd;
        if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();

        try {
            JSONObject json = new JSONObject(sb.toString());
            return (JSONArray) json.get("list");
        } catch (JSONException e) {
            System.out.println("json이 아닙니다.!!!");
        }
        return null;
    }

    public JSONArray getAirCondition() throws IOException {
        URL url = OpenApiRequestURL.forecastDataRequestURL();
        System.out.println(url.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode()); // logger로 변경 할 것
        BufferedReader rd;
        if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();

        try {
            JSONObject json = new JSONObject(sb.toString());
            return (JSONArray) json.get("list");
        } catch (JSONException e) {
            System.out.println("json이 아닙니다.!!!");
        }
        return null;
    }

    public JSONObject kakaoTransferAPI(String coordX, String coordY) throws IOException {
        URL url = OpenApiRequestURL.coordinateTransferRequestURL(coordX,coordY);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Authorization", "KakaoAK ac2b1f730c8654ca8bff36525a578c41");
        System.out.println("Response code: " + conn.getResponseCode()); // logger로 변경 할 것
        BufferedReader rd;

        if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();

        try {
            JSONObject json = new JSONObject(sb.toString());
            JSONArray jsonArray = (JSONArray) json.get("documents");
            return jsonArray.getJSONObject(0);
        } catch (JSONException e) {
            System.out.println("JSON 형식이 아닙니다.");
        }

        return null;
    }

    public JSONArray getStationInformation(JSONObject tmCoordinate) throws IOException {
        URL url = OpenApiRequestURL.stationInfoRequestURL(tmCoordinate);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();

        try {
            JSONObject json = new JSONObject(sb.toString());
            return (JSONArray) json.get("list");
        } catch (JSONException e) {
            System.out.println("json이 아닙니다.!!!");
        }
        return null;
    }
}
