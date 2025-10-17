@quiz @regression
Feature: Textual Question - Text

  Background:
    Given I open url "http://ask-qa.portnov.com/#/login"
    Then I should see page title contains "Assessment Control"
    When I type "yuliyaharbar1986@gmail.com" into element with xpath "//*[@formcontrolname='email']"
    And I type "lake2025" into element with xpath "//*[@formcontrolname='password']"
    When I click on element with xpath "//*[@type='submit']"
    And I wait for element with xpath "//*[@class='info']" to be present
    And I wait for 2 sec
    Then element with xpath "//*[@class='info']" should contain text "TEACHER"
    When I click on element with xpath "//h5[normalize-space()='Quizzes']"
    And I wait for element with xpath "//ac-quizzes-list" to be present
    And I wait for 2 sec
    And I click on element with xpath "//*[text()='Create New Quiz']"
    And I wait for 2 sec

  @quiz_TQ
  Scenario: Create Quiz -  Textual Question Text - Happy Path
    When I type "Yuliya TA Quiz" into element with xpath "//*[@formcontrolname='name']"
    And I wait for 2 sec

#  add question
    And I click on element with xpath "//*[text()='add_circle']"
#  select textual type question
    When I click on element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[contains(text(),'Textual')]"
    And I type "Textual question" into element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[@formcontrolname='question']"
    And I click on element with xpath "//*[contains(text(),'Save')]"
    And I wait for 1 sec
    Then element with xpath "//mat-panel-title[contains(text(),'Yuliya TA']" should be displayed
    And I wait for 1 sec
#  delete quiz
    When I click on element with xpath "//mat-panel-title[contains(text(),'Yuliya TA Quiz']"
    And I click on element with xpath "//mat-panel-title[contains(text(),'Yuliya TA Quiz')]/../../..//*[text()='Delete']"
    And I click on element with xpath "//ac-modal-confirmation/..//*[text()='Delete']"
    And I wait for 2 sec

  @quizTQ_required
  Scenario: Create Textual Question with Empty Space
    When I type "Yuliya TA Quiz (Empty Space)" into element with xpath "//*[@formcontrolname='name']"
    And I wait for 2 sec
    And I click on element with xpath "//*[text()='add_circle']"

#  field is required
    When I click on element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[contains(text(),'Textual')]"
    And I type "" into element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[@formcontrolname='question']"
    And I wait for 2 sec
    And I click on element with xpath "//*[contains(text(),'Save')]"
    Then element with xpath "//mat-error" should contain text "This field is required"



  @quiz_TQ_empty
  Scenario: Create Textual Question with White Space
    When I type "Yuliya TQ-Text-Whitespace" into element with xpath "//*[@formcontrolname='name']"
    And I wait for 2 sec
    And I click on element with xpath "//*[text()='add_circle']"

#  add white space into question
    When I click on element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[contains(text(),'Textual')]"
    And I type "     " into element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[@formcontrolname='question']"
    And I wait for 2 sec
    And I click on element with xpath "//*[contains(text(),'Save')]"
#    expected result Then element with xpath "//mat-error" should contain text "This field is required"
#    Jira ticket SEP25-cccc
#     cleant test state
      And I wait for 1 sec
    Then element with xpath "//mat-panel-title[normalize-space()='Yuliya TQ-Text-Whitespace']" should be displayed
    And I wait for 1 sec
#  delete quiz
    When I click on element with xpath "//mat-panel-title[normalize-space()='Yuliya TQ-Text-Whitespace']"
    And I click on element with xpath "//mat-panel-title[normalize-space()='Yuliya TQ-Text-Whitespace']/../../..//*[text()='Delete']"
    And I click on element with xpath "//ac-modal-confirmation/..//*[text()='Delete']"
    And I wait for 2 sec

