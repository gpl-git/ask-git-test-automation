@predefined
Feature: log in

  @predefined1
  Scenario: log into account
    Given I open url "http://ask-qa.portnov.com/#/login"
    Then I should see page title as "Assessment Control @ Portnov"
    And I wait for 1 sec
    And element with xpath "//input[@formcontrolname='email']" should be present
    And element with xpath "//input[@formcontrolname='password']" should be present
    When I type "student5@test.com" into element with xpath "//input[@formcontrolname='email']"
    And I type "ABC123" into element with xpath "//input[@formcontrolname='password']"
    Then I click on element using JavaScript with xpath "//span[normalize-space()='Sign In']"
    And I wait for 4 sec
#    Verify home page:user name and role
    Then element with xpath "//*[@class='info']" should contain text "STUDENT"
    Then element with xpath "//*[@class='info']" should contain text "Student Five"
    And I wait for 3 sec


