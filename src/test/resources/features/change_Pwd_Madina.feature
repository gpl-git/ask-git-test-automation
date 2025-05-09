@regression @change_pwd
Feature: Student Settings- Change Password

  Background:
    Given I open url "http://ask-qa.portnov.com/#/login"
    Then I should see page title contains "Assessment Control"
    When I type "disho1988@gustr.com" into element with xpath "//input[@formcontrolname='email']"
    And I type "12345" into element with xpath "//input[@formcontrolname='password']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for element with xpath "//main[@class='ng-tns-c0-0']" to be present
    And I wait for 2 sec
    When I click on element with xpath "//h5[text()='Settings']"
    And I wait for 2 sec
    When I click on element with xpath "//span[text()='Change Your Password']"
    And I wait for element with xpath "//h1" to be present
    And element with xpath "//h1" should contain text "Changing Password"
    When I type "12345" into element with xpath "//input[@formcontrolname='password']"

  @change_pwd1
  Scenario: Change Password Student  - Happy Path
    And I type "321cxz" into element with xpath "//input[@formcontrolname='newPassword']"
    And I type "321cxz" into element with xpath "//input[@formcontrolname='confirmPassword']"
    When I click on element with xpath "//button[.//span[text()='Change']]"
    Then I wait for element with xpath "//h4" to be present
        #    This is a know issue Jira ticket APR25-588 The validation message should appear "The Password was changed successfully"
    When I click on element with xpath "//span[text()='Change Your Password']"
    And I wait for element with xpath "//h1" to be present
    And element with xpath "//h1" should contain text "Changing Password"

  @change_pwd2
  Scenario Outline: Change Password Student  - Allowed input
    When I type "<newPassword>" into element with xpath "//input[@formcontrolname='newPassword']"
    And I type "<confirmPassword>" into element with xpath "//input[@formcontrolname='confirmPassword']"
    And I click on element with xpath "//button[.//span[text()='Change']]"
    Then I wait for element with xpath "//h4" to be present
    Examples:
      | newPassword                      | confirmPassword                  |
      | ASDF@                            | ASDF@                            |
      | asdf-                            | asdf-                            |
      | AsDf1                            | AsDf1                            |
      | x@c.aaaa2aaaaaaaaaaggggggggggggg | x@c.aaaa2aaaaaaaaaaggggggggggggg |
      | 12345                            | 12345                            |


  @change_pwd3
  Scenario: Change Password Student  - Negative Path White spaces
#         White spaces are not allowed
    When I type "321 cxz" into element with xpath "//input[@formcontrolname='newPassword']"
    And I wait for element with xpath "//*[contains(text(), 'Whitespaces')]" to be present
    Then element with xpath "//*[contains(text(), 'Whitespaces')]" should contain text "Whitespaces are not allowed"

  @change_pwd4
  Scenario: Change Password Student  - Negative Path Password must match
#         Password must match Confirm Password
    When I type "321cxz" into element with xpath "//input[@formcontrolname='newPassword']"
    And I type "cxz321" into element with xpath "//input[@formcontrolname='confirmPassword']"
    And I wait for element with xpath "//*[contains(text(), 'Entered passwords')]" to be present
    Then element with xpath "//*[contains(text(), 'Entered passwords')]" should contain text "Entered passwords should match"

  @change_pwd5
  Scenario: Change Password Student  - Negative Path Minimum
#         Minimum (5) characters
    When I type "1234" into element with xpath "//input[@formcontrolname='newPassword']"
    And I wait for element with xpath "//*[contains(text(), 'Should be')]" to be present
    Then element with xpath "//*[contains(text(), 'Should be')]" should contain text "Should be at least 5 characters"

  @change_pwd6
  Scenario: Change Password Student  - Negative Path Maximum
#         Maximum (32) characters
    When I type "x@c.aaaa2aaaaaaaaaagggggggggggggt" into element with xpath "//input[@formcontrolname='newPassword']"
    And I type "x@c.aaaa2aaaaaaaaaagggggggggggggt" into element with xpath "//input[@formcontrolname='confirmPassword']"
    #    This is a know issue Jira ticket APR25-589 The validation message should appear "The Password is too long."