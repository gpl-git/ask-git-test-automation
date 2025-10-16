@login @regression

Feature: Login Teacher


  Background:
    Given I open url "http://ask-qa.portnov.com/#/login"
    Then I should see page title contains "Assessment Control"
    Then element with xpath "//*[@formcontrolname='password']" should have attribute "type" as "password"


  @smoke
  Scenario: Login Happy Path Teacher
    When I type "giall1987@einrot.com" into element with xpath "//*[@formcontrolname='email']"
    And I type "ABC123" into element with xpath "//*[@formcontrolname='password']"
    When I click on element with xpath "//*[@type='submit']"
    And I wait for element with xpath "//mat-icon[contains(text(),'home')]" to be present
    Then element with xpath "//*[@class='info']" should contain text "TEACHER"

  @login
  Scenario Outline: Login error messages
    When I type <email> into element with xpath "//*[@formcontrolname='email']"
    And I type <password> into element with xpath "//*[@formcontrolname='password']"
    And I wait for 1 sec
    And I click on element with xpath "//*[@type='submit']"
    And I wait for 1 sec
    And element with xpath <error> should contain text <error message>
    Examples:
      |email  |             password       | error                | error message |
      | "giall1987 @einrot.com" |   "ABC123"   |  "//mat-error"        | "Should be a valid email address" |
      | " giall1987@einrot.com" |   "ABC123"   |"//mat-error"        | "Should be a valid email address" |
      | "giall1987@einrot.com " | "ABC123"   | "//mat-error"        | "Should be a valid email address" |
      | "giall1987@einrot.com"  |   "ABC 123"  |  "//mat-error"        | "Whitespaces are not allowed"     |
      | "giall1987@einrot.com"  |   " ABC123"  |  "//mat-error"        | "Whitespaces are not allowed"     |
      | "giall1987@einrot.com"  |  "ABC123 "  |  "//mat-error"        | "Whitespaces are not allowed"     |
      | ""                      |  "ABC123"   | "//mat-error"        | "This field is required"          |
      | "giall1987@einrot.com"  |   ""         | "//mat-error"        | "This field is required"          |
      | ""                      |   ""         | "//mat-error"        | "This field is required"          |
#    User is not registered
      | "aas@test.com"           |   "ABC123"         | "//simple-snack-bar"        | "Authentication failed. User not found or password does not match"          |