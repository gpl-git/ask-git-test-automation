@quiz_demo
Feature: Quiz Demo

  Background:
    Given I open url "http://ask-qa.portnov.com/#/login"
    When I type "ask_instr@aol.com" into element with xpath "//input[@formcontrolname='email']"
    And I type "ABC123" into element with xpath "//input[@formcontrolname='password']"
    When I click on element with xpath "//*[text()='Sign In']"
    And I wait for 1 sec
    When I click on element with xpath "//h5[contains(text(),'Quizzes')]"
    And I wait for 1 sec
    And I click on element with xpath "//span[contains(text(),'Create New Quiz')]"
    And I wait for 1 sec

  @sc_question
  Scenario: Quiz with a SC Question
    When I type "SC Question" into element with xpath "//input[@formcontrolname='name']"
    And I click on element with xpath "//mat-icon[text()='add_circle']"
    And I wait for 1 sec
    When I click on element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[contains(text(),'Single')]"
    And I type "Question 1" into element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//textarea[@formcontrolname='question']"
    When I type "Option 1" into element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//textarea[@placeholder='Option 1*']"
    When I type "Option 2" into element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//textarea[@placeholder='Option 2*']"
    And I click on element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//textarea[@placeholder='Option 2*']/../../../../..//mat-radio-button"
    And I click on element with xpath "//span[contains(text(),'Save')]"
    And I wait for 2 sec
    Then element with xpath "//mat-panel-title[contains(text(),'SC Question')]" should be displayed
    And I wait for 1 sec
#    to delete a quiz
    When I click on element with xpath "//mat-panel-title[contains(text(),'SC Question')]"
    And I click on element with xpath "//mat-panel-title[contains(text(),'SC Question')]/../../..//*[text()='Delete']"
    And I click on element with xpath "//ac-modal-confirmation/..//*[text()='Delete']"


