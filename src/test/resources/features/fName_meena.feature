@taskregistration
Feature: Registration page - first name

  Background:
    When I open url "http://ask-qa.portnov.com/#/login"
    And I click on element with xpath "//span[contains(text(),'Register Now')]"
    And I wait for 2 sec
    And I type "a" into element with xpath "//input[@formcontrolname='lastName']"
    When I type "meena@email.com" into element with xpath "//input[@formcontrolname='email']"
    And I type "xyz" into element with xpath "//input[@formcontrolname='group']"
    When I type "12345" into element with xpath "//input[@formcontrolname='password']"
    And I type "12345" into element with xpath "//input[@formcontrolname='confirmPassword']"


  @taskregister2
  Scenario: first name confirmation
    When I type "a" into element with xpath "//input[@formcontrolname='firstName']"
    When I click on element with xpath "//span[contains(text(),'Register Me')]"
    And I wait for 2 sec
    Then element with xpath "//h4" should contain text "You have been Registered."
    And I wait for 5 sec

  @taskregister3
  Scenario Outline: first name Special characters
    When I type <text> into element with xpath "//input[@formcontrolname='firstName']"
    And I wait for 2 sec
    When I click on element with xpath "//span[contains(text(),'Register Me')]"
    And I wait for 2 sec
    Then element with xpath "//h4" should contain text "You have been Registered."
    And I wait for 2 sec

    Examples:
      | text |
      | "$"    |
      | "&"    |
      | "%"    |


  @taskregister4
  Scenario Outline: First Name error messages
    When I type <text> into element with xpath "//input[@formcontrolname='firstName']"
    And I wait for 2 sec
    And I click on element with xpath "//span[contains(text(),'Register Me')]"
    And I wait for 2 sec
    Then element with xpath "//mat-error" should contain text <text1>
    Then I wait for 2 sec
    Examples:
      | text        | text1                          |
      | "a a"       | "White spaces are not allowed" |
      | ""          | "This field is required"       |


      | "userhjhjhjhjhjhjhjhjhjhjhjhjhjhjhkhjajxasjhlhacjhahashdhadhaldhdhslahaldhuserhjhjhjhjhjhjhjhjhjhjhjhjhjhjhkhjajxasjhlhacjhahashdhadhaldhdhslahaldhuserhjhjhjhjhjhjhjhjhjhjhjhjhjhjhkhjajxasjhlhacjhahashdhadhaldhdhslahaldhuserhjhjhjhjhjhjhjhjhjhjhjhjhjhjhkh5"       | "Not more than 254 characters allowed" |


