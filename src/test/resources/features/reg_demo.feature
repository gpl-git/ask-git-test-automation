@reg
Feature: Registration Demo

  Background: 

    Given I open url "http://ask-qa.portnov.com/#/registration"
    When I type "Last" into element with xpath "//input[@formcontrolname='lastName']"
    When I type "email@123.com" into element with xpath "//input[@formcontrolname='email']"
    When I type "ABCD" into element with xpath "//input[@formcontrolname='group']"
    When I type "12345" into element with xpath "//input[@formcontrolname='password']"
    When I type "12345" into element with xpath "//input[@formcontrolname='confirmPassword']"

    @reg1
    Scenario: Happy Path
      When I type "first" into element with xpath "//input[@formcontrolname='firstName']"
      And I click on element with xpath "//button[@type='submit']"
      And I wait for 3 sec
