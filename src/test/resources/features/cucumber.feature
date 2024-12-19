@regression
Feature: Sample Page Scenarios

  Background:
    Given I open url "https://skryabin.com/webdriver/html/sample.html"
    Then I should see page title as "Sample Page"

  @username @smoke
  Scenario: Username Field Behavior
    When I type "a" into element with xpath "//input[@name='username']"
    And I click on element with xpath "//button[@id='formSubmit']"
    Then element with xpath "//label[@id='username-error']" should be displayed
    Then element with xpath "//label[@id='username-error']" should contain text "Please enter at least 2 characters"
    When I clear element with xpath "//input[@name='username']"
    Then element with xpath "//label[@id='username-error']" should contain text "This field is required."
    When I type "aa" into element with xpath "//input[@name='username']"
    Then element with xpath "//label[@id='username-error']" should not be displayed
    And I wait for 2 sec

    @smoke
    Scenario: Name Input Field
      When I click on element with xpath "//input[@id='name']"
      And I type "Galina" into element with xpath "//input[@id='firstName']"
      And I type "Lagunova" into element with xpath "//input[@id='lastName']"
      When I click on element with xpath "//*[text()='Save']"
      Then element with xpath "//input[@id='name']" should have attribute "value" as "Galina Lagunova"
      And I wait for 2 sec
      
    


    
    
