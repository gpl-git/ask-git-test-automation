@sq_showstopper
Feature: Quiz Demo
  Background:
    Given I open url "http://ask-qa.portnov.com/#/login"
    When I type "rusyuranyuk@cwrotzxks.com" into element with xpath "//input[@formcontrolname='email']"
    When I type "teacher" into element with xpath "//input[@formcontrolname='password']"
    And I click on element with xpath "//button[@type='submit']"
      # create a quiz
    And I wait for element with xpath "//h5[contains(text(), 'Quizzes')]" to be present
    When I click on element with xpath "//h5[contains(text(), 'Quizzes')]"
    And I wait for element with xpath "//*[text()='Create New Quiz']" to be present
    When I click on element with xpath "//*[text()='Create New Quiz']"
    And I wait for element with xpath "//input[@formcontrolname='name']" to be present

  @sq_showstopper1
  Scenario: Quiz with Single Choice Question - only allow one show stopper
    When I type "1 Choice Demo Quiz TA" into element with xpath "//input[@formcontrolname='name']"
    When I click on element with xpath "//mat-icon[text()='add_circle']"
    And I wait for element with xpath "//mat-panel-title[contains(text(), 'Q1')]/../../..//*[contains(text(), 'Textual')]" to be present
    And I click on element with xpath "//mat-panel-title[contains(text(), 'Q1')]/../../..//*[contains(text(), 'Textual')]"
    And I wait for element with xpath "//mat-panel-title[contains(text(), 'Q1')]/../../..//textarea[@formcontrolname='question']" to be present
    When I type "What is API?" into element with xpath "//mat-panel-title[contains(text(), 'Q1')]/../../..//textarea[@formcontrolname='question']"
      # select 1 show stopper
    And I click on element with xpath "//mat-panel-title[contains(text(), 'Q1')]/../../..//span[contains(text(),'Show-Stopper')]"
    Then element with xpath "//mat-panel-title[contains(text(), 'Q1')]/../../..//mat-panel-title[contains(text(),'Q1*')]" should be displayed
    And I click on element with xpath "//mat-icon[text()='add_circle']"
    And I wait for element with xpath "//mat-panel-title[contains(text(), 'Q2')]/../../..//*[contains(text(), 'Single-Choice')]" to be present
    And I click on element with xpath "//mat-panel-title[contains(text(), 'Q2')]/../../..//*[contains(text(), 'Single-Choice')]"
    When I type "Choose your favorite color" into element with xpath "//mat-panel-title[contains(text(), 'Q2')]/../../..//textarea[@formcontrolname='question']"
    When I type "red" into element with xpath "//mat-panel-title[contains(text(), 'Q2')]/../../..//textarea[@placeholder='Option 1*']"
    And I type "green" into element with xpath "//mat-panel-title[contains(text(), 'Q2')]/../../..//textarea[@placeholder='Option 2*']"
    And I click on element with xpath "(//../../..//div[@class='right']//mat-radio-button)[2]"
    When I click on element with xpath "//mat-panel-title[contains(text(), 'Q2')]/../../..//span[contains(text(),'Show-Stopper')]"
      # only 1 show stopper allowed
    Then element with xpath "//mat-panel-title[contains(text(), 'Q1')]/../../..//mat-panel-title" should not contain text "Q1*"
    Then element with xpath "//mat-panel-title[contains(text(), 'Q2')]/../../..//mat-panel-title[contains(text(),'Q2*')]" should be displayed

  @sq_showstopper2
  Scenario: Quiz with Single Choice Question has asterisk
    When I type "2 Choice Demo Quiz TA" into element with xpath "//input[@formcontrolname='name']"
    When I click on element with xpath "//mat-icon[text()='add_circle']"
    And I wait for element with xpath "//mat-panel-title[contains(text(), 'Q1')]/../../..//*[contains(text(), 'Single-Choice')]" to be present
    And I click on element with xpath "//mat-panel-title[contains(text(), 'Q1')]/../../..//*[contains(text(), 'Single-Choice')]"
    When I type "Choose your favorite color" into element with xpath "//mat-panel-title[contains(text(), 'Q1')]/../../..//textarea[@formcontrolname='question']"
    When I type "red" into element with xpath "//mat-panel-title[contains(text(), 'Q1')]/../../..//textarea[@placeholder='Option 1*']"
    And I type "green" into element with xpath "//mat-panel-title[contains(text(), 'Q1')]/../../..//textarea[@placeholder='Option 2*']"
    And I click on element with xpath "(//../../..//div[@class='right']//mat-radio-button)[2]"
    When I click on element with xpath "//mat-panel-title[contains(text(), 'Q1')]/../../..//span[contains(text(),'Show-Stopper')]"
    Then element with xpath "//mat-panel-title[contains(text(), 'Q1')]/../../..//mat-panel-title[contains(text(),'Q1*')]" should be displayed

      # preview should see red show stopper
    And I click on element with xpath "//span[contains(text(),'Preview')]"
    And I wait for element with xpath "//ac-quiz-preview" to be present
    Then element with xpath "//ac-quiz-preview" should be displayed
    And element with xpath "//div[@formarrayname='questions']//*[contains(text(), 'Choose your favorite color')]/../p[text()='Show-Stopper Question']" should be displayed

  @sq_showstopper3
  Scenario: Preview Quiz with Single Choice Question - show stopper
    When I type "3 Choice Demo Quiz TA" into element with xpath "//input[@formcontrolname='name']"
    When I click on element with xpath "//mat-icon[text()='add_circle']"
    And I wait for element with xpath "//mat-panel-title[contains(text(), 'Q1')]/../../..//*[contains(text(), 'Textual')]" to be present
    And I click on element with xpath "//mat-panel-title[contains(text(), 'Q1')]/../../..//*[contains(text(), 'Textual')]"
    And I wait for element with xpath "//mat-panel-title[contains(text(), 'Q1')]/../../..//textarea[@formcontrolname='question']" to be present
    When I type "What is API?" into element with xpath "//mat-panel-title[contains(text(), 'Q1')]/../../..//textarea[@formcontrolname='question']"
    And I click on element with xpath "//mat-icon[text()='add_circle']"
    And I wait for element with xpath "//mat-panel-title[contains(text(), 'Q2')]/../../..//*[contains(text(), 'Single-Choice')]" to be present
    And I click on element with xpath "//mat-panel-title[contains(text(), 'Q2')]/../../..//*[contains(text(), 'Single-Choice')]"
    When I type "Choose your favorite color" into element with xpath "//mat-panel-title[contains(text(), 'Q2')]/../../..//textarea[@formcontrolname='question']"
    When I type "red" into element with xpath "//mat-panel-title[contains(text(), 'Q2')]/../../..//textarea[@placeholder='Option 1*']"
    And I type "green" into element with xpath "//mat-panel-title[contains(text(), 'Q2')]/../../..//textarea[@placeholder='Option 2*']"
    And I click on element with xpath "(//../../..//div[@class='right']//mat-radio-button)[2]"
    When I click on element with xpath "//mat-panel-title[contains(text(), 'Q2')]/../../..//span[contains(text(),'Show-Stopper')]"

      # preview should see red show stopper
    And I click on element with xpath "//span[contains(text(),'Preview')]"
    And I wait for element with xpath "//ac-quiz-preview" to be present
    Then element with xpath "//ac-quiz-preview" should be displayed
    And element with xpath "//div[@formarrayname='questions']//*[contains(text(), 'Choose your favorite color')]/../p[text()='Show-Stopper Question']" should be displayed
    When I click on element with xpath "//button[@aria-label='Close dialog']"

    And I click on element with xpath "//span[contains(text(), 'Save')]"
    And I wait for element with xpath "//*[text()='List of Quizzes']" to be present
    Then element with xpath "//mat-panel-title[contains(text(), '3 Choice Demo Quiz TA')]" should be displayed

      # edit quiz should see arsterik for show stopper
    When I click on element with xpath "//mat-panel-title[contains(text(), '3 Choice Demo Quiz TA')]"
    And I wait for element with xpath "//mat-panel-title[contains(text(), '3 Choice Demo Quiz TA')]/../../..//*[text()= 'Edit']" to be present
    And I click on element with xpath "//mat-panel-title[contains(text(), '3 Choice Demo Quiz TA')]/../../..//*[text()= 'Edit']"
    And I wait for element with xpath "//ac-quiz-builder-page" to be present
    And I wait for 5 sec
    Then element with xpath "//mat-panel-title[contains(text(),'Q2*: Choose your favorite color')]" should be displayed
    When I click on element with xpath "//span[contains(text(), 'Back To Quizzes List')]"
    And I wait for element with xpath "//*[text()='List of Quizzes']" to be present
         # to delete a  quiz
    When I click on element with xpath "//mat-panel-title[contains(text(), '3 Choice Demo Quiz TA')]"
    And I wait for element with xpath "//mat-panel-title[contains(text(), '3 Choice Demo Quiz TA')]/../../..//*[text()= 'Delete']" to be present
    And I click on element with xpath "//mat-panel-title[contains(text(), '3 Choice Demo Quiz TA')]/../../..//*[text()= 'Delete']"
    And I wait for element with xpath "//ac-modal-confirmation" to be present
    When I click on element with xpath "//ac-modal-confirmation/..//*[text()='Delete']"
    And I wait for element with xpath "//*[text()='List of Quizzes']" to be present


