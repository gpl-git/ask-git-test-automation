@smoke @textQuestion
Feature: Textual Question functionality

Feature: Quiz Demo - Textual Question

  Background:
    Given I open url "http://ask-qa.portnov.com/#/login"
    Then I should see page title contains "Assessment"
    When I type "ask_instr@aol.com" into element with xpath "//*[@formcontrolname='email']"
    And I type "ABC123" into element with xpath "//*[@formcontrolname='password']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for 2 sec
    Then element with xpath "//*[@class='info']" should contain text "TEACHER"

  @smoke @textQuestion
  Scenario: Create and Verify Textual Question

  Navigate to Quiz
    When I click on element with xpath "//*[contains(text(),'Quizzes')]"
    And I wait for element with xpath "//*[text()='Create New Quiz']" to be present
    And I click on element with xpath "//*[text()='Create New Quiz']"
#  Set Quiz Title
    And I wait for element with xpath "//*[@formcontrolname='name']" to be present
    When I type "Afshan_Textual_Quiz_01" into element with xpath "//*[@formcontrolname='name']"
#  Add Question
    And I click on element with xpath "//button[contains(.,'Add Question')]"
#  Select Textual Question
    When I click on element with xpath "//*[contains(text(),'Textual')]"
    And I wait for 2 sec
#  Fill Question
    And I type "Explain QA testing process." into element with xpath "//textarea[@formcontrolname='question']"
#  Save Quiz
    And I click on element with xpath "//*[contains(text(),'Save')]"
#  Verification
    And I wait for element with xpath "//mat-panel-title[contains(text(),'Afshan_Textual_Quiz_01')]" to be present
    Then element with xpath "//mat-panel-title[contains(text(),'Afshan_Textual_Quiz_01')]" should be displayed
#  Delete Quiz
    When I click on element with xpath "//mat-panel-title[contains(text(),'Afshan_Textual_Quiz_01')]"
    And I click on element with xpath "//mat-panel-title[contains(text(),'Afshan_Textual_Quiz_01')]/../../..//*[text()='Delete']"
    And I wait for element with xpath "//ac-modal-confirmation//button[contains(.,'Delete')]" to be present
    And I click on element with xpath "//ac-modal-confirmation//button[contains(.,'Delete')]"
    And I wait for 3 sec
  @textQuestion_neg
  Scenario: Textual question - empty field

    When I click on element with xpath "//*[contains(text(),'Quizzes')]"
    And I wait for element with xpath "//*[text()='Create New Quiz']" to be present
    And I click on element with xpath "//*[text()='Create New Quiz']"
    And I wait for element with xpath "//*[@formcontrolname='name']" to be present
    When I type "Textual_Empty_01" into element with xpath "//*[@formcontrolname='name']"
    And I click on element with xpath "//button[contains(.,'Add Question')]"
    And I wait for 2 sec
    When I click on element with xpath "//mat-radio-button//label[contains(.,'Textual')]"
    And I wait for 2 sec
    And I click on element with xpath "//*[contains(text(),'Save')]"
    Then element with xpath "//mat-error" should be displayed
    Then element with xpath "//mat-error" should contain text "This field is required"

  @textQuestion_neg
  Scenario: Textual question - only spaces

    When I click on element with xpath "//*[contains(text(),'Quizzes')]"
    And I wait for element with xpath "//*[text()='Create New Quiz']" to be present
    And I click on element with xpath "//*[text()='Create New Quiz']"
    And I wait for element with xpath "//*[@formcontrolname='name']" to be present
    When I type "Textual_Spaces_01" into element with xpath "//*[@formcontrolname='name']"
    And I click on element with xpath "//button[contains(.,'Add Question')]"
    And I wait for 2 sec
    When I click on element with xpath "//mat-radio-button//label[contains(.,'Textual')]"
    And I wait for 2 sec
    And I click on element with xpath "//textarea"
    And I type " " into element with xpath "//textarea"
#    Then element with xpath "//mat-error" should be displayed
    #    this is a reoirted bug FEB26-3333
    And I click on element with xpath "//*[contains(text(),'Save')]"
    And I wait for element with xpath "//mat-panel-title[contains(text(),'Textual_Spaces_01')]" to be present
    Then element with xpath "//mat-panel-title[contains(text(),'Textual_Spaces_01')]" should be displayed
#  Delete Quiz
    When I click on element with xpath "//mat-panel-title[contains(text(),'Textual_Spaces_01')]"
    And I click on element with xpath "//mat-panel-title[contains(text(),'Textual_Spaces_01')]/../../..//*[text()='Delete']"
    And I wait for element with xpath "//ac-modal-confirmation//button[contains(.,'Delete')]" to be present
    And I click on element with xpath "//ac-modal-confirmation//button[contains(.,'Delete')]"