@demoReg @regression
Feature: Registration Form First Name Field Behavior

  Background:
    Given I open url "http://ask-qa.portnov.com/#/registration"
    Then I should see page title as "Assessment Control @ Portnov"
    And I type "W" into element with xpath "//*[@formcontrolname='lastName']"
    When I type "Vised1980@cuvox.de" into element with xpath "//*[@formcontrolname='email']"
    And I type "DEMO" into element with xpath "//*[@formcontrolname='group']"
    When I type "12345" into element with xpath "//*[@formcontrolname='password']"
    And I type "12345" into element with xpath "//*[@formcontrolname='confirmPassword']"

  @smoke @fName1
  Scenario: FirstName Demo Happy Path
    When I type "Alice" into element with xpath "//*[@formcontrolname='firstName']"
    When I click on element with xpath "//button[@type='submit'] "
    And I wait for element with xpath "//ac-registration-confirmation-page" to be present
    Then element with xpath "//h4" should contain text "You have been Registered."
    And I wait for 2 sec

  @fName2
  Scenario: FirstName - Field is required
    When I type "" into element with xpath "//*[@formcontrolname='firstName']"
    When I click on element with xpath "//button[@type='submit'] "
    And I wait for 2 sec
    Then element with xpath "//mat-error" should be displayed
    Then element with xpath "//mat-error" should contain text "This field is required"

  @fname3
  Scenario Outline: FirstName Demo Happy Path - Outline
    When I type <text> into element with xpath "//*[@formcontrolname='firstName']"
    When I click on element with xpath "//button[@type='submit']"
    And I wait for element with xpath "//ac-registration-confirmation-page" to be present
    Then element with xpath "//h4" should contain text "You have been Registered."

    Examples:
      | text                                                                                                                                                                                                                                                             |
      | "Alice"                                                                                                                                                                                                                                                          |
      | "A"                                                                                                                                                                                                                                                              |
#        does not work in build 1.0.7
      | "1234"                                                                                                                                                                                                                                                           |
      | "ABC!@#@$% "                                                                                                                                                                                                                                                     |
      | "scooterhowmuchisthefishellalegustalagasolinascooterhowmuchisthefishellalegustalagasolinascooterhowmuchisthefishellalegustalagasolinascooterhowmuchisthefishellalegustalagasolinalagasolinascooterhowmuchisthefishellalegustalagasolinascooterhowmuchisthrrrrrr" |

  @fname4
  Scenario Outline: FirstName - Field errors
    When I type <fName> into element with xpath "//*[@formcontrolname='firstName']"
    When I click on element with xpath "//button[@type='submit']"
    And I wait for 1 sec
    Then element with xpath <xpath> should contain text <error>
    And I wait for 2 sec

    Examples:
      | fName                                                                                                                                                                                                                                                             | xpath                | error                    |
      | ""                                                                                                                                                                                                                                                                | "//mat-error"        | "This field is required" |
      | "scooterhowmuchisthefishellalegustalagasolinascooterhowmuchisthefishellalegustalagasolinascooterhowmuchisthefishellalegustalagasolinascooterhowmuchisthefishellalegustalagasolinalagasolinascooterhowmuchisthefishellalegustalagasolinascooterhowmuchisthrrrrrrc" | "//simple-snack-bar" | "Data too long"          |
