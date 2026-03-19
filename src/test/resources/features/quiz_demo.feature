@quiz @regression
Feature: Quiz Demo


  Background:
    Given I open url "http://ask-qa.portnov.com/#/login"
    Then I should see page title contains "Assessment"
    When I type "ask_instr@aol.com" into element with xpath "//*[@formcontrolname='email']"
    When I type "ABC123" into element with xpath "//*[@formcontrolname='password']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for 1 sec
#          verify user role = TEACHER
    Then element with xpath "//*[@class='info']" should contain text "TEACHER"
    When I click on element with xpath "//*[contains(text(),'Quizzes')]"
    And I wait for 1 sec
    When I click on element with xpath "//*[text()='Create New Quiz']"
    And I wait for 2 sec

  @smoke
  Scenario: Create a Quiz
    When I type "Quiz TA Demo" into element with xpath "//*[@formcontrolname='name']"
    And I click on element with xpath "//button[contains(., ' Add Question')]"
#      select question type
    When I click on element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[contains(text(),'Single')]"
#      fill out question and option fields
    And I type "Question 1" into element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[@formcontrolname='question']"
    When I type "Option 1" into element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[@placeholder='Option 1*']"
    When I type "Option 2" into element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[@placeholder='Option 2*']"
#      select correct option
    When I click on element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[@placeholder='Option 1*']/../../../../..//mat-radio-button"
    And I click on element with xpath "//*[contains(text(),'Save')]"
    And I wait for 1 sec
#      verification of quiz title on the list of quizzes
    Then element with xpath "//mat-panel-title[contains(text(), 'Quiz TA Demo')]" should be displayed
#      delete quiz
    When I click on element with xpath "//mat-panel-title[contains(text(), 'Quiz TA Demo')]"
    And I click on element with xpath "//mat-panel-title[contains(text(), 'Quiz TA Demo')]/../../..//*[text()='Delete']"
    And I click on element with xpath "//ac-modal-confirmation/..//*[text()='Delete']"
    And I wait for 3 sec






