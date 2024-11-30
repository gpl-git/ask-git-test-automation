@sample
Feature: Sample page

  Background:
    Given I open url "https://skryabin.com/webdriver/html/sample.html"
    Then I should see page title as "Sample Page"

  @sample1
  Scenario: Username field behavior

    When I type "a" into element with xpath "//input[@name='username']"
    And I click on element with xpath "//button[@id='formSubmit']"
    And I wait for 1 sec
    Then element with xpath "//label[@id='username-error']" should be displayed
    Then element with xpath "//label[@id='username-error']" should contain text "Please enter at least 2 characters."
    When I clear element with xpath "//input[@name='username']"
    Then element with xpath "//label[@id='username-error']" should contain text "This field is required."
    When I type "aa" into element with xpath "//input[@name='username']"
    Then element with xpath "//label[@id='username-error']" should not be displayed

  @sample2
  Scenario Outline: Username field  errfor messages
    Given I open url "https://skryabin.com/webdriver/html/sample.html"
    When I type <text> into element with xpath "//input[@name='username']"
    And I click on element with xpath "//button[@id='formSubmit']"
    Then element with xpath "//label[@id='username-error']" should contain text <text1>
    Examples:
      | text | text1                                 |
      | "a"  | "Please enter at least 2 characters." |
      | ""   | "This field is required."             |

    @sample3
    Scenario:  Name field behavior
      When I click on element with xpath "//input[@id='name']"
      And I type "first" into element with xpath "//input[@id='firstName']"
      And I type "middle" into element with xpath "//input[@id='middleName']"
      And I type "last" into element with xpath "//input[@id='lastName']"
      And I click on element with xpath "//span[text()='Save']"
      And I wait for 1 sec
      Then element with xpath "//input[@id='name']" should have attribute "value" as "first middle last"



