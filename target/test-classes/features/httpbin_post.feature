Feature: httpbin POST endpoint basic checks

  Scenario: POST /post returns 200 and echoes JSON payload
    Given httpbin base is configured
    And header "Accept" equals "application/json"
    And JSON body is
      """
      { "name": "Alisher", "grade": 11 }
      """
    When I send POST request to "/post"
    Then status code should be 200
    And response JSON path "json.name" should equal "Alisher"
