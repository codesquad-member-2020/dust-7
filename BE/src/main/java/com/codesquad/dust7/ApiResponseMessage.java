package com.codesquad.dust7;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.json.JSONArray;
import org.springframework.http.HttpStatus;

public class ApiResponseMessage {
    private HttpStatus status;
    private Object message;
    private int statusCode;

    private ApiResponseMessage() {}

    public ApiResponseMessage(HttpStatus status, String message, int statusCode) {
        this();
        this.status = status;
        this.message = message;
        this.statusCode = statusCode;
    }
    public ApiResponseMessage(HttpStatus status, JSONArray jsonArray, int statusCode) {
        this();
        this.status = status;
        this.message = jsonArray;
        this.statusCode = statusCode;
    }
}
