Feature: Add members

  Scenario: Add a new member
    Given I chose to add a new member
    When I add a new member with details:
      | firstname | Duana   |  
      | lastname  | Stanley |
      | ic_number | 12345   |
    Then show me the page
    Then I see a confirmation of the member's details

