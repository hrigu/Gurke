Feature: show details of a plant
  as a gardener
  when I'm looking for details of a plant
  Gurke shows me the details

  Scenario Outline: looking for family name and energy need of the plant
    Given the plant with name "<plant>" and family with name "<family>" and energy_need "<energy_need>"
    When I go to the "plant" page for "<plant>"
    Then The plant name is "<plant>"
    And The family name is "<family>"
    And the energy need is "<energy_need>"

    Scenarios:
      | plant     | family              | energy_need    |
      | Kopfsalat | Körbchenblütler   | Schwachzehrer |
      | Zwiebel   | Liliengewächse     | Schwachzehrer |
      | Randen    | Gänsefussgewächse | Starkzehrer   |
