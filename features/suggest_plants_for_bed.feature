
Feature: suggest plants for a bed
  As a gardener
  when I have an empty bed and want to plant something on it
  then Gurke suggests a list of candidate plants

  Scenario Outline:
    Given the gardener "fritz" is logged in
    And his garden "Pflanzblätz"
    And A bed with name "<bed_name>" and field "<field>"
    And The given "<plants>"
    When I ask Gurke for a plant to seed there
    Then Gurke suggests plants "<plants>"

    Scenarios:
      | bed_name  | field | plants         |
      | hallo | A     | Ruebli Zwiebel |
      | hi    | B     | Kopfsalat      |
      | this  | C     | Spinat Randen  |
      | that  | D     | Kartoffel      |
