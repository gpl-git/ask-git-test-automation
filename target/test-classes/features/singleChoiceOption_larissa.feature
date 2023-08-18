@quiz
Feature: Single Choice Question - options

Scenario: : Create a quiz
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
    When I type "Question 1" into question field of "Q1"
    And I type "Option 1" into "Option 1" option field of "Q1"
    And I type "Option 2" into "Option 2" option field of "Q1"
    And I select "Option 1" as a correct option in "Q1"
    And I click "Save" button
    And I wait for 1 sec
    Then "Title#" is displayed on the list of quizzes
    And I wait for 5 sec
    And I delete "Title#"
