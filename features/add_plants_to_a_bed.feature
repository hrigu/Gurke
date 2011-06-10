Feature: Add plants to a bed
  As a gardener
  I want to add suitable plants to a bed
  in order to get a big harvest
  
  Scenario Outline: add some plants to bed
    Given the gardener "fritz" is logged in
    And the garden "Pflanzblätz"
    And A bed with name "<bed_name>" and field state "<field>"
    When I add "<plants>"
    Then Gurke adds the plants to the bed

    Scenarios:
      | bed_name     | field | plants         |
      | my_green_bed | A     | Rüebli Zwiebel |
