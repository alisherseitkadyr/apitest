Feature: httpbin GET endpoint basic checks

  Scenario: GET /get returns 200 and echoes query param
    Given httpbin base is configured
    And query param "course" equals "api-testing"
    When I send GET request to "/get"
    Then status code should be 200
    And response JSON path "args.course" should equal "api-testing"

  Scenario: GET /get with multiple query parameters
    Given httpbin base is configured
    And query param "name" equals "John"
    And query param "age" equals "30"
    When I send GET request to "/get"
    Then status code should be 200
    And response JSON path "args.name" should equal "John"
    And response JSON path "args.age" should equal "30"

  Scenario: GET /headers returns request headers
    Given httpbin base is configured
    And header "X-Custom-Header" equals "test-value"
    When I send GET request to "/headers"
    Then status code should be 200
    And response JSON path "headers.X-Custom-Header" should equal "test-value"

  Scenario: GET /user-agent returns user agent
    Given httpbin base is configured
    When I send GET request to "/user-agent"
    Then status code should be 200
    And response JSON path "user-agent" should not be empty

  Scenario: GET /ip returns client IP
    Given httpbin base is configured
    When I send GET request to "/ip"
    Then status code should be 200
    And response JSON path "origin" should not be empty
