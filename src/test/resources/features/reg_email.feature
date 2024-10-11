@reg_demo
Feature: Registration Demo - Email

  Background:
    Given I open url "http://ask-qa.portnov.com/#/login"
    Then I should see page title contains "Portnov"
    When I click on element with xpath "//span[contains(text(),'Register Now')]"
    And I wait for 1 sec
    When I type "Alice" into element with xpath "//input[@formcontrolname='firstName']"
    When I type "White" into element with xpath "//input[@formcontrolname='lastName']"
    When I type "ABC" into element with xpath "//input[@formcontrolname='group']"
    When I type "12345" into element with xpath "//input[@formcontrolname='password']"
    When I type "12345" into element with xpath "//input[@formcontrolname='confirmPassword']"

  @reg_demo1
  Scenario: Happy Path
    When I type "abc@123.com" into element with xpath "//input[@formcontrolname='email']"
    And I click on element with xpath "//span[contains(text(),'Register Me')]"
    And I wait for 1 sec
    Then element with xpath "//h4" should be displayed
    Then element with xpath "//h4" should have text as "You have been Registered."

  @reg_demo2
  Scenario: This field is required
    When I type "" into element with xpath "//input[@formcontrolname='email']"
    And I click on element with xpath "//span[contains(text(),'Register Me')]"
    And I wait for 2 sec
    Then element with xpath "(//div[@class='mat-input-wrapper mat-form-field-wrapper'])[3]" should contain text "This field is required"
    And I wait for 2 sec

  @reg_demo3
  Scenario: Leading whitespaces should not be allowed
    When I type " asd@gil.co" into element with xpath "//input[@formcontrolname='email']"
    And I click on element with xpath "//span[contains(text(),'Register Me')]"
    And I wait for 2 sec
    Then element with xpath "(//div[@class='mat-input-wrapper mat-form-field-wrapper'])[3]" should contain text "Should be a valid email address"
