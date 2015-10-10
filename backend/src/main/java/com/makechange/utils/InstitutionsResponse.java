package com.makechange.utils;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown=true)
public class InstitutionsResponse {

    private Institution[] institutions;

    public InstitutionsResponse(Institution[] institutions) {
        this.institutions = institutions;
    }

    public Institution[] getInstitutions() {
        return institutions;
    }
}
