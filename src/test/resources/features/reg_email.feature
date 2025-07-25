
@registration @regression
Feature: Registration
  Background:
    Given I open url "http://ask-qa.portnov.com/#/registration"
    When I type "John" into element with xpath "//*[@formcontrolname='firstName']"
    And I type "S" into element with xpath "//*[@formcontrolname='lastName']"
    And I type "ABCD" into element with xpath "//*[@formcontrolname='group']"
    When I type "12345" into element with xpath "//*[@formcontrolname='password']"
    And I type "12345" into element with xpath "//*[@formcontrolname='confirmPassword']"

  @reg_Email @smoke
  Scenario: Registration Email Happy Path
    When I type "user@example.com" into element with xpath "//*[@formcontrolname='email']"
    When I click on element with xpath "//button[@type='submit']"
    And I wait for 3 sec
    Then element with xpath "//mat-sidenav-container" should be displayed
    And I wait for 2 sec
    And element with xpath "//h4" should contain text "You have been Registered."

  @reg_Email @smoke
  Scenario: Registration Email - This field is required
    When I type "" into element with xpath "//*[@formcontrolname='email']"
    When I click on element with xpath "//button[@type='submit']"
    And I wait for 2 sec
    Then element with xpath "//mat-error" should contain text "This field is required"
    And I wait for 5 sec


  @reg_Email_errors
  Scenario Outline: Registration Errors - Error messages
    When I type <email> into element with xpath "//*[@formcontrolname='email']"
    When I click on element with xpath "//button[@type='submit']"
    And I wait for 1 sec
    Then element with xpath <expectedResult> should contain text <response>
    Examples:
      | email                                                      | expectedResult       | response                                    |
      | ""                                                         | "//mat-error"        | "This field is required"                 |
      | " user@example.com"                                        | "//mat-error"        | "Whitespaces are not allowed"           |
      | "user@example.com   "                                      | "//mat-error"        | "Whitespaces are not allowed"            |
      | "user@example.com"                                        | "//mat-error"        | "Whitespaces are not allowed"            |
#      This is a know issue - Jira ticket JUN25-345
      | "user@example"                                             | "//mat-error"        | "Should be a valid email address"            |
      | "user@exa.mple.com"                                               | "//mat-error"        | "Should be a valid email address"            |
      | "userexample.com"                                               | "//mat-error"        | "Should be a valid email address"            |
      | "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa@bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb.com" | //h4            | You have been Registered.      |

  @reg_email_conf
  Scenario Outline: Registration - Validate email input
    When I type "<email>" into element with xpath "//*[@formcontrolname='email']"
    When I click on element with xpath "//button[@type='submit']"
    And I wait for 2 sec
    And element with xpath "//h4" should contain text "You have been Registered."

    Examples:
      | email                                               |
      | user@example.com                                    |
      | user@example.com                                   |
      | aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa@example.com |
      | aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa@example.com |
      | user@gverylongdomainsegmentthatexceeds63characterslonglonglonglonggoo.com |
      | user+name@example.com |
