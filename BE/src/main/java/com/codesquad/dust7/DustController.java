package com.codesquad.dust7;

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
        DailyDustResult dailyDustResult = new DailyDustResult();
        try{
            return new ResponseEntity<>(new ApiResponseMessage(HttpStatus.OK,dailyDustResult.dailyDustParser(stationName),200),HttpStatus.OK);
        }catch (IOException e){
            return new ResponseEntity<>(new ApiResponseMessage(HttpStatus.BAD_REQUEST,"에러가 발생하였습니다!!",404),HttpStatus.BAD_REQUEST);
        }
    }

}