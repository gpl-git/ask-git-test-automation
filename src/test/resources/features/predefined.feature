@predefined
Feature: Smoke steps

  @predefined1
  Scenario: Predefined steps for Google
    Given I open url "https://google.com"
    Then I should see page title as "Google"
    And element with xpath "//*[@name='q']" should be present
    When I type "Behavior Driven Development" into element with xpath "//*[@name='q']"
    And I click on element using JavaScript with xpath "(//input[@name='btnK'])[2]"
    And I wait for element with xpath "//*[@id='res']" to be present
    Then element with xpath "//*[@id='res']" should contain text "Cucumber"
    
    
  @predefined2
  Scenario: Steps for excite.com
    Given I open url "https://www.excite.com/"
    Then I should see page title contains "excite"
    And element with xpath "//*[@name='q']" should be present
    When I type "Behavior Driven Development" into element with xpath "//*[@name='q']"
    And I click on element with xpath "//button[@class='search-btn']"
    When I switch to new window
    And I wait for element with xpath "//div[@class='layout__mainline']" to be present
    Then element with xpath "//div[@class='layout__mainline']" should contain text "cucumber"
    And I switch to first window
    And I wait for 3 sec
    
    
  @predefined3 @smoke
  Scenario: Steps for givewater.com
    Given  I open url "https://www.givewater.com/"
    Then I should see page title contains "giveWater Search Engine"
    And element with xpath "//*[@name='q']" should be present
    When I type "Behavior Driven Development" into element with xpath "//*[@name='q']"
    And I click on element using JavaScript with xpath "//button[@type='submit' and @class='btn-search']"
    And I wait for 1 sec
    And I wait for element with xpath "//div[@class='layout__mainline']" to be present
    Then element with xpath "//div[@class='layout__mainline']" should contain text "cucumber"
    And I wait for 1 sec

    @predefined4
    Scenario: Steps for dogpile.com
      Given I open url "https://www.dogpile.com/"    
      And I wait for 3 sec
      Then I should see page title as "Dogpile.com"
      And I wait for 1 sec