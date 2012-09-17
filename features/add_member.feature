Feature: Manage members

  Scenario: Add a new member
    Given I chose to add a new member
    When I add a new member with details:
      | name      | Duana Stanley |
      | ic_number | 12345         |
      | doj       | 30/01/1970    |
      | donation  | 20            |
      | hand_phone| 9887 3434     |
      | line1     | Blk 35 Mandalay Road      |
      | line2     | # 13–37 Mandalay Towers   |
      | postcode  | 308215                    |
      | family_members_attributes_0_name | Aisyah  |
      | family_members_attributes_1_name | Taufik  |
    Then I see a confirmation of the member's details


