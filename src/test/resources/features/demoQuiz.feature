@quiz @regression
Feature: Demo Quiz
  Background:
    Given I open url "http://ask-qa.portnov.com/#/login"
    Then I should see page title as "Assessment Control @ Portnov"
    When I type "ask_instr@aol.com" into element with xpath "//*[@formcontrolname='email']"
    And  I type "ABC123" into element with xpath "//*[@formcontrolname='password']"
    When I click on element with xpath "//*[@type='submit'] "
    And I wait for 1 sec
    When I click on element with xpath "//h5[text()='Quizzes']"
    And I wait for 1 sec
    When I click on element with xpath "//*[text()='Create New Quiz']"
    And I wait for 1 sec

  @smoke @quiz1
  Scenario: Create Quiz
    When I type "TA Demo 04/30/26" into element with xpath "//*[@formcontrolname='name']"
#      add question
    And I click on element with xpath "//*[text()='add_circle']"
#      select question type
    When I click on element with xpath "//*[contains(text(),'Q1')]/../../..//*[contains(text(), 'Single')]"
#      question text
    And I type "Question 1" into element with xpath "//*[contains(text(),'Q1')]/../../..//*[@formcontrolname='question']"
    Then element with xpath "//*[contains(text(),'Q1')]" should contain text "Question 1"
#      options text
    When I type "Option 1" into element with xpath "//*[contains(text(),'Q1')]/../../..//*[@placeholder='Option 1*']"
    When I type "Option 2" into element with xpath "//*[contains(text(),'Q1')]/../../..//*[@placeholder='Option 2*']"
#      select correct option
    And I click on element with xpath "//*[contains(text(),'Q1')]/../../..//*[@placeholder='Option 2*']/../../../../..//mat-radio-button"
#      click Showstopper checkbox
    When I click on element with xpath "(//*[contains(text(),'Q1')]/../../..//*[@class='mat-checkbox-label'])[2]"
    Then element with xpath "//*[contains(text(),'Q1')]" should contain text "*"
#      open preview
    When I click on element with xpath "//span[normalize-space()='Preview']"
    Then element with xpath "//p[contains(@class, 'show-stopper')]" should be displayed
    And element with xpath "//p[contains(@class, 'show-stopper')]" should contain text "Show-Stopper Question"
    And I wait for 1 sec
    When I click on element with xpath "//span[normalize-space()='Close']"
#      save quiz
    When I click on element with xpath "//span[normalize-space()='Save']"
    And I wait for 1 sec
#      verify quiz title on the list of quizzes
    Then element with xpath "//mat-panel-title[normalize-space()='TA Demo 04/30/26']" should be displayed
#      delete quiz
    When I click on element with xpath "//mat-panel-title[normalize-space()='TA Demo 04/30/26']"
    And I click on element with xpath "//mat-panel-title[normalize-space()='TA Demo 04/30/26']/../../..//*[text()='Delete']"
    And I click on element with xpath "//ac-modal-confirmation/..//*[text()='Delete']"
    And I wait for 2 sec
