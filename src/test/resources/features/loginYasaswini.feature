@Login @regression
Feature: Login form
  Background:
    Given I open url "http://ask-qa.portnov.com/#/login"

  @smoke @login
  Scenario: Login Happy Path
    And I type "student1@test.com" into element with xpath "//*[@formcontrolname='email']"
    And I type "ABC123" into element with xpath "//*[@formcontrolname='password']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for element with xpath "//ac-home-page" to be present
    Then element with xpath "//p[contains(text(),'STUDENT')]" should be present
#    verify user role
    Then element with xpath "//p[contains(text(),'STUDENT')]" should be displayed

  @negative @login
  Scenario: Login with Invalid Password
    When I type "student1@test.com" into element with xpath "//*[@formcontrolname='email']"
    And I type "WrongPass" into element with xpath "//*[@formcontrolname='password']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for 2 sec
    Then element with xpath "//simple-snack-bar" should contain text "Authentication failed"

  @negative @login
  Scenario: Login with Empty Email Field
    When I type "" into element with xpath "//*[@formcontrolname='email']"
    And I type "ABC123" into element with xpath "//*[@formcontrolname='password']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for 2 sec
    And element with xpath "//mat-error" should be displayed
    Then element with xpath "//mat-error" should contain text "This field is required"

  @negative @login
  Scenario: Login with Empty Password Field
    When I type "student1@test.com" into element with xpath "//*[@formcontrolname='email']"
    And I type "" into element with xpath "//*[@formcontrolname='password']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for 2 sec
    And element with xpath "//mat-error" should be displayed
    Then element with xpath "//mat-error" should contain text "This field is required"

  @negative @login
  Scenario: Login with Invalid Email Format
    When I type "student1test.com" into element with xpath "//*[@formcontrolname='email']"
    And I type "Password123" into element with xpath "//*[@formcontrolname='password']"
    And I wait for 2 sec
    Then element with xpath "//mat-error" should contain text "Should be a valid email address"

  Scenario Outline: Login with multiple credentials
    And I type "<email>" into element with xpath "//*[@formcontrolname='email']"
    And I type "<password>" into element with xpath "//*[@formcontrolname='password']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for 2 sec
    Then element with xpath "<resultXpath>" should contain text "<message>"

    Examples:
      | email                | password     | resultXpath                    | message                |
      | student1@test.com    | ABC123       | //p[contains(text(),'STUDENT')]| STUDENT                |
      | student1@test.com    | WrongPass    | //simple-snack-bar             | Authentication failed  |

  @Login
  Scenario: Password is masked, copy/paste is disabled
    And I type "<password>" into element with xpath "//*[@formcontrolname='password']"
    Then element with xpath "//*[@formcontrolname='password']" should have attribute "type" as "password"
