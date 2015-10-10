package com.makechange.utils;

public class PlaidClientsideException extends RuntimeException {

    public PlaidClientsideException(String message, Throwable cause) {
        super(message, cause);
    }

    public PlaidClientsideException(String message) {
        super(message);
    }

    public PlaidClientsideException(Throwable cause) {
        super(cause);
    }

}
