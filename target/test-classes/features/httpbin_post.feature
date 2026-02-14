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

  Scenario: POST /post with complex JSON structure
    Given httpbin base is configured
    And JSON body is
      """
      { "user": "alice", "email": "alice@example.com", "active": true }
      """
    When I send POST request to "/post"
    Then status code should be 200
    And response JSON path "json.user" should equal "alice"
    And response JSON path "json.email" should equal "alice@example.com"

  Scenario: POST /post returns echoed data
    Given httpbin base is configured
    And JSON body is
      """
      { "message": "hello world" }
      """
    When I send POST request to "/post"
    Then status code should be 200
    And response JSON path "json.message" should equal "hello world"

  Scenario: POST /post with array in JSON
    Given httpbin base is configured
    And JSON body is
      """
      { "items": ["apple", "banana", "orange"] }
      """
    When I send POST request to "/post"
    Then status code should be 200
    And response JSON path "json.items" should not be empty

  Scenario: POST /post returns request headers
    Given httpbin base is configured
    And JSON body is
      """
      { "test": "data" }
      """
    When I send POST request to "/post"
    Then status code should be 200
    And response JSON path "json.test" should equal "data"
