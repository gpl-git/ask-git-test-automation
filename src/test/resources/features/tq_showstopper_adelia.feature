@tq_showstop
Feature: Textual Question - Show-Stopper

  Background:
    Given I open url "http://ask-qa.portnov.com/#/login"
    And I wait for 3 sec
    Then I should see page title as "Assessment Control @ Portnov"
    When I click on element with xpath "//input[@formcontrolname='email']"
    And I type "sihuhe@teleg.eu" into element with xpath "//input[@formcontrolname='email']"
    And I click on element with xpath "//input[@formcontrolname='password']"
    And I type "123456" into element with xpath "//input[@formcontrolname='password']"
    And I click on element with xpath "//span[contains(text(),'Sign In')]"
    When I wait for element with xpath "//h5[contains(text(),'Quizzes')]" to be present
    And I click on element with xpath "//h5[contains(text(),'Quizzes')]"
    Then I wait for element with xpath "//span[contains(text(),'Create New Quiz')]" to be present
    When I click on element with xpath "//span[contains(text(),'Create New Quiz')]"
    Then I wait for element with xpath "//input[@formcontrolname='name']" to be present

  @tq_showstop1
  Scenario: Textual show-stopper question can be created
    When I type "Cucumber Quiz From Adele" into element with xpath "//input[@formcontrolname='name']"
    Then I wait for element with xpath "//mat-icon[text()='add_circle']" to be present
    When I click on element with xpath "//mat-icon[text()='add_circle']"
    And I click on element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[contains(text(),'Textual')]"
    And I wait for 2 sec
    When I click on element with xpath "//div[@class='mat-checkbox-inner-container']"
    And I click on element with xpath "//div[@class='mat-input-infix mat-form-field-infix']/child::textarea"
    When I type "How old are you?" into element with xpath "//div[@class='mat-input-infix mat-form-field-infix']/child::textarea"
    And I click on element with xpath "//button[@type='button']/child::span[contains(text(),'Save')]"
    Then I wait for element with xpath "//div[@class='quizzes']" to be present
    And element with xpath "//div[@class='quizzes']" should contain text "Cucumber Quiz From Adele"
#    to delete the quiz
    When I click on element with xpath "//mat-panel-title[contains(text(),'Cucumber Quiz From Adele')]"
    And I wait for 2 sec
    And I click on element with xpath "//mat-panel-title[contains(text(),'Cucumber Quiz From Adele')]/../../..//*[text()='Delete']"
    And I click on element with xpath "//button[@aria-label='Close dialog'][2]"

  @tq_showstop2
  Scenario: Show-stopper question has a red label in a preview
    When I type "Cucumber Quiz From Adele" into element with xpath "//input[@formcontrolname='name']"
    Then I wait for element with xpath "//mat-icon[text()='add_circle']" to be present
    When I click on element with xpath "//mat-icon[text()='add_circle']"
    And I click on element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[contains(text(),'Textual')]"
    And I wait for 2 sec
    When I click on element with xpath "//ac-question-body-form/div[1]/div[2]/div[1]/div[1]/mat-checkbox[1]/label[1]/div[1]"
    And I click on element with xpath "//div[@class='mat-input-infix mat-form-field-infix']/child::textarea"
    When I type "How old are you?" into element with xpath "//div[@class='mat-input-infix mat-form-field-infix']/child::textarea"
    And I click on element with xpath "//button[@type='button']/child::span[contains(text(),'Save')]"
    Then I wait for element with xpath "//div[@class='quizzes']" to be present
    And element with xpath "//div[@class='quizzes']" should contain text "Cucumber Quiz From Adele"
    When I click on element with xpath "//mat-panel-title[contains(text(),'Cucumber Quiz From Adele')]"
    And I wait for 2 sec
    And I click on element with xpath "//mat-panel-title[contains(text(),'Cucumber Quiz From Adele')]/../../..//*[text()='Preview']"
    Then element with xpath "//p[contains(text(),'Show-Stopper Question')]" should be present
    And I wait for 2 sec
    When I click on element with xpath "//button[@aria-label='Close dialog']"
    And I click on element with xpath "//mat-panel-title[contains(text(),'Cucumber Quiz From Adele')]/../../..//*[text()='Delete']"
    And I click on element with xpath "//button[@aria-label='Close dialog'][2]"

  @tq_showstop3
  Scenario: The system's restriction to the creation of more than one "Show-Stopper" question per quiz.
    When I type "Cucumber Quiz From Adele" into element with xpath "//input[@formcontrolname='name']"
    Then I wait for element with xpath "//mat-icon[text()='add_circle']" to be present
    When I click on element with xpath "//mat-icon[text()='add_circle']"
    And I click on element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[contains(text(),'Textual')]"
    And I wait for 2 sec
    When I click on element with xpath "//ac-question-body-form/div[1]/div[2]/div[1]/div[1]/mat-checkbox[1]/label[1]/div[1]"
    And I click on element with xpath "//div[@class='mat-input-infix mat-form-field-infix']/child::textarea"
    When I type "How old are you?" into element with xpath "//div[@class='mat-input-infix mat-form-field-infix']/child::textarea"
    And I click on element with xpath "//mat-icon[text()='add_circle']"
    And I click on element with xpath "//mat-panel-title[contains(text(),'Q2')]/../../..//*[contains(text(),'Textual')]"
    And I click on element using JavaScript with xpath "//mat-panel-title[contains(text(),'Q2')]/../../..//*[contains(text(),'Show-Stopper')]"
    And I wait for 2 sec

    When I click on element with xpath "//mat-panel-title[contains(text(),'Q2')]/../../..//*[@placeholder='Question *']"

    And I wait for 2 sec


    And I type "How are you?" into element with xpath "//mat-panel-title[contains(text(),'Q2')]/../../..//*[@placeholder='Question *']"

    And I click on element with xpath "//button[@type='button']/child::span[contains(text(),'Save')]"
    Then I wait for element with xpath "//div[@class='quizzes']" to be present
    And I wait for 2 sec
    And element with xpath "//div[@class='quizzes']" should contain text "Cucumber Quiz From Adele"
#    In case the quiz was created
    When I click on element with xpath "//mat-panel-title[contains(text(),'Cucumber Quiz From Adele')]"
    And I wait for 2 sec
    And I click on element with xpath "//mat-panel-title[contains(text(),'Cucumber Quiz From Adele')]/../../..//*[text()='Delete']"
    And I click on element with xpath "//button[@aria-label='Close dialog'][2]"



  @tq_showstop4
  Scenario: Show-stopper question is displayed with an asterisk
    When I type "Cucumber Quiz From Adele" into element with xpath "//input[@formcontrolname='name']"
    Then I wait for element with xpath "//mat-icon[text()='add_circle']" to be present
    When I click on element with xpath "//mat-icon[text()='add_circle']"
    And I click on element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[contains(text(),'Textual')]"
    And I wait for 2 sec
    When I click on element with xpath "//ac-question-body-form/div[1]/div[2]/div[1]/div[1]/mat-checkbox[1]/label[1]/div[1]"
    Then element with xpath "//mat-panel-title[contains(text(),'Q1')]" should contain text "*"













