# Login
#
#Valid email and valid password combination lets user in
#any other combination will be rejected
#Password field displays input in bullets
#"Cut" menu item on "Password" field is disabled
#"Copy" menu item on "Password" field is disabled
#Leading and trailing spaces are not allowed
#Email field Case insensitive
#PWD field Case sensitive

@smoke
@login
Feature: Login_Zukhra

  Background:
    Given I open url "http://ask-qa.portnov.com/#/login"
    Then  I should see page title as "Assessment Control @ Portnov"
  @login1
  Scenario: Valid email and valid password combination lets user in ("happy path")
    When I type "jlefko@bentsgolf.com" into element with xpath "//input[@placeholder='Email *']"
    When I type "12345" into element with xpath "//input[@formcontrolname='password']"
    And I click on element with xpath "//span[contains(text(),'Sign In')]"
    And I wait for 3 sec
    Then element with xpath "//h3[contains(text(),'Zukhra Abdullayeva')]" should be displayed
  @login2
  Scenario: invalid email/valid password
    When I type "jlefko@bentsgolf.co" into element with xpath "//input[@placeholder='Email *']"
    When I type "12345" into element with xpath "//input[@formcontrolname='password']"
    And I click on element with xpath "//span[contains(text(),'Sign In')]"
    And I wait for 1 sec
    Then element with xpath "//simple-snack-bar" should be displayed
    Then element with xpath "//simple-snack-bar" should contain text "Authentication failed. User not found or password does not match"
  @login3
  Scenario: valid email/invalid password
    When I type "jlefko@bentsgolf.com" into element with xpath "//input[@placeholder='Email *']"
    When I type "123456" into element with xpath "//input[@formcontrolname='password']"
    And I click on element with xpath "//span[contains(text(),'Sign In')]"
    And I wait for 1 sec
    Then element with xpath "//simple-snack-bar" should be displayed
    Then element with xpath "//simple-snack-bar" should contain text "Authentication failed. User not found or password does not match"
  @login4
  Scenario: Password field displays input in bullets, "Cut"/"Copy" menu item on "Password" field is disabled
    When I type "123456" into element with xpath "//input[@formcontrolname='password']"
    Then element with xpath "//input[@placeholder='Password *']" should be displayed
  @login5
  Scenario Outline: Leading and trailing spaces are not allowed
    When I type <text> into element with xpath "//input[@placeholder='Email *']"
    When I type "12345" into element with xpath "//input[@formcontrolname='password']"
    And I click on element with xpath "//span[contains(text(),'Sign In')]"
    Then element with xpath "//mat-error" should contain text "Should be a valid email address"
    Examples:
      | text                    |
      | " jlefko@bentsgolf.com" |
      | "jlefko@bentsgolf.com " |
  @login6
  Scenario: Email field Case insensitive
    When I type "Jlefko@bentsgolf.com" into element with xpath "//input[@placeholder='Email *']"
    And I type "12345" into element with xpath "//input[@formcontrolname='password']"
    And I click on element with xpath "//span[contains(text(),'Sign In')]"
    And I wait for 3 sec
    Then element with xpath "//h3[contains(text(),'Zukhra Abdullayeva')]" should be displayed
  @login7
  Scenario: PWD field Case sensitive
    When I type "qa.sofi@gmail.com" into element with xpath "//input[@placeholder='Email *']"
    When I type "aBC123" into element with xpath "//input[@formcontrolname='password']"
    And I click on element with xpath "//span[contains(text(),'Sign In')]"
    And I wait for 1 sec
    Then element with xpath "//simple-snack-bar" should be displayed
    Then element with xpath "//simple-snack-bar" should contain text "Authentication failed. User not found or password does not match"
















