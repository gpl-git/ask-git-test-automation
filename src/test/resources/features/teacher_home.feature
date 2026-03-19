@homePage @regression
Feature: Home Page


  Background:
    Given I open url "http://ask-qa.portnov.com/#/login"
    Then I should see page title contains "Assessment"
    When I type "acked1930@fleckens.hu" into element with xpath "//*[@formcontrolname='email']"
    When I type "ABC123" into element with xpath "//*[@formcontrolname='password']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for 1 sec
    #verify user role = TEACHER
    Then element with xpath "//*[@class='info']" should contain text "TEACHER"

  @smoke @home
  Scenario: Home
#    verify current URL
    When I click on element with xpath "//a[@href='/#/home']"
    And I wait for 1 sec
    Then element with xpath "//ac-home-teacher[@class='ng-star-inserted']" should contain text "New Submissions From Students"
  @submissions
  Scenario: Submissions
    When I click on element with xpath "//a[@href='/#/submissions/0']"
    And I wait for 1 sec
    Then element with xpath "//ac-submissions-list-page[@class='ng-star-inserted']" should contain text "Submissions"
  @assignments
  Scenario: Assignments
    When I click on element with xpath "//a[@href='/#/assignments']"
    And I wait for 1 sec
    Then element with xpath "//ac-assignments-list-page[@class='ng-star-inserted']" should contain text "List of Assignments"
  @quizzes
  Scenario: Quizzes
    When I click on element with xpath "//a[@href='/#/quizzes']"
    And I wait for 1 sec
    Then element with xpath "//ac-quizzes-list[@class='ng-star-inserted']" should contain text "List of Quizzes"
  @users
  Scenario: Users Management
    When I click on element with xpath "//a[@href='/#/users-management']"
    And I wait for 1 sec
    Then element with xpath "//ac-user-management-page[@class='ng-star-inserted']" should contain text "User's Management"
  @settings
  Scenario: Settings
    When I click on element with xpath "//a[@href='/#/settings']"
    And I wait for 1 sec
    Then element with xpath "//ac-settings-page[@class='ng-star-inserted']" should contain text "Settings"
  @logout
  Scenario: Log out
    When I click on element with xpath "//h5[text()='Log Out']"
    And I wait for 1 sec
    Then element with xpath "//ac-modal-confirmation[@class='ng-star-inserted']" should contain text "Confirmation"

  @404error
  Scenario: Go to Sunmissions
    When I click on element with xpath "//*[text()='Go To Submissions']"
    And I wait for 1 sec
#    reported bug FEB26-5555
    Then  element with xpath "//h4" should be displayed
    And I wait for 1 sec
