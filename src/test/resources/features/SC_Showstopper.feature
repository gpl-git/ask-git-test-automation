@quiz-SC-Show-Stopper

Feature: Single Choice-Show-Stopper

  Background:
    Given I open url "http://ask-qa.portnov.com/#/login"
    Then I should see page title contains "Portnov"
    When I type "ghandouradvertising@kimgmail.com" into element with xpath "//input[@formcontrolname='email']"
    And I type "123456" into element with xpath "//input[@formcontrolname='password']"
    When I click on element with xpath "//button[@type='submit']"
    And I wait for 1 sec
    When I click on element with xpath " //h5[contains(text(),'Quizzes')]"
    And I wait for 1 sec
    When I click on element with xpath "//span[text()='Create New Quiz']"
    And I wait for 1 sec

  @quiz-SC-Show-Stopper1
  Scenario: Quiz with Single Choice Question-Showstopper
    When I type "SCQ-SS" into element with xpath "//input[@formcontrolname='name']"
    And I click on element with xpath "//mat-icon[text()='add_circle']"
    When I click on element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[contains(text(),'Single-Choice')]"
    And I type "The main focus of acceptance testing is?" into element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[@formcontrolname='question']"
    And I type "1. testing for a business perspective" into element with xpath "//textarea[@placeholder='Option 1*']"
    And I type "2. ensuring that the system is acceptable to all users" into element with xpath "//textarea[@placeholder='Option 2*']"
    And I click on element with xpath "//ac-question-body-form/div[1]/div[2]/div[1]/mat-radio-group[1]/mat-radio-button[1]/label[1]/div[1]"
    When I click on element with xpath "//ac-question-body-form/div[1]/div[2]/div[1]/div[2]/mat-checkbox[1]/label[1]"
    And I wait for 2 sec
    Then element with xpath "//mat-panel-title[contains(text(),'Q1')]" should contain text "*"
    When I click on element with xpath "//span[contains(text(),'Save')]"
    And I wait for 2 sec
    Then element with xpath "//mat-panel-title[contains(text(),'SCQ-SS')]" should be displayed
    When I click on element with xpath "//mat-panel-title[contains(text(),'SCQ-SS')]"
    And I click on element with xpath "//mat-panel-title[contains(text(),'SCQ-SS')]/../../..//*[text()='Delete']"
    And I wait for 2 sec
    And I click on element with xpath "//ac-modal-confirmation/..//*[text()='Delete']"

  @quiz-SC-Show-Stopper2(RedLabelPreview)
  Scenario: Quiz with Single Choice Question-Showstopper
    When I type "SCQ-SS" into element with xpath "//input[@formcontrolname='name']"
    And I click on element with xpath "//mat-icon[text()='add_circle']"
    When I click on element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[contains(text(),'Single-Choice')]"
    And I type "The main focus of acceptance testing is?" into element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[@formcontrolname='question']"
    And I type "1. testing for a business perspective" into element with xpath "//textarea[@placeholder='Option 1*']"
    And I type "2. ensuring that the system is acceptable to all users" into element with xpath "//textarea[@placeholder='Option 2*']"
    And I click on element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[@placeholder='Option 1*']/../../../../..//mat-radio-button"
    When I click on element with xpath " //mat-panel-title[contains(text(),'Q1')]/../../..//*[@class='mat-checkbox-label']"
    And I wait for 2 sec
    Then element with xpath "//mat-panel-title[contains(text(),'Q1')]" should contain text "*"
    When I click on element with xpath "//span[contains(text(),'Save')]"
    And I wait for 2 sec
    Then element with xpath "//mat-panel-title[contains(text(),'SCQ-SS')]" should be displayed
    And I click on element with xpath "//mat-panel-title[contains(text(),'SCQ-SS')]"
    And I click on element with xpath "//mat-panel-title[contains(text(),'SCQ-SS')]/../../..//span[text()='Preview']"
    Then element with xpath "//p[contains(text(),'Show-Stopper Question')]" should be present
    And I click on element with xpath "//span[contains(text(),'Close')]"
    And I click on element with xpath "//mat-panel-title[contains(text(),'SCQ-SS')]/../../..//*[text()='Delete']"
    And I wait for 2 sec
    And I click on element with xpath "//ac-modal-confirmation/..//*[text()='Delete']"

  @quiz-SC-Show-Stopper3(1perQuiz)
  Scenario:
    When I type "SCQ-SS" into element with xpath "//input[@formcontrolname='name']"
    And I click on element with xpath "//mat-icon[text()='add_circle']"
    When I click on element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[contains(text(),'Single-Choice')]"
    And I type "The main focus of acceptance testing is?" into element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[@formcontrolname='question']"
    And I type "1. testing for a business perspective" into element with xpath "//textarea[@placeholder='Option 1*']"
    And I type "2. ensuring that the system is acceptable to all users" into element with xpath "//textarea[@placeholder='Option 2*']"
    And I click on element with xpath "//ac-question-body-form/div[1]/div[2]/div[1]/mat-radio-group[1]/mat-radio-button[1]/label[1]/div[1]"
    When I click on element with xpath "//ac-question-body-form/div[1]/div[2]/div[1]/div[2]/mat-checkbox[1]/label[1]"
    And I click on element with xpath "//mat-icon[text()='add_circle']"
    And I wait for 3 sec
    And I click on element with xpath "//mat-panel-title[contains(text(),'Q2')]/../../..//*[contains(text(),'Single-Choice')]"
    And I wait for 3 sec
    And I type "The main focus of acceptance testing is?" into element with xpath "//mat-panel-title[contains(text(),'Q2')]/../../..//textarea[@placeholder='Question *']"
    And I type "1. testing for a business perspective" into element with xpath "//mat-panel-title[contains(text(),'Q2')]/../../..//textarea[@placeholder='Option 1*']"
    And I type "2. ensuring that the system is acceptable to all users" into element with xpath "//mat-panel-title[contains(text(),'Q2')]//../../..//textarea[@placeholder='Option 2*']"
    And I click on element with xpath "//body[1]/ac-root[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/main[1]/ac-quiz-builder-page[1]/form[1]/main[1]/mat-accordion[1]/mat-expansion-panel[2]/div[1]/div[1]/ac-question-body-form[1]/div[1]/div[2]/div[1]/mat-radio-group[1]/mat-radio-button[1]/label[1]/div[1]/div[2]"
    When I click on element with xpath "//body[1]/ac-root[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/main[1]/ac-quiz-builder-page[1]/form[1]/main[1]/mat-accordion[1]/mat-expansion-panel[2]/div[1]/div[1]/ac-question-body-form[1]/div[1]/div[2]/div[1]/div[2]/mat-checkbox[1]/label[1]/div[1]"
    And I wait for 2 sec
    Then element with xpath "//mat-panel-title[contains(text(),'Q2')]" should contain text "*"
    When I click on element with xpath "//span[contains(text(),'Save')]"
    And I wait for 2 sec
    Then element with xpath "//mat-panel-title[contains(text(),'SCQ-SS')]" should be displayed
    When I click on element with xpath "//mat-panel-title[contains(text(),'SCQ-SS')]"
    And I click on element with xpath "//mat-panel-title[contains(text(),'SCQ-SS')]/../../..//*[text()='Delete']"
    And I wait for 2 sec
    And I click on element with xpath "//ac-modal-confirmation/..//*[text()='Delete']"










