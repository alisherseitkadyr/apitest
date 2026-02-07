Feature: httpbin GET endpoint basic checks

  Scenario: GET /get returns 200 and echoes query param
    Given httpbin base is configured
    And query param "course" equals "api-testing"
    When I send GET request to "/get"
    Then status code should be 200
    And response JSON path "args.course" should equal "api-testing"
