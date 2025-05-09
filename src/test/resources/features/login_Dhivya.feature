@regression @login_page
Feature: Login page Demo

  Background:
    Given I open url "http://ask-qa.portnov.com/#/login"


  @login_page3
  Scenario: Login - Invalid credentials - Empty Email & Password
    When I type "" into element with xpath "//input[@formcontrolname='email']"
    And I type "" into element with xpath "//input[@formcontrolname='password']"
    Then I click on element with xpath "//button[@type='submit']"
    And I wait for 3 sec
    And element with xpath "//mat-error[@class='mat-error ng-star-inserted']" should contain text "This field is required"
    Then element with xpath "//mat-error[@class='mat-error ng-star-inserted']" should contain text "This field is required"



  @login_page4
  Scenario Outline: Login - Invalid credentials -invalid email or password -password case-sensitivity
    When I type <email> into element with xpath "//input[@formcontrolname='email']"
    And I type <password> into element with xpath "//input[@formcontrolname='password']"
    Then I click on element with xpath "//button[@type='submit']"
    And I wait for 3 sec
    And element with xpath "//simple-snack-bar" should contain text <error>
    Examples:
      | email                             | password | error                                                              |
      #invalid email and valid password combination
      | "Eforgoorable5555@jourrapide.com" |"12345"   | "Authentication failed. User not found or password does not match" |
      #valid email and invalid password combination
      | "Eforgoorable1944@jourrapide.com" |"123456"  | "Authentication failed. User not found or password does not match" |
      ##invalid email and invalid password combination
      | "Eforgoorable5555@jourrapide.com" |"123456"  | "Authentication failed. User not found or password does not match" |
      #Valid email and valid password(Changed to upper/lower case)(Checking case sensitivity)
      | "dhivyadurai90@gmail.com"         |"ABCD123" | "Authentication failed. User not found or password does not match" |

  @login_page5
  Scenario: Login - Invalid credentials - leading and trailing spaces in Email
    When I type "Eforgoorable1944@jourrapide.com " into element with xpath "//input[@formcontrolname='email']"
    And I type "12345" into element with xpath "//input[@formcontrolname='password']"
    Then I click on element with xpath "//button[@type='submit']"
    And I wait for 3 sec
    And element with xpath "//mat-error[@class='mat-error ng-star-inserted']" should contain text "Should be a valid email address"

  @login_page6
  Scenario: Login - Invalid credentials - leading and trailing spaces in password
    When I type "Eforgoorable1944@jourrapide.com" into element with xpath "//input[@formcontrolname='email']"
    And I type "12345 " into element with xpath "//input[@formcontrolname='password']"
    Then I click on element with xpath "//button[@type='submit']"
    And I wait for 3 sec
    And element with xpath "//mat-error[@class='mat-error ng-star-inserted']" should contain text "Whitespaces are not allowed"

  @login_page7
  Scenario Outline: Login -  Student/Teacher Role - Valid credentials
    When I type <email> into element with xpath "//input[@formcontrolname='email']"
    And I type <password> into element with xpath "//input[@formcontrolname='password']"
    Then I click on element with xpath "//button[@type='submit']"
    And I wait for 4 sec
    And element with xpath "//div//h3" should contain text <user>
    Then element with xpath "//div//p" should contain text <role>
    Examples:
      | email                             | password   | user            | role     |
      #valid Student credential
      | "Eforgoorable1944@jourrapide.com" | "12345"    |"Benny Brown"    | "STUDENT" |
      #valid Teacher credential
      | "dhivyadurai90@gmail.com"         |"abcd123"   | "Dhivya Durai"  | "TEACHER" |
      #Checking case sensitivity for email field
      | "DHIVYADURAI90@gmail.com"         |"abcd123"   | "Dhivya Durai"  | "TEACHER" |

  @login_page8
  Scenario: Login - valid credentials - copy/cut/masking- security verification of password
    When I type "dhivyadurai90@gmail.com" into element with xpath "//input[@formcontrolname='email']"
    And I type "abcd123" into element with xpath "//input[@formcontrolname='password']"
    Then element with xpath "//input[@formcontrolname='password']" should have attribute "type" as "password"
