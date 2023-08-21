@quizTotalQuestionsPolinaSv
Feature: Quiz Total Questions Polina Sv

  Background:
#    Given I open "login" page ps
#    When I type "khravinina2@lce0ak.com" into "email" field ps
#    And I type "qwe123" into "password" field ps
#    And I click "Sign In" button ps
#    And I wait for 1 sec ps
#    When I click "Quizzes" menu item ps
#    And I wait for 1 sec ps
#    And I click "Create New Quiz" button ps
#    And I wait for 1 sec ps

#    Test Case 1, JUL23-403 Create new Quiz with Total "0" Question
  @createNewQuizWithNoQuestion
  Scenario: Create new Quiz with Total "0" Question
    When I type "Quiz with no questions" as quiz name ps
    And I add a question ps
    And I click "Save" button ps
    Then Error message "Quiz is not completed." should be displayed ps

# Test Case 2, 	JUL23-402 Create new Quiz with Total 1 Question
  @createNewQuizWith1Question
  Scenario: Create new Quiz with Total 1 Question
    When I type "Quiz with 1 question" as quiz name ps
    And I add a question ps
    When I select "Textual" question in "Q1" ps
    And I type "Question 1" into question field of "Q1" ps
    And I click "Save" button ps
    Then "Quiz with 1 question" is displayed on the list of quizzes ps
    And I wait for 1 sec ps
    And "Quiz with 1 question" should contain "1 Question" ps
    And I delete "Quiz with 1 question" ps
    And I wait for 1 sec ps

    # Test Case 3, 	JUL23-404 Create new Quiz with Total 2 Questions
  @createNewQuizWith2Questions
  Scenario: Create new Quiz with Total 2 Questions
    When I type "Quiz with 2 questions" as quiz name ps
    And I add a question ps
    When I select "Textual" question in "Q1" ps
    And I type "Question 1" into question field of "Q1" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q2" ps
    And I type "Question 2" into question field of "Q2" ps
    And I click "Save" button ps
    Then "Quiz with 2 questions" is displayed on the list of quizzes ps
    And I wait for 1 sec ps
    And "Quiz with 2 questions" should contain "2 Question" ps
    And I delete "Quiz with 2 questions" ps
    And I wait for 1 sec ps

      # Test Case 5, 	JUL23-406 Create new Quiz with Total 50 Questions
  @createNewQuizWith50Questions
  Scenario: Create new Quiz with Total 50 Questions
    When I type "Quiz with 50 questions" as quiz name ps
    And I add 50 Textual questions ps
    And I click "Save" button ps
    Then "Quiz with 50 questions" is displayed on the list of quizzes ps
    And I wait for 1 sec ps
    And "Quiz with 50 questions" should contain "50 Question" ps
    And I delete "Quiz with 50 questions" ps
    And I wait for 1 sec ps

          # Test Case 6, 	JUL23-407 Create new Quiz with Total 51 Questions
  @createNewQuizWith51Questions
  Scenario: Create new Quiz with Total 51 Questions
    When I type "Quiz with 51 questions" as quiz name ps
    And I add 50 Textual questions ps
    And I add a question ps
    Then Error message "Only 50 questions can be assigned" should be displayed ps
# It will fail - known bug JUL23-83 "Teacher is able to create a quiz with more than 50 questions"

#  Or an Error message can be displayed after creating 51st question - instead of saving quiz.
#    And I wait for 1 sec ps
#    When I select "Textual" question in "Q51" ps
#    And I type "Question 51" into question field of "Q51" ps
#    And I click "Save" button ps
#    Then Error message "Only 50 questions can be assigned" should be displayed ps

#    Then "Quiz with 51 questions" is displayed on the list of quizzes ps
#    And I wait for 1 sec ps
#    And "Quiz with 51 questions" should contain "51 Question" ps
#    And I delete "Quiz with 51 questions" ps

    #    Test Case 8, JUL23-163 Verify Total number of Questions in "List of Quizzes" Panel
  @TotalNumberOfQuestionsInListOfQuizzesPanel
  Scenario: Verify Total number of Questions in "List of Quizzes" Panel
    When I type "Quiz with 1 question" as quiz name ps
    And I add a question ps
    When I select "Textual" question in "Q1" ps
    And I type "Question 1" into question field of "Q1" ps
    And I click "Save" button ps
    Then "Quiz with 1 question" is displayed on the list of quizzes ps
    And I wait for 1 sec ps
    And "Quiz with 1 question" should contain "1 Question" ps
    When I click on "Quiz with 1 question" in the list of Quizzes ps
    And I wait for 1 sec ps
    Then "Quiz with 1 question" should contain "1" in Panel of the Quiz ps
    When I click on "Quiz with 1 question" in the list of Quizzes ps
    And I delete "Quiz with 1 question" ps
    And I wait for 1 sec ps

#    Test Case 7 JUL23-408 [S]Verify Total number of Questions in "My Assignments" Panel
#    Run without Background
  @TotalNumberOfQuestionsInMyAssignments
  Scenario: Verify Total number of Questions in in "My Assignments" Panel
    Given I open "login" page ps
    When I type "burghboy@chcial.com" into "email" field ps
    And I type "qwe123" into "password" field ps
    And I click "Sign In" button ps
    And I wait for 1 sec ps
    When I click "My Assignments" menu item ps
    And I wait for 1 sec ps
    Then "ABC" assignment should contain "3" questions ps

