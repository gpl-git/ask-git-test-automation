@reg @reg_email @regression
Feature: Registration Email
  Background:
    Given I open url "http://ask-qa.portnov.com/#/registration"
    When I type "John" into element with xpath "//input[@formcontrolname='firstName']"
    And I type "Doe30" into element with xpath "//input[@formcontrolname='lastName']"
    And I type "XYZ" into element with xpath "//input[@formcontrolname='group']"
    And I type "12345" into element with xpath "//input[@formcontrolname='password']"
    And I type "12345" into element with xpath "//input[@formcontrolname='confirmPassword']"

  @reg_email_positive1 @smoke
  #Combines MAY25-147 (special characters), 160 (max 128 char) and 162 (local part 64 char)
  Scenario: Registration Email - Smoke Happy Path
    When I type "Abcdefghijklmnopqrstuvwxyz1234567890!#$%&'*+/=?^_`{|}~64characte@Abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmnopqrstuvw.com" into element with xpath "//input[@formcontrolname='email']"
    And I click on element using JavaScript with xpath "//button[@type='submit']"
    Then I wait for element with xpath "//ac-registration-confirmation-page" to be present
    And element with xpath "//h4" should contain text "You have been registered."

  @reg_email_positive2
  #MAY25-164 (domain label 63 char) and 166 (top-level domain 63 char)
  Scenario Outline: Registration Email - Other Happy Path
    When I type <email> into element with xpath "//input[@formcontrolname='email']"
    And I click on element using JavaScript with xpath "//button[@type='submit']"
    Then I wait for element with xpath "//ac-registration-confirmation-page" to be present
    And element with xpath "//h4" should contain text "You have been registered."
    Examples:
      | email                                                                   |
      |"a@abcdefghijklmnopqrstuvwxyz123Abcdefghijklmnopq123mmddyyyyhrmmss.com"  |
      |"a@g.abcdefghijklmnopqrstuvwxyz123Abcdefghijklmnopq123mmddyyyyhrmmss"    |

  @reg_email_negative
  #MAY25-156 (invalid), 158 (empty), 159 (spaces), 161 (more than 128 char),
  #MAY25-163 (local part >64 char), 165 (domain >63), 167 (top-level domain > 63),
  #MAY25-195 (existing email)
  Scenario Outline: Registration Email - Negative Test set
    When I type <email> into element with xpath "//input[@formcontrolname='email']"
    And I click on element using JavaScript with xpath "//button[@type='submit']"
    And I wait for 1 sec
    Then element with xpath <label> should contain text <error>
    Examples:
      | email                                                                             | label               | error                             |
      |"john.doe@-domain.com"                                                             |"//mat-error"        |"Should be a valid email address"  |
      |""                                                                                 |"//mat-error"        |"This field is required"           |
      |"john doe@domain.com"                                                              |"//mat-error"        |"Should be a valid email address"  |
      |"Abcdefghijklmnopqrstuvwxyz123Abcdefghijk!#$%&'*+/=?^_`{\|}~@exampleabcdefghijklmnopqrstuvwxyz123.abcdefghijklmnopqrstuvwxyz123comp" |"//simple-snack-bar" |"Data too long for column 'email' at row 1" |
      |"AAbcdefghijklmnopqrstuvwxyz123Abcdefghijklmnopqr123mmddyyyyhrmmss@gmail.com"      |"//mat-error"        |"Should be a valid email address"  |
      |"a@aabcdefghijklmnopqrstuvwxyz123Abcdefghijklmnopq123mmddyyyyhrmmss.com"           |"//mat-error"        |"Should be a valid email address"  |
      |"a@g.aabcdefghijklmnopqrstuvwxyz123Abcdefghijklmnopq123mmddyyyyhrmmss"             |"//mat-error"        |"Should be a valid email address"  |
      |"Thoo1960@jourrapide.com"                                                          |"//simple-snack-bar" |"User already exists and activated"|

  #And some other negative scenarios not in the test set (but should be checked)
  Scenario Outline: Registration Email - Other Negative
    When I type <email> into element with xpath "//input[@formcontrolname='email']"
    And I click on element using JavaScript with xpath "//button[@type='submit']"
    And I wait for 1 sec
    Then element with xpath <label> should contain text <error>
    Examples:
      | email           | label           | error                             |
      |"@domain.com"    |"//mat-error"    |"Should be a valid email address"  |
      |"name@.com"      |"//mat-error"    |"Should be a valid email address"  |
      |"name@domain."   |"//mat-error"    |"Should be a valid email address"  |
#      this is a known issue jira ticket MAY25-194
      |"name@domain"   |"//mat-error"    |"Should be a valid email address"  |
