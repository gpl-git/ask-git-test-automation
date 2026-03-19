@regression
Feature: Quiz Demo - Textual Show-Stopper

  Background:
    Given I open url "http://ask-qa.portnov.com/#/login"
    Then I should see page title contains "Assessment"
    When I type "ask_instr@aol.com" into element with xpath "//*[@formcontrolname='email']"
    And I type "ABC123" into element with xpath "//*[@formcontrolname='password']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for 1 sec

#  verify user role = TEACHER
    Then element with xpath "//*[@class='info']" should contain text "TEACHER"
  @smoke @text_ShowStopper
  Scenario: Create and Verify Textual Show-Stopper Question

#  Navigate to Quiz Creation
    When I click on element with xpath "//*[contains(text(),'Quizzes')]"
    And I wait for element with xpath "//*[text()='Create New Quiz']" to be present
    When I click on element with xpath "//*[text()='Create New Quiz']"
#  Set Quiz Title
    And I wait for element with xpath "//*[@formcontrolname='name']" to be present
    When I type "Textual Show-Stopper Demo" into element with xpath "//*[@formcontrolname='name']"
    And I click on element with xpath "//button[contains(., ' Add Question')]"
#  SELECT TEXTUAL QUESTION TYPE
    When I click on element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[contains(text(),'Textual')]"
#  WAIT for checkbox to appear
    And I wait for 1 sec

#  ENABLE SHOW-STOPPER
    And I click on element with xpath "//mat-panel-title[contains(text(), 'Q1')]/../../..//mat-checkbox"
#  Fill out the question
    And I type "Please describe the bug life cycle in detail." into element with xpath "//mat-panel-title[contains(text(), 'Q1')]/../../..//textarea[@formcontrolname='question']"
#    verify showstopper indicator
    Then element with xpath "//mat-panel-title[contains(text(), 'Q1')]" should contain text "*"
#    verify showstopper in preview
    When I click on element with xpath "//*[contains(text(),'Preview')]"
    Then element with xpath "//*[contains(@class, 'show-stopper')]" should contain text "Show-Stopper Question"
    When I click on element using JavaScript with xpath "//*[contains(text(),'Close')]"
#    When I click on element with xpath "//*[contains(text(),'Close')]"
    And I wait for 1 sec
# create textual question 2
    And I click on element with xpath "//button[contains(., ' Add Question')]"
    And I wait for 1 sec
    When I click on element with xpath "//mat-panel-title[contains(text(),'Q2')]/../../..//*[contains(text(),'Textual')]"
    And I type "Question 2" into element with xpath "//mat-panel-title[contains(text(), 'Q2')]/../../..//textarea[@formcontrolname='question']"
    And I click on element with xpath "//mat-panel-title[contains(text(), 'Q2')]/../../..//mat-checkbox"
#  Verify "*" is displayed  at Q2
    Then element with xpath "//mat-panel-title[contains(text(), 'Q2')]" should contain text "*"
    And  element with xpath "//mat-panel-title[contains(text(), 'Q1')]" should not contain text "*"
  #  Save the Quiz
    And I click on element with xpath "//*[contains(text(),'Save')]"
#  Verification: Wait for the quiz list and check for the title
    And I wait for element with xpath "//mat-panel-title[contains(text(), 'Textual Show-Stopper Demo')]" to be present
    Then element with xpath "//mat-panel-title[contains(text(), 'Textual Show-Stopper Demo')]" should be displayed
#delete quiz
    When I click on element with xpath "//mat-panel-title[contains(text(), 'Textual Show-Stopper Demo')]"
    And I click on element with xpath "//mat-panel-title[contains(text(), 'Textual Show-Stopper Demo')]/../../..//*[text()='Delete']"

#  Wait for the confirmation modal and click the final Delete button
    And I wait for element with xpath "//ac-modal-confirmation//button[contains(.,'Delete')]" to be present
    And I click on element with xpath "//ac-modal-confirmation//button[contains(.,'Delete')]"
    And I wait for 3 sec


