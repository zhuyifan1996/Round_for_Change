package com.makechange.utils;

import com.makechange.utils.ErrorResponse;

public class PlaidServersideException extends RuntimeException {
    
    private ErrorResponse errorResponse;
    private int httpStatusCode;
    
    public PlaidServersideException(ErrorResponse errorResponse, int httpStatusCode) {
        this.errorResponse = errorResponse;
        this.httpStatusCode = httpStatusCode;
    }

    public ErrorResponse getErrorResponse() {
        return errorResponse;
    }
    
    public int getHttpStatusCode() {
		return httpStatusCode;
	}
    
}
