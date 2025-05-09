@quiz
Feature: Quiz Demo

  Background:
    Given I open url "http://ask-qa.portnov.com/#/login"
    Then I should see page title as "Assessment Control @ Portnov"
    When I type "ask_instr@aol.com" into element with xpath "//input[@formcontrolname='email']"
    And I type "ABC123" into element with xpath "//input[@formcontrolname='password']"
    When I click on element with xpath "//button[@type='submit']"
    And I wait for 2 sec
    When I click on element with xpath "//h5[contains(text(),'Quizzes')]"
    And I wait for 1 sec
    When I click on element with xpath "//span[contains(text(),'Create New Quiz')]"
    And I wait for 2 sec

  @quiz1
  Scenario: Create A Quiz
    When I type "Demo Quiz 050625" into element with xpath "//input[@formcontrolname='name']"
    And I click on element with xpath "//mat-icon[text()='add_circle']"
#    select question type
    When I click on element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[contains(text(),'Single')]"
    And I type "Question 1" into element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[@formcontrolname='question']"
    When I type "Option 1" into element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[@placeholder='Option 1*']"
    When I type "Option 2" into element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[@placeholder='Option 2*']"
#    select Option 1 as a correct option
    And I click on element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[@placeholder='Option 1*']/../../../../..//mat-radio-button"
    When I click on element with xpath "//span[contains(text(),'Save')]"
    And I wait for 2 sec
    Then element with xpath "//mat-panel-title[contains(text(),'Demo Quiz 050625')]" should be displayed
#    to delete a quiz
    When I click on element with xpath "//mat-panel-title[contains(text(),'Demo Quiz 050625')]"
    And I click on element with xpath "//mat-panel-title[contains(text(),'Demo Quiz 050625')]/../../..//*[text()='Delete']"
    When I click on element with xpath "//ac-modal-confirmation/..//*[text()='Delete']"
    And I wait for 2 sec

