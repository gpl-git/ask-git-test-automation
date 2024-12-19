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
    Then I should see page title as "www.excite.com"
    And element with xpath "//*[@name='q']" should be present
    When I type "Behavior Driven Development" into element with xpath "//*[@name='q']"
    And I click on element with xpath "//button"
    When I switch to new window
    And I wait for element with xpath "//div[@class='layout__mainline']" to be present
    Then element with xpath "//div[@class='layout__mainline']" should contain text "cucumber"
    And I wait for 2 sec
    And I switch to first window

  @predefined3
  Scenario: Predefined steps for DuckDuckGo
    Given I open url "https://duckduckgo.com/"
    And I wait for 3 sec
    Then I should see page title contains "DuckDuckGo"
    And element with xpath "//*[@name='q']" should be present
    When I type "Behavior Driven Development" into element with xpath "//*[@name='q']"
    And I click on element with xpath "//button[@type='submit']"
    Then I wait for element with xpath "//*[@class='react-results--main']" to be present
    Then element with xpath "//*[@class='react-results--main']" should contain text "Behavior"
    And I wait for 1 sec

  @predefined4
  Scenario: Predefined steps for GiveWater
    Given I open url "https://www.givewater.com/"
    And I wait for 1 sec
    Then I should see page title contains "giveWater Search Engine"
    Then element with xpath "//input[@id='site-search']" should be present
    When I type "Behavior Driven Development" into element with xpath "//input[@id='site-search']"
    Then I click on element using JavaScript with xpath "//button[@class='btn-search']"
    Then I wait for element with xpath "//div[@class='layout__mainline']" to be present
    Then element with xpath "//div[@class='layout__mainline']" should contain text "Behavior"
    And I wait for 1 sec

  @predefined5
  Scenario: Predefined steps for Ecosia
    Given I open url "https://www.ecosia.org/"
    And I wait for 1 sec
    Then I should see page title contains "Ecosia"
    And element with xpath "//*[@name='q']" should be present
    When I type "Behavior Driven Development" into element with xpath "//*[@name='q']"
    And I click on element with xpath "//button[@type='submit']"
    Then I wait for element with xpath "//div[@class='mainline__content']" to be present
    Then element with xpath "//div[@class='mainline__content']" should contain text "cucumber"
    And I wait for 3 sec

  @predefined6
  Scenario: Predefined steps for Startpage
    Given I open url "https://www.startpage.com/"
    Then I should see page title contains "Startpage"
    Then element with xpath "//input[@id='q']" should be present
    When I type "Behavior Driven Development" into element with xpath "//input[@id='q']"
    And I click on element with xpath "//button[@type='submit']"
    Then I wait for element with xpath "//section[@id='main']" to be present
    Then element with xpath "//section[@id='main']" should contain text "Cucumber"
    And I wait for 1 sec

  @predefined7
  Scenario: Predefined steps for Ask
    Given I open url "https://www.ask.com/"
    Then I should see page title contains "Ask.com"
    Then element with xpath "//input" should be present
    When I type "Behavior Driven Development" into element with xpath "//input"
    And I click on element with xpath "//button[@type='submit7777']"
    And I wait for 1 sec
    When I switch to iframe with xpath "//iframe[@id='master-1']"
    Then I wait for element with xpath "//div[@id='adBlock']" to be present
    Then element with xpath "//div[@id='adBlock']" should contain text "BDD"
    And I switch to default content
    And I wait for 1 sec