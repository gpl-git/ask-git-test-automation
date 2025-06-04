@reg @regression
Feature: Registration Demo
  Background:
    Given I open url "http://ask-qa.portnov.com/#/registration"
    When I type "A" into element with xpath "//input[@formcontrolname='firstName']"
    When I type "B" into element with xpath "//input[@formcontrolname='lastName']"
    When I type "sdf@ggmail.com" into element with xpath "//input[@formcontrolname='email']"
    When I type "hello123" into element with xpath "//input[@formcontrolname='password']"
    When I type "hello123" into element with xpath "//input[@formcontrolname='confirmPassword']"


  @reg_groupName @smoke
  Scenario Outline: Registration groupName Happy Path
    When I type <text> into element with xpath "//input[@formcontrolname='group']"
    And I wait for 2 sec
    Then I click on element with xpath "//button[@type='submit']"
    And I wait for 2 sec
    Then element with xpath "//ac-registration-confirmation-page" should be displayed
    Then element with xpath "//h4" should contain text "You have been Registered."
    Examples:
      | text |
      | "1"  |
      | "1"  |
      | "A2"  |
      | "AB.DE"  |
      | "(Hello)64+"  |
      | "LK<2>f/?9"  |


  Scenario Outline: Registration First Name - Error Messages - Outline
    When I type <text> into element with xpath "//input[@formcontrolname='group']"
    And I wait for 2 sec
    Then I click on element with xpath "//button[@type='submit']"
    And I wait for 2 sec
    Then element with xpath <label> should contain text <error>
    Examples:
      | text                                                                                                   | label         | error |
      | ""                                                                                                     | "//mat-error" | "This field is required" |
      #      knowen issue Jira MAY25-
      | "JFD 123"        | "//simple-snack-bar" | "Whitespaces are not allowed"              |
      | "(Hello)64+/"                                                                                          | "//mat-error"  | "Should no more than 10 characters" |
      | "ldjflasdfalfkjasdflkasdjfksdfasldf;asldfkjsdlkfjsakdfjkasjdfkjsdafkjsdkfjsdkjfuasdhfsadjfhsadjfggasj" | "//mat-error"  | "Should no more than 10 characters" |
#      knowen issue Jira MAY25-
      | "  " | "//mat-error"  | "Whitespaces are not allowed" |

