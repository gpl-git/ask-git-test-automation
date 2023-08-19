@options
Feature: Single Choice Question - options

  Background: : : Create a quiz
    Given I open "login" page
    When I type "coleverde@jucky.net" into email field
    When I type "Intel2" into password field
    And I click "Sign In" button
    And I wait for 1 sec
    When I click "Quizzes" menu item
    And I wait for 1 sec
    And I click "Create New Quiz" button
    And I wait for 1 sec
    And I type "Title#" as quiz name
    And I add a question
    And I wait for 3 sec
    When I select "Single" question
    And I wait for 2 sec

  @options1
  Scenario: Single Choice Question - Options (Choosing Option)
    When I type "Question 1" into question field of "Q1"
    And I type "Option 1" into "Option 1" option field of "Q1"
    And I type "Option 2" into "Option 2" option field of "Q1"
    And I select "Option 1" as a correct option in "Q1"
    And I click "Save" button
    And I wait for 1 sec
    Then "Title#" is displayed on the list of quizzes
    And I click on the quiz "Title#"
    And I wait for 6 sec
    And I click delete "Title#" quiz

    @options2
    Scenario: Single Choice Question - Delete option 2 when having 2 options in total
      When I type "Question 1" into question field of "Q1"
      And I type "Option 1" into "Option 1" option field of "Q1"
      And I type "Option 2" into "Option 2" option field of "Q1"
      And I select "Option 1" as a correct option in "Q1"
      When I click on "Option 2" gear button
      Then button is disabled
      And I wait for 5 sec
      And I exit gear menu
      And I click "Save" button
      And I wait for 1 sec
      Then "Title#" is displayed on the list of quizzes
      And I click on the quiz "Title#"
      And I wait for 5 sec
      And I click delete "Title#" quiz

    @options3
    Scenario: Single Choice Question - Delete option 2 with 3 options in total
      When I type "Question 1" into question field of "Q1"
      And I type "Option 1" into "Option 1" option field of "Q1"
      And I type "Option 2" into "Option 2" option field of "Q1"
      And I add option
      And I type "Option 3" into "Option 3" option field of "Q1"
      And I select "Option 1" as a correct option in "Q1"
      When I click on "Option 2" gear button
      Then button is enabled
      And I wait for 2 sec
      Then I click "Delete Option" button
      And I wait for 2 sec
      And I click "Save" button
      And I wait for 1 sec
      Then "Title#" is displayed on the list of quizzes
      And I click on the quiz "Title#"
      And I wait for 2 sec
      And I click delete "Title#" quiz

      @options4
      Scenario: Single Choice Question - Options (move option 2 up with three options total)
        When I type "Question 1" into question field of "Q1"
        And I type "Option 1" into "Option 1" option field of "Q1"
        And I type "Option 2" into "Option 2" option field of "Q1"
        And I add option
        And I type "Option 3" into "Option 3" option field of "Q1"
        And I select "Option 1" as a correct option in "Q1"
        When I click on "Option 2" gear button
        And I wait for 2 sec
        And I click "Move option up" button
        And I wait for 2 sec
        Then text "Option 2" appears in "Option 1" option field
        And I click "Save" button
        And I wait for 1 sec
        Then "Title#" is displayed on the list of quizzes
        And I click on the quiz "Title#"
        And I wait for 2 sec
        And I click delete "Title#" quiz
      @options5
      Scenario: Single Choice Question - 15 Options
        When I type "Question 1" into question field of "Q1"
        And I type "Option 1" into "Option 1" option field of "Q1"
        And I type "Option 2" into "Option 2" option field of "Q1"
        And I add 15 more options in "Q1"
        And I wait for 2 sec
        And I select "Option 11" as a correct option in "Q1"
        And I click "Save" button
        And I wait for 1 sec
        Then "Title#" is displayed on the list of quizzes
        And I click on the quiz "Title#"
        And I wait for 3 sec
        And I "Preview" the quiz "Title#"
        Then the quiz preview should contain "Option 15"
        And I wait for 2 sec
        And I click "Close" button
        And I wait for 1 sec
        And I click delete "Title#" quiz
      @options16
      Scenario: Single Choice Question - 16 Options
        When I type "Question 1" into question field of "Q1"
        And I type "Option 1" into "Option 1" option field of "Q1"
        And I type "Option 2" into "Option 2" option field of "Q1"
        And I add 16 more options in "Q1"
        And I wait for 2 sec
        And I select "Option 11" as a correct option in "Q1"
        And I click "Save" button
        And I wait for 1 sec
        Then "Title#" is displayed on the list of quizzes
        And I click on the quiz "Title#"
        And I wait for 3 sec
        And I "Preview" the quiz "Title#"
        Then the quiz preview should not contain "Option 16"
        And I wait for 2 sec
        And I click "Close" button
        And I wait for 1 sec
        And I click delete "Title#" quiz