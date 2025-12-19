@reg @regression
Feature: Registration Page - Group code

  Background:
    Given I open url "http://ask-qa.portnov.com/#/registration"
    Then I should see page title as "Assessment Control @ Portnov"
    And element with xpath "//h4" should contain text "Registration"
    When I type "Lisa" into element with xpath "//*[@formcontrolname='firstName']"
    And I type "Jones" into element with xpath "//*[@formcontrolname='lastName']"
    When I type "Daget1977@superrito.com" into element with xpath "//*[@formcontrolname='email']"
    When I type "12345" into element with xpath "//*[@formcontrolname='password']"
    When I type "12345" into element with xpath "//*[@formcontrolname='confirmPassword']"


  @smoke
  Scenario: Registration - Group code - Happy Path
    When I type "DEC" into element with xpath "//*[@formcontrolname='group']"
    And I click on element with xpath "//*[@type='submit']"
    And I wait for 2 sec
    Then element with xpath "//h4" should contain text "You have been Registered."
    And I wait for 2 sec

  @reg_groupCode
  Scenario: Registration - Group Code Behavior
#  Positive inputs - Alphanumeric and Special characters
    When I type "DEC@25$" into element with xpath "//*[@formcontrolname='group']"
    And I click on element with xpath "//*[@type='submit']"
    And I wait for 2 sec
    Then element with xpath "//h4" should contain text "You have been Registered."
    And I wait for 2 sec

  @reg_groupCode_parameterized
  Scenario Outline: Registration - Group Code Accepted Characters - Outline
    When I type <text> into element with xpath "//*[@formcontrolname='group']"
    And I click on element with xpath "//*[@type='submit']"
    And I wait for 2 sec
    Then element with xpath "//h4" should contain text "You have been Registered."
    And I wait for 2 sec

    Examples:
      | text         |
      | "DEC@25$"    |
      | "December"   |
      | "12345"      |
      | "$@#%&"      |
      | "A"          |
      | "DEC@2025$#" |


  @reg_groupCode_negative
  Scenario Outline: Registration - Group Code - Error messages
    When I type <groupCode> into element with xpath <input>
    And I click on element with xpath "//*[@type='submit']"
    And I wait for 2 sec
    Then element with xpath <xpath> should contain text <error>
    Examples:
      | groupCode     | input                           | xpath         | error                               |
#      typo in the error message known issue JIRA
      | "DECEM@2025$" | "//*[@formcontrolname='group']" | "//mat-error" | "Should be no more than 10 characters" |
      | ""            | "//*[@formcontrolname='group']" | "//mat-error" | "This field is required"            |
#      the next 3 tests are failing due to the reported issue JIRA
      | "Dec @25"     | "//*[@formcontrolname='group']" | "//mat-error" | "Whitespaces are not allowed"       |
      | " Dec@25"     | "//*[@formcontrolname='group']" | "//mat-error" | "Whitespaces are not allowed"       |
      | "Dec@25 "     | "//*[@formcontrolname='group']" | "//mat-error" | "Whitespaces are not allowed"       |
