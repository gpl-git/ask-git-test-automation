@password @regression

Feature: Forgot Password

  @password
  Scenario: password reset with valid email
    Given I open url "http://ask-qa.portnov.com/#/login"
    Then I should see page title contains "Assessment Control"
    When I click on element with xpath "//a[normalize-space()='I forgot my password']"
    And I wait for 2 sec
    Then element with xpath "//h4[normalize-space()='Reset Password Request']" should be displayed
    When I click on element with xpath "//input[@id='mat-input-15']"
    Then I type "ah@dayrep.com" into element with xpath "//input[@id='mat-input-15']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for 2 sec
    Then element with xpath "//mat-card[@class='mat-card']" should contain text "Your request is confirmed"
