@quiz @regression
Feature: Quiz Demo

  Background:
    Given I open url "http://ask-qa.portnov.com/#/login"
    Then I should see page title contains "Assessment Control"
    When I type "ask_instr@aol.com" into element with xpath "//*[@formcontrolname='email']"
    And I type "ABC123" into element with xpath "//*[@formcontrolname='password']"
    When I click on element with xpath "//*[@type='submit'] "
    And I wait for element with xpath "//*[@class='info']" to be present
    And I wait for 1 sec
    Then element with xpath "//*[@class='info']" should contain text "TEACHER"
    When I click on element with xpath "//h5[normalize-space()='Quizzes']"
    And I wait for element with xpath "//ac-quizzes-list" to be present
    And I wait for 1 sec
    And I click on element with xpath "//*[text()='Create New Quiz']"
    And I wait for 1 sec

  @quiz1
  Scenario: Create a Quiz
    When I type "Galina TA Quiz Demo" into element with xpath "//*[@formcontrolname='name']"
#      add question
    And I click on element with xpath "//*[text()='add_circle']"
#      select question type
    When I click on element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[contains(text(),'Single')]"
    And I type "Single-choice question" into element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[@formcontrolname='question']"
    And I type "Option 1" into element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[@placeholder='Option 1*']"
    And I type "Option 2" into element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[@placeholder='Option 2*']"
#      choose correct answer
    When I click on element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[@placeholder='Option 1*']/../../../../../mat-radio-button"
#       check showstopper question
    And I click on element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//span[@class='bold']"
    When I click on element with xpath "//*[contains(text(),'Save')]"
    And I wait for 1 sec
    Then element with xpath "//mat-panel-title[contains(text(),'Galina TA Quiz Demo')]" should be displayed
#      delete quiz
    When I click on element with xpath "//mat-panel-title[contains(text(),'Galina TA Quiz Demo')]"
    And I click on element with xpath "//mat-panel-title[contains(text(),'Galina TA Quiz Demo')]/../../..//*[text()='Delete']"
    And I click on element with xpath "//ac-modal-confirmation/..//*[text()='Delete']"
    And I wait for 2 sec
