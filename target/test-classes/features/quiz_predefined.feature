@quiz
  Feature: Create a Quiz

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
    @quiz1
    Scenario: Sample Quiz
      When I type "Sample Quiz" as quiz name
      And I add a question
      When I select "Textual" question in "Q1"
      When I type "Question 1" into question field of "Q1"
      And I add a question
      And I wait for 1 sec
     When I select "Single" question in "Q2"
      And I wait for 1 sec
      When I type "Question 2" into question field of "Q2"
      And I type "Option 1" into "Option 1" option field of "Q2"
      And I type "Option 2" into "Option 2" option field of "Q2"
      When I select "Option 1" as a correct option in "Q2"
      And I click "Save" button
      And I wait for 1 sec
      Then "Sample Quiz" is displayed on the list of quizzes
      And I delete "Sample Quiz"
      And I wait for 2 sec