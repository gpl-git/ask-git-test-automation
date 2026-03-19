@regression
Feature: Registration Form -Email Field

  Background:
    When I open url "http://ask-qa.portnov.com/#/registration"
    Then I should see page title contains "Assessment Control"
    And I type "Ania" into element with xpath "//*[@formcontrolname='firstName']"
    And I type "Roman" into element with xpath "//*[@formcontrolname='lastName']"
    And I type "AWS" into element with xpath "//*[@formcontrolname='group']"
    When I type "12345" into element with xpath "//*[@formcontrolname='password']"
    And I type "12345" into element with xpath "//*[@formcontrolname='confirmPassword']"


  @regression @reg_email_neg
  Scenario: Email - can't be empty

    When I click on element with xpath "//*[@type='submit'] "
    Then element with xpath "//mat-error" should be displayed
    And I wait for 5 sec
    Then element with xpath "//mat-error" should contain text "This field is required"


  Scenario: Email - Whitespaces
    When I type " " into element with xpath "//*[@formcontrolname='email']"
    When I click on element with xpath "//*[@type='submit'] "
    Then element with xpath "//*[text()='Should be a valid email address']" should be displayed
    Then element with xpath "//*[text()='Should be a valid email address']" should contain text "Should be a valid email address"
    And I wait for 3 sec

  Scenario Outline: Email - Error messages
    When I type <email> into element with xpath "//*[@formcontrolname='email']"
    When I click on element with xpath "//*[@type='submit'] "
    Then element with xpath "//mat-error" should contain text <errorMessage>
    Examples:
      | email | errorMessage                         |
      | " "  |  "Should be a valid email address" |

      | "  Toordon63@fleckens.hu" |"Should be a valid email address" |
      | "Toordon63@fleckens.hu "  |"Should be a valid email address" |
      | "Toordon63@@fleckens.hu"  |"Should be a valid emaDil address" |
#      Reported issue FEB26-#####
      | "Toordon63@@fleckens"  |"Should be a valid emaDil address" |
      | ""                        |"This field is required"          |
