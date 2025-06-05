@quiz @regression
Feature: Quiz Demo
  Background:
    Given I open url "http://ask-qa.portnov.com/#/login"
    Then I should see page title as "Assessment Control @ Portnov"
    When I type "ask_instr@aol.com" into element with xpath "//input[@formcontrolname='email']"
    And I type "ABC123" into element with xpath "//input[@formcontrolname='password']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for 1 sec
    When I click on element with xpath "//h5[normalize-space()='Quizzes']"
    And I wait for 1 sec
    When I click on element with xpath "//*[text()='Create New Quiz']"
    And I wait for 2 sec
#    create Quiz
    When I type "Auto Quiz 06/04/25" into element with xpath "//input[@formcontrolname='name']"
    And I click on element with xpath "//mat-icon[text()='add_circle']"

  @quiz_with_textQ
  Scenario Outline: Add textual Question - Positive
    When I click on element with xpath "//mat-panel-title[contains(text(), 'Q1')]/../../..//*[contains(text(), 'Textual')]"
    When I type <text> into element with xpath "//mat-panel-title[contains(text(), 'Q1')]/../../..//*[@formcontrolname='question']"
    And I wait for 1 sec
    When I click on element with xpath "//button[contains(.,'Save')]"
    And I wait for 1 sec
    Then element with xpath "//mat-panel-title[contains(text(),'Auto Quiz 06/04/25')]" should be displayed
#      delete Auto Quiz 06/04/25
    When I click on element with xpath "//mat-panel-title[contains(text(),'Auto Quiz 06/04/25')]"
    And I wait for 2 sec
    And I click on element with xpath "//mat-panel-title[contains(text(),'Auto Quiz 06/04/25')]/../../..//*[text()='Delete']"
    And I click on element with xpath "//ac-modal-confirmation/..//*[text()='Delete']"
    And I wait for 2 sec
    Examples:
      | text |
#      Min 1 Characters
      | "1"  |
#     Alphanumeric & Sp. characters
      |   "Are @ ! - + / \ # % & @ special characters?"   |
      |   "Question_1"   |
#     Max 1000 characters
      |   "dfasdfdfasfasjkdfasdjfnjkashdfjkasjkdfhajskhdfjkahsdfjhajksdfhaskdjfhaksjdfhkjashdfaskdfhjajasdfhjdfhdfasdfdfasfasjkdfasdjfnjkashdfjkasjkdfhajskhdfjkahsdfjhajksdfhaskdjfhaksjdfhkjashdfaskdfhjajasdfhjdfhdfasdfdfasfasjkdfasdjfnjkashdfjkasjkdfhajskhdfjkahsdfjhajksdfhaskdjfhaksjdfhkjashdfaskdfhjajasdfhjdfhdfasdfdfasfasjkdfasdjfnjkashdfjkasjkdfhajskhdfjkahsdfjhajksdfhaskdjfhaksjdfhkjashdfaskdfhjajasdfhjdfhdfasdfdfasfasjkdfasdjfnjkashdfjkasjkdfhajskhdfjkahsdfjhajksdfhaskdjfhaksjdfhkjashdfaskdfhjajasdfhjdfhdfasdfdfasfasjkdfasdjfnjkashdfjkasjkdfhajskhdfjkahsdfjhajksdfhaskdjfhaksjdfhkjashdfaskdfhjajasdfhjdfhdfasdfdfasfasjkdfasdjfnjkashdfjkasjkdfhajskhdfjkahsdfjhajksdfhaskdjfhaksjdfhkjashdfaskdfhjajasdfhjdfhdfasdfdfasfasjkdfasdjfnjkashdfjkasjkdfhajskhdfjkahsdfjhajksdfhaskdjfhaksjdfhkjashdfaskdfhjajasdfhjdfhdfasdfdfasfasjkdfasdjfnjkashdfjkasjkdfhajskhdfjkahsdfjhajksdfhaskdjfhaksjdfhkjashdfaskdfhjajasdfhjdfhdfasdfdfasfasjkdfasdjfnjkashdfjkasjkdfhajskhdfjkahsdfjhajksdfhaskdjfhaksjdfhkjashdfaskdfhja"   |

  @quiz_with_textQ
  Scenario Outline: Add textual Question - Negative
    When I click on element with xpath "//mat-panel-title[contains(text(), 'Q1')]/../../..//*[contains(text(), 'Textual')]"
    When I type <text> into element with xpath "//mat-panel-title[contains(text(), 'Q1')]/../../..//*[@formcontrolname='question']"
    And I wait for 1 sec
    When I click on element with xpath "//button[contains(.,'Save')]"
    And I wait for 1 sec
    Then element with xpath <label> should be displayed
    Examples:
      | text | label |
#      required field
      | ""  | "//mat-panel-title[contains(text(), 'Q1')]/../../..//mat-error[contains(text(), 'This field is required')]" |
#      white spaces  this is  bug MAY25-
      | "      "  | "//mat-panel-title[contains(text(), 'Q1')]/../../..//mat-error[contains(text(), 'This field is required')]" |
#    More than 1000 characters (1001) - Test fails. Bug report is filed ASK-MAY25MAY25-282
      |"ldjflasdfalfkjasdflkasdjfksdfasldf;asldfkjsdlkfjsakdfjkasjdfkjsdafkjsdkfjsdkjfuasdhfsadjfhsadjfggasjldjflasdfalfkjasdflkasdjfksdfasldf;asldfkjsdlkfjsakdfjkasjdfkjsdafkjsdkfjsdkjfuasdhfsadjfhsadjfggasjldjflasdfalfkjasdflkasdjfksdfasldf;asldfkjsdlkfjsakdfjkasjdfkjsdafkjsdkfjsdkjfuasdhfsadjfhsadjfggasjldjflasdfalfkjasdflkasdjfksdfasldf;asldfkjsdlkfjsakdfjkasjdfkjsdafkjsdkfjsdkjfuasdhfsadjfhsadjfggasjldjflasdfalfkjasdflkasdjfksdfasldf;asldfkjsdlkfjsakdfjkasjdfkjsdafkjsdkfjsdkjfuasdhfsadjfhsadjfggasjldjflasdfalfkjasdflkasdjfksdfasldf;asldfkjsdlkfjsakdfjkasjdfkjsdafkjsdkfjsdkjfuasdhfsadjfhsadjfggasjldjflasdfalfkjasdflkasdjfksdfasldf;asldfkjsdlkfjsakdfjkasjdfkjsdafkjsdkfjsdkjfuasdhfsadjfhsadjfggasjldjflasdfalfkjasdflkasdjfksdfasldf;asldfkjsdlkfjsakdfjkasjdfkjsdafkjsdkfjsdkjfuasdhfsadjfhsadjfggasjldjflasdfalfkjasdflkasdjfksdfasldf;asldfkjsdlkfjsakdfjkasjdfkjsdafkjsdkfjsdkjfuasdhfsadjfhsadjfggasjldjflasdfalfkjasdflkasdjfksdfasldf;asldfkjsdlkfjsakdfjkasjdfkjsdafkjsdkfjsdkjfuasdhfsadjfhsadjfggasj1"| "//mat-panel-title[contains(text(), 'Q1')]/../../..//mat-error[contains(text(), 'Maximum length exceeded. Please enter no more than 1000 characters.')]" |