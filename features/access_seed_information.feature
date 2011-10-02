Feature: Access seed information of a plant
  As a user
  I want to obtain seed and harvest information
  In order to improve predicatility


  Scenario Outline: Display seed information on plant details page
    Given the plant with name "<name>" and family "<family>"
    When I go to the "plant" page for "<name>"
    #When I display the details of "<name>"
    Then the details page shows "<name>", "<family>", "<seed_from>", "<seed_to>", "<maturation_time>" and average "<variation>"

  Scenarios:
    | name   | family   | seed_from    | seed_to   | maturation_time | variation |
    | Rüebli | Wurzel | Anfang April | Ende Juni | 3 Monate        | 10%       |
