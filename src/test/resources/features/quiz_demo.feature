@quiz

Feature: Quiz Demo
  Background:
    Given I open url "http://ask-qa.portnov.com/#/login"
    When I type "ask_instr@aol.com" into element with xpath "//input[@formcontrolname='email']"
    When I type "ABC123" into element with xpath "//input[@formcontrolname='password']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for 1 sec
    When I click on element with xpath "//h5[contains(text(),'Quizzes')]"
    And I wait for 1 sec
    When I click on element with xpath "//*[text()='Create New Quiz']"
    And I wait for 1 sec

  @quiz1
  Scenario: Quiz with SC Question
    And I type "Galina Demo Quiz TA" into element with xpath "//input[@formcontrolname='name']"
    When I click on element with xpath "//mat-icon[text()='add_circle']"
    And I click on element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[contains(text(),'Textual')]"
    When I type "Question 1" into element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[@formcontrolname='question']"
    And I click on element with xpath "//span[contains(text(),'Save')]"
    And I wait for 2 sec
    Then element with xpath "//mat-panel-title[contains(text(),'Galina Demo Quiz TA')]" should be displayed
#      to delete a quiz
    When I click on element with xpath "//mat-panel-title[contains(text(),'Galina Demo Quiz TA')]"
    And I click on element with xpath "//mat-panel-title[contains(text(),'Galina Demo Quiz TA')]/../../..//*[text()='Delete']"
    And I click on element with xpath "//ac-modal-confirmation/..//*[text()='Delete']"
