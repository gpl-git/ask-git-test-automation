Feature: Quiz Test


  @smoke
  Scenario: Demo Quiz
    Given I open url "http://ask-qa.portnov.com/#/login"
    When I type "ask_instr@aol.com" into element with xpath "//input[@formcontrolname='email']"
    And I type "ABC123" into element with xpath "//input[@formcontrolname='password']"
    When I click on element with xpath "//button[@type='submit']"
    And I wait for 1 sec
    When I click on element with xpath "//h5[text()='Quizzes']"
    And I wait for 2 sec
    And I click on element with xpath "//span[text()='Create New Quiz']"
    And I wait for 1 sec
    When I type "A0000" into element with xpath "//input[@formcontrolname='name']"
    And I click on element with xpath "//mat-icon[text()='add_circle']"
    When I click on element with xpath "//*[contains(text(),'Textual')]"
    And I type "Question 1" into element with xpath "//*[@formcontrolname='question']"
    And I wait for 1 sec
    And I click on element with xpath "//span[@class='mat-checkbox-label']"
    Then element with xpath "//mat-panel-title" should contain text "Q1*"
    And I click on element with xpath "//span[contains(text(),'Preview')]"
    And I wait for 1 sec
    Then element with xpath "//p[contains(@class,'show-stopper')]" should have text as "Show-Stopper Question"
    When I click on element with xpath "//span[text()='Close']"
    And I wait for 1 sec
    And I click on element with xpath "//span[contains(text(),'Save')]"
    And I wait for 1 sec
    Then I wait for element with xpath "//mat-panel-title[contains(text(),'A0000')]" to be present
    Then element with xpath "//mat-panel-title[contains(text(),'A0000')]" should be displayed
    When I click on element with xpath "//mat-panel-title[contains(text(),'A0000')]"
    And I click on element with xpath "//mat-panel-title[contains(text(), 'A0000')]/../../..//*[text()='Delete']"
    And I click on element with xpath "//ac-modal-confirmation/..//*[text()='Delete']"