#    Then element with xpath "//mat-error[@class='mat-error ng-star-inserted']/../..//*[contains(text(),'valid email address')]" should contain text "Should be a valid email address"

  @reg_demo4
  Scenario: Local part should accept 64 characters
    When I type "qwerertsdfadgshycvfdgtytvdfggfghyjvbgfftysrrenbsbnsdnejhdbndkhaa@gmail.com" into element with xpath "//input[@formcontrolname='email']"
    And I click on element with xpath "//span[contains(text(),'Register Me')]"
    And I wait for 1 sec
    Then element with xpath "//h4" should be displayed
    Then element with xpath "//h4" should have text as "You have been Registered."

  @reg_demo24
  Scenario: Local part should not accept more than 64 ( 64+1 ) characters
    When I type "aqwerertsdfadgshycvfdgtytvdfggfghyjvbgfftysrrenbsbnsdnejhdbndkhaa@gmail.com" into element with xpath "//input[@formcontrolname='email']"
    And I click on element with xpath "//span[contains(text(),'Register Me')]"
    And I wait for 1 sec
    Then element with xpath "(//div[@class='mat-input-wrapper mat-form-field-wrapper'])[3]" should contain text "Should be a valid email address"
    And I wait for 1 sec

  @reg_demo5
  Scenario: Domain part should accept 63 characters
    When I type "a@aqwerertsdfadgshycvfdgtytvdfggfghyjvbgfftysrrenbsbnsdnejhdbndkh.com" into element with xpath "//input[@formcontrolname='email']"
    And I click on element with xpath "//span[contains(text(),'Register Me')]"
    And I wait for 1 sec
    Then element with xpath "//h4" should be displayed
    Then element with xpath "//h4" should have text as "You have been Registered."
    And I wait for 1 sec

  @reg_demo6
  Scenario: Domain part should not exceed 63+1 characters
    When I type "a@aaqwerertsdfadgshycvfdgtytvdfggfghyjvbgfftysrrenbsbnsdnejhdbndkh.com" into element with xpath "//input[@formcontrolname='email']"
    And I click on element with xpath "//span[contains(text(),'Register Me')]"
    And I wait for 1 sec
    Then element with xpath "(//div[@class='mat-input-wrapper mat-form-field-wrapper'])[3]" should contain text "Should be a valid email address"
    And I wait for 1 sec


  @reg_demo7
  Scenario: Top-level domain should accept 63 characters
    When I type "a@gmail.aqwerertsdfadgshycvfdgtytvdfggfghyjvbgfftysrrenbsbnsdnejhdbndkh" into element with xpath "//input[@formcontrolname='email']"
    And I click on element with xpath "//span[contains(text(),'Register Me')]"
    And I wait for 1 sec
    Then element with xpath "//h4" should be displayed
    Then element with xpath "//h4" should have text as "You have been Registered."
    And I wait for 1 sec

  @reg_demo8
  Scenario: Top-level domain should not accept 63+1 characters
    When I type "a@gmail.aaqwerertsdfadgshycvfdgtytvdfggfghyjvbgfftysrrenbsbnsdnejhdbndkh" into element with xpath "//input[@formcontrolname='email']"
    And I click on element with xpath "//span[contains(text(),'Register Me')]"
    And I wait for 1 sec
    Then element with xpath "(//div[@class='mat-input-wrapper mat-form-field-wrapper'])[3]" should contain text "Should be a valid email address"
    And I wait for 1 sec


  @reg_demo9
  Scenario: Email field should accept 128 characters
    When I type "adghavshbdjsjndksdnkmsdlsmdlmsdmsdsdsdsdsdsdsdsddsdssddd@gmail.aqwerertsdfadgshycvfdgtytvdfggfghyjvbgfftysrrenbsbnsdnejhdbnh.com" into element with xpath "//input[@formcontrolname='email']"
    And I click on element with xpath "//span[contains(text(),'Register Me')]"
    And I wait for 1 sec
    Then element with xpath "//h4" should be displayed
    Then element with xpath "//h4" should have text as "You have been Registered."
    And I wait for 1 sec

  @reg_demo10
  Scenario:  Email field should not accept more than 128 (128+1) characters
    When I type "aa@gmail.aaqwerertsdfadgshycvfdgtytvdfggfghyjvbgfftysrrenbsbnsdnejhdbndkh" into element with xpath "//input[@formcontrolname='email']"
    And I click on element with xpath "//span[contains(text(),'Register Me')]"
    And I wait for 1 sec
    Then element with xpath "(//div[@class='mat-input-wrapper mat-form-field-wrapper'])[3]" should contain text "Should be a valid email address"
    And I wait for 1 sec

  @reg_demo11
  Scenario: Whitespaces should not be allowed between parts of an email address
    When I type "asd @ gil .co" into element with xpath "//input[@formcontrolname='email']"
    And I click on element with xpath "//span[contains(text(),'Register Me')]"
    And I wait for 1 sec
    Then element with xpath "(//div[@class='mat-input-wrapper mat-form-field-wrapper'])[3]" should contain text "Should be a valid email address"
    And I wait for 1 sec

  @reg_demo12
  Scenario: Trailing Whitespaces should not be allowed
    When I type "asd@gil.co " into element with xpath "//input[@formcontrolname='email']"
    And I click on element with xpath "//span[contains(text(),'Register Me')]"
    And I wait for 1 sec
    Then element with xpath "(//div[@class='mat-input-wrapper mat-form-field-wrapper'])[3]" should contain text "Should be a valid email address"
    And I wait for 1 sec

  @reg_demo13
  Scenario: Email address with consecutive dots (..) should not be allowed
    When I type "asd@gil..co" into element with xpath "//input[@formcontrolname='email']"
    And I click on element with xpath "//span[contains(text(),'Register Me')]"
    And I wait for 1 sec
    Then element with xpath "(//div[@class='mat-input-wrapper mat-form-field-wrapper'])[3]" should contain text "Should be a valid email address"
    And I wait for 1 sec

  @reg_demo14
  Scenario: Email field should not accept email address without '@' symbol
    When I type "asdgil.co" into element with xpath "//input[@formcontrolname='email']"
    And I click on element with xpath "//span[contains(text(),'Register Me')]"
    And I wait for 1 sec
    Then element with xpath "(//div[@class='mat-input-wrapper mat-form-field-wrapper'])[3]" should contain text "Should be a valid email address"
    And I wait for 1 sec

  @reg_demo15
  Scenario: Email field does not accept special characters in the domain part
    When I type "asdgil@g#mail.com" into element with xpath "//input[@formcontrolname='email']"
    And I click on element with xpath "//span[contains(text(),'Register Me')]"
    And I wait for 1 sec
    Then element with xpath "(//div[@class='mat-input-wrapper mat-form-field-wrapper'])[3]" should contain text "Should be a valid email address"
    And I wait for 1 sec

  @reg_demo16
  Scenario: Email field should accept special characters in the local part
    When I type "as!%&dgil@gmail.com" into element with xpath "//input[@formcontrolname='email']"
    And I click on element with xpath "//span[contains(text(),'Register Me')]"
    And I wait for 1 sec
    Then element with xpath "//h4" should be displayed
    Then element with xpath "//h4" should have text as "You have been Registered."
    And I wait for 1 sec

  @reg_demo17
  Scenario: Email field should not accept '@' in the local part
    When I type "a@sdgil@gmail.com" into element with xpath "//input[@formcontrolname='email']"
    And I click on element with xpath "//span[contains(text(),'Register Me')]"
    And I wait for 1 sec
    Then element with xpath "(//div[@class='mat-input-wrapper mat-form-field-wrapper'])[3]" should contain text "Should be a valid email address"
    And I wait for 1 sec

  @reg_demo18
  Scenario: Email field should not accept ',' in the local part
    When I type "as,dgil@gmail.com" into element with xpath "//input[@formcontrolname='email']"
    And I click on element with xpath "//span[contains(text(),'Register Me')]"
    And I wait for 1 sec
    Then element with xpath "(//div[@class='mat-input-wrapper mat-form-field-wrapper'])[3]" should contain text "Should be a valid email address"
    And I wait for 1 sec

  @reg_demo19
  Scenario: Email field with valid top level domain
    When I type "asdgil@gmail.co" into element with xpath "//input[@formcontrolname='email']"
    And I click on element with xpath "//span[contains(text(),'Register Me')]"
    And I wait for 1 sec
    Then element with xpath "//h4" should be displayed
    Then element with xpath "//h4" should have text as "You have been Registered."
    And I wait for 1 sec

  @reg_demo28
  Scenario: Email field should not accept invalid top level domains
    When I type "asdgil@gmail.local" into element with xpath "//input[@formcontrolname='email']"
    And I click on element with xpath "//span[contains(text(),'Register Me')]"
    And I wait for 2 sec
    Then element with xpath "(//div[@class='mat-input-wrapper mat-form-field-wrapper'])[3]" should contain text "Should be a valid email address"
    And I wait for 1 sec

  @reg_demo20
  Scenario: Email field with valid top level domain
    When I type "asdgil@gmail.org" into element with xpath "//input[@formcontrolname='email']"
    And I click on element with xpath "//span[contains(text(),'Register Me')]"
    And I wait for 1 sec
    Then element with xpath "//h4" should be displayed
    Then element with xpath "//h4" should have text as "You have been Registered."
    And I wait for 1 sec

  @reg_demo21
  Scenario: Local part should accept 63 characters
    When I type "werertsdfadgshycvfdgtytvdfggfghyjvbgfftysrrenbsbnsdnejhdbndkhaa@gmail.com" into element with xpath "//input[@formcontrolname='email']"
    And I click on element with xpath "//span[contains(text(),'Register Me')]"
    And I wait for 1 sec
    Then element with xpath "//h4" should be displayed
    Then element with xpath "//h4" should have text as "You have been Registered."
    And I wait for 1 sec

  @reg_demo22
  Scenario: Domain part should accept 62 characters
    When I type "a@qwerertsdfadgshycvfdgtytvdfggfghyjvbgfftysrrenbsbnsdnejhdbndkh.com" into element with xpath "//input[@formcontrolname='email']"
    And I click on element with xpath "//span[contains(text(),'Register Me')]"
    And I wait for 1 sec
    Then element with xpath "//h4" should be displayed
    Then element with xpath "//h4" should have text as "You have been Registered."
    And I wait for 1 sec

  @reg_demo23
  Scenario: Top-level domain should accept 62 characters
    When I type "a@gmail.qwerertsdfadgshycvfdgtytvdfggfghyjvbgfftysrrenbsbnsdnejhdbndkh" into element with xpath "//input[@formcontrolname='email']"
    And I click on element with xpath "//span[contains(text(),'Register Me')]"
    And I wait for 1 sec
    Then element with xpath "//h4" should be displayed
    Then element with xpath "//h4" should have text as "You have been Registered."
    And I wait for 1 sec

  @reg_demo25
  Scenario: Email field should accept 127 ( Max 128-1 ) characters
    When I type "dghavshbdjsjndksdnkmsdlsmdlmsdmsdsdsdsdsdsdsdsddsdssddd@gmail.aqwerertsdfadgshycvfdgtytvdfggfghyjvbgfftysrrenbsbnsdnejhdbnh.com" into element with xpath "//input[@formcontrolname='email']"
    And I click on element with xpath "//span[contains(text(),'Register Me')]"
    And I wait for 1 sec
    Then element with xpath "//h4" should be displayed
    Then element with xpath "//h4" should have text as "You have been Registered."
    And I wait for 1 sec

  @reg_demo26
  Scenario: Email address with no local part
    When I type "@domain.com" into element with xpath "//input[@formcontrolname='email']"
    And I click on element with xpath "//span[contains(text(),'Register Me')]"
    And I wait for 1 sec
    Then element with xpath "(//div[@class='mat-input-wrapper mat-form-field-wrapper'])[3]" should contain text "Should be a valid email address"
    And I wait for 1 sec

  @reg_demo27
  Scenario: Email address with a missing top-level domain
    When I type "asdf@gmail" into element with xpath "//input[@formcontrolname='email']"
    And I click on element with xpath "//span[contains(text(),'Register Me')]"
    And I wait for 1 sec
    Then element with xpath "(//div[@class='mat-input-wrapper mat-form-field-wrapper'])[3]" should contain text "Should be a valid email address"
    And I wait for 1 sec

  @reg_demo29
  Scenario: Email address with a missing top-level domain
    When I type "asdf@gmail." into element with xpath "//input[@formcontrolname='email']"
    And I click on element with xpath "//span[contains(text(),'Register Me')]"
    And I wait for 1 sec
    Then element with xpath "(//div[@class='mat-input-wrapper mat-form-field-wrapper'])[3]" should contain text "Should be a valid email address"
    And I wait for 1 sec


  @email_invalid_16
  Scenario Outline: Invalid Email addresses
    When I type <emailValue> into element with xpath "//input[@formcontrolname='email']"
    And I click on element with xpath "//span[contains(text(),'Register Me')]"
    And I wait for 2 sec
    Then element with xpath "(//div[contains(@class,'mat-input-subscript-wrapper')])[3]" should contain text "Should be a valid email address"
    And I wait for 3 sec
    Examples:
      | emailValue     |
