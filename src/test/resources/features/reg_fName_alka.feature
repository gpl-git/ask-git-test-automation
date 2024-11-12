@reg_firstname
Feature: Registration Demo

  Background:
    Given I open url "http://ask-qa.portnov.com/#/registration"
    When I type "L" into element with xpath "//input[@formcontrolname='lastName']"
    When I type "email@123.com" into element with xpath "//input[@formcontrolname='email']"
    When I type "ABCD" into element with xpath "//input[@formcontrolname='group']"
    When I type "12345" into element with xpath "//input[@formcontrolname='password']"
    When I type "12345" into element with xpath "//input[@formcontrolname='confirmPassword']"

  @reg_firstname1
  Scenario Outline: First Name field behavior - Happy Path
    When I clear element with xpath "//input[@formcontrolname='firstName']"
    When I type <text> into element with xpath "//input[@formcontrolname='firstName']"
    And I click on element with xpath "//span[contains(text(),'Register Me')]"
    And I wait for 2 sec
    Then element with xpath "//h4" should be displayed
    Then element with xpath "//h4" should contain text <text1>
    Examples:
      | text     | text1                       |
      | "a"      | "You have been Registered." |
      | "a123$%" | "You have been Registered." |


  @reg_firstname2
  Scenario Outline: First Name field behavior - Unhappy Path
    When I type <text> into element with xpath "//input[@formcontrolname='firstName']"
    And I click on element with xpath "//span[contains(text(),'Register Me')]"
    And I wait for 2 sec
    Then element with xpath "//mat-error" should contain text <text1>
    Examples:
      | text        | text1                         |
      | "first 123" | "Whitespaces are not allowed" |
      | ""          | "This field is required"      |
#  When I enter more than max 254 characters, I should get error message but do not get error message- Filed bug in Jira #ASK-619
#      | "rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr"

