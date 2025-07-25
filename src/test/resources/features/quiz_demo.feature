@quiz @regression
Feature:  Quiz Demo

  Background:
    Given I open url "http://ask-qa.portnov.com/#/login"
    Then I should see page title contains "Assessment Control"
    When I type "ask_instr@aol.com" into element with xpath "//*[@formcontrolname='email']"
    And I type "ABC123" into element with xpath "//*[@formcontrolname='password']"
    When I click on element with xpath "//button[@type='submit']"
    And I wait for 1 sec
#    verify user role
    Then element with xpath "//*[@class='info']" should contain text "TEACHER"
    When I click on element with xpath "//h5[text()='Quizzes']"
    And I wait for 1 sec
    When I click on element with xpath "//*[text()='Create New Quiz']"
    And I wait for 1 sec

  @quiz1
  Scenario: Create a Quiz
    When I type "TA Demo Quiz 07/23/25" into element with xpath "//input[@formcontrolname='name']"
    And I click on element with xpath "//mat-icon[text()='add_circle']"
#      select question type
    When I click on element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[contains(text(),'Single')]"
#      fill out question field
    And I type "Question 1" into element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[@formcontrolname='question']"
      #      fill out option  fields
    When I type "Option 1" into element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[@placeholder='Option 1*']"
    And I type "Option 2" into element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[@placeholder='Option 2*']"
#      select correct option
    When I click on element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[@placeholder='Option 2*']/../../../../..//mat-radio-button"
    And I click on element with xpath "//span[normalize-space()='Save']"
    And I wait for 2 sec
#      verify that quiz is displayed
    Then element with xpath "//mat-panel-title[contains(text(),'TA Demo Quiz 07/23/25')]" should be displayed
#      delete quiz
    When I click on element with xpath "//mat-panel-title[contains(text(),'TA Demo Quiz 07/23/25')]"
    And I click on element with xpath "//mat-panel-title[contains(text(),'TA Demo Quiz 07/23/25')]/../../..//*[contains(text(),'Delete')]"
    When I click on element with xpath "//ac-modal-confirmation/..//*[contains(text(),'Delete')]"
    And I wait for 3 sec









