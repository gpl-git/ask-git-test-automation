@quiz @regression
Feature:  Quiz Single Choice Question - Show-Stopper

  Background:
    Given I open url "http://ask-qa.portnov.com/#/login"
    Then I should see page title contains "Assessment Control"
    When I type "ask_instr@aol.com" into element with xpath "//*[@formcontrolname='email']"
    And I type "ABC123" into element with xpath "//*[@formcontrolname='password']"
    When I click on element with xpath "//button[@type='submit']"
    And I wait for 1 sec
#    verify user role
    Then element with xpath "//*[@class='info']" should contain text "TEACHER"
    When I click on element with xpath "//h5[text()='Quizzes']"
    And I wait for 1 sec
    When I click on element with xpath "//*[text()='Create New Quiz']"
    And I wait for 1 sec

  @SC+Showstopper
  Scenario: Indication of Showstopper in the SC Question
    When I type "Single-Choice Question - Show-stopper Quiz 07/24/25" into element with xpath "//input[@formcontrolname='name']"
    And I click on element with xpath "//mat-icon[text()='add_circle']"
#      select question type
    When I click on element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[contains(text(),'Single')]"
#      fill out question field
    And I type "Question 1" into element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[@formcontrolname='question']"
      #      fill out option  fields
    When I type "Option 1" into element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[@placeholder='Option 1*']"
    And I type "Option 2" into element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[@placeholder='Option 2*']"
#      select correct option
    When I click on element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[@placeholder='Option 2*']/../../../../..//mat-radio-button"
#       show stopper
    And I click on element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[contains(text(),'Show-Stopper')]"
    #    verify that showstopper is displayed next to Q1
    Then element with xpath "//mat-panel-title[contains(text(),'Q1')]" should contain text "*"
    When I click on element with xpath "//span[normalize-space()='Preview']"
    Then element with xpath "//p[contains(@class,'show-stopper')]" should be displayed
    And element with xpath "//p[contains(@class,'show-stopper')]" should contain text "Show-Stopper Question"
    When I click on element with xpath "//span[normalize-space()='Close']"
    And I wait for 1 sec
    When I click on element with xpath "//span[normalize-space()='Save']"
    And I wait for 2 sec
#      verify that quiz is displayed
    Then element with xpath "//mat-panel-title[contains(text(),'Single-Choice Question - Show-stopper Quiz 07/24/25')]" should be displayed
#      delete quiz
    When I click on element with xpath "//mat-panel-title[contains(text(),'Single-Choice Question - Show-stopper Quiz 07/24/25')]"
    And I click on element with xpath "//mat-panel-title[contains(text(),'Single-Choice Question - Show-stopper Quiz 07/24/25')]/../../..//*[contains(text(),'Delete')]"
    When I click on element with xpath "//ac-modal-confirmation/..//*[contains(text(),'Delete')]"
    And I wait for 3 sec


  @SC+Showstopper
  Scenario: Only One Single Choice Question per Quiz is Allowed
    When I type "Single-Choice Question - Show-stopper Quiz 07/24/25" into element with xpath "//input[@formcontrolname='name']"
    And I click on element with xpath "//mat-icon[text()='add_circle']"
#      select question type
    When I click on element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[contains(text(),'Single')]"
#      fill out question field
    And I type "Question 1" into element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[@formcontrolname='question']"
      #      fill out option  fields
    When I type "Option 1" into element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[@placeholder='Option 1*']"
    And I type "Option 2" into element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[@placeholder='Option 2*']"
#      select correct option
    When I click on element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[@placeholder='Option 2*']/../../../../..//mat-radio-button"
#       show stopper
    And I click on element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[contains(text(),'Show-Stopper')]"
    #    verify that showstopper is displayed next to Q1
    Then element with xpath "//mat-panel-title[contains(text(),'Q1')]" should contain text "*"
#    create question 2Feature:
    And I click on element with xpath "//mat-icon[text()='add_circle']"
    And I wait for 1 sec
    When I click on element with xpath "//mat-panel-title[contains(text(),'Q2')]/../../..//*[contains(text(),'Single')]"
#      fill out question field
    And I type "Question 1" into element with xpath "//mat-panel-title[contains(text(),'Q2')]/../../..//*[@formcontrolname='question']"
      #      fill out option  fields
    When I type "Option 1" into element with xpath "//mat-panel-title[contains(text(),'Q2')]/../../..//*[@placeholder='Option 1*']"
    And I type "Option 2" into element with xpath "//mat-panel-title[contains(text(),'Q2')]/../../..//*[@placeholder='Option 2*']"
#      select correct option
    When I click on element with xpath "//mat-panel-title[contains(text(),'Q2')]/../../..//*[@placeholder='Option 2*']/../../../../..//mat-radio-button"
#       show stopper
    And I click on element with xpath "//mat-panel-title[contains(text(),'Q2')]/../../..//*[contains(text(),'Show-Stopper')]"
        #    verify that showstopper is displayed next to Q2
    Then element with xpath "//mat-panel-title[contains(text(),'Q2')]" should contain text "*"
    When I click on element with xpath "//span[normalize-space()='Save']"
    And I wait for 2 sec
#      verify that quiz is displayed
    Then element with xpath "//mat-panel-title[contains(text(),'Single-Choice Question - Show-stopper Quiz 07/24/25')]" should be displayed
#      delete quiz
    When I click on element with xpath "//mat-panel-title[contains(text(),'Single-Choice Question - Show-stopper Quiz 07/24/25')]"
    And I click on element with xpath "//mat-panel-title[contains(text(),'Single-Choice Question - Show-stopper Quiz 07/24/25')]/../../..//*[contains(text(),'Delete')]"
    When I click on element with xpath "//ac-modal-confirmation/..//*[contains(text(),'Delete')]"
    And I wait for 3 sec
