#Teacher: Galina Lagunova
#Group: ASK-NOV24
#Student: Umsunai Kubatbekova

@regression
Feature: ask.qa-portnov.com - change password as a student

  Background:
    Given I open url "http://ask-qa.portnov.com/#/login"
    When I type "jbfan71@chupanhcuoidep.com" into element with xpath "//input[@formcontrolname='email']"
    And I type "12345A" into element with xpath "//input[@formcontrolname='password']"
    And I click on element with xpath "//span[contains(text(),'Sign In')]"
    And I wait for 3 sec
    When I click on element with xpath "//h5[contains(text(),'Settings')]"
    And I click on element with xpath "//span[contains(text(),'Change Your Password')]"
    Then I type "12345A" into element with xpath "//input[@formcontrolname='password']"
    And I wait for 3 sec

  @password_min
  Scenario: Minimum (5) characters
    And I type "1aU!@" into element with xpath "//input[@formcontrolname='newPassword']"
    And I type "1aU!@" into element with xpath "//input[@formcontrolname='confirmPassword']"
    Then I click on element with xpath "//span[text()='Change']"
    And I wait for 3 sec

  @password_errors
  Scenario Outline: Password field - Error Messages
    And I type <text> into element with xpath "//input[@formcontrolname='newPassword']"
    And I wait for 3 sec
    And I click on element with xpath "//input[@formcontrolname='confirmPassword']"
    And I wait for 3 sec
    Then element with xpath "//mat-error" should contain text <error>
    And I wait for 3 sec

    Examples:
      | text              | error                             |
      | "1234"            | "Should be at least 5 characters" |
      | ""                | "This field is required"          |
      | "1 uk"            | "Whitespaces are not allowed"     |
#     This is a know issue. The bug was reported by Anton Sobolev, ticket: NOV24-518
      | "jjfdjfjfjhduhihfhdfhfdffhhdfhfdfg"            | "No more than 32 characters"      |

  @cPassword_match
  Scenario Outline: Password must match Confirm Password
    Then I type <text> into element with xpath "//input[@formcontrolname='newPassword']"
    And I wait for 3 sec
    Then I type <text1> into element with xpath "//input[@formcontrolname='confirmPassword']"
    And I wait for 3 sec
    And I click on element with xpath "//div[@class='cdk-overlay-pane']"
    Then element with xpath "//mat-error" should contain text <error>
    And I wait for 3 sec

    Examples:
      | text    | text1    | error                            |
      | "12345" | "123456" | "Entered passwords should match" |