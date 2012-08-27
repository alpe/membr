Feature: Add members

  Scenario: Add a new member
    Given I chose to add a new member
    When I add a new member with details:
      | name      | Duana Stanley |
      | ic_number | 12345         |
      | doj       | 01/01/1970    |
      | donation  | 20            |
      | phone     | 9887 3434     |
    Then show me the page
    Then I see a confirmation of the member's details

