package com.alisher.httpbin.util;

import io.restassured.RestAssured;
import io.restassured.http.ContentType;
import io.restassured.response.Response;

import java.util.Map;

import static io.restassured.RestAssured.given;

public final class ApiClient {
    private ApiClient() {}

    static {
        RestAssured.baseURI = TestConfig.baseUrl();
    }

    public static Response get(String path, Map<String, Object> queryParams, Map<String, String> headers) {
        return given()
                .headers(headers == null ? Map.of() : headers)
                .queryParams(queryParams == null ? Map.of() : queryParams)
                .when()
                .get(path)
                .andReturn();
    }

    public static Response postJson(String path, String jsonBody, Map<String, String> headers) {
        return given()
                .contentType(ContentType.JSON)
                .accept(ContentType.JSON)
                .headers(headers == null ? Map.of() : headers)
                .body(jsonBody)
                .when()
                .post(path)
                .andReturn();
    }
}
