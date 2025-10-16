@reg @regression
Feature: Registration Demo - First Name

  Background:
    Given I open url "http://ask-qa.portnov.com/#/registration"
    Then I should see page title contains "Assessment Control"
    And I type "A" into element with xpath "//*[@formcontrolname='lastName']"
    When I type "Beeptund1939@dayrep.com" into element with xpath "//*[@formcontrolname='email']"
    And I type "ABC" into element with xpath "//*[@formcontrolname='group']"
    When I type "12345" into element with xpath "//*[@formcontrolname='password']"
    And I type "12345" into element with xpath "//*[@formcontrolname='confirmPassword']"

  @reg_fName @smoke
  Scenario: Registration - Happy Path
    When I type "Alex" into element with xpath "//*[@formcontrolname='firstName']"
    When I click on element with xpath "//*[@type='submit']"
    And I wait for element with xpath "//ac-registration-confirmation-page" to be present
    Then element with xpath "//h4" should be displayed
    Then element with xpath "//h4" should contain text "You have been Registered."
    And I wait for 3 sec

  @reg_fName_positive
  Scenario Outline: First Name - Positive Input  Outline
    When I type <fName> into element with xpath "//*[@formcontrolname='firstName']"
    When I click on element with xpath "//*[@type='submit']"
    And I wait for element with xpath "//ac-registration-confirmation-page" to be present
    Then element with xpath "//h4" should contain text <message>
    Examples:
      | fName             |   message                       |
      | "A"               |    "You have been Registered." |
      | "1234"            |    "You have been Registered." |
      | "ABCefg"          |    "You have been Registered." |
      | "A!@#$%^&&*"      |    "You have been Registered." |
      | "hellofejwhbevhwbehbwieufvbweiuvbweiufvbewvoiewvepfvonweofvoewvbouvbeuovfevuwehbwieufvbweiuvbweiufvbewvoiewvepfvonweofvowpenhellofejwhbevhwbehbwieufvbweiuvbweiufvbewvoiewvepfvonweofvoewvbouvbeuovfevuwehbwieufvbweiuvbweiufvbewvoiewvepfvonweofvowggggggggggg"      |    "You have been Registered." |

  @reg_fName_negative
  Scenario Outline: First Name - Negative Input  Outline
    When I type <fName> into element with xpath "//*[@formcontrolname='firstName']"
    When I click on element with xpath "//*[@type='submit']"
    Then element with xpath <xpath> should contain text <message>
    Examples:
      | fName       |   xpath                       | message                  |
      | ""          |   "//mat-error"               | "This field is required" |
      | " "         |   "//mat-error"                | "Whitespaces are not allowed" |
      | " Alex"      |   "//mat-error"               | "Whitespaces are not allowed" |
      | "Alex "      |   "//mat-error"               | "Whitespaces are not allowed" |
      | "Al ex"      |   "//mat-error"               | "Whitespaces are not allowed" |
#      This is a known issue JIRA SEP25-hhhh
      | "hellofejwhbevhwbehbwieufvbweiuvbweiufvbewvoiewvepfvonweofvoewvbouvbeuovfevuwehbwieufvbweiuvbweiufvbewvoiewvepfvonweofvowpenhellofejwhbevhwbehbwieufvbweiuvbweiufvbewvoiewvepfvonweofvoewvbouvbeuovfevuwehbwieufvbweiuvbweiufvbewvoiewvepfvonweofvowggggggggggg1"      |   "//simple-snack-bar"               | "too long" |