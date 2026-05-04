@regression @textualText
Feature: Textual Question
  Background:
    Given I open url "http://ask-qa.portnov.com"
    Then  I should see page title contains "Assessment Control @ Portnov"
    When I type "ask_instr@aol.com" into element with xpath "//*[@formcontrolname='email']"
    And I type "ABC123" into element with xpath "//*[@formcontrolname='password']"
    When I click on element with xpath "//*[@type='submit']"
    And I wait for 1 sec
 # Then I should see element with xpath "//h3[contains(text(),'TEACHER')]"
    When I click on element with xpath "//h5[text()='Quizzes']"
    And I wait for 1 sec
    When I click on element with xpath "//*[text()='Create New Quiz']"
    And I wait for 1 sec

  @textualText1
  Scenario: Textual Question  Text Happy Path
    When I type "Textual QUIZ503" into element with xpath "//*[@formcontrolname='name']"
    And I click on element with xpath "//*[text()='add_circle']"
#      select question type
    When I click on element with xpath "//*[contains(text(),'Q1')]/../../..//*[contains(text(), 'Textual')]"
#      question text
    And I type "Question 1" into element with xpath "//*[contains(text(),'Q1')]/../../..//*[@formcontrolname='question']"
    Then element with xpath "//*[contains(text(),'Q1')]" should contain text "Question 1"
    And I wait for 1 sec
    And I wait for element with xpath "//*[contains(text(),'Q1')]/../../..//*[@formcontrolname='question']" to be present
    And I wait for 1 sec
    Then I click on element with xpath "//textarea[@formcontrolname='question']"
    And I wait for 1 sec
    Then I type "T-Question 1" into element with xpath "//*[contains(text(),'Q1')]/../../..//*[@formcontrolname='question']"
    And I wait for 1 sec
  #      save quiz
    When I click on element with xpath "//span[normalize-space()='Save']"
    And I wait for 1 sec
#  verify quiz title on the list of quizzes
    Then element with xpath "//mat-panel-title[normalize-space()='Textual QUIZ503']" should be displayed
#  delete quiz
    When I click on element with xpath "//mat-panel-title[normalize-space()='Textual QUIZ503']"
    And I click on element with xpath "//mat-panel-title[normalize-space()='Textual QUIZ503']/../../..//*[text()='Delete']"
    And I click on element with xpath "//ac-modal-confirmation/..//*[text()='Delete']"
    And I wait for 1 sec

  @textualText2
  Scenario: This Field is required
    When I type "Textual QUIZ503" into element with xpath "//*[@formcontrolname='name']"
    And I click on element with xpath "//*[text()='add_circle']"
#      select question type
    When I click on element with xpath "//*[contains(text(),'Q1')]/../../..//*[contains(text(), 'Textual')]"
    When I click on element with xpath "//span[normalize-space()='Save']"
    And I wait for 1 sec
    Then element with xpath "//mat-error" should be displayed
    Then element with xpath "//mat-error" should contain text "This field is required"
    Then element with xpath "//simple-snack-bar" should be displayed
    Then element with xpath "//simple-snack-bar" should contain text "Quiz is not complete"

  @textualText3
  Scenario: Textual question text fiels accepts white space only
    When I type "Textual QUIZ503" into element with xpath "//*[@formcontrolname='name']"
    And I click on element with xpath "//*[text()='add_circle']"
#      select question type
    When I click on element with xpath "//*[contains(text(),'Q1')]/../../..//*[contains(text(), 'Textual')]"
    And I type " " into element with xpath "//*[contains(text(),'Q1')]/../../..//*[@formcontrolname='question']"
    When I click on element with xpath "//span[normalize-space()='Save']"
    And I wait for 1 sec
    #    this is a known bug Jira ticket APR26-88888
    Then element with xpath "//mat-error" should be displayed
    Then element with xpath "//simple-snack-bar" should be displayed





