@homepage @regression
Feature: Home Page Student


  Background:
    Given I open url "http://ask-qa.portnov.com/#/login"
    Then I should see page title contains "Assessment"
    When I type "student1@test.com" into element with xpath "//*[@formcontrolname='email']"
    When I type "ABC123" into element with xpath "//*[@formcontrolname='password']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for 1 sec
    #verify user role = Students
    Then element with xpath "//*[@class='info']" should contain text "STUDENT"

  @smoke
  Scenario: Home
    When I click on element with xpath "//a[@href='/#/home']"
    And I wait for 1 sec
    Then element with xpath "//ac-home-student[@class='ng-star-inserted']" should contain text "Assignments"

  Scenario: My assignments
    When I click on element with xpath "//a[@href='/#/my-assignments']"
    And I wait for 2 sec
    Then element with xpath "//h4" should be present
    #Then element with xpath "//ac-student-assignments-page[@class='ng-star-inserted']" should be displayed
    #Then element with xpath "//mat-card[@class='page mat-card']" should be present


  Scenario: My Grades
    When I click on element with xpath "//a[@href='/#/my-grades']"
    And I wait for 2 sec
    Then element with xpath "//h4" should be displayed
    Then element with xpath "//h4" should contain text "My grades"

  Scenario: Settings
    When I click on element with xpath "//a[@href='/#/settings']"
    And I wait for 2 sec
    Then element with xpath "//h4" should be displayed
    Then element with xpath "//h4" should contain text "My grades"
  Scenario: Log Out
    When I click on element with xpath "//h5[text()='Log Out']"
    And I wait for 3 sec
    Then element with xpath "//ac-modal-confirmation" should be displayed
    #Then element with xpath "//ac-modal-confirmation[@class='ng-star-inserted']" should contain text "Confirmation"