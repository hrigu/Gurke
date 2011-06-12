Feature: Register new Gardener
  In order to have access to my garden
  as a gardener
  I want to be able to login

  Scenario: Signup successfully as a new gardener
    Given I am a new gardener with name "fritz", password "gruen", and email "fritz@test.com"
    When I sign up
    Then I have an account on gurke

  Scenario: log in with password
    Given an exiting gardener with name "fritz", password "gruen", and email "fritz@test.com"
    When fritz logs in with his password
    Then he is logged in

  Scenario: log in with email
    Given an exiting gardener with name "fritz", password "gruen", and email "fritz@test.com"
    When fritz logs in with his email
    Then he is logged in

  Scenario: log in with wrong password
    Given an exiting gardener with name "fritz", password "grue", and email "fritz@test.com"
    When fritz tries to log in with password "red"
    Then he isn't' logged in
