@login @regression
Feature: Login  Background:
Given I open url "http://ask-qa.portnov.com/#/login"
Then I should see page title as "Assessment Control @ Portnov"

  @login_positive @login_teacher @smoke
  Scenario: Login -Teacher - Happy Path
    When I type "justure89@gustr.com" into element with xpath "//input[@formcontrolname='email']"
    And I type "123456" into element with xpath "//input[@formcontrolname='password']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for 3 sec
    Then element with xpath "//h3" should contain text "abc"
    And element with xpath "(//p)[1]" should contain text "TEACHER"
    And element with xpath "//ac-home-teacher[@class='ng-star-inserted']" should be displayed

  @login_positive @login_student @smoke
  Scenario: Login - Student - Happy Path
    When I type "goake1988@armyspy.com" into element with xpath "//input[@formcontrolname='email']"
    And I type "123456" into element with xpath "//input[@formcontrolname='password']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for 3 sec
    Then element with xpath "//h3" should contain text "ASJ Student1"
    And element with xpath "(//p)[1]" should contain text "STUDENT"
    And element with xpath "//ac-home-student[@class='ng-star-inserted']" should be displayed

  @login_negative @login_incorrectData
  Scenario Outline: Login - Incorrect Email/Password - Negative
    When I type <email> into element with xpath "//input[@formcontrolname='email']"
    And I type <password> into element with xpath "//input[@formcontrolname='password']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for 1 sec
    Then element with xpath <label> should contain text <error>

    Examples:
      | email                     |  password        | label                    | error |
      | "justure89@gustr123.com"  |  "123456"        | "//simple-snack-bar"     |  "Authentication failed. User not found or password does not match"    |
      | "justure89@gustr.com"     |  "12345"         | "//simple-snack-bar"     |  "Authentication failed. User not found or password does not match"    |
      | ""                        |  "123456"        | "//mat-error"            |  "This field is required"                                              |
      | "justure89@gustr.com"     |  ""              | "//mat-error"            |  "This field is required"                                              |
      | " justure89@gustr.com"    |  "123456"        | "//mat-error"            |  "Should be a valid email address"                                     |
      | "justure89@gustr.com "    |  "123456"        | "//mat-error"            |  "Should be a valid email address"                                     |
      | "justure89@gustr...com "  |  "123456"        | "//mat-error"            |  "Should be a valid email address"                                     |
      | "justure89@gustr.com"     |  " 123456"       | "//mat-error"            |  "Whitespaces are not allowed"                                         |

  @login_positive @login_caseInsensitive
  Scenario: Login - Email is case insensitive
    When I type "JUSTURE89@gustr.com" into element with xpath "//input[@formcontrolname='email']"
    And I type "123456" into element with xpath "//input[@formcontrolname='password']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for 3 sec
    Then element with xpath "//h3" should contain text "abc"
    And element with xpath "(//p)[1]" should contain text "TEACHER"
    And element with xpath "//ac-home-teacher[@class='ng-star-inserted']" should be displayed

  @login_password @login_positive
  Scenario: Login - Password should be masked
    When I type "JUSTURE89@gustr.com" into element with xpath "//input[@formcontrolname='email']"
    And I type "123456" into element with xpath "//input[@formcontrolname='password']"
    Then element with xpath "//input[@formcontrolname='password']" should have attribute "type" as "password"

  @login_password @login_negative
  Scenario: Login - Password field is case sensitive - Negative
    When I type "qa.sofi@gmail.com" into element with xpath "//input[@formcontrolname='email']"
    And I type "abc123" into element with xpath "//input[@formcontrolname='password']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for 1 sec
    Then element with xpath "//simple-snack-bar" should contain text "Authentication failed. User not found or password does not match"



