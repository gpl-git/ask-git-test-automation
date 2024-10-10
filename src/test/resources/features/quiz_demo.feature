@quiz_demo
  
  Feature: Quiz Demo
    Background:
      Given I open url "http://ask-qa.portnov.com/#/login"
      Then I should see page title contains "Portnov"
      When I type "ask_instr@aol.com" into element with xpath "//input[@formcontrolname='email']"
      And I type "ABC123" into element with xpath "//input[@formcontrolname='password']"
      When I click on element with xpath "//button[@type='submit']"
      And I wait for 1 sec
      When I click on element with xpath " //h5[contains(text(),'Quizzes')]"
      And I wait for 1 sec
      When I click on element with xpath "//span[text()='Create New Quiz']"
      And I wait for 1 sec

    @quiz_demo1
    Scenario: Quiz with Textual Question-Showstopper
      When I type "Demo-TQ-SS" into element with xpath "//input[@formcontrolname='name']"
      And I click on element with xpath "//mat-icon[text()='add_circle']"
      When I click on element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[contains(text(),'Textual')]"
      And I type "Question 1" into element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[@formcontrolname='question']"
      When I click on element with xpath " //mat-panel-title[contains(text(),'Q1')]/../../..//*[@class='mat-checkbox-label']"
      Then element with xpath "//mat-panel-title[contains(text(),'Q1')]" should contain text "*"
      When I click on element with xpath "//span[contains(text(),'Save')]"
      And I wait for 2 sec
      Then element with xpath "//mat-panel-title[contains(text(),'Demo-TQ-SS')]" should be displayed
      When I click on element with xpath "//mat-panel-title[contains(text(),'Demo-TQ-SS')]"
      And I click on element with xpath "//mat-panel-title[contains(text(),'Demo Quiz SEP24')]/../../..//*[text()='Delete']"
      And I click on element with xpath "//ac-modal-confirmation/..//*[text()='Delete']"

      

      
