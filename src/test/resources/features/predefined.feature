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
 Scenario:  Steps for Swisscows
   Given I open url "https://swisscows.com/en"
   Then I should see page title contains "Swisscows"
   And element with xpath "//input[@name='query']" should be present
   When I type "Behavior Driven Development" into element with xpath "//input[@name='query']"
   And I wait for 2 sec
   When I click on element with xpath "(//div[@class='searchbar']//ul[@class='suggestions'])[1]"
   And I wait for 1 sec
   Then I wait for element with xpath " //div[@class='web-results content']" to be present
   Then element with xpath "//div[@class='web-results content']" should contain text "BDD"
   
   
   
   @predefined3
   Scenario: Steps for Givewater
     Given I open url "https://www.givewater.com/"
     Then I should see page title contains "giveWater Search Engine"
     And element with xpath "//*[@name='q']" should be present
     When I type "Behavior Driven Development" into element with xpath "//*[@name='q']"
     And I wait for 2 sec
     When I click on element using JavaScript with xpath "//button[@type='submit'and @class='btn-search']"
     And I wait for element with xpath "//div[@class='layout__mainline']" to be present
     And I wait for 1 sec
     Then element with xpath "//div[@class='layout__mainline']" should contain text "BDD"
     And I wait for 2 sec

