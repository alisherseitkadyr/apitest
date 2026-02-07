package com.alisher.httpbin.steps;

import com.alisher.httpbin.util.ApiClient;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.restassured.response.Response;

import java.util.HashMap;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.*;

public class HttpBinSteps {

    private Map<String, Object> queryParams;
    private Map<String, String> headers;
    private String jsonBody;
    private Response response;

    @Given("httpbin base is configured")
    public void httpbin_base_is_configured() {
        // Base URL is configured via TestConfig + RestAssured.baseURI static init.
        queryParams = new HashMap<>();
        headers = new HashMap<>();
        jsonBody = null;
        response = null;
    }

    @Given("query param {string} equals {string}")
    public void query_param_equals(String key, String value) {
        queryParams.put(key, value);
    }

    @Given("header {string} equals {string}")
    public void header_equals(String key, String value) {
        headers.put(key, value);
    }

    @Given("JSON body is")
    public void json_body_is(String docString) {
        this.jsonBody = docString;
    }

    @When("I send GET request to {string}")
    public void i_send_get_request_to(String path) {
        response = ApiClient.get(path, queryParams, headers);
    }

    @When("I send POST request to {string}")
    public void i_send_post_request_to(String path) {
        response = ApiClient.postJson(path, jsonBody, headers);
    }

    @Then("status code should be {int}")
    public void status_code_should_be(Integer expected) {
        assertNotNull(response, "Response is null (request not executed?)");
        assertEquals(expected.intValue(), response.statusCode());
    }

    @Then("response JSON path {string} should equal {string}")
    public void response_json_path_should_equal(String jsonPath, String expected) {
        assertNotNull(response, "Response is null (request not executed?)");
        String actual = response.jsonPath().getString(jsonPath);
        assertEquals(expected, actual);
    }

    @Then("response JSON path {string} should not be empty")
    public void response_json_path_should_not_be_empty(String jsonPath) {
        assertNotNull(response, "Response is null (request not executed?)");
        String actual = response.jsonPath().getString(jsonPath);
        assertNotNull(actual);
        assertFalse(actual.isBlank(), "Expected non-empty value at " + jsonPath);
    }
}
