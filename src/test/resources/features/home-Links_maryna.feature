@marynasharaiahomepage

Feature: Home Page Links Student Account

  @feature1ms
  Scenario: Open Go to My Assignments Link on Student Home Page
    Given I open url "http://ask-qa.portnov.com/#/login"
    When I type "chopper67hd@shopcaunho.com" into element with xpath "//input[@formcontrolname='email']"
    And I type "abc123" into element with xpath "//input[@formcontrolname='password']"
    When I click on element with xpath "//*[text()='Sign In']"
    And I wait for 1 sec
    Then element with xpath "//h5[normalize-space()='Home']" should be displayed
    When I click on element with xpath "//span[normalize-space()='Go To My Assignments']"
    And I wait for 1 sec
    Then element with xpath "//h4[normalize-space()='My Assignments']" should be displayed

  @feature2ms
  Scenario: Open Go to my Grades Link on Student home Page
    Given I open url "http://ask-qa.portnov.com/#/login"
    When I type "chopper67hd@shopcaunho.com" into element with xpath "//input[@formcontrolname='email']"
    And I type "abc123" into element with xpath "//input[@formcontrolname='password']"
    When I click on element with xpath "//*[text()='Sign In']"
    And I wait for 1 sec
    Then element with xpath "//h5[normalize-space()='Home']" should be displayed
    When I click on element with xpath "//span[normalize-space()='Go To My Grades']"
    And I wait for 1 sec
    Then element with xpath "//h4[normalize-space()='My Grades']" should be displayed