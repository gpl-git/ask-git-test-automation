@quiz @regression
Feature: Quiz with Single choice Showstopper
  Background:
    Given I open url "http://ask-qa.portnov.com/#/login"
    Then I should see page title as "Assessment Control @ Portnov"
    When I type "justure89@gustr.com" into element with xpath "//input[@formcontrolname='email']"
    And I type "123456" into element with xpath "//input[@formcontrolname='password']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for 3 sec
    When I click on element with xpath "//h5[text()='Quizzes']"
    And I wait for 3 sec
    When I click on element with xpath "//*[text()='Create New Quiz']"
    And I wait for 1 sec

  @quiz1
  Scenario: Create a quizz
    When I type "ASJ SingleChoice - ShowStopper" into element with xpath "//input[@formcontrolname='name']"
    And I wait for 3 sec
    And I click on element with xpath "//mat-icon[text()='add_circle']"
#    select question type
    When I click on element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[contains(text(),'Single-Choice')]"
    And I wait for 1 sec
    When I type "Question1" into element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[@formcontrolname='question']"
    And I type "Option1" into element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[@placeholder='Option 1*']"
    And I type "Option2" into element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[@placeholder='Option 2*']"
#    select a correct option
    When I click on element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[@placeholder='Option 1*']/../../../../..//mat-radio-button"
    And I wait for 3 sec
#    select showstopper
    When I click on element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[contains(text(),'Show-Stopper')]/../..//*[@class='mat-checkbox-inner-container']"
    And I wait for 5 sec
#    verifying title Q1*
    Then element with xpath "//mat-panel-title[contains(text(),'Q1*')]" should be displayed
#    preview
    When I click on element with xpath "//*[contains(text(),'Preview')]"
    And I wait for 5 sec
    Then element with xpath "//h5[contains(text(),'Question 1')]/..//p[text()='Show-Stopper Question']" should be displayed
    And I click on element with xpath "//span[text()='Close']"
#    add second question
    And I click on element with xpath "//mat-icon[text()='add_circle']"
    And I wait for 3 sec
    #    select question type
    When I click on element with xpath "//mat-panel-title[contains(text(),'Q2')]/../../..//*[contains(text(),'Single-Choice')]"
    And I wait for 5 sec
    When I type "Question2" into element with xpath "//mat-panel-title[contains(text(),'Q2')]/../../..//*[@formcontrolname='question']"
    And I type "Option1" into element with xpath "//mat-panel-title[contains(text(),'Q2')]/../../..//*[@placeholder='Option 1*']"
    And I type "Option2" into element with xpath "//mat-panel-title[contains(text(),'Q2')]/../../..//*[@placeholder='Option 2*']"
#    select a correct option
    When I click on element with xpath "//mat-panel-title[contains(text(),'Q2')]/../../..//*[@placeholder='Option 1*']/../../../../..//mat-radio-button"
    And I wait for 3 sec
#    select showstopper
    When I click on element with xpath "//mat-panel-title[contains(text(),'Q2')]/../../..//*[contains(text(),'Show-Stopper')]/../..//*[@class='mat-checkbox-inner-container']"
    And I wait for 5 sec
#    verifying title Q1*
    Then element with xpath "//mat-panel-title[contains(text(),'Q2*')]" should be displayed
#    preview
    When I click on element with xpath "//*[contains(text(),'Preview')]"
    And I wait for 5 sec
    Then element with xpath "//h5[contains(text(),'Question 2')]/..//p[text()='Show-Stopper Question']" should be displayed
    And I click on element with xpath "//span[text()='Close']"
#    save
    When I click on element with xpath "//*[contains(text(),'Save')]"
    And I wait for 3 sec
    Then element with xpath "//mat-panel-title[contains(text(),'ASJ SingleChoice - ShowStopper')]" should be displayed
    And I wait for 2 sec
#    to delete the quiz
    When I click on element with xpath "//mat-panel-title[contains(text(),'ASJ SingleChoice - ShowStopper')]"
    And I wait for 2 sec
    When I click on element with xpath "//mat-panel-title[contains(text(),'ASJ SingleChoice - ShowStopper')]/../../..//*[text()='Delete']"
    And I click on element with xpath "//ac-modal-confirmation/..//*[text()='Delete']"
    And I wait for 2 sec
