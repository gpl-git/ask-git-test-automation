@reg_password
Feature:

  Background:
    Given I open url "http://ask-qa.portnov.com/#/registration"
    When I type "Aldo" into element with xpath "//input[@formcontrolname='firstName']"
    When I type "Benucci" into element with xpath "//input[@formcontrolname='lastName']"
    When I type "Aldobenuccis@gmail.com" into element with xpath "//input[@formcontrolname='email']"
    When I type "ITALY" into element with xpath "//input[@formcontrolname='group']"


  @reg_password1
  Scenario: Password/Confirm password - Happy path
    When I type "ALDO123" into element with xpath "//input[@formcontrolname='password']"
    When I type "ALDO123" into element with xpath "//input[@formcontrolname='confirmPassword']"
    And I click on element with xpath "//span[contains(text(),'Register Me')]"
    And I wait for 5 sec
    Then element with xpath "//h4" should be displayed
    Then element with xpath "//h4" should contain text "You have been Registered."

  @reg_password2
  Scenario Outline: Register with different passwords inputs
    When I type <password> into element with xpath "//input[@formcontrolname='password']"
    When I type <confirm_password> into element with xpath "//input[@formcontrolname='confirmPassword']"
    And I click on element with xpath "//span[contains(text(),'Register Me')]"
    And I wait for 3 sec
    Then element with xpath "//mat-error" should contain text <error_messages>


    Examples:
      | password                | confirm_password      |error_messages                              |
      | "ALDO123"               | "ALDO1234"            |"Entered passwords should match"            |
      | ""                      | ""                    |"This field is required"                    |
      | "ALDO 1234"             | "ALDO 1234"           |"Whitespaces are not allowed"               |
      | "ALDO"                  | "ALDO"                |"Too short. Should be at least 5 characters"|
