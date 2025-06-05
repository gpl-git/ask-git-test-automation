@homeWork
Feature: Registration
  Background:
    Given I open url "http://ask-qa.portnov.com/#/registration"
    When  I type "First" into element with xpath "//*[@formcontrolname='firstName']"
    And I type "Last" into element with xpath "//*[@formcontrolname='lastName']"
    When I type "Gremess1949@fleckens.hu" into element with xpath "//*[@formcontrolname='email']"
    And I type "ABC" into element with xpath "//*[@formcontrolname='group']"


  @reg_password_ok
  Scenario: Registration Password/Confirm - Happy Path
    When I type "matching" into element with xpath "//*[@formcontrolname='password']"
    And I type "matching" into element with xpath "//*[@formcontrolname='confirmPassword']"
    When I click on element with xpath "//button[@type='submit']"
    And I wait for 1 sec
    Then element with xpath "//ac-registration-confirmation-page" should be displayed
    Then element with xpath "//h4" should contain text "You have been Registered"




  @reg_password_error
  Scenario Outline: Registration Password/Confirm - Error Messages
    When I type <pass> into element with xpath "//*[@formcontrolname='password']"
    And I type <conf> into element with xpath "//*[@formcontrolname='confirmPassword']"
    When I click on element with xpath "//button[@type='submit']"
    And I wait for 1 sec
    Then element with xpath <label1> should contain text <error1>

    Examples:
      | pass       |    conf          |      label1         |         error1                    |
      | "matching" | "mismatching"    |  "(//mat-error)[1]" | "Entered passwords should match"  |
      | "1"        | "matching"       |  "(//mat-error)[1]" | "Should be at least 5 characters" |
      | ""         | "matching"       |  "(//mat-error)[1]" | "This field is required"          |
      | "1 "       | "matching"       |  "(//mat-error)[1]" | "Whitespaces are not allowed"     |
      | "matching" | ""               |  "(//mat-error)[1]" | "This field is required"          |
      | "matching" | "1"              |  "(//mat-error)[1]" | "Should be at least 5 characters" |
      | "matching" | "1 "             |  "(//mat-error)[1]" | "Whitespaces are not allowed"     |
      | "33characterssssssssssssssssssssss" | "matching"    |  "(//mat-error)[1]" | "Should be no longer than 32 characters" |
      | "matching" | "33characterssssssssssssssssssssss"    |  "(//mat-error)[1]" | "Should be no longer than 32 characters" |


