@reg @regression
Feature: Registration Demo - Email
  Background:
    Given I open url "http://ask-qa.portnov.com/#/registration"
    Then I should see page title contains "Assessment Control"
    #firstName
    And I type "A" into element with xpath "//*[@formcontrolname='lastName']"
    #lastName
    #When I type "Alear1928@gustr.com" into element with xpath "//input[@id='mat-input-10']"
    When I type "Alex" into element with xpath "//*[@formcontrolname='firstName']"
    #Group
    And I type "ABC" into element with xpath "//*[@formcontrolname='group']"
    #Password
    When I type "12345" into element with xpath "//*[@formcontrolname='password']"
    #Confirm Password
    And I type "12345" into element with xpath "//*[@formcontrolname='confirmPassword']"

  @Reg_email @smoke
  Scenario: Registration Email - Happy Path
    #https://www.fakemailgenerator.com/
    When I type "alex@gmail.com" into element with xpath "//*[@formcontrolname='email']"
    When I click on element with xpath "//button[@type='submit']"
    And I wait for element with xpath "//ac-registration-confirmation-page" to be present
    #Then element with xpath "//h4" should b
    Then element with xpath "//h4" should be enabled
    Then element with xpath "//h4" should contain text "You have been Registered."
    And I wait for 3 sec

  @reg_email_positive
  Scenario Outline: Email - Positive Input  Outline
    #Email
    When I type <fEmail> into element with xpath "//*[@formcontrolname='email']"
    When I click on element with xpath "//button[@type='submit']"
    And I wait for element with xpath "//ac-registration-confirmation-page" to be present
    Then element with xpath "//h4" should contain text <message>
    Examples:
      | fEmail             |            message             |
      | "12reg@wert.com"   |    "You have been Registered." |
      | "dsvvfbgbgfngfnvcxxcvcdfvdzbvfbvcxvdzfdvrvravcxbgbgbsfgbrbtsrtfas@csdfbgfdvbdsvfdsvsrvevervfvfvdfgbrsvasdsdadcdcsdcdvbgbg.com"  |    "You have been Registered." |
      | "dsvvfbgbgfngfnvcxxcvcdfvdzbvfbvcxvdzfdvrvravcxbgbgbsfgbrbtsrtfas@com.csdfbgfdvbdsvfdsvsrvevervfvfvdfgbrsvasdsdadcdcsdcdvbgbg"           |    "You have been Registered." |
      | "12_reg@wert.com"       |    "You have been Registered." |


  @reg_email_negative
  Scenario Outline: Email - Negative Input  Outline
    When I type <fEmail> into element with xpath "//*[@formcontrolname='email']"
    When I click on element with xpath "//button[@type='submit']"
    Then element with xpath <xpath> should contain text <message>
    Examples:
      | fEmail       |   xpath                       | message                  |
      | ""          |   "//mat-error"               | "This field is required" |
      | " "         |   "//mat-error"                | "Should be a valid email address" |
      | "dsvvfbgbgfngfnvcxxcvcdfvdzbvfbvcxvdzfdvrvravcxbgbgbsfgbrbdsffstsrtfas@com.csdfbgfdfdzfvbdsvfdsvsrvevervfvfvdfgbrsvasdsdadcdcsdcdvbgbghyt"      |   "//mat-error"               | "Should be a valid email address" |
      | "12re g@wert.com"      |   "//mat-error"               | "Should be a valid email address" |
      | "12reg@we rt.com"      |   "//mat-error"               | "Should be a valid email address" |
      | "12reg@wert.c om"      |   "//mat-error"               | "Should be a valid email address" |

    #https://www.charactercountonline.com/
