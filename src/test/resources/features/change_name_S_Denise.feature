#change_username.feature

@ChangeUsername
Feature: Change Username

  Background:
    Given I open url "http://ask-qa.portnov.com/#/login"
    Then I should see page title as "Assessment Control @ Portnov"
    When I type "diesch@bentsgolf.com" into element with xpath "//input[@formcontrolname='email']"
    And I type "bentsgoft456" into element with xpath "//input[@formcontrolname='password']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for 2 sec
    # original name is Denise Bentsgoft
    Then element with xpath "//h3[contains(text(), 'Denise Bentsgoft')]" should be displayed
    Then I click on element with xpath "//*[text() = 'Settings']"
    And I wait for 2 sec
    # clear the name field
    When I click on element with xpath "//*[text() = 'Change Your Name']"
    Then I clear element with xpath "//input[@formcontrolname='name']"

  @ChangeUsername1
  Scenario: Change valid username
  # change name
    And I type "Denise Student" into element with xpath "//input[@formcontrolname='name']"
    Then I click on element with xpath "//span[@class='mat-button-wrapper' and text()='Change']"
    And I wait for 2 sec
    Then element with xpath "//h3[contains(text(), 'Denise Student')]" should be displayed
    # change name back to Denise Bentsgoft
    When I click on element with xpath "//*[text() = 'Change Your Name']"
    Then I clear element with xpath "//input[@formcontrolname='name']"
    And I type "Denise Bentsgoft" into element with xpath "//input[@formcontrolname='name']"
    Then I click on element with xpath "//span[@class='mat-button-wrapper' and text()='Change']"
    And I wait for 2 sec
    Then element with xpath "//h3[contains(text(), 'Denise Bentsgoft')]" should be displayed
  @ChangeUsername2
  Scenario: empty username
  # change name
    And I type "" into element with xpath "//input[@formcontrolname='name']"
    #Then I wait for 2 sec
    Then I hit enter key on element with xpath "//input[@formcontrolname='name']"
    And I wait for 2 sec
    Then element with xpath "//mat-error" should be displayed
    Then element with xpath "//mat-error" should contain text "This field is required"


  @ChangeUsername3
  Scenario Outline: Change username error messages
  # Change to invalid name==> error message
    And I type <fullname> into element with xpath "//input[@formcontrolname='name']"
    Then I click on element with xpath "//span[@class='mat-button-wrapper' and text()='Change']"
    Then I wait for 1 sec
    Then element with xpath "//mat-error" should be displayed
    Then element with xpath "//mat-error" should contain text <error_message>
    #Then I wait for 2 sec
    # Make sure to change name back to Denise Bentsgoft in case apps crashes or has bugs
    Then I clear element with xpath "//input[@formcontrolname='name']"
    And I type "Denise Bentsgoft" into element with xpath "//input[@formcontrolname='name']"
    Then I click on element with xpath "//span[@class='mat-button-wrapper' and text()='Change']"
    And I wait for 2 sec
    Then element with xpath "//h3[contains(text(), 'Denise Bentsgoft')]" should be displayed
    Examples:
      | fullname | error_message |
      | ""       | "This field is required" |
      | "a"      | "Should contain only first and last name" |
      | "a b c"  | "Should contain only first and last name" |
      | " a b"   | "Should not contain leading or trailing spaces" |
      | " a b "  | "Should not contain leading or trailing spaces" |
      | "Denise@ Nguyen" | "Should contain only first and last name latin characters" |
      | "Denise #Nguyen" | "Should contain only first and last name latin characters" |
      | "123 Nguyen"     | "Should contain only first and last name latin characters" |
      | "a abcdefghijklmnopqrstuvwxzyzxsdabcdefghijklmnopqrstuvwxzyzxsdabcdefghijklmnopqrstuvwxzyzxsdabcddsdat" | "Too long. Should be no more than 100 characters" |
