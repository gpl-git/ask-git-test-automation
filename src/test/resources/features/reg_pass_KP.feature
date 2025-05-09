@reg_password_confirm
Feature: Test Set : Registration - Password / Confirm

  Background:
    Given I open url "http://ask-qa.portnov.com/#/login"
    Then I should see page title as "Assessment Control @ Portnov"
    When I click on element with xpath "//span[contains(text(),'Register')]"
    And I wait for element with xpath "//button[@type='submit']" to be present
#      First Name
    And I type "John" into element with xpath "//input[@formcontrolname='firstName']"
#      Last Name
    And I type "Snow" into element with xpath "//input[@formcontrolname='lastName']"
#      Email
    And I type "Pirs1940@teleworm.us" into element with xpath "//input[@formcontrolname='email']"
#      Group
    And I type "ABC" into element with xpath "//input[@formcontrolname='group']"


  @reg_password_confirm1
  Scenario: Allowable characters: Alphanumeric & Special characters
    When I type "Ss125!@&" into element with xpath "//input[@formcontrolname='password']"
    And I type "Ss125!@&" into element with xpath "//input[@formcontrolname='confirmPassword']"
    When I click on element with xpath "//button[@type='submit']"
    Then I wait for element with xpath "//h4[contains(text(),'You have been Registered')]" to be present
    And element with xpath "//h4[contains(text(),'You have been Registered')]" should be displayed


  @reg_password_confirm2
  Scenario: Password field is required - cannot be empty
    When I type "Ss125!@&" into element with xpath "//input[@formcontrolname='confirmPassword']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for 1 sec
    Then element with xpath "//mat-error" should contain text "field is required"

  @reg_password_confirm3
  Scenario: Confirm Password field is required - cannot be empty
    When I type "Ss125!@&" into element with xpath "//input[@formcontrolname='password']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for element with xpath "//input[@formcontrolname='confirmPassword']/../../..//mat-error" to be present
    And I wait for 1 sec
    Then element with xpath "//input[@formcontrolname='confirmPassword']/../../..//mat-error[@role='alert']" should contain text "field is required"

  @reg_password_confirm4
  Scenario: Password must match Confirm Password
    When I type "Aa&@#123bB" into element with xpath "//input[@formcontrolname='password']"
    And I type "Ss125!@&" into element with xpath "//input[@formcontrolname='confirmPassword']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for 1 sec
    Then element with xpath "//mat-error[text()='Entered passwords should match']" should be displayed

  @reg_password_confirm5
  Scenario: White spaces are not allowed
    When I type "Ss125! @&" into element with xpath "//input[@formcontrolname='password']"
    And I type "Ss125! @&" into element with xpath "//input[@formcontrolname='confirmPassword']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for 1 sec
    Then element with xpath "//mat-error" should contain text "Whitespaces are not allowed"

  @reg_password_confirm6
  Scenario Outline: (POS) Boundary Password length
    When I type <text> into element with xpath "//input[@formcontrolname='password']"
    And I type <text> into element with xpath "//input[@formcontrolname='confirmPassword']"
    When I click on element with xpath "//button[@type='submit']"
    And I wait for 1 sec
    Then I wait for element with xpath "//h4[contains(text(),'You have been Registered')]" to be present
    Examples:
      | text                               |
      | "S12s&"                            |
      | "S12s&!"                           |
      | "SsfghytTY1456478@GHJUU&GHgh14556" |
      | "SsfghytTY1456478@GHJUU&GHgh1455"  |

  @reg_password_confirm6
  Scenario Outline: (NEG) Boundary Password length
    When I type <text> into element with xpath "//input[@formcontrolname='password']"
    And I type <text> into element with xpath "//input[@formcontrolname='confirmPassword']"
    When I click on element with xpath "//button[@type='submit']"
    And I wait for 1 sec
    Then element with xpath "//mat-error" should contain text <error>
    And I wait for 3 sec
    Then element with xpath "//mat-card[@class='mat-card']" should not contain text "You have been Registered"
    Examples:
      | text                                | error                            |
      | "S1s&"                              | "at least 5 characters"          |
      | "SsfghytTY1456478@GHJUU&GHgh145567" | "no more than 32 characters"     |

#    known defect in case 2 (upper limit not enforced):   APR25-251

  @reg_password_confirm7
  Scenario Outline: Password mismatch
    When I type <pass> into element with xpath "//input[@formcontrolname='password']"
    And I type <confirm> into element with xpath "//input[@formcontrolname='confirmPassword']"
    When I click on element with xpath "//button[@type='submit']"
    And I wait for 1 sec
    Then element with xpath "//mat-error" should contain text "Entered passwords should match"
    And I wait for 3 sec
    Then element with xpath "//mat-card[@class='mat-card']" should not contain text "You have been Registered"

    Examples:
      | pass                    | confirm    |
      | "123456789"             | "12345"    |
      | "Qwertyuio"             | "Qwerty"   |
      | "qWE123&^567!!!DFas!!!" | "qWE123&^" |

  @red_password_confirm8
  Scenario: Verify field 'type' attribute is 'password'
    And element with xpath "//input[@formcontrolname='password']" should have attribute "type" as "password"
    And element with xpath "//input[@formcontrolname='confirmPassword']" should have attribute "type" as "password"


  @reg_password_cleanup
  Scenario: Delete user John Snow, who knows nothing, reportedly
    Then I click on element with xpath "//span[contains(text(),'Back to Login')]"
    And I type "sandroshatki@bizisstance.com" into element with xpath "//input[@formcontrolname='email']"
    And I type "123abc" into element with xpath "//input[@formcontrolname='password']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for element with xpath "//h5[contains(text(),'Users Management')]" to be present
    And I click on element with xpath "//h5[contains(text(),'Users Management')]"
    And I wait for element with xpath "//h4[contains(text(),'John Snow')]" to be present
    And I click on element with xpath "//h4[contains(text(),'John Snow')]"
    And I wait for element with xpath "//button[@aria-haspopup='true']" to be present
    Then I click on element using JavaScript with xpath "//button[@aria-haspopup='true']"
    And I wait for element with xpath "//button[@role='menuitem']//*[contains(text(),'delete')]" to be present
    And I click on element using JavaScript with xpath "//button[@role='menuitem']//*[contains(text(),'delete')]"
