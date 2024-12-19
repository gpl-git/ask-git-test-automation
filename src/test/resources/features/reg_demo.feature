@regression
Feature:  Registration Demo

  Background:
    Given I open url "http://ask-qa.portnov.com/#/registration"
    When I type "a" into element with xpath "//input[@formcontrolname='firstName']"
    When I type "clarebear27373@ourl.me" into element with xpath "//input[@formcontrolname='email']"
    And I type "XYZ" into element with xpath "//input[@formcontrolname='group']"
    When I type "12345" into element with xpath "//input[@formcontrolname='password']"
    And I type "12345" into element with xpath "//input[@formcontrolname='confirmPassword']"

  @reg_lName
  Scenario: LastName Confirmation
    And I type "avbQWE123$%^&e" into element with xpath "//input[@formcontrolname='lastName']"
    And I wait for 1 sec
    When I click on element with xpath "//*[text()='Register Me']"
    And I wait for 2 sec
    Then element with xpath "//h4" should contain text "You have been Registered."
    And I wait for 2 sec


  @reg_lName_specChar
  Scenario Outline: LastName -Special Characters
    And I type <text> into element with xpath "//input[@formcontrolname='lastName']"
    And I wait for 1 sec
    When I click on element with xpath "//*[text()='Register Me']"
    And I wait for 2 sec
    Then element with xpath "//h4" should contain text "You have been Registered."
    And I wait for 2 sec

    Examples:
      | text             |
      | "$" |
      | "%" |
      | "\" |
      | "&" |

  @lName-errors
  Scenario Outline: LastName Error Messages
    And I type <text> into element with xpath "//input[@formcontrolname='lastName']"
    And I wait for 1 sec
    When I click on element with xpath "//*[text()='Register Me']"
    And I wait for 2 sec
    Then element with xpath "//mat-error" should contain text <error>
    And I wait for 2 sec

    Examples:
      | text             |    error                         |
      | "a a"            |    "Whitespaces are not allowed" |
      | ""               |    "This field is required"      |
#      This is a known issue bug was filed NOV24-3333
      | "userhjhjhjhjhjhjhjhjhjhjhjhjhjhjhkhjajxasjhlhacjhahashdhadhaldhdhslahaldhuserhjhjhjhjhjhjhjhjhjhjhjhjhjhjhkhjajxasjhlhacjhahashdhadhaldhdhslahaldhuserhjhjhjhjhjhjhjhjhjhjhjhjhjhjhkhjajxasjhlhacjhahashdhadhaldhdhslahaldhuserhjhjhjhjhjhjhjhjhjhjhjhjhjhjhkh5"               |    "Nomre than 254 characters"      |


