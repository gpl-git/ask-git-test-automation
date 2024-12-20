@ForgotEmail
Feature: Forgot email flow

  @ConfirmationEmail
  Scenario: Confirmation e-Mail should be sent
    Given Open the "http://ask-qa.portnov.com/#/forgot-password" page
    Then Title should be "Assessment Control @ Portnov"
    Then I wait for 2 sec
    And Element with xpath "//input[@id='mat-input-0']" should be present
    When Type "aleksfilin@btcmod.com" into element with xpath "//input[@id='mat-input-0']"
    Then Click on element with xpath "//button[@type='submit']"
    Then I wait for 2 sec
    And Element with xpath "//mat-card[@class='mat-card']" should be present
    Then Verify forgot-password

  @WrongEmail
  Scenario: Email not found
    Given Open the "http://ask-qa.portnov.com/#/forgot-password" page
    Then Title should be "Assessment Control @ Portnov"
    Then I wait for 2 sec
    And Element with xpath "//input[@id='mat-input-0']" should be present
    When Type "aleksfilin@btcmodd.com" into element with xpath "//input[@id='mat-input-0']"
    Then Click on element with xpath "//button[@type='submit']"
    Then I wait for 2 sec
    And Element with xpath "//div[@id='cdk-overlay-0']" should be present

  @WrongFormatEmail
  Scenario Outline: Wrong Email format
    Given Open the "http://ask-qa.portnov.com/#/forgot-password" page
    Then Title should be "Assessment Control @ Portnov"
    Then I wait for 2 sec
    And Element with xpath "//input[@id='mat-input-0']" should be present
    When Type <email> into element with xpath "//input[@id='mat-input-0']"
    Then Click on element with xpath "//button[@type='submit']"
    Then I wait for 2 sec
    And Element with xpath "//mat-error[@id='mat-error-0']" should be present
    Examples:
      |email          |
      | "fffffffsfc@" |
      | "fffffffsfc@fgd" |
      | "fffff ffsfc@gmail.com" |
      | "abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghij12345@gmail.com" |
      | "abc@abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghij1234.com" |
      | "abc@gmail.abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghij1234" |
      | "abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghij@abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghij.commmmmmm" |
      | "1111" |
      | "" |

  @ChangePassword
  Scenario Outline: Password should be changed
    Given Open the "http://ask-qa.portnov.com/#/forgot-password" page
    Then Title should be "Assessment Control @ Portnov"
    Then I wait for 2 sec
    And Element with xpath "//input[@id='mat-input-0']" should be present
    When Type "aleksfilin@btcmod.com" into element with xpath "//input[@id='mat-input-0']"
    Then Click on element with xpath "//button[@type='submit']"
    Then I wait for 2 sec
    And Element with xpath "//mat-card[@class='mat-card']" should be present
    Then Verify forgot-password
    Then I wait for 2 sec
    Then Title should be "Assessment Control @ Portnov"
    Then I wait for 2 sec
    When Type <password> into element with xpath "//input[@id='mat-input-1']"
    When Type <password> into element with xpath "//input[@id='mat-input-2']"
    Then Click on element with xpath "//button[@type='submit']"
    Then I wait for 2 sec
    And Url should be "http://ask-qa.portnov.com/#/reset-password-confirmation"
    Examples:
      |password         |
      | "ABC12"         |
      | "ABC123"         |
      | "ABC123$"         |
      | "ab123456789012345678901234567890"         |

  @PasswordMismatched
  Scenario Outline: Password not should be changed
    Given Open the "http://ask-qa.portnov.com/#/forgot-password" page
    Then Title should be "Assessment Control @ Portnov"
    Then I wait for 2 sec
    And Element with xpath "//input[@id='mat-input-0']" should be present
    When Type "aleksfilin@btcmod.com" into element with xpath "//input[@id='mat-input-0']"
    Then Click on element with xpath "//button[@type='submit']"
    Then I wait for 2 sec
    And Element with xpath "//mat-card[@class='mat-card']" should be present
    Then Verify forgot-password
    Then I wait for 2 sec
    Then Title should be "Assessment Control @ Portnov"
    Then I wait for 2 sec
    When Type <password> into element with xpath "//input[@id='mat-input-1']"
    When Type <confirmPassword> into element with xpath "//input[@id='mat-input-2']"
    Then Click on element with xpath "//button[@type='submit']"
    Then I wait for 2 sec
    And Element with xpath "//mat-error[@id='mat-error-3']" should be present
    Examples:
      |password         |confirmPassword         |
      | "ABC12"         | "ABC1"                |


  @WrongFormatPassword
  Scenario Outline: Wrong Password format
    Given Open the "http://ask-qa.portnov.com/#/forgot-password" page
    Then Title should be "Assessment Control @ Portnov"
    Then I wait for 2 sec
    And Element with xpath "//input[@id='mat-input-0']" should be present
    When Type "aleksfilin@btcmod.com" into element with xpath "//input[@id='mat-input-0']"
    Then Click on element with xpath "//button[@type='submit']"
    Then I wait for 2 sec
    And Element with xpath "//mat-card[@class='mat-card']" should be present
    Then Verify forgot-password
    Then I wait for 2 sec
    Then Title should be "Assessment Control @ Portnov"
    Then I wait for 2 sec
    When Type <password> into element with xpath "//input[@id='mat-input-1']"
    When Type <password> into element with xpath "//input[@id='mat-input-2']"
    Then Click on element with xpath "//button[@type='submit']"
    Then I wait for 2 sec
    And Element with xpath "//mat-error[@id='mat-error-2']" should be present
    Examples:
      |password          |
      | "abc1234567890123456789012345678901234567890"           |
      | ""               |
      | "1"              |
      | "abcd"           |
      | "     "           |
      | "abc123456789012345678901234567890"           |
      | "abc d12"           |
