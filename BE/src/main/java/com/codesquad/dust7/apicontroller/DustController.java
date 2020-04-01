package com.codesquad.dust7.apicontroller;

import com.codesquad.dust7.parsedata.DustDataParser;
import com.codesquad.dust7.message.ApiResponseMessage;
import com.codesquad.dust7.parsedata.ForcastParser;
import com.codesquad.dust7.parsedata.StationInfoParser;
import org.json.JSONException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;

@RestController
public class DustController {

    @GetMapping("/dust-status")
    public ResponseEntity<ApiResponseMessage> responseDayDustResult(@RequestParam String stationName) throws JSONException {
        DustDataParser dustDataParser = new DustDataParser();
        try {
            return new ResponseEntity<>(new ApiResponseMessage(dustDataParser.DustDataParser(stationName)), HttpStatus.OK);
        } catch (IOException e) {
            return new ResponseEntity<>(new ApiResponseMessage("에러가 발생하였습니다!!"), HttpStatus.BAD_REQUEST);
        }
    }

    @GetMapping("/forecast")
    public ResponseEntity<ApiResponseMessage> responseAirConditionResult() throws JSONException {
        ForcastParser forcastParser = new ForcastParser();
        try {
            return new ResponseEntity<>(new ApiResponseMessage(forcastParser.forcastDataParser()), HttpStatus.OK);
        } catch (IOException e) {
            return new ResponseEntity<>(new ApiResponseMessage("에러가 발생하였습니다!!"), HttpStatus.BAD_REQUEST);
        }
    }

    @GetMapping("/location")
    public ResponseEntity<ApiResponseMessage> responseStationInfo(@RequestParam String coordinateWGS84) throws JSONException {
        StationInfoParser stationInfoParser = new StationInfoParser();
        try {
            return new ResponseEntity<>(new ApiResponseMessage(stationInfoParser.stationInformation(coordinateWGS84)), HttpStatus.OK);
        } catch (IOException e) {
            return new ResponseEntity<>(new ApiResponseMessage("에러가 발생하였습니다!!"), HttpStatus.BAD_REQUEST);
        }
    }

}
