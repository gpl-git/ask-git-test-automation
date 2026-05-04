@QuizTitle @regression
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

  @smoke  @TitleOfTheQuiz1
  Scenario:1. Allowable characters: Alphanumeric & Sp. characters
    When I type "Quiz#1" into element with xpath "//input[@formcontrolname = 'name']"
    Then element with xpath "//*[text()='add_circle']" should be enabled
    When I click on element with xpath "//*[text()='add_circle']"
    And I wait for 2 sec
    Then element with xpath "//*[contains(text(),'Q1')]" should be displayed

  @TitleOfTheQuiz2
  Scenario: 2.Verify The field is required(1)
    When I type "Q" into element with xpath "//input[@formcontrolname = 'name']"
    And I wait for 2 sec
    And I clear element with xpath "//input[@formcontrolname = 'name']"
    Then I click on element with xpath "//ac-quiz-builder-page"
    And I wait for 2 sec
    Then element with xpath "//mat-form-field//*[text() = 'This field is required']" should be displayed

  @smoke @TitleOfTheQuiz3
  Scenario: 2.Verify The field is required(2)
#      This Scenario also verifies: min 1 character is required.
    When I type "" into element with xpath "//input[@formcontrolname = 'name']"
    Then element with xpath "//form" should not contain text "add_circle"

  @TitleOfTheQuiz4
  Scenario: 3.Verify Quiz title needs Min 1 Characters
    When I type "QA" into element with xpath "//input[@formcontrolname = 'name']"
    And I clear element with xpath "//input[@formcontrolname = 'name']"
    Then element with xpath "//*[text()='add_circle']" should be disabled

  @TitleOfTheQuiz5
  Scenario:4.Verify Qiz title accepts Max 1000 characters
    Then element with xpath "//input[@formcontrolname = 'name']" should be present
#      enter 1001 characters
    When I type "vgtyftyftyrtr654565676765645@#$@#@!@##%##@@jhgjyfyhbhjguygjgygyghjvhjgde5435678789u9i97656r^R$#@#!$$^&^(**)(_)+_(()HHJBHJVFYTFTGVVJGYUGHGYTyugytt67545787898tyvjfutghjgygyutyugygyugyughvjhgtyujhbjhhiuuyu8934u38927rskjhfndjasnclkjhaoiu897r32yuiwehfjkdbfjdshiufsdhgjbdsnvmbshjvuisdhfbjdsbfjhdsbfuwegujhfbewfjhgeuiwuyr78iyrhjekbfnmdv bbmnsdbfiuewy7r83289479012ueiowqljdna,smfbnjkdhfjdhsjdgfhjsdgfhjsdghjdsguytuiquyruyetryuetrqiqoiiueyewhfvdsfbndsvbuyi3yr3brnmebfnsdghfu788738367844653847ihrjhsbfnsbdfjtfewgfhjwebjfhhgwrivgtyftyftyrtr654565676765645@#$@#@!@##%##@@jhgjyfyhbhjguygjgygyghjvhjgde5435678789u9i97656r^R$#@#!$$^&^(**)(_)+_(()HHJBHJVFYTFTGVVJGYUGHGYTyugytt67545787898tyvjfutghjgygyutyugygyugyughvjhgtyujhbjhhiuuyu8934u38927rskjhfndjasnclkjhaoiu897r32yuiwehfjkdbfjdshiufsdhgjbdsnvmbshjvuisdhfbjdsbfjhdsbfuwegujhfbewfjhgeuiwuyr78iyrhjekbfnmdv bbmnsdbfiuewy7r83289479012ueiowqljdna,smfbnjkdhfjdhsjdgfhjsdgfhjsdghjdsguytuiquyruyetryuetrqiqoiiueyewhfvdsfbndsvbuyi3yr3brnmebfnsdghfu788738367844653847io" into element with xpath "//input[@formcontrolname = 'name']"
    Then element with xpath "//*[text()='add_circle']" should be disabled

  @TitleOfTheQuiz6
  Scenario: 5. Leading and trailing space characters to be eliminated when Quiz is saved in the List of Quizzes
    When I type "   QA#1 " into element with xpath "//input[@formcontrolname = 'name']"
    And I click on element with xpath "//*[text()='add_circle']"
    Then element with xpath "//mat-panel-title[contains(text() ,'Q1')]" should be present
    When I click on element with xpath "//*[contains(text(),'Q1')]/../../..//*[contains(text(), 'Textual')]"
    And I wait for 2 sec
    Then  I type "Question1" into element with xpath "//textarea[@formcontrolname='question']"
    And I click on element with xpath "//span[normalize-space()='Save']"
    And I wait for 2 sec
#      verify quiz title on the list of quizzes
    Then element with xpath "//mat-panel-title[normalize-space()='QA#1']" should be displayed


  @TitleOfTheQuiz7
  Scenario: Quiz Title White Space Only
    When I type " " into element with xpath "//input[@formcontrolname = 'name']"
    And I click on element with xpath "//*[text()='add_circle']"
    Then element with xpath "//mat-panel-title[contains(text() ,'Q1')]" should be present
    When I click on element with xpath "//*[contains(text(),'Q1')]/../../..//*[contains(text(), 'Textual')]"
    And I wait for 2 sec
    Then  I type "Question1" into element with xpath "//textarea[@formcontrolname='question']"
    And I click on element with xpath "//span[normalize-space()='Save']"
    And I wait for 2 sec
#      verify quiz title on the list of quizzes
    When I click on element with xpath "(//mat-panel-title)[1]"
   #    delete quiz
    And I click on element with xpath "(//mat-panel-title)[1]/../../..//*[text()='Delete']"
    And I click on element with xpath "//ac-modal-confirmation/..//*[text()='Delete']"
    And I wait for 2 sec
