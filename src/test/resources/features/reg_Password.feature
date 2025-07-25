@registration @regression
Feature: Registration - Password Validation

  Background:
    Given I open url "http://ask-qa.portnov.com/#/registration"
    And I type "FirstName" into element with xpath "//*[@formcontrolname='firstName']"
    And I type "LastName" into element with xpath "//*[@formcontrolname='lastName']"
    And I type "test@teleworm.us" into element with xpath "//*[@formcontrolname='email']"
    And I type "ABC" into element with xpath "//*[@formcontrolname='group']"

  @reg_Password @smoke
  Scenario: Registration - Valid password (Happy Path)
    When I type "Valid1!" into element with xpath "//*[@formcontrolname='password']"
    And I type "Valid1!" into element with xpath "//*[@formcontrolname='confirmPassword']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for 2 sec
    Then element with xpath "//mat-sidenav-container" should be displayed
    And element with xpath "//h4" should contain text "You have been Registered."

  @reg_Password @smoke
  Scenario: Registration - Empty password (Negative Path)
    When I type "" into element with xpath "//*[@formcontrolname='password']"
    And I type "" into element with xpath "//*[@formcontrolname='confirmPassword']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for 2 sec
    Then element with xpath "//mat-error" should contain text "This field is required"

  @reg_Password @validation
  Scenario Outline: Password valid content validation
    When I type "<password>" into element with xpath "//*[@formcontrolname='password']"
    And I type "<confirm_password>" into element with xpath "//*[@formcontrolname='confirmPassword']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for 2 sec
    Then element with xpath "//h4" should contain text "You have been Registered."

    Examples:
      | password                                   | confirm_password                          |
      | abcdef                                     | abcdef                                    |
      | ABCDEF                                     | ABCDEF                                    |
      | 123456                                     | 123456                                    |
      | @#$%&^*                                    | @#$%&^*                                   |
      | Hello.World!                               | Hello.World!                              |
      | 32CharsPassword@aA1@aA1@aA1@aA1@           | 32CharsPassword@aA1@aA1@aA1@aA1@          |

  @reg_Password_errors @validation
  Scenario Outline: Password invalid content validation
    When I type "<password>" into element with xpath "//*[@formcontrolname='password']"
    And I type "<confirm_password>" into element with xpath "//*[@formcontrolname='confirmPassword']"
    And I click on element with xpath "//button[@type='submit']"
    Then element with xpath "//mat-error" should contain text "<error_message>"

    Examples:
      | password       | confirm_password | error_message                     |
      |                |                  | This field is required            |
      | < aA123@>      | < aA123@>        | Whitespaces are not allowed       |
      | <aA123@ >      | <aA123@ >        | Whitespaces are not allowed       |
      | ABC 123@       | ABC 123@         | Whitespaces are not allowed       |
      | Valid1!        | Invalid1!        | Entered passwords should match    |
      | aA1@           | aA1@             | Should be at least 5 characters   |