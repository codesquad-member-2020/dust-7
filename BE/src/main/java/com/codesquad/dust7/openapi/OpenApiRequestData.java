package com.codesquad.dust7.openapi;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.web.reactive.function.client.WebClient;
import org.springframework.web.util.DefaultUriBuilderFactory;
import java.time.LocalDate;

public class OpenApiRequestData {
//  OPEN API KEY
    public static final String AIR_SERVICEKEY = "afCrvgZOg17BFetVIzUT3QbEQ4f0E4G1fmPGkRUbQwEpAbNgKNWDtydvCFeX7580oiT6FUsuCae398DYvYoN%2BQ%3D%3D";
    public static final String KAKAO_TOKEN = "KakaoAK ac2b1f730c8654ca8bff36525a578c41";

//  OPEN API 공통 주소
    public static final String AIR_BASE_URL = "http://openapi.airkorea.or.kr/openapi/services/rest";
    public static final String KAKAO_BASE_URL = "https://dapi.kakao.com";

//  OPEN API 요청 PATH
    public static final String DUST_DATA_PATH = "/ArpltnInforInqireSvc/getMsrstnAcctoRltmMesureDnsty";
    public static final String FORECAST_DATA_PATH = "/ArpltnInforInqireSvc/getMinuDustFrcstDspth";
    public static final String STATION_INFO_DATA_PATH = "/MsrstnInfoInqireSvc/getNearbyMsrstnList";
    public static final String COORDINATE_TRANSFER_DATA_PATH = "/v2/local/geo/transcoord.json";

    public static JSONArray getdustData(String stationName) throws JSONException {
        DefaultUriBuilderFactory factory = new DefaultUriBuilderFactory(AIR_BASE_URL);
        factory.setEncodingMode(DefaultUriBuilderFactory.EncodingMode.NONE);
        WebClient client = WebClient.builder().uriBuilderFactory(factory).build();
        String response = client.get().uri(uriBuilder -> uriBuilder
                .path(DUST_DATA_PATH)
                .queryParam("ServiceKey", AIR_SERVICEKEY)
                .queryParam("numOfRows", "24")
                .queryParam("pageNo", "1")
                .queryParam("stationName", stationName)
                .queryParam("dataTerm", "DAILY")
                .queryParam("ver", "1.3")
                .queryParam("_returnType", "json")
                .build()).retrieve().bodyToMono(String.class).block();

        JSONObject json = new JSONObject(response);
        return json.getJSONArray("list");
    }

    public static JSONArray getforecastData() throws JSONException {
        DefaultUriBuilderFactory factory = new DefaultUriBuilderFactory(AIR_BASE_URL);
        factory.setEncodingMode(DefaultUriBuilderFactory.EncodingMode.NONE);
        WebClient client = WebClient.builder().uriBuilderFactory(factory).build();
        String response = client.get().uri(uriBuilder -> uriBuilder
                .path(FORECAST_DATA_PATH)
                .queryParam("ServiceKey", AIR_SERVICEKEY)
                .queryParam("searchDate", LocalDate.now().minusDays(1).toString())
                .queryParam("InformCode", "PM10")
                .queryParam("_returnType", "json")
                .build()).retrieve().bodyToMono(String.class).block();

        JSONObject json = new JSONObject(response);
        return json.getJSONArray("list");
    }

    public static JSONObject getWGS84Coordinate(String x, String y) throws JSONException {
        DefaultUriBuilderFactory factory = new DefaultUriBuilderFactory(KAKAO_BASE_URL);
        factory.setEncodingMode(DefaultUriBuilderFactory.EncodingMode.NONE);
        WebClient client = WebClient.builder().uriBuilderFactory(factory).build();
        String response = client.get().uri(uriBuilder -> uriBuilder
                .path(COORDINATE_TRANSFER_DATA_PATH)
                .queryParam("x", x)
                .queryParam("y", y)
                .queryParam("input_coord", "WGS84")
                .queryParam("output_coord", "WTM")
                .build())
                .header(HttpHeaders.AUTHORIZATION, KAKAO_TOKEN)
                .accept(MediaType.APPLICATION_JSON)
                .retrieve().bodyToMono(String.class).block();

        JSONObject json = new JSONObject(response);
        JSONArray jsonArray = json.getJSONArray("documents");
        return jsonArray.getJSONObject(0);
    }

    public static JSONArray getStationInformation(JSONObject tmCoordinate) throws JSONException {
        String tmX = tmCoordinate.getString("x");
        String tmY = tmCoordinate.getString("y");
        DefaultUriBuilderFactory factory = new DefaultUriBuilderFactory(AIR_BASE_URL);
        factory.setEncodingMode(DefaultUriBuilderFactory.EncodingMode.NONE);
        WebClient client = WebClient.builder().uriBuilderFactory(factory).build();
        String response = client.get().uri(uriBuilder -> uriBuilder
                .path(STATION_INFO_DATA_PATH)
                .queryParam("ServiceKey", AIR_SERVICEKEY)
                .queryParam("tmX", tmX)
                .queryParam("tmY", tmY)
                .queryParam("_returnType", "json")
                .build()).retrieve().bodyToMono(String.class).block();

        JSONObject json = new JSONObject(response);
        return json.getJSONArray("list");
    }
}
