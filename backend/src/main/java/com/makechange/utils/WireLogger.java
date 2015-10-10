package com.makechange.utils;

import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpRequestBase;

import com.fasterxml.jackson.databind.JsonNode;

public interface WireLogger {

	void logRequestResponsePair(HttpRequestBase request, CloseableHttpResponse response);
	
	void logRequestResponsePair(HttpRequestBase request, CloseableHttpResponse response, JsonNode jsonResponseBody);
}