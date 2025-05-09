@quiz
Feature: E2E SingleChoice Showstopper

  Background:
    Given I open url "http://ask-qa.portnov.com/#/login"
    Then I should see page title contains "Assessment Control"
    When I type "Martyart1989@jourrapide.com" into element with xpath "//input[@formcontrolname='email']"
    And I type "qwe123" into element with xpath "//input[@formcontrolname='password']"
    When I click on element with xpath "//button[@type='submit']"
    And I wait for 1 sec
    When I click on element with xpath "//*[contains(text(), 'Quizzes')]"
    And I wait for 2 sec
    When I click on element with xpath "//*[contains(text(),'Create New Quiz')]"
    And I wait for 2 sec

  @quiz @singlechoice_showstopper
  Scenario: Create a Quiz - Happy Path
    When I type "SingleChoice Showstopper Kostia 05/08/25" into element with xpath "//input[@formcontrolname='name']"
#    First question
    And I click on element with xpath "//mat-icon[text()='add_circle']"
#    Select question type
    When I click on element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[contains(text(),'Single')]"
    And I wait for 1 sec
    When I type "Which of the following is not part of performance testing?" into element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[@formcontrolname='question']"
    When I type "Recovery testing" into element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[@placeholder='Option 1*']"
    When I type "Measuring response time" into element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[@placeholder='Option 2*']"
#    select a correct option
    And I click on element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[@placeholder='Option 1*']/../../../../..//mat-radio-button"
#    Mark showstopper
    And I click on element with xpath "//label[@for='mat-checkbox-2-input']//div[@class='mat-checkbox-inner-container']"
    Then element with xpath "//mat-panel-title[contains(text(), 'Q1')]" should contain text "*"
    # Click Preview
    And I click on element with xpath "//button[@class='mat-raised-button mat-primary ng-star-inserted']"
    # Check showstopper
    And I wait for 1 sec
    Then element with xpath "//p[@class='show-stopper ng-star-inserted']" should contain text "Show-Stopper Question"
    # Click Close
    And I click on element with xpath "//*[text()='Close']"