#      | "asdf@gmail"  |
      | "@domain.com" |
#      | "asdgil@gmail.local" |
      | "as,dgil@gmail.com"    |
      |   "a@sdgil@gmail.com"     |
      |      "asdgil@g#mail.com"  |
      |         "asdgil.co"        |
      |         "asd@gil..co"    |
      |          "asd@gil.co "  |
      |      "asd @ gil .co"     |
      | "aa@gmail.aaqwerertsdfadgshycvfdgtytvdfggfghyjvbgfftysrrenbsbnsdnejhdbndkh"  |
      |     "a@gmail.aaqwerertsdfadgshycvfdgtytvdfggfghyjvbgfftysrrenbsbnsdnejhdbndkh"  |
      |   "a@aaqwerertsdfadgshycvfdgtytvdfggfghyjvbgfftysrrenbsbnsdnejhdbndkh.com"  |
      |    "aqwerertsdfadgshycvfdgtytvdfggfghyjvbgfftysrrenbsbnsdnejhdbndkhaa@gmail.com"  |
      |   " asd@gil.co" |
      | "asdf@gmail." |

  @email_valid_12
  Scenario Outline: Happy Path
    When I type <text> into element with xpath "//input[@formcontrolname='email']"
    And I click on element with xpath "//span[contains(text(),'Register Me')]"
    And I wait for 1 sec
    Then element with xpath "//h4" should be displayed
    Then element with xpath "//h4" should have text as "You have been Registered."
    And I wait for 2 sec
    Examples:
      | text               |
      | "abc@123.com" |
      | "qwerertsdfadgshycvfdgtytvdfggfghyjvbgfftysrrenbsbnsdnejhdbndkhaa@gmail.com"  |
      | "a@aqwerertsdfadgshycvfdgtytvdfggfghyjvbgfftysrrenbsbnsdnejhdbndkh.com"       |
      | "a@gmail.aqwerertsdfadgshycvfdgtytvdfggfghyjvbgfftysrrenbsbnsdnejhdbndkh"     |
      | "adghavshbdjsjndksdnkmsdlsmdlmsdmsdsdsdsdsdsdsdsddsdssddd@gmail.aqwerertsdfadgshycvfdgtytvdfggfghyjvbgfftysrrenbsbnsdnejhdbnh.com"  |
      | "as!%&dgil@gmail.com"  |
      | "asdgil@gmail.co"      |
      | "asdgil@gmail.org"     |
      | "werertsdfadgshycvfdgtytvdfggfghyjvbgfftysrrenbsbnsdnejhdbndkhaa@gmail.com" |
      | "a@qwerertsdfadgshycvfdgtytvdfggfghyjvbgfftysrrenbsbnsdnejhdbndkh.com"      |
      | "a@gmail.qwerertsdfadgshycvfdgtytvdfggfghyjvbgfftysrrenbsbnsdnejhdbndkh"    |
      | "dghavshbdjsjndksdnkmsdlsmdlmsdmsdsdsdsdsdsdsdsddsdssddd@gmail.aqwerertsdfadgshycvfdgtytvdfggfghyjvbgfftysrrenbsbnsdnejhdbnh.com" |

