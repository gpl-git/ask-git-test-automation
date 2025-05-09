@quiz
Feature: Quiz Demo

  Background:
    Given I open url "http://ask-qa.portnov.com/#/login"
    Then I should see page title contains "Assessment Control"
    When I type "ask_instr@aol.com" into element with xpath "//input[@formcontrolname='email']"
    And I type "ABC123" into element with xpath "//input[@formcontrolname='password']"
    When I click on element with xpath "//button[@type='submit']"
    And I wait for 1 sec
    When I click on element with xpath "//*[contains(text(), 'Quizzes')]"
    And I wait for 2 sec
    When I click on element with xpath "//*[contains(text(),'Create New Quiz')]"
    And I wait for 2 sec

  @quiz
  Scenario: Create a Quiz Textual question - empty (The field is required)
    When I type "DEMO Quiz Evgeniya 1" into element with xpath "//input[@formcontrolname='name']"
    And I click on element with xpath "//mat-icon[text()='add_circle']"
    Then I click on element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[contains(text(),'Textual')]"
    And I wait for 1 sec
    When I click on element with xpath "//*[contains(text(),'Save')]"
    And I wait for 1 sec
    Then element with xpath "//*[contains(text(),'This field is required')]" should be present
    And I wait for 3 sec

  @quiz1
  Scenario: Create Quiz with textual question (Min 1 Characters)
    When I type "DEMO Quiz Evgeniya 1" into element with xpath "//input[@formcontrolname='name']"
    And I click on element with xpath "//mat-icon[text()='add_circle']"
    Then I click on element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[contains(text(),'Textual')]"
    And I wait for 1 sec
    Then I type "A" into element with xpath "//*[@formcontrolname='question']"
    And I click on element with xpath "//*[contains(text(),'Save')]"
    And I wait for 2 sec
    Then element with xpath "//mat-panel-title[contains(text(),'DEMO Quiz Evgeniya 1')]" should be displayed
    And I wait for 2 sec
    When I click on element with xpath "//mat-panel-title[contains(text(),'DEMO Quiz Evgeniya 1')]"
    And I click on element with xpath "//mat-panel-title[contains(text(),'DEMO Quiz Evgeniya 1')]/../../..//*[text()='Delete']"
    And I click on element with xpath "//ac-modal-confirmation/..//*[text()='Delete']"
    And I wait for 3 sec

  @quiz2
  Scenario: Quiz with Textual Question 1000 characters
    When I type "DEMO Quiz Evgeniya 2" into element with xpath "//input[@formcontrolname='name']"
    And I click on element with xpath "//mat-icon[text()='add_circle']"
    Then I click on element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[contains(text(),'Textual')]"
    And I wait for 1 sec
    Then I type "bbbbbbbbbbbbbbbbbbbbbbbnnnnnnnnnnnnnnnnnnvvccghxfcggfgfghghhjjhgggvhjkhhj34567654456775455665675547657566fghjhgjkjhklkj\][\[\]\]][\['';l'''''lkjjjjhhhhjhhhhhhhhhhhhhhhhhhvvvvvvvvvvvvvvvvvvvvvcvcccccccvvhhjjjkkikuuyrrreeeeewssdsdxxxcgghhhjhjjjjjjkkkjjjjjjjhjhbbhbhhhhhhbvgh7777777777777777777777777777777777777777777777777777777777777777777777878999999999998t5rrdddddddddddddddsssssssssssssssssasaassddddddddddddddddddddddddddddddddddddddddddddddddddxzxzzzzzzzzzzzzzzzzzzzzzzxxxdfgbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbnnnnnnnnnnnnnnnnnnnnnbbnbnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnbnnnnnnnnnfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff666666666666666666666666666666666666666666666666666666666666666666666666666666666eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee?" into element with xpath "//*[@formcontrolname='question']"
    And I click on element with xpath "//*[contains(text(),'Save')]"
    And I wait for 2 sec
    Then element with xpath "//mat-panel-title[contains(text(),'DEMO Quiz Evgeniya 2')]" should be displayed
    And I wait for 2 sec
    When I click on element with xpath "//mat-panel-title[contains(text(),'DEMO Quiz Evgeniya 2')]"
    And I click on element with xpath "//mat-panel-title[contains(text(),'DEMO Quiz Evgeniya 2')]/../../..//*[text()='Delete']"
    And I click on element with xpath "//ac-modal-confirmation/..//*[text()='Delete']"
    And I wait for 3 sec

  @quiz3
  Scenario: Quiz with Textual Question 1001 characters
    When I type "DEMO Quiz Evgeniya 2" into element with xpath "//input[@formcontrolname='name']"
    And I click on element with xpath "//mat-icon[text()='add_circle']"
    Then I click on element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[contains(text(),'Textual')]"
    And I wait for 1 sec
    Then I type "bbbbbbbbbbbbbbbbbbbbbbbnnnnnnnnnnnnnnnnnnvvccghxfcggfgfghghhjjhgggvhjkhhj34567654456775455665675547657566fghjhgjkjhklkj][[]]][[';l'''''lkjjjjhhhhjhhhhhhhhhhhhhhhhhhvvvvvvvvvvvvvvvvvvvvvcvcccccccvvhhjjjkkikuuyrrreeeeewssdsdxxxcgghhhjhjjjjjjkkkjjjjjjjhjhbbhbhhhhhhbvgh7777777777777777777777777777777777777777777777777777777777777777777777878999999999998t5rrdddddddddddddddsssssssssssssssssasaassddddddddddddddddddddddddddddddddddddddddddddddddddxzxzzzzzzzzzzzzzzzzzzzzzzxxxdfgbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbnnnnnnnnnnnnnnnnnnnnnbbnbnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnbnnnnnnnnnfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff666666666666666666666666666666666666666666666666666666666666666666666666666666666eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee!!" into element with xpath "//*[@formcontrolname='question']"
    #And I click on element with xpath "//*[contains(text(),'Save')]"
    Then I should see element {string} with xpath {string}
    And I wait for 5 sec
    #When I click on element with xpath "//mat-panel-title[contains(text(),'DEMO Quiz Evgeniya 2')]"
    #And I click on element with xpath "//mat-panel-title[contains(text(),'DEMO Quiz Evgeniya 2')]/../../..//*[text()='Delete']"
    #And I click on element with xpath "//ac-modal-confirmation/..//*[text()='Delete']"
    #And I wait for 3 sec
    #Then error message should be displayed
    #And I wait for 2 sec
  #bug https://jira.portnov.com/browse/APR25-215

  @quiz4
  Scenario: Textual question with Clear Space
    When I type "DEMO Quiz Evgeniya 1" into element with xpath "//input[@formcontrolname='name']"
    And I click on element with xpath "//mat-icon[text()='add_circle']"
    Then I click on element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[contains(text(),'Textual')]"
    And I wait for 1 sec
    Then I type "     " into element with xpath "//*[@formcontrolname='question']"
    When I click on element with xpath "//*[contains(text(),'Save')]"
    And I wait for 1 sec
    Then element with xpath "//*[contains(text(),'This field is required')]" should be present
    And I wait for 3 sec
    When I click on element with xpath "//mat-panel-title[contains(text(),'     ')]"
    And I click on element with xpath "//mat-panel-title[contains(text(),'     ')]/../../..//*[text()='Delete']"
    And I click on element with xpath "//ac-modal-confirmation/..//*[text()='Delete']"
    And I wait for 3 sec
    #Failed scenario

  @quiz5
  Scenario: Allowable characters: Alphanumeric & Special characters
    When I type "DEMO Quiz Evgeniya 3" into element with xpath "//input[@formcontrolname='name']"
    And I click on element with xpath "//mat-icon[text()='add_circle']"
    Then I click on element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[contains(text(),'Textual')]"
    And I wait for 1 sec
    Then I type "AAaaa11111@!#$%^&*" into element with xpath "//*[@formcontrolname='question']"
    And I click on element with xpath "//*[contains(text(),'Save')]"
    And I wait for 2 sec
    Then element with xpath "//mat-panel-title[contains(text(),'DEMO Quiz Evgeniya 3')]" should be displayed
    And I wait for 2 sec
    When I click on element with xpath "//mat-panel-title[contains(text(),'DEMO Quiz Evgeniya 3')]"
    And I click on element with xpath "//mat-panel-title[contains(text(),'DEMO Quiz Evgeniya 3')]/../../..//*[text()='Delete']"
    And I click on element with xpath "//ac-modal-confirmation/..//*[text()='Delete']"
    And I wait for 3 sec