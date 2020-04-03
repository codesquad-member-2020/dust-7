package com.codesquad.dust7.apicontroller;

import com.codesquad.dust7.domain.DustData;
import com.codesquad.dust7.domain.ForecastData;
import com.codesquad.dust7.domain.StationInfoData;
import com.codesquad.dust7.message.ErrorMessage;
import com.codesquad.dust7.parsedata.DustDataParser;
import com.codesquad.dust7.message.ApiResponseMessage;
import com.codesquad.dust7.parsedata.ForecastParser;
import com.codesquad.dust7.parsedata.StationInfoParser;
import org.json.JSONException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@CrossOrigin
public class DustController {

    @GetMapping("/dust-status")
    public ResponseEntity<ApiResponseMessage> responseDayDustResult(@RequestParam String stationName) throws JSONException {
        DustDataParser dustDataParser = new DustDataParser();

        try {
            List<DustData> dustData = dustDataParser.DustDataParser(stationName);
            if (dustData.isEmpty()) {
                return new ResponseEntity<>(new ApiResponseMessage(ErrorMessage.badRequestMessage()), HttpStatus.BAD_REQUEST);
            }
            return new ResponseEntity<>(new ApiResponseMessage(dustDataParser.DustDataParser(stationName)), HttpStatus.OK);
        } catch (NullPointerException e){
            return new ResponseEntity<>(new ApiResponseMessage(ErrorMessage.getnulldataMessage()), HttpStatus.BAD_REQUEST);
        }

    }

    @GetMapping("/forecast")
    public ResponseEntity<ApiResponseMessage> responseAirConditionResult() throws JSONException {
        ForecastParser forcastParser = new ForecastParser();
        try {
            List<ForecastData> forecastData = forcastParser.forcastDataParser();
            if (forecastData.isEmpty()) {
                return new ResponseEntity<>(new ApiResponseMessage(ErrorMessage.badRequestMessage()), HttpStatus.BAD_REQUEST);
            }
            return new ResponseEntity<>(new ApiResponseMessage(forcastParser.forcastDataParser()), HttpStatus.OK);
        } catch (NullPointerException e){
            return new ResponseEntity<>(new ApiResponseMessage(ErrorMessage.getnulldataMessage()), HttpStatus.BAD_REQUEST);
        }
    }

    @GetMapping("/location")
    public ResponseEntity<ApiResponseMessage> responseStationInfo(@RequestParam String coordinateWGS84) throws JSONException {
        StationInfoParser stationInfoParser = new StationInfoParser();
        try {
            List<StationInfoData> stationInfoData = stationInfoParser.stationInformation(coordinateWGS84);
            if (stationInfoData.isEmpty()) {
                return new ResponseEntity<>(new ApiResponseMessage(ErrorMessage.badRequestMessage()), HttpStatus.BAD_REQUEST);
            }
            return new ResponseEntity<>(new ApiResponseMessage(stationInfoParser.stationInformation(coordinateWGS84)), HttpStatus.OK);
        } catch (NullPointerException e){
            return new ResponseEntity<>(new ApiResponseMessage(ErrorMessage.getnulldataMessage()), HttpStatus.BAD_REQUEST);
        }

    }

}
