Feature: Manage families
  As an admin user
  I want to manage plant families
  In order to increase the known families

  Scenario: Add a new family
    Given I am logged in as admin user
    When I create a a family "Doldengewächse" that is "Schwachzehrer" and of type "C"
    Then the newly created family should be created

  Scenario: Rename a family
    Given I am logged in as admin user
    And a family called "family_with_old_name"
    When I change the name to "family_with_new_name"
    Then the family exists with the new name