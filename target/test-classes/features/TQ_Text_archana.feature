@quiz_TQ_Text
  Feature: Textual Question Text

    Background:
      Given I open "login" page
      When I type "ask_instr@aol.com" into email field
      When I type "12345" into password field
      And I click "Sign In" button
      And I wait for 1 sec
      When I click "Quizzes" menu item
      And I wait for 1 sec
      And I click "Create New Quiz" button
      And I wait for 1 sec

    @quiz_TQ_Text1
    Scenario: 1000 Characters
      When I type "Easy Quiz" as quiz name
      And I add a question
      When I select "Textual" question in "Q1"
      And I wait for 1 sec
      When I type "987654567oijhgfdsrtyuio987654e3wsdghjkoiuytrewsd678iuytrewsdfghjiu76trer56789oiuytfdfghjkoiu7y6trer6789oiuytfdfghjuytrert6y7u8iuytrfdcvbjkiuytrefghjiuytreroi8u7y6t5redfgbhjklop9u8ytr54eszdcfgbhjkioi9uy7tr5esrxdfvbhjkoi9864dexfcvbhjiko9i854erxdfvbhnji9u8t5rdtcgfvbhnjiko9i754esrdcfghujiko0" into question field of "Q1"
      And I click "Save" button
      Then "Easy Quiz" is displayed on the list of quizzes
      And I wait for 1 sec
      And I delete "Easy Quiz"
      And I wait for 3 sec
