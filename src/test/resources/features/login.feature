@regression
Feature: Login


  @smoke @login1
  Scenario: Successful login with valid credentials
    When I open url "http://ask-qa.portnov.com/#/login"
    Then I should see page title contains "Assessment Control"
    When I type "snow@gustr.com" into element with xpath "//*[@formcontrolname='email']"
    And I type "12345" into element with xpath "//*[@formcontrolname='password']"
    And I click on element with xpath "//*[@type='submit']"
    And I wait for element with xpath "//ac-home-page" to be present
    And I wait for 2 sec

  @smoke @login1
  Scenario: Login with invalid password
    When I open url "http://ask-qa.portnov.com/#/login"
    Then I should see page title contains "Assessment Control"
    When I type "snow@gustr.com" into element with xpath "//*[@formcontrolname='email']"
    And I type "wrongpass" into element with xpath "//*[@formcontrolname='password']"
    And I click on element with xpath "//*[@type='submit']"
    And I wait for 2 sec
    Then element with xpath "//simple-snack-bar" should be displayed
    Then element with xpath "//simple-snack-bar" should contain text "Authentication failed. User not found or password does not match"


  @login3
  Scenario: Login with empty fields
    When I open url "http://ask-qa.portnov.com/#/login"
    Then I should see page title contains "Assessment Control"
    When I click on element with xpath "//*[@type='submit']"
    Then element with xpath "//mat-error" should be displayed
    Then element with xpath "//mat-error" should contain text "This field is required"

  @login4
  Scenario: Login - Password is masked and copy/paste disabled
    When I open url "http://ask-qa.portnov.com/#/login"
    Then I should see page title contains "Assessment Control"
    When I type "snow@gustr.com" into element with xpath "//*[@formcontrolname='email']"
    And I type "wrongpass" into element with xpath "//*[@formcontrolname='password']"
    Then element with xpath "//*[@formcontrolname='password']" should have attribute "type" as "password"


