@regression
Feature: Registration Page - Group Code

  Background:
    Given I open url "http://ask-qa.portnov.com/#/registration"
    When I type "a" into element with xpath "//input[@formcontrolname='firstName']"
    And I type "b" into element with xpath "//input[@formcontrolname='lastName']"
    When I type "gregory12@wamerangkul.com" into element with xpath "//input[@formcontrolname='email']"
    When I type "12345" into element with xpath "//input[@formcontrolname='password']"
    And I type "12345" into element with xpath "//input[@formcontrolname='confirmPassword']"

  @reg_GC_alphanumericChar
  Scenario Outline: GC - Alphanumeric Characters
    And I type <text> into element with xpath "//input[@formcontrolname='group']"
    And I wait for 1 sec
    When I click on element with xpath "//*[text()='Register Me']"
    And I wait for 3 sec
    Then element with xpath "//h4" should contain text "You have been Registered."
    And I wait for 2 sec
    Examples:
      | text       |
      | "aAbB"     |
      | "123450"   |
      | "a1A2B00F" |

  @reg_GC_specialChar
  Scenario Outline: GC - Special Characters
    And I type <text> into element with xpath "//input[@formcontrolname='group']"
    And I wait for 1 sec
    When I click on element with xpath "//*[text()='Register Me']"
    And I wait for 3 sec
    Then element with xpath "//h4" should contain text "You have been Registered."
    And I wait for 2 sec
    Examples:
      | text |
      | "$"  |
      | "%"  |
      | "#"  |
      | "&"  |

  @reg_GC_length
  Scenario Outline: GC - Valid Number of Characters
    And I type <text> into element with xpath "//input[@formcontrolname='group']"
    And I wait for 1 sec
    When I click on element with xpath "//*[text()='Register Me']"
    And I wait for 4 sec
    Then element with xpath "//h4" should contain text "You have been Registered."
    And I wait for 2 sec
    Examples:
      | text         |
      | "a"          |
      | "ab"         |
      | "abcdefghi"  |
      | "abcdefghij" |

  @reg_grCode_errors
  Scenario Outline: GC - Invalid Number of Characters
    And I type <text> into element with xpath "//input[@formcontrolname='group']"
    When I click on element with xpath "//*[text()='Register Me']"
    And I wait for 1 sec
    Then element with xpath "//*[contains(@id, 'mat-error-')]" should contain text <text1>
    Examples:
      | text                         |  text1                              |
      | ""                           | "This field is required"            |
      | "abcdefghijk"                | "Should no more than 10 characters" |
      | "abcdefghijklmnopqrstuvwxyz" | "Should no more than 10 characters" |
      #  This is a known issue bug wasn't filed
      | " "                          | "Whitespaces are not allowed"       |
      | "a a"                        | "Whitespaces are not allowed"       |
      | " aa"                        | "Whitespaces are not allowed"       |
      | "aa "                        | "Whitespaces are not allowed"       |








