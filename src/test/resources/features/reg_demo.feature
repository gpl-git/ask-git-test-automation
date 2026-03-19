@reg @regression
Feature: Registration Form - First Name field behavior
  Background:
    When I open url "http://ask-qa.portnov.com/#/registration"
    Then I should see page title contains "Assessment Control"
    And I type "B" into element with xpath "//*[@formcontrolname='lastName']"
    When I type "Wease1971@dayrep.com" into element with xpath "//*[@formcontrolname='email']"
    And I type "FEB26" into element with xpath "//*[@formcontrolname='group']"
    When I type "12345" into element with xpath "//*[@formcontrolname='password']"
    And I type "12345" into element with xpath "//*[@formcontrolname='confirmPassword']"

  @smoke @reg_fName1
  Scenario: First Name Demo - Happy Path
    When I type "Joe" into element with xpath "//*[@formcontrolname='firstName']"
    When I click on element with xpath "//*[@type='submit'] "
    And I wait for element with xpath "//ac-registration-confirmation-page" to be present
    Then element with xpath "//h4" should contain text "You have been Registered."
    And I wait for 2 sec

  @regression  @reg_fName_neg
  Scenario: First Name - Whitespaces
    When I type " " into element with xpath "//*[@formcontrolname='firstName']"
    When I click on element with xpath "//*[@type='submit'] "
    Then element with xpath "//mat-error" should be displayed
    Then element with xpath "//mat-error" should contain text "Whitespaces are not allowed"
    And I wait for 2 sec

  @reg_fName2
  Scenario Outline: First Name Demo - Confirmarion message
    When I type <text> into element with xpath "//*[@formcontrolname='firstName']"
    When I click on element with xpath "//*[@type='submit'] "
    And I wait for element with xpath "//ac-registration-confirmation-page" to be present
    Then element with xpath "//h4" should contain text "You have been Registered."
    Examples:
      | text  |
      | "J" |
      | "forhellofejwhbevhwbehbwieufvbweiuvbwhellofejwhbevhwbehbwieufvbweiuvbwhellofejwhbevhwbehbwieufvbweiuvbwhellofejwhbevhwbehbwieufvbweiuvbwhellofejwhbevhwbehbwieufvbweiuvbwhellofejwhbevhwbehbwieufvbweiouvbwhellofejwhbevhwbedfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdffdf" |
      | "Joe1234" |
      | "Joe!@#$%^&*" |

  @reg_fName3
  Scenario Outline: First Name - Error messages
    When I type <fName> into element with xpath "//*[@formcontrolname='firstName']"
    When I click on element with xpath "//*[@type='submit'] "
    Then element with xpath "//mat-error" should contain text <errorMessage>
    And I wait for 3 sec
    Examples:
      | fName    | errorMessage                   |
      | " "      |  "Whitespaces are not allowed" |
      | " Joe"   |  "Whitespaces are not allowed" |
      | "Joe "   |  "Whitespaces are not allowed" |
      | "Jo e"   |  "Whitespaces are not allowed" |
      | ""       |  "This field is required"      |
#      this is a known issue Jira ticket FEB26-$$$$$
      | "forhellofejwhbevhwbehbwieufvbweiuvbwhellofejwhbevhwbehbwieufvbweiuvbwhellofejwhbevhwbehbwieufvbweiuvbwhellofejwhbevhwbehbwieufvbweiuvbwhellofejwhbevhwbehbwieufvbweiuvbwhellofejwhbevhwbehbwieufvbweiouvbwhellofejwhbevhwbedfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdffdf1"       |  "No more than"      |