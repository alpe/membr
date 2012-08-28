Feature: Manage members

  @wip  
  Scenario: Add a new member
    Given I chose to add a new member
    When I add a new member with details:
      | name      | Duana Stanley |
      | ic_number | 12345         |
      | doj       | 30/01/1970    |
      | donation  | 20            |
      | phone     | 9887 3434     |
      | line1     | Blk 35 Mandalay Road      |
      | line2     | # 13–37 Mandalay Towers   |
      | postcode  | 308215                    |
    Then I see a confirmation of the member's details
    Then show me the page

  Scenario: List members
    Given a member exists
    And I am on the members page
    Then I see a list view of the members details

