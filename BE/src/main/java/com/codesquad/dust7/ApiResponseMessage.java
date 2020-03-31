package com.codesquad.dust7;

import lombok.Getter;
import lombok.Setter;
import org.json.JSONArray;
import org.springframework.http.HttpStatus;

import java.util.ArrayList;

@Getter @Setter
public class ApiResponseMessage {
    private HttpStatus status;
    private Object message;
    private int statusCode;

    public ApiResponseMessage(HttpStatus status, String message, int statusCode) {
        this.status = status;
        this.message = message;
        this.statusCode = statusCode;
    }
    public ApiResponseMessage(HttpStatus status, ArrayList<OneHourDust> resultArray, int statusCode) {
        this.status = status;
        this.message = resultArray;
        this.statusCode = statusCode;
    }
}
