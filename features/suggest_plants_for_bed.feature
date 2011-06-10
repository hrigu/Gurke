Feature: suggest plants for a bed
  As a gardener
  when I have an empty bed and want to plant something on it
  then Gurke suggests a list of candidate plants

  Scenario Outline:
    Given the gardener "fritz" is logged in
    And the garden "Pflanzblätz"
    And A bed with name "<name>" and field "<field>"
    When I ask Gurke for a plant to seed there
    Then Gurke suggests plants "<plants>"

    Scenarios:
      | name  | field | plants         |
      | hallo | A     | Rüebli Zwiebel |
      | hi    | B     | Kopfsalat      |
      | this  | C     | Spinat Randen  |
      | that  | D     | Kartoffel      |
