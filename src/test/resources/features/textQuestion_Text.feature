@textualtext
Feature: Textual Question - Text
  Background:
    Given I open url "http://ask-qa.portnov.com/#/login"
    Then I should see page title contains "Portnov"
    When I type "inspiron1300@hotrokh.com" into element with xpath "//input[@formcontrolname='email']"
    And I type "123456" into element with xpath "//input[@formcontrolname='password']"
    And I wait for 2 sec
    When I click on element with xpath "//button[@type='submit']"
    And I wait for 2 sec
    When I click on element with xpath "//h5[contains(text(),'Quizzes')]"
    And I wait for 2 sec
    When I click on element with xpath "//span[contains(text(),'Create New Quiz')]"
    And I wait for 1 sec

  @textualtext1
  Scenario: Create Quiz with Textual Question-Text: minimum number of character
    When I type "Madhu Demo TQ-Text1" into element with xpath "//input[@formcontrolname='name']"
    And I click on element with xpath "//mat-icon[contains(text(),'add_circle')]"
    When I click on element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[contains(text(),'Textual')]"
    And I type "Q" into element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[@formcontrolname='question']"
    And I wait for 1 sec
    When I click on element with xpath "//span[contains(text(),'Save')]"
    And I wait for 2 sec
    Then element with xpath "//mat-panel-title[contains(text(),'Madhu Demo TQ-Text1')]" should be displayed
    And I wait for 1 sec
    When I click on element with xpath "//mat-panel-title[contains(text(),'Madhu Demo TQ-Text1')]"
    And I click on element with xpath "//mat-panel-title[contains(text(),'Madhu Demo TQ-Text1')]/../../..//*[text()='Delete']"
    And I click on element with xpath "//ac-modal-confirmation/..//*[text()='Delete']"

  @textualtext2
  Scenario: Create Quiz with Textual Question-Text: Maximum length 1000
    When I type "Madhu Demo TQ-Text2" into element with xpath "//input[@formcontrolname='name']"
    And I click on element with xpath "//mat-icon[contains(text(),'add_circle')]"
    When I click on element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[contains(text(),'Textual')]"
    And I type "AnitajhgkjhgugyufghfghfjgfkugfjysfgsdfhfghrgfthertyrwtyrtyertgrgtrdgtrytrytryhtrhyrwtyrwtyewryrtyrytryhjfvdskjhfvdskjfhgakfgjfhgdsfhgkafshdfgdshfgdfkjshgdsjlfsguetyerytryteiurtbfgdfgvhjvgbcxbvhgfdhgdhgvhdghdgsyfgdsuyfgusygsdgcdshgccsdhgshdgfuydsfyusfuestfyusefgysdghdsghsdvcfhgzvghvdgfjdgfyufguydfgydsufgsdgfehvfrgcffjgefyudfgdsyfghsevfbgkadhgfkdgfyertyetrnabvfjuhfgdshfvdskhfgeugtfyuertfggeyfdhufgdhgfdgfdhgfdhfguakyfgtyuergtfuygfrdhjfbhgfvgfvdhfgdgAnitajhgkjhgugyufghfghfjgfkugfjysfgsdfhfghrgfthertyrwtyrtyertgrgtrdgtrytrytryhtrhyrwtyrwtyewryrtyrytryhjfvdskjhfvdskjfhgakfgjfhgdsfhgkafshdfgdshfgdfkjshgdsjlfsguetyerytryteiurtbfgdfgvhjvgbcxbvhgfdhgdhgvhdghdgsyfgdsuyfgusygsdgcdshgccsdhgshdgfuydsfyusfuestfyusefgysdghdsghsdvcfhgzvghvdgfjdgfyufguydfgydsufgsdgfehvfrgcffjgefyudfgdsyfghsevfbgkadhgfkdgfyertyetrnabvfjuhfgdshfvdskhfgeugtfyuertfggeyfdhufgdhgfdgfdhgfdhfguakyfgtyuergtfuygfrdhjfbhgfvgfvdhfgdggkadhgfkdgfyertyetrnabvfjuhfgdshfvdskhfgeugtfyuertfggeyfdhufgdhgfdgfdhgfdhfguakyfgtyugkadhgfkdgfyevn" into element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[@formcontrolname='question']"
    And I wait for 1 sec
    When I click on element with xpath "//span[contains(text(),'Save')]"
    And I wait for 2 sec
    Then element with xpath "//mat-panel-title[contains(text(),'Madhu Demo TQ-Text2')]" should be displayed
    And I wait for 1 sec
    When I click on element with xpath "//mat-panel-title[contains(text(),'Madhu Demo TQ-Text2')]"
    And I click on element with xpath "//mat-panel-title[contains(text(),'Madhu Demo TQ-Text2')]/../../..//*[text()='Delete']"
    And I click on element with xpath "//ac-modal-confirmation/..//*[text()='Delete']"

  @textualtext3
  Scenario: Create Quiz with Textual Question-Text: Maximum length 1000+1
    When I type "Madhu Demo TQ-Text3" into element with xpath "//input[@formcontrolname='name']"
    And I click on element with xpath "//mat-icon[contains(text(),'add_circle')]"
    When I click on element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[contains(text(),'Textual')]"
    And I type "AnitajhgkjhgugyufghfghfjgfkugfjysfgsdfhfghrgftheartyrwtyrtyertgrgtrdgtrytrytryhtrhyrwtyrwtyewryrtyrytryhjfvdskjhfvdskjfhgakfgjfhgdsfhgkafshdfgdshfgdfkjshgdsjlfsguetyerytryteiurtbfgdfgvhjvgbcxbvhgfdhgdhgvhdghdgsyfgdsuyfgusygsdgcdshgccsdhgshdgfuydsfyusfuestfyusefgysdghdsghsdvcfhgzvghvdgfjdgfyufguydfgydsufgsdgfehvfrgcffjgefyudfgdsyfghsevfbgkadhgfkdgfyertyetrnabvfjuhfgdshfvdskhfgeugtfyuertfggeyfdhufgdhgfdgfdhgfdhfguakyfgtyuergtfuygfrdhjfbhgfvgfvdhfgdgAnitajhgkjhgugyufghfghfjgfkugfjysfgsdfhfghrgfthertyrwtyrtyertgrgtrdgtrytrytryhtrhyrwtyrwtyewryrtyrytryhjfvdskjhfvdskjfhgakfgjfhgdsfhgkafshdfgdshfgdfkjshgdsjlfsguetyerytryteiurtbfgdfgvhjvgbcxbvhgfdhgdhgvhdghdgsyfgdsuyfgusygsdgcdshgccsdhgshdgfuydsfyusfuestfyusefgysdghdsghsdvcfhgzvghvdgfjdgfyufguydfgydsufgsdgfehvfrgcffjgefyudfgdsyfghsevfbgkadhgfkdgfyertyetrnabvfjuhfgdshfvdskhfgeugtfyuertfggeyfdhufgdhgfdgfdhgfdhfguakyfgtyuergtfuygfrdhjfbhgfvgfvdhfgdggkadhgfkdgfyertyetrnabvfjuhfgdshfvdskhfgeugtfyuertfggeyfdhufgdhgfdgfdhgfdhfguakyfgtyugkadhgfkdgfyevn" into element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[@formcontrolname='question']"
    And I wait for 1 sec
    When I click on element with xpath "//span[contains(text(),'Save')]"
    And I wait for 2 sec
    Then element with xpath "//mat-panel-title[contains(text(),'Madhu Demo TQ-Text2')]" should be displayed
    And I wait for 1 sec
    When I click on element with xpath "//mat-panel-title[contains(text(),'Madhu Demo TQ-Text3')]"
    And I click on element with xpath "//mat-panel-title[contains(text(),'Madhu Demo TQ-Text3')]/../../..//*[text()='Delete']"
    And I click on element with xpath "//ac-modal-confirmation/..//*[text()='Delete']"

  @textualtext4
  Scenario: Create Quiz with Textual Question-Text: Empty Textual field
    When I type "Madhu Demo TQ-Text4" into element with xpath "//input[@formcontrolname='name']"
    And I click on element with xpath "//mat-icon[contains(text(),'add_circle')]"
    When I click on element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[contains(text(),'Textual')]"
    And I type " " into element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[@formcontrolname='question']"
    And I wait for 1 sec
    When I click on element with xpath "//span[contains(text(),'Save')]"
    And I wait for 2 sec
    Then element with xpath "//mat-panel-title[contains(text(),'Madhu Demo TQ-Text4')]" should be displayed
    And I wait for 1 sec
    When I click on element with xpath "//mat-panel-title[contains(text(),'Madhu Demo TQ-Text4')]"
    And I click on element with xpath "//mat-panel-title[contains(text(),'Madhu Demo TQ-Text4')]/../../..//*[text()='Delete']"
    And I click on element with xpath "//ac-modal-confirmation/..//*[text()='Delete']"

  @textualtext5
  Scenario: Create Quiz with Textual Question-Text: Required field
    When I type "Madhu Demo TQ-Text5" into element with xpath "//input[@formcontrolname='name']"
    And I click on element with xpath "//mat-icon[contains(text(),'add_circle')]"
    When I click on element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[contains(text(),'Textual')]"
    And I type "" into element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[@formcontrolname='question']"
    And I wait for 1 sec
    When I click on element with xpath "//span[contains(text(),'Save')]"
    And I wait for 2 sec
    Then I wait for element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[contains(text(),'This field is required')]" to be present

  @textualtext1
  Scenario Outline: Create Quiz with Textual Question-Text: positive Scenario
    When I type <title> into element with xpath "//input[@formcontrolname='name']"
    And I click on element with xpath "//mat-icon[contains(text(),'add_circle')]"
    When I click on element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[contains(text(),'Textual')]"
    And I type <questiontext> into element with xpath "//mat-panel-title[contains(text(),'Q1')]/../../..//*[@formcontrolname='question']"
    When I click on element with xpath "//span[contains(text(),'Save')]"
    Then element with xpath "//mat-panel-title[contains(text(),'Madhu Demo TQ-Text1')]" should be displayed
    When I click on element with xpath "//mat-panel-title[contains(text(),'Madhu Demo TQ-Text1')]"
    And I click on element with xpath "//mat-panel-title[contains(text(),'Madhu Demo TQ-Text2')]/../../..//*[text()='Delete']"
    And I click on element with xpath "//ac-modal-confirmation/..//*[text()='Delete']"
    Examples:
      | title                 | questiontext |
      | "Madhu Demo TQ-Text1" | "Q"          |
      | "Madhu Demo TQ-Text2" | "AnitajhgkjhgugyufghfghfjgfkugfjysfgsdfhfghrgfthertyrwtyrtyertgrgtrdgtrytrytryhtrhyrwtyrwtyewryrtyrytryhjfvdskjhfvdskjfhgakfgjfhgdsfhgkafshdfgdshfgdfkjshgdsjlfsguetyerytryteiurtbfgdfgvhjvgbcxbvhgfdhgdhgvhdghdgsyfgdsuyfgusygsdgcdshgccsdhgshdgfuydsfyusfuestfyusefgysdghdsghsdvcfhgzvghvdgfjdgfyufguydfgydsufgsdgfehvfrgcffjgefyudfgdsyfghsevfbgkadhgfkdgfyertyetrnabvfjuhfgdshfvdskhfgeugtfyuertfggeyfdhufgdhgfdgfdhgfdhfguakyfgtyuergtfuygfrdhjfbhgfvgfvdhfgdgAnitajhgkjhgugyufghfghfjgfkugfjysfgsdfhfghrgfthertyrwtyrtyertgrgtrdgtrytrytryhtrhyrwtyrwtyewryrtyrytryhjfvdskjhfvdskjfhgakfgjfhgdsfhgkafshdfgdshfgdfkjshgdsjlfsguetyerytryteiurtbfgdfgvhjvgbcxbvhgfdhgdhgvhdghdgsyfgdsuyfgusygsdgcdshgccsdhgshdgfuydsfyusfuestfyusefgysdghdsghsdvcfhgzvghvdgfjdgfyufguydfgydsufgsdgfehvfrgcffjgefyudfgdsyfghsevfbgkadhgfkdgfyertyetrnabvfjuhfgdshfvdskhfgeugtfyuertfggeyfdhufgdhgfdgfdhgfdhfguakyfgtyuergtfuygfrdhjfbhgfvgfvdhfgdggkadhgfkdgfyertyetrnabvfjuhfgdshfvdskhfgeugtfyuertfggeyfdhufgdhgfdgfdhgfdhfguakyfgtyugkadhgfkdgfyevn"          |
      | "Madhu Demo TQ-Text3" | "AnitajhgkjhgugyufghfghfjgfkugfjysfgsdfhfghrgftheartyrwtyrtyertgrgtrdgtrytrytryhtrhyrwtyrwtyewryrtyrytryhjfvdskjhfvdskjfhgakfgjfhgdsfhgkafshdfgdshfgdfkjshgdsjlfsguetyerytryteiurtbfgdfgvhjvgbcxbvhgfdhgdhgvhdghdgsyfgdsuyfgusygsdgcdshgccsdhgshdgfuydsfyusfuestfyusefgysdghdsghsdvcfhgzvghvdgfjdgfyufguydfgydsufgsdgfehvfrgcffjgefyudfgdsyfghsevfbgkadhgfkdgfyertyetrnabvfjuhfgdshfvdskhfgeugtfyuertfggeyfdhufgdhgfdgfdhgfdhfguakyfgtyuergtfuygfrdhjfbhgfvgfvdhfgdgAnitajhgkjhgugyufghfghfjgfkugfjysfgsdfhfghrgfthertyrwtyrtyertgrgtrdgtrytrytryhtrhyrwtyrwtyewryrtyrytryhjfvdskjhfvdskjfhgakfgjfhgdsfhgkafshdfgdshfgdfkjshgdsjlfsguetyerytryteiurtbfgdfgvhjvgbcxbvhgfdhgdhgvhdghdgsyfgdsuyfgusygsdgcdshgccsdhgshdgfuydsfyusfuestfyusefgysdghdsghsdvcfhgzvghvdgfjdgfyufguydfgydsufgsdgfehvfrgcffjgefyudfgdsyfghsevfbgkadhgfkdgfyertyetrnabvfjuhfgdshfvdskhfgeugtfyuertfggeyfdhufgdhgfdgfdhgfdhfguakyfgtyuergtfuygfrdhjfbhgfvgfvdhfgdggkadhgfkdgfyertyetrnabvfjuhfgdshfvdskhfgeugtfyuertfggeyfdhufgdhgfdgfdhgfdhfguakyfgtyugkadhgfkdgfyevn"          |
      | "Madhu Demo TQ-Text4" | " "          |



