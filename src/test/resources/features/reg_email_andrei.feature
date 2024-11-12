@registrationEmail

Feature: Registration Email

  Background:

    Given I open url "http://ask-qa.portnov.com/#/registration"
    When I type "FN" into element with xpath "//input[@formcontrolname='firstName']"
    And I type "LN" into element with xpath "//input[@formcontrolname='lastName']"
    And I type "1G" into element with xpath "//input[@formcontrolname='group']"
    And I type "11111" into element with xpath "//input[@formcontrolname='password']"
    And I type "11111" into element with xpath "//input[@formcontrolname='confirmPassword']"



  @registrationEmail1
  Scenario Outline: Verify the email is registered
    When I type <email> into element with xpath "//input[@formcontrolname='email']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for element with xpath "//mat-card[@class='mat-card']" to be present
    And I wait for 2 sec
    Then element with xpath "//mat-card[@class='mat-card']" should contain text "You have been Registered."
    When I click on element with xpath "//button[@class='mat-button mat-primary']"
    Then element with xpath "//h3[text()='Assessment Control']/.." should be present
    Examples:
      | email                                                                                                                              |
      | "user123@example.com"                                                                                                              |
      | "user!#$%&'*+-./=?^_`{\|}~@example.com"                                                                                            |
      | "user123456789123456789123456789123456789123456789123456789123456@example123456789123456789123456789123456789123456789123456.com"  |
      | "user123456789123456789123456789123456789123456789123456789123456@example1234567891234567891234567891234567891234567891234567.com" |
      | "user12345678912345678912345678912345678912345678912345678912345@example.com"                                                      |
      | "user123456789123456789123456789123456789123456789123456789123456@example.com"                                                     |
      | "user@example1234567891234567891234567891234567891234567891234567891.com"                                                          |
      | "user@example12345678912345678912345678912345678912345678912345678912.com"                                                         |
      | "user@example.com12345678912345678912345678912345678912345678912345678912345"                                                      |
      | "user@example.com123456789123456789123456789123456789123456789123456789123456"                                                     |


  @registrationEmail2
  Scenario Outline: Verify the email is not registered
    When I type <email> into element with xpath "//input[@formcontrolname='email']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for 2 sec
    Then element with xpath "//mat-error[@class='mat-error ng-star-inserted']" should contain text <error>

    Examples:
      | email                                                                                                                               | error                                                       |
      | ""                                                                                                                                  | "This field is required"                                    |
      | "user 123@example.com"                                                                                                              | "Should be a valid email address"                           |
      | "user123@exa mple.com"                                                                                                              | "Should be a valid email address"    |
#      This error message happened since number of characters exceeded 128 Jira ticket Number
      | "user123456789123456789123456789123456789123456789123456789123456@example12345678912345678912345678912345678912345678912345678.com" | "Should be a valid email address"                           |
      | "user1234567891234567891234567891234567891234567891234567891234567@example.com"                                                     | "Should be a valid email address"                           |
      | "user@example123456789123456789123456789123456789123456789123456789123.com"                                                         | "Should be a valid email address"                           |
      | "user@example.com1234567891234567891234567891234567891234567891234567891234567"                                                     | "Should be a valid email address"                           |
      | "\<user@example.com"                                                                                                                | "Should be a valid email address"                           |
      | "\>user@example.com"                                                                                                                | "Should be a valid email address"                           |
      | "\(user@example.com"                                                                                                                | "Should be a valid email address"                           |
      | "\)user@example.com"                                                                                                                | "Should be a valid email address"                           |
      | "\[user@example.com"                                                                                                                | "Should be a valid email address"                           |
      | "\]user@example.com"                                                                                                                | "Should be a valid email address"                           |
      | "\,user@example.com"                                                                                                                | "Should be a valid email address"                           |
      | "\;user@example.com"                                                                                                                | "Should be a valid email address"                           |
      | "\:user@example.com"                                                                                                                | "Should be a valid email address"                           |
      | "\user@example.com"                                                                                                                 | "Should be a valid email address"                           |
      | "\"user@example.com"                                                                                                                | "Should be a valid email address"                           |








