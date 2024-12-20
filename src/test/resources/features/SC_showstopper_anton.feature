@Anton
Feature: Quiz creation

  Background:
    Given I open url "http://ask-qa.portnov.com/#/login"
    When I type "dmukmoe@ship79.com" into element with xpath "//input[@placeholder='Email *']"
    And I type "12345A" into element with xpath "//input[@placeholder='Password *']"
    And I click on element with xpath "//span[normalize-space()='Sign In']"
    And I wait for 1 sec
    When I click on element with xpath "//h5[normalize-space()='Quizzes']"
    And I wait for 1 sec
    And I click on element with xpath "//span[normalize-space()='Create New Quiz']"
    And I wait for 1 sec

  @create_sc_question_showstopper
  Scenario: Quiz with a SC Question Showstopper
      #Typing name of the Quiz
    When I type "SC Question with SS" into element with xpath "//input[@formcontrolname='name']"
      #Click on add question
    And I click on element with xpath "//div[@class='controls ng-star-inserted']//button[@type='button']"
      #Click on SC radio button
    When I click on element with xpath "//label[@for='mat-radio-3-input']"
      #Typing the Title of the question
    And I type "Question 1" into element with xpath "//textarea[@placeholder='Question *']"
      #Typing Questions itself
    When I type "This is an option ONE" into element with xpath "//textarea[@placeholder='Option 1*']"
    When I type "This is an option TWO" into element with xpath "//textarea[@placeholder='Option 2*']"
      #Choosing the correct answer
    And I click on element with xpath "//label[@for='mat-radio-6-input']"
      #Mark the question as a showstopper
    When I click on element with xpath "//ac-question-body-form/div/div/div[@formarrayname='options']/div/mat-checkbox/label[@for='mat-checkbox-2-input']/div[1]"
      #Check for the presence of an asterisk
    Then element with xpath "//mat-expansion-panel-header[@role='button']//span//mat-panel-title" should contain text "*"

      #Check that only one question can be showstopper

      #Click on Add question
    When I click on element with xpath "//body/ac-root/mat-sidenav-container/mat-sidenav-content/main/ac-quiz-builder-page/form/div/button[1]"
    And I wait for 1 sec
      #Click on SC radio button
    And I click on element with xpath "//ac-question-body-form/div/div/div/mat-radio-group[@role='radiogroup']/mat-radio-button/label[@for='mat-radio-11-input']/div[1]"
    And I wait for 1 sec
      #Mark the question as a showstopper
    And I click on element with xpath "//ac-question-body-form/div/div/div[@formarrayname='options']/div/mat-checkbox/label[@for='mat-checkbox-4-input']/div[1]"
    And I wait for 3 sec
      #Check if Question2 has asterisk
    Then element with xpath "(//mat-panel-title)[2]" should contain text "*"
      #Check if Question1 has NO asterisk
    And element with xpath "//mat-expansion-panel-header[@role='button']//span//mat-panel-title" should not contain text "*"
      #Click on Delete question
    When I click on element with xpath "/html[1]/body[1]/ac-root[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/main[1]/ac-quiz-builder-page[1]/form[1]/main[1]/mat-accordion[1]/mat-expansion-panel[2]/div[1]/div[1]/div[2]/button[1]/span[1]"
    And I wait for 1 sec
      #Click Delete on confirmation window
    And I click on element with xpath "//button[@color='warn']//span"
    And I wait for 3 sec
      #Select Question 1
    When I click on element with xpath "//mat-expansion-panel-header[@role='button']//span//mat-panel-title"
    And I wait for 3 sec
      #Mark the question as a showstopper again
    And I click on element with xpath "//ac-question-body-form/div/div/div[@formarrayname='options']/div/mat-checkbox/label[@for='mat-checkbox-2-input']/div[1]"
    And I wait for 3 sec
      #Click Save the quiz
    And I click on element with xpath "//div//div//button[2]//span[1]"
    And I wait for 3 sec
      #Select created quiz by name
    When I click on element with xpath "//mat-panel-title[contains(text(),'SC Question with SS')]"
    And I wait for 3 sec
      #Click on Preview using anchoring for the name of the quiz
    And I click on element with xpath "//mat-panel-title[contains(text(),'SC Question with SS')]/../../..//*[contains(text(),'Preview')]"
    And I wait for 3 sec
      #Check for the presence of "Show-Stopper Question"
    Then element with xpath "//p[contains(text(),'Show-Stopper Question')]" should be displayed
    And I wait for 3 sec
      #Back to quizzes list
    When I click on element with xpath "//button[@aria-label='Close dialog']//span"
    And I wait for 3 sec
      # Deleting a quiz
    When I click on element with xpath "//mat-panel-title[contains(text(),'SC Question with SS')]/../../..//*[contains(text(),'Delete')]"
    And I wait for 3 sec
    And I click on element with xpath "//button[@aria-label='Close dialog']//span[contains(text(),'Delete')]"
