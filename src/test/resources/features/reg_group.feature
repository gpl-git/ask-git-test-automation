@reg @regression
Feature: Registration Demo - GroupCode

  Background:
    Given I open url "http://ask-qa.portnov.com/#/registration"
    Then I should see page title contains "Assessment Control"
    And I type "Chris" into element with xpath "//*[@formcontrolname='firstName']"
    And I type "Griffin" into element with xpath "//*[@formcontrolname='lastName']"
    And I type "groupcode_test@mailinator.com" into element with xpath "//*[@formcontrolname='email']"
    And I type "12345" into element with xpath "//*[@formcontrolname='password']"
    And I type "12345" into element with xpath "//*[@formcontrolname='confirmPassword']"

  @reg_groupcode_positive
  Scenario Outline: Group Code - Positive Input Outline
    When I type <groupCode> into element with xpath "//*[@formcontrolname='group']"
    When I click on element with xpath "//*[@type='submit']"
    And I wait for element with xpath "//ac-registration-confirmation-page" to be present
    Then element with xpath "//h4" should contain text <message>
    And I wait for 2 sec
    Examples:
      | groupCode      | message                       |
      | "A"            | "You have been Registered."   |
      # testing only 1 character
      | "ABC123"       | "You have been Registered."   |
      | "QA_2025#"     | "You have been Registered."   |
      | "1234567890"   | "You have been Registered."   |
#             exactly 10 characters (boundary valid)
      | "Test@10"      | "You have been Registered."   |


  @reg_groupcode_negative
  Scenario Outline: Group Code - Negative Input Outline
    When I type <groupCode> into element with xpath "//*[@formcontrolname='group']"
    When I click on element with xpath "//*[@type='submit']"
    Then element with xpath <xpath> should contain text <message>
    And I wait for 2 sec
    Examples:
      | groupCode       | xpath                | message                                |
#      | ""              | "//mat-error"        | "This field is required"               |
##      this is a known bug for whitespaces SEP25 - XXXX
#      | " "             | "//mat-error"        | "Whitespaces are not allowed"          |
#      | " QA"           | "//mat-error"        | "Whitespaces are not allowed"          |
#      | "QA "           | "//mat-error"        | "Whitespaces are not allowed"          |
#      | "Q A"           | "//mat-error"        | "Whitespaces are not allowed"          |
##      Jira ticket SEP25-xxxx for group code error typo
      | "Automation1234"| "//mat-error"      | "Should no more than 10 characters" |
      # 11 characters (boundary invalid)

  @smoke_groupcode-forign
  Scenario: Registration - Group Code with Chinese Characters
    When I type "цйжэ" into element with xpath "//*[@formcontrolname='group']"
      # Foreign language for  group value
    And I click on element with xpath "//button[@type='submit']"
   And I wait for 1 sec
     Then element with xpath "//simple-snack-bar" should contain text "Incorrect string value"
    And I wait for 2 sec