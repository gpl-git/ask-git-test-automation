@quiz_demo
Feature: Quiz Demo (Portnov CS)

  Background:
    Given I open url "http://ask-qa.portnov.com/#/login"
    When I type "yoshiyuk@banhang14.com" into element with xpath "//input[@formcontrolname='email']"
    And I type "12345abc" into element with xpath "//input[@formcontrolname='password']"
    When I click on element with xpath "//*[text()='Sign In']"
    And I wait for 1 sec
    When I click on element with xpath "//h5[text()='Quizzes']"
    And I wait for 1 sec
    When I click on element with xpath "//span[text()='Create New Quiz']"
    And I wait for 1 sec

  @t_sc_mc_question
  Scenario: Quiz with a Textual, Single-Choice and Multiple Questions
    When I type "2_Different types of questions" into element with xpath "//input[@formcontrolname='name']"
    And I click on element with xpath "//mat-icon[text()='add_circle']"
    And I wait for 1 sec
    When I click on element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[contains(text(),'Textual')]"
    And I type "Test Question 1" into element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//textarea[@formcontrolname='question']"
    And I click on element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//span[contains(text(),'Show-Stopper')]"
    And I wait for 2 sec
    When I click on element with xpath "//mat-icon[text()='add_circle']"
    And I wait for 1 sec
    When I click on element with xpath "//mat-panel-title[contains(text(),'Q2')]/../../..//*[contains(text(),'Single')]"
    And I type "Test Question 2" into element with xpath "//mat-panel-title[contains(text(),'Q2')]/../../..//textarea[@formcontrolname='question']"
    And I type "Answer1" into element with xpath "//mat-panel-title[contains(text(),'Q2')]/../../..//textarea[@placeholder='Option 1*']"
    And I type "Answer2" into element with xpath "//mat-panel-title[contains(text(),'Q2')]/../../..//textarea[@placeholder='Option 2*']"
    And I click on element with xpath "//mat-panel-title[contains(text(),'Q2')]/../../..//textarea[@placeholder='Option 2*']/../../../../..//mat-radio-button"
    And I wait for 2 sec
    When I click on element with xpath "//mat-icon[text()='add_circle']"
    And I wait for 1 sec
    When I click on element with xpath "//mat-panel-title[contains(text(),'Q3')]/../../..//*[contains(text(),'Multiple')]"
    And I type "Test Question 3" into element with xpath "//mat-panel-title[contains(text(),'Q3')]/../../..//textarea[@formcontrolname='question']"
    And I type "Answer1" into element with xpath "//mat-panel-title[contains(text(),'Q3')]/../../..//textarea[@placeholder='Option 1*']"
    And I type "Answer2" into element with xpath "//mat-panel-title[contains(text(),'Q3')]/../../..//textarea[@placeholder='Option 2*']"
    And I click on element with xpath "//mat-panel-title[contains(text(),'Q3')]/../../..//textarea[@placeholder='Option 2*']/../../../../..//mat-checkbox"
    When I click on element with xpath "//*[contains(text(),'Save')]"
    And I wait for 1 sec
    Then element with xpath "//mat-panel-title[contains(text(),'2_Different types of questions')]" should be displayed
    And I wait for 1 sec

    #delete quiz
    When I click on element with xpath "//mat-panel-title[contains(text(),'2_Different types of questions')]"
    And I click on element with xpath "//mat-panel-title[contains(text(),'2_Different types of questions')]/../../..//*[text()='Delete']"
    And I click on element with xpath "//ac-modal-confirmation/..//*[text()='Delete']"
    And I wait for 2 sec





