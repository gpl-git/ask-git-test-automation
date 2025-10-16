@reg @regression
Feature: Forgot Password

  Background:
    Given I open url "http://ask-qa.portnov.com/#/forgot-password"
    Then I should see page title contains "Assessment Control"

  @forg_valid
  Scenario: Forgot Password - Valid Email
    Given I open url "http://ask-qa.portnov.com/#/forgot-password"
    Then I should see page title contains "Assessment Control"
    When I type "usik1986@yahoo.com" into element with xpath "//*[@formcontrolname='email']"
    And I click on element with xpath "//*[@type='submit']"
    And I wait for 1 sec
    And element with xpath "//h4']" should contain text "Your request is confirmed"
    And I wait for 3 sec

  @forg_invalid
  Scenario: Forgot Password - Invalid Email
    When I type "wrongemail@nomail.com" into element with xpath "//*[@formcontrolname='email']"
    And I click on element with xpath "//*[@type='submit']"
    And I wait for 1 sec
    And element with xpath "//simple-snack-bar" should contain text "Authentication failed"
    And I wait for 3 sec

  @forg_empty
  Scenario: Forgot Password - Empty Field
    When I type "" into element with xpath "//*[@formcontrolname='email']"
    When I click on element with xpath "//*[@type='submit']"
    And I wait for 1 sec
    And element with xpath "//mat-error" should contain text "This field is required"
    And I wait for 3 sec

  @forg_format
  Scenario: Forgot Password - Invalid Email Format
    When I type "email" into element with xpath "//*[@formcontrolname='email']"
    And I click on element with xpath "//*[@type='submit']"
    And element with xpath "//mat-error" should contain text "Should be a valid email address"
    And I wait for 3 sec
