@reg_demo_lName

Feature: Registration Demo - Last Name
  Background:
    Given I open url "http://ask-qa.portnov.com/#/login"
    Then I should see page title contains "Portnov"
    When I click on element with xpath "//span[contains(text(),'Register Now')]"
    And I wait for 1 sec
    When I type "C" into element with xpath "//input[@formcontrolname='firstName']"
    When I type "abc@123.com" into element with xpath "//input[@formcontrolname='email']"
    When I type "ABC" into element with xpath "//input[@formcontrolname='group']"
    When I type "12345" into element with xpath "//input[@formcontrolname='password']"
    When I type "12345" into element with xpath " //input[@formcontrolname='confirmPassword']"
    And I wait for 3 sec
  @reg_lName1
  Scenario: Min 1 characters - Last name
    When I type "P" into element with xpath "//input[@formcontrolname='lastName']"
    And I click on element with xpath " //span[contains(text(),'Register Me')]"
    And I wait for 3 sec
    Then element with xpath "//h4" should be displayed
    Then element with xpath "//h4" should have text as "You have been Registered."

  @reg_lName2
  Scenario: This field is required
    When I type "" into element with xpath "//input[@formcontrolname='lastName']"
    When I click on element with xpath "//span[contains(text(),'Register Me')]"
    Then element with xpath "//mat-error[@role='alert']" should contain text "This field is required"

  @reg_lName3
  Scenario: Whitespaces are not allowed
    When I type "Palmer Palmer" into element with xpath "//input[@formcontrolname='lastName']"
    And I click on element with xpath "//span[contains(text(),'Register Me')]"
    And I wait for 3 sec
    Then element with xpath "//mat-error[@role='alert']" should contain text "Whitespaces are not allowed"

  @reg_lName4
  Scenario:  Alphanumeric & Special characters allowed
    When I type "Palmer-3" into element with xpath "//input[@formcontrolname='lastName']"
    And I click on element with xpath "//span[contains(text(),'Register Me')]"
    And I wait for 3 sec
    Then element with xpath "//h4" should be displayed
    Then element with xpath "//mat-card[@class='mat-card']" should contain text "Registered."

  @reg_lName5
  Scenario Outline: This field is required
    When I type <lName> into element with xpath "//input[@formcontrolname='lastName']"
    When I click on element with xpath "//span[contains(text(),'Register Me')]"
    Then element with xpath "//mat-error[@role='alert']" should contain text <error>
    Examples:
      | lName               | error                    |
      | ""                  | "This field is required"  |
      | "Palmer Palmer"     | "Whitespaces are not allowed" |
      | "fgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgJfg"     | "No more than 254 are allowed" |

    @reg_lNamr6
    Scenario: Confirmation

  @reg_lName1
  Scenario Outline: Min 1 characters - Last name
    When I type <text> into element with xpath "//input[@formcontrolname='lastName']"
    And I click on element with xpath " //span[contains(text(),'Register Me')]"
    Then element with xpath "//h4" should be displayed
    Examples:
      | text |
      | "P"  |
      | "1234"  |
      | "accb"  |
      | "PbbBfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgJfBBBB"  |
