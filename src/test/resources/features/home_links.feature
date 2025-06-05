@predefined
Feature: Home page links
  Background:
    Given I open url "http://ask-qa.portnov.com/#/login"
    Then I should see page title as "Assessment Control @ Portnov"
    And element with xpath "//input[@id='mat-input-0']" should be present
    Then I type "qa1@test.com" into element with xpath "//input[@id='mat-input-0']"
    Then element with xpath "//input[@id='mat-input-1']" should be present
    And I type "ABC123" into element with xpath "//input[@id='mat-input-1']"
    And I click on element with xpath "(//button[@type='submit'])[1]"
    And I wait for element with xpath "//mat-list[@class='mat-list']" to be present

  @predefined1
  Scenario Outline: Click each home menu link and verify page title
    And I wait for 1 sec
    And I wait for element with xpath "//a[.//h5[contains(normalize-space(), '<button>')]]" to be present
    And I click on element with xpath "//a[.//h5[contains(normalize-space(), '<button>')]]"
    And I wait for element with xpath "<title_xpath>" to be present
    Then element with xpath "<title_xpath>" should contain text "<expected_title>"
    And I click on element with xpath "//h5[normalize-space()='Home']"
    And I wait for element with xpath "//mat-list[@class='mat-list']" to be present
    And I wait for 1 sec

    Examples:
      | button                  | title_xpath                                            | expected_title       |
      | Submissions             | //mat-card[@class='page mat-card']                     | Submissions          |
      | Assignments             | //mat-card[@class='page mat-card']                     | List of Assignments  |
      | Quizzes                 | //mat-card[@class='page mat-card ng-star-inserted']    | List of Quizzes      |
      | Users Management        | //mat-card[@class='page mat-card']                     | User's Management    |
      | Settings                | //mat-card[@class='mat-card']                          | Settings             |



