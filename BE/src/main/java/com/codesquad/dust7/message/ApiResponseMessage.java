package com.codesquad.dust7.message;

import lombok.Getter;
import lombok.Setter;
import org.json.JSONArray;
import org.springframework.http.HttpStatus;

import java.util.ArrayList;

@Getter
@Setter
public class ApiResponseMessage {
    private Object ResponseMessage;

    public ApiResponseMessage(String ResponseMessage) {
        this.ResponseMessage = ResponseMessage;
    }

    public ApiResponseMessage(Object resultArray) {
        this.ResponseMessage = resultArray;
    }
}
