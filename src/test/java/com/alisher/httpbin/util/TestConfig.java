package com.alisher.httpbin.util;

public final class TestConfig {
    private TestConfig() {}

    /**
     * Default base URL for httpbin. You can override:
     * -DbaseUrl=https://httpbin.org
     */
    public static String baseUrl() {
        String v = System.getProperty("baseUrl");
        return (v == null || v.isBlank()) ? "https://httpbin.org" : v.trim();
    }
}
