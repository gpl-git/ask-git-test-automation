@registration @regression
Feature: Registration Demo

  Background:
    Given I open url "http://ask-qa.portnov.com/#/registration"
    And I type "S" into element with xpath "//*[@formcontrolname='lastName']"
    When I type "Sonch1966@dayrep.com" into element with xpath "//*[@formcontrolname='email']"
    And I type "ABCD" into element with xpath "//*[@formcontrolname='group']"
    When I type "12345" into element with xpath "//*[@formcontrolname='password']"
    And I type "12345" into element with xpath "//*[@formcontrolname='confirmPassword']"

  @reg_fName @smoke
  Scenario: Registration First Name Happy Path
    When I type "John" into element with xpath "//*[@formcontrolname='firstName']"
    When I click on element with xpath "//button[@type='submit']"
    And I wait for 2 sec
    Then element with xpath "//mat-sidenav-container" should be displayed
    And element with xpath "//h4" should contain text "You have been Registered."

  @reg_fName @smoke
  Scenario: Registration First Name - This field is required
    When I type "" into element with xpath "//*[@formcontrolname='firstName']"
    When I click on element with xpath "//button[@type='submit']"
    Then element with xpath "//mat-error" should contain text "This field is required"
    And I wait for 5 sec

  @reg_fName_errors
  Scenario Outline: Registration First Name - Error messages - Outline
    When I type <text> into element with xpath "//*[@formcontrolname='firstName']"
    When I click on element with xpath "//button[@type='submit']"
    And I wait for 1 sec
    Then element with xpath <xpath> should contain text <error>
    Examples:
      | text                                                                                                                                                                                                                                                              | xpath                | error                                    |
      | ""                                                                                                                                                                                                                                                                | "//mat-error"        | "This field is required"                 |
      | " John"                                                                                                                                                                                                                                                           | "//mat-error"        | "Whitespaces are not allowed"            |
      | "John   "                                                                                                                                                                                                                                                         | "//mat-error"        | "Whitespaces are not allowed"            |
      | "Jo hn"                                                                                                                                                                                                                                                           | "//mat-error"        | "Whitespaces are not allowed"            |
      | "77CharEmailaaaabbbbbbbbbccccccccc12378456789cdddcccccccc12123451@teleu77CharEmailaaaabbbbbbbbbccccccccc12378456789cdddcccccccc12123451@teleu77CharEmailaaaabbbbbbbbbccccccccc12378456789cdddcccccccc12123451@teleu77CharEmailaaaabbbbbbbbbccccccccc12378456789c" | "//simple-snack-bar" | "Data too long for column 'name' at row" |