@regression @reg_demo
Feature: Registration Demo - FN

  Background:
    Given I open url "http://ask-qa.portnov.com/#/registration"
    And I type "P" into element with xpath "//input[@formcontrolname='lastName']"
    When I type "h.ppp@hogw.edu" into element with xpath "//input[@formcontrolname='email']"
    And  I type "ABC" into element with xpath "//input[@formcontrolname='group']"
    When I type "12345" into element with xpath "//input[@formcontrolname='password']"
    And I type "12345" into element with xpath "//input[@formcontrolname='confirmPassword']"

  @reg_demo1
  Scenario: Registration First Name  - Happy Path
    When I type "Harry" into element with xpath "//input[@formcontrolname='firstName']"
    When I click on element with xpath "//button[@type='submit']"
    And I wait for 2 sec
    And I wait for element with xpath "//h4" to be present
#    This is a know issue Jira ticket APR25-
    And element with xpath "//h4" should contain text "You have been Registered"


  Scenario Outline: Registration First Name  - Allowed input
    When I type <text> into element with xpath "//input[@formcontrolname='firstName']"
    When I click on element with xpath "//button[@type='submit']"
    And I wait for 2 sec
    And I wait for element with xpath "//h4" to be present
    And element with xpath "//h4" should contain text <message>
    Examples:
      | text      | message                      |
      | "Harry"   | "You have been Registered" |
      | "GAFGAFGFAG"   | "You have been Registered" |
      | "11232344"   | "You have been Registered" |
      | "H"   | "You have been Registered" |
      | "123ascvbnmnmnmnm1212121W@@@@@@123123ascvbnmnmnmnm1212121W@@@@@@123123ascvbnmnmnmnm1212121W@@@@@@123123ascvbnmnmnmnm121212123ascvbnmnmnmnm1212121W@@@@@@123123ascvbnmnmnmnm1212121W@@@@@@123123ascvbnmnmnmnm1212121W@@@@@@123123ascvbnmnmnmnm1212121W@@@@@@1230"                             | "You have been Registered" |
