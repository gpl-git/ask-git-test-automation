@quizTotalQuestionsPolinaSv
Feature: Quiz Total Questions Polina Sv

  Background:
    Given I open "login" page ps
    When I type "khravinina2@lce0ak.com" into "email" field ps
    And I type "qwe123" into "password" field ps
    And I click "Sign In" button ps
    And I wait for 1 sec ps
    When I click "Quizzes" menu item ps
    And I wait for 1 sec ps
    And I click "Create New Quiz" button ps
    And I wait for 1 sec ps

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

      # Test Case 5, 	JUL23-406 Create new Quiz with Total 50 Questions
  @createNewQuizWith50Questions
  Scenario: Create new Quiz with Total 50 Questions
    When I type "Quiz with 50 questions" as quiz name ps
    And I add a question ps
    When I select "Textual" question in "Q1" ps
    And I type "Question 1" into question field of "Q1" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q2" ps
    And I type "Question 2" into question field of "Q2" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q3" ps
    And I type "Question 3" into question field of "Q3" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q4" ps
    And I type "Question 4" into question field of "Q4" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q5" ps
    And I type "Question 5" into question field of "Q5" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q6" ps
    And I type "Question 6" into question field of "Q6" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q7" ps
    And I type "Question 7" into question field of "Q7" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q8" ps
    And I type "Question 8" into question field of "Q8" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q9" ps
    And I type "Question 9" into question field of "Q9" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q10" ps
    And I type "Question 10" into question field of "Q10" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q11" ps
    And I type "Question 11" into question field of "Q11" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q12" ps
    And I type "Question 12" into question field of "Q12" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q13" ps
    And I type "Question 13" into question field of "Q13" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q14" ps
    And I type "Question 14" into question field of "Q14" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "15" ps
    And I type "Question 15" into question field of "Q15" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q16" ps
    And I type "Question 16" into question field of "Q16" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q17" ps
    And I type "Question 17" into question field of "Q17" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q18" ps
    And I type "Question 18" into question field of "Q18" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q19" ps
    And I type "Question 19" into question field of "Q19" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q20" ps
    And I type "Question 20" into question field of "Q20" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q21" ps
    And I type "Question 21" into question field of "Q21" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q22" ps
    And I type "Question 22" into question field of "Q22" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q23" ps
    And I type "Question 23" into question field of "Q23" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q24" ps
    And I type "Question 24" into question field of "Q24" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q25" ps
    And I type "Question 25" into question field of "Q25" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q26" ps
    And I type "Question 26" into question field of "Q26" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q27" ps
    And I type "Question 27" into question field of "Q27" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q28" ps
    And I type "Question 28" into question field of "Q28" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q29" ps
    And I type "Question 29" into question field of "Q29" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q30" ps
    And I type "Question 30" into question field of "Q30" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q31" ps
    And I type "Question 31" into question field of "Q31" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q32" ps
    And I type "Question 32" into question field of "Q32" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q33" ps
    And I type "Question 33" into question field of "Q33" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q34" ps
    And I type "Question 34" into question field of "Q34" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q35" ps
    And I type "Question 35" into question field of "Q35" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q36" ps
    And I type "Question 36" into question field of "Q36" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q37" ps
    And I type "Question 37" into question field of "Q37" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q38" ps
    And I type "Question 38" into question field of "Q38" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q39" ps
    And I type "Question 39" into question field of "Q39" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q40" ps
    And I type "Question 40" into question field of "Q40" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q41" ps
    And I type "Question 41" into question field of "Q41" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q42" ps
    And I type "Question 42" into question field of "Q42" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q43" ps
    And I type "Question 43" into question field of "Q43" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q44" ps
    And I type "Question 44" into question field of "Q44" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q45" ps
    And I type "Question 45" into question field of "Q45" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q46" ps
    And I type "Question 46" into question field of "Q46" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q47" ps
    And I type "Question 47" into question field of "Q47" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q48" ps
    And I type "Question 48" into question field of "Q48" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q49" ps
    And I type "Question 49" into question field of "Q49" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q50" ps
    And I type "Question 50" into question field of "Q50" ps
    And I click "Save" button ps
    Then "Quiz with 50 questions" is displayed on the list of quizzes ps
    And I wait for 1 sec ps
    And "Quiz with 50 questions" should contain "50 Question" ps
    And I delete "Quiz with 50 questions" ps

          # Test Case 6, 	JUL23-407 Create new Quiz with Total 51 Questions
  @createNewQuizWith51Questions
  Scenario: Create new Quiz with Total 51 Questions
    When I type "Quiz with 51 questions" as quiz name ps
    And I add a question ps
    When I select "Textual" question in "Q1" ps
    And I type "Question 1" into question field of "Q1" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q2" ps
    And I type "Question 2" into question field of "Q2" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q3" ps
    And I type "Question 3" into question field of "Q3" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q4" ps
    And I type "Question 4" into question field of "Q4" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q5" ps
    And I type "Question 5" into question field of "Q5" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q6" ps
    And I type "Question 6" into question field of "Q6" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q7" ps
    And I type "Question 7" into question field of "Q7" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q8" ps
    And I type "Question 8" into question field of "Q8" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q9" ps
    And I type "Question 9" into question field of "Q9" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q10" ps
    And I type "Question 10" into question field of "Q10" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q11" ps
    And I type "Question 11" into question field of "Q11" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q12" ps
    And I type "Question 12" into question field of "Q12" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q13" ps
    And I type "Question 13" into question field of "Q13" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q14" ps
    And I type "Question 14" into question field of "Q14" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "15" ps
    And I type "Question 15" into question field of "Q15" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q16" ps
    And I type "Question 16" into question field of "Q16" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q17" ps
    And I type "Question 17" into question field of "Q17" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q18" ps
    And I type "Question 18" into question field of "Q18" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q19" ps
    And I type "Question 19" into question field of "Q19" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q20" ps
    And I type "Question 20" into question field of "Q20" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q21" ps
    And I type "Question 21" into question field of "Q21" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q22" ps
    And I type "Question 22" into question field of "Q22" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q23" ps
    And I type "Question 23" into question field of "Q23" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q24" ps
    And I type "Question 24" into question field of "Q24" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q25" ps
    And I type "Question 25" into question field of "Q25" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q26" ps
    And I type "Question 26" into question field of "Q26" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q27" ps
    And I type "Question 27" into question field of "Q27" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q28" ps
    And I type "Question 28" into question field of "Q28" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q29" ps
    And I type "Question 29" into question field of "Q29" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q30" ps
    And I type "Question 30" into question field of "Q30" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q31" ps
    And I type "Question 31" into question field of "Q31" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q32" ps
    And I type "Question 32" into question field of "Q32" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q33" ps
    And I type "Question 33" into question field of "Q33" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q34" ps
    And I type "Question 34" into question field of "Q34" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q35" ps
    And I type "Question 35" into question field of "Q35" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q36" ps
    And I type "Question 36" into question field of "Q36" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q37" ps
    And I type "Question 37" into question field of "Q37" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q38" ps
    And I type "Question 38" into question field of "Q38" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q39" ps
    And I type "Question 39" into question field of "Q39" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q40" ps
    And I type "Question 40" into question field of "Q40" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q41" ps
    And I type "Question 41" into question field of "Q41" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q42" ps
    And I type "Question 42" into question field of "Q42" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q43" ps
    And I type "Question 43" into question field of "Q43" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q44" ps
    And I type "Question 44" into question field of "Q44" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q45" ps
    And I type "Question 45" into question field of "Q45" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q46" ps
    And I type "Question 46" into question field of "Q46" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q47" ps
    And I type "Question 47" into question field of "Q47" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q48" ps
    And I type "Question 48" into question field of "Q48" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q49" ps
    And I type "Question 49" into question field of "Q49" ps
    And I add a question ps
    And I wait for 1 sec ps
    When I select "Textual" question in "Q50" ps
    And I type "Question 50" into question field of "Q50" ps
    And I add a question ps
    Then Error message "Only 50 questions can be assigned" should be displayed ps

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

