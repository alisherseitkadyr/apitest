Feature: Placeholder for additional Assignment 7 scenarios

  Scenario: GET /status/200 returns 200
    Given httpbin base is configured
    When I send GET request to "/status/200"
    Then status code should be 200

  Scenario: GET /uuid returns unique identifier
    Given httpbin base is configured
    When I send GET request to "/uuid"
    Then status code should be 200
    And response JSON path "uuid" should not be empty

  Scenario: GET /anything returns all request details
    Given httpbin base is configured
    And query param "test" equals "value"
    When I send GET request to "/anything/mypath"
    Then status code should be 200
    And response JSON path "args.test" should equal "value"

  Scenario: GET /get with no parameters returns empty args
    Given httpbin base is configured
    When I send GET request to "/get"
    Then status code should be 200
    And response JSON path "args" should not be empty

  Scenario: GET /base64 endpoint returns valid content
    Given httpbin base is configured
    When I send GET request to "/base64/SFRUUEJJTiBpcyBhd2Vzb21l"
    Then status code should be 200
