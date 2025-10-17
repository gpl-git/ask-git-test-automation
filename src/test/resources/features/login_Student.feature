@login @regression

Feature: Log In Student

  Background:
    Given I open url "http://ask-qa.portnov.com/#/login"
    Then I should see page title contains "Assessment Control"
    Then element with xpath "//*[@formcontrolname='password']" should have attribute "type" as "password"


  @smoke @login_S
  Scenario: Log In - Happy Path Student
    When I type "woolnemis75@superrito.com" into element with xpath "//*[@formcontrolname='email']"
    And I type "123456" into element with xpath "//*[@formcontrolname='password']"
    When I click on element with xpath "//*[@type='submit']"
    And I wait for element with xpath "//mat-icon[contains(text(),'school')]" to be present
    Then element with xpath "//div[@class='info']" should contain text "STUDENT"

  @login_S_errors
  Scenario Outline: Log In - Error messages
    When I type <email> into element with xpath "//*[@formcontrolname='email']"
    And I type <password> into element with xpath "//*[@formcontrolname='password']"
    When I wait for 1 sec
    And I click on element with xpath "//*[@type='submit']"
    When I wait for 1 sec
    And element with xpath <error> should contain text <error message>
    Examples:
      | email                            |  password   |  error                | error message |
      | "woolnemis75@superrito.com"      |  "123 456"  |  "//mat-error"        | "Whitespaces are not allowed"     |
      | "woolnemis75@superrito.com"      |  " 123456"  |  "//mat-error"        | "Whitespaces are not allowed"     |
      | "woolnemis75@superrito.com"      |  "123456 "  |  "//mat-error"        | "Whitespaces are not allowed"     |
      | "woolnemis75superrito.com"       |  "123456"   |  "//mat-error"        | "Should be a valid email address" |
      | "woolnemis75@superrito."         |  "123456"   |  "//mat-error"        | "Should be a valid email address" |
      | " woolnemis75@superrito.com"     |  "123456"   |  "//mat-error"        | "Should be a valid email address" |
      | "woolnemis75@superrito.com "     |  "123456"   |  "//mat-error"        | "Should be a valid email address" |
      | "woolnemis75 @superrito.com"     |  "123456"   |  "//mat-error"        | "Should be a valid email address" |
      | ""                               |  ""         |  "//mat-error"        | "This field is required"          |
      | "woolnemis75@superrito.com"      |  ""         |  "//mat-error"        | "This field is required"          |
      | ""                               |  "123456"   |  "//mat-error"        | "This field is required"          |
      | "woolnemis@superrito.com"        |  "123456"   | "//simple-snack-bar"  | "Authentication failed. User not found or password does not match" |
