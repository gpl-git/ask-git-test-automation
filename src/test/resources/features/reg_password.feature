@smoke @regression
Feature: Password / Confirm Password Registration Test

#  Test Set - FEB26-103
  Background:
    Given I open url "http://ask-qa.portnov.com/#/registration"
    And I type "Josh" into element with xpath "//input[@formcontrolname='firstName']"
    And I type "N" into element with xpath "//input[@formcontrolname='lastName']"
    And I type "jzionna@tempmail247.top" into element with xpath "//input[@formcontrolname='email']"
    And I type "XYZ" into element with xpath "//input[@formcontrolname='group']"

  @smoke @password1
  Scenario: Happy Path - Positive Test
    And I type "Password" into element with xpath "//input[@formcontrolname='password']"
    And I type "Password" into element with xpath "//input[@formcontrolname='confirmPassword']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for 3 sec
    Then element with xpath "//h4[contains(text(), 'You have been Registered')]" should contain text "You have been Registered"

  @password2
  Scenario: Minimum Length of 5 Character
    And I type "1234" into element with xpath "//input[@formcontrolname='password']"
    And I type "1234" into element with xpath "//input[@formcontrolname='confirmPassword']"
    And I click on element with xpath "//button[@type='submit']"
    Then element with xpath "(//mat-error[@role='alert'])[1]" should contain text "Should be at least 5 characters"
    And element with xpath "(//mat-error[@role='alert'])[2]" should contain text "Should be at least 5 characters"

  @password3
  Scenario: Cannot be empty
    And I type "" into element with xpath "//input[@formcontrolname='password']"
    And I type "" into element with xpath "//input[@formcontrolname='confirmPassword']"
    And I click on element with xpath "//button[@type='submit']"
    Then element with xpath "(//mat-error[@role='alert'])[1]" should contain text "This field is required"
    And element with xpath "(//mat-error[@role='alert'])[2]" should contain text "This field is required"

  Scenario: Maximum Length of 32 Characters
    And I type "12345678901234567890123456789012" into element with xpath "//input[@formcontrolname='password']"
    And I type "12345678901234567890123456789012" into element with xpath "//input[@formcontrolname='confirmPassword']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for 3 sec
    Then element with xpath "//h4[contains(text(), 'You have been Registered')]" should contain text "You have been Registered"
  @password4
  Scenario:  Exceeding Maximum Length (33 Characters)
    And I type "123456789012345678901234567890123" into element with xpath "//input[@formcontrolname='password']"
    And I type "123456789012345678901234567890123" into element with xpath "//input[@formcontrolname='confirmPassword']"
    And I click on element with xpath "//button[@type='submit']"
    #  Known Issue. FEB26-351
    Then element with xpath "(//mat-error[@role='alert'])[1]" should contain text "Should be at most 32 characters"
    And element with xpath "(//mat-error[@role='alert'])[2]" should contain text "Should be at most 32 characters"

  @password5
  Scenario: White Spaces are Not Allowed
    And I type " " into element with xpath "//input[@formcontrolname='password']"
    And I type " " into element with xpath "//input[@formcontrolname='confirmPassword']"
    And I click on element with xpath "//button[@type='submit']"
    Then element with xpath "(//mat-error[@role='alert'])[1]" should contain text "Whitespaces are not allowed"
    And element with xpath "(//mat-error[@role='alert'])[2]" should contain text "Whitespaces are not allowed"

  @password6
  Scenario: Passwords Must Match
    And I type "12345" into element with xpath "//input[@formcontrolname='password']"
    And I type "45678" into element with xpath "//input[@formcontrolname='confirmPassword']"
    And I click on element with xpath "//button[@type='submit']"
    And element with xpath "//mat-error" should contain text "Entered passwords should match"

  Scenario: Passwords Must Match (Bug Test)
    And I type "12345" into element with xpath "//input[@formcontrolname='password']"
    And I type "12345" into element with xpath "//input[@formcontrolname='confirmPassword']"
    And I clear element with xpath "//input[@formcontrolname='confirmPassword']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for 5 sec
    #  Known Issue. FEB26-199
    And element with xpath "//mat-error" should contain text "Entered passwords should match"

