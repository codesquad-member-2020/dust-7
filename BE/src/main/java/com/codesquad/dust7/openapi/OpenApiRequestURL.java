package com.codesquad.dust7.openapi;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.time.LocalDate;

public class OpenApiRequestURL {
    public static final String AIR_SERVICEKEY = "afCrvgZOg17BFetVIzUT3QbEQ4f0E4G1fmPGkRUbQwEpAbNgKNWDtydvCFeX7580oiT6FUsuCae398DYvYoN%2BQ%3D%3D";
    public static final String DUST_DATA_REQUEST_URL = "http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getMsrstnAcctoRltmMesureDnsty";
    public static final String FORECAST_DATA_REQUEST_URL = "http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getMinuDustFrcstDspth";
    public static final String STATION_INFO_REQUEST_URL = "http://openapi.airkorea.or.kr/openapi/services/rest/MsrstnInfoInqireSvc/getNearbyMsrstnList";
    public static final String COORDINATE_TRANSFER_REQUEST_URL = "https://dapi.kakao.com/v2/local/geo/transcoord.json";

    public static URL dustDataRequestURL(String stationName) {
        StringBuilder urlBuilder = new StringBuilder(DUST_DATA_REQUEST_URL); /*URL*/
        try {
            urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8") + "=" + AIR_SERVICEKEY); /*Service Key*/
            urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("24", "UTF-8")); /*한 페이지 결과 수*/
            urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/
            urlBuilder.append("&" + URLEncoder.encode("stationName", "UTF-8") + "=" + URLEncoder.encode(stationName, "UTF-8")); /*측정소 이름*/
            urlBuilder.append("&" + URLEncoder.encode("dataTerm", "UTF-8") + "=" + URLEncoder.encode("DAILY", "UTF-8")); /*요청 데이터기간 (하루 : DAILY, 한달 : MONTH, 3달 : 3MONTH)*/
            urlBuilder.append("&" + URLEncoder.encode("ver", "UTF-8") + "=" + URLEncoder.encode("1.3", "UTF-8")); /*버전별 상세 결과 참고문서 참조*/
            urlBuilder.append("&" + URLEncoder.encode("_returnType", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8"));
            return new URL(urlBuilder.toString());
        } catch (UnsupportedEncodingException | MalformedURLException e) {
            System.out.println("여기 로거로 변경해서 에러 찍으면 된다.");
        }
        return null;
    }

    public static URL forecastDataRequestURL() {
        StringBuilder urlBuilder = new StringBuilder(FORECAST_DATA_REQUEST_URL); /*URL*/
        LocalDate yesterDay = LocalDate.now().minusDays(1);
        try {
            urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8") + "=" + AIR_SERVICEKEY); /*Service Key*/
            urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수 (조회 날짜로 검색 시 사용 안함)*/
            urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호(조회 날짜로 검색 시 사용 안함)*/
            urlBuilder.append("&" + URLEncoder.encode("searchDate", "UTF-8") + "=" + URLEncoder.encode(yesterDay.toString(), "UTF-8")); /*통보시간 검색 (조회 날짜 입력 없을 경우 한달동안 예보통보 발령 날짜의 리스트 정보를 확인)*/
            urlBuilder.append("&" + URLEncoder.encode("InformCode", "UTF-8") + "=" + URLEncoder.encode("PM10", "UTF-8")); /*통보코드검색 (PM10 : 미세먼지 PM25 : 초미세먼지 O3 : 오존)*/
            urlBuilder.append("&" + URLEncoder.encode("_returnType", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8"));
            return new URL(urlBuilder.toString());
        } catch (UnsupportedEncodingException | MalformedURLException e) {
            System.out.println("여기 로거로 변경해서 에러 찍으면 된다.");
        }
        return null;
    }

    public static URL coordinateTransferRequestURL(String coordX, String coordY) {
        StringBuilder urlBuilder = new StringBuilder(COORDINATE_TRANSFER_REQUEST_URL);
        try {
            urlBuilder.append("?" + URLEncoder.encode("x", "UTF-8") + "=" + URLEncoder.encode(coordX, "UTF-8"));
            urlBuilder.append("&" + URLEncoder.encode("y", "UTF-8") + "=" + URLEncoder.encode(coordY, "UTF-8"));
            urlBuilder.append("&" + URLEncoder.encode("input_coord", "UTF-8") + "=" + URLEncoder.encode("WGS84", "UTF-8"));
            urlBuilder.append("&" + URLEncoder.encode("output_coord", "UTF-8") + "=" + URLEncoder.encode("WTM", "UTF-8"));
            return new URL(urlBuilder.toString());    /*URL*/
        } catch (UnsupportedEncodingException | MalformedURLException e) {
            System.out.println("여기 로거로 변경해서 에러 찍으면 된다.");
        }
        return null;
    }

    public static URL stationInfoRequestURL(JSONObject CoordinateTM) {
        StringBuilder urlBuilder = new StringBuilder(STATION_INFO_REQUEST_URL); /*URL*/
        try {
            String tmX = CoordinateTM.getString("x");
            String tmY = CoordinateTM.getString("y");
            urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8") + "=" + AIR_SERVICEKEY); /*Service Key*/
            urlBuilder.append("&" + URLEncoder.encode("tmX", "UTF-8") + "=" + URLEncoder.encode(tmX, "UTF-8")); /*TM측정방식 X좌표*/
            urlBuilder.append("&" + URLEncoder.encode("tmY", "UTF-8") + "=" + URLEncoder.encode(tmY, "UTF-8")); /*TM측정방식 Y좌표*/
            urlBuilder.append("&" + URLEncoder.encode("_returnType", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8"));
            return new URL(urlBuilder.toString());
        } catch (UnsupportedEncodingException | MalformedURLException | JSONException e) {
            System.out.println("여기 로거로 변경해서 에러 찍으면 된다.");
        }
        return null;
    }
}
