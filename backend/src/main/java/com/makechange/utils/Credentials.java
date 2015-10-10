package com.makechange.utils;

public class Credentials {
    
    private String username;
    private String password;
    private String pin;

    public Credentials(String username, String password) {
        // the json serializer will not include the pin when it is null
        this(username, password, null);
    }
    
    public Credentials(String username, String password, String pin) {
        this.username = username;
        this.password = password;
        this.pin = pin;
    }

    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getPin() {
        return pin;
    }
    public void setPin(String pin) {
        this.pin = pin;
    }

}
