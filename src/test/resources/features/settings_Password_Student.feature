@quiz_student_setting_password @regression
Feature: Quiz - Student: Settings - Password

  Background:
    Given I open url "http://ask-qa.portnov.com/#/login"
    Then I should see page title contains "Assessment Control"
    When I type "Arded1960@teleworm.us" into element with xpath "//*[@formcontrolname='email']"
    And I type "12345" into element with xpath "//*[@formcontrolname='password']"
    When I click on element with xpath "//*[@type='submit'] "
    And I wait for element with xpath "//*[@class='info']" to be present
    And I wait for 1 sec
    Then element with xpath "//p[normalize-space()='STUDENT']" should contain text "STUDENT"
# click on the "Settings"
    When I click on element with xpath "//h5[normalize-space()='Settings']"
# "Setting" title should be present
    And I wait for element with xpath "(//mat-card[@class='mat-card'])[1]" to be present
    And I wait for 1 sec


  @change_password
  Scenario: Change student password
# click on the button "Change Your Password"
    When I click on element with xpath "(//button[@class='mat-raised-button mat-primary'])[2]"
    And I wait for 1 sec
# "Changing Password" dialog window should be present
    Then I wait for element with xpath "(//h1[normalize-space()='Changing Password'])[1]" to be present
# type old "Password"
    And I type "12345" into element with xpath "//input[@placeholder='Password']"
# type "New Password"
    And I type "12345_" into element with xpath "//input[@placeholder='New Password']"
# type "Confirm new Password"
    And I type "12345_" into element with xpath "//input[@placeholder='Confirm New Password']"
# Click "Change" button
    Then I click on element with xpath "(//button[@aria-label='Close dialog'])[2]"
# log Out
    And I click on element with xpath "(//mat-icon[normalize-space()='power_settings_new'])[1]"
    And I wait for 1 sec
# Click "Log out" confirmation button
    Then I click on element with xpath "//button[@class='mat-button mat-warn']"
    And I wait for 1 sec
#check_new_student_password
    Then I should see page title contains "Assessment Control"
    When I type "Arded1960@teleworm.us" into element with xpath "//*[@formcontrolname='email']"
    And I type "12345_" into element with xpath "//*[@formcontrolname='password']"
    When I click on element with xpath "//*[@type='submit'] "
    And I wait for element with xpath "//*[@class='info']" to be present
    And I wait for 1 sec
    Then element with xpath "//p[normalize-space()='STUDENT']" should contain text "STUDENT"
#    clean test state
    When I click on element with xpath "//h5[normalize-space()='Settings']"
# "Setting" title should be present
    And I wait for element with xpath "(//mat-card[@class='mat-card'])[1]" to be present
    And I wait for 1 sec
    When I click on element with xpath "(//button[@class='mat-raised-button mat-primary'])[2]"
    And I wait for 1 sec
# "Changing Password" dialog window should be present
    Then I wait for element with xpath "(//h1[normalize-space()='Changing Password'])[1]" to be present
# type old "Password"
    And I type "12345_" into element with xpath "//input[@placeholder='Password']"
# type "New Password"
    And I type "12345" into element with xpath "//input[@placeholder='New Password']"
# type "Confirm new Password"
    And I type "12345" into element with xpath "//input[@placeholder='Confirm New Password']"
# Click "Change" button
    Then I click on element with xpath "(//button[@aria-label='Close dialog'])[2]"