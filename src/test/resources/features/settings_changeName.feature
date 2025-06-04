@settings_changeName
Feature: [T]:Settings - Change Name

  Background:
    Given I open url "http://ask-qa.portnov.com/#/login"
    When I type "alst1985@rhyta.com" into element with xpath "//*[@formcontrolname='email']"
    And I type "12345" into element with xpath "//*[@formcontrolname='password']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for 3 sec
    Then element with xpath "//mat-list[@class='mat-list']" should be displayed
    And element with xpath "//div[@class='info']" should contain text "J S"
    When I click on element with xpath "//a[@href='/#/settings']//div[@class='mat-list-item-content']"
    Then element with xpath "//mat-card[@class='mat-card']" should be displayed
    When I click on element with xpath "//span[text()='Change Your Name']"
    And I wait for 2 sec
    Then element with xpath "//mat-dialog-container[@role='dialog']" should be displayed


  @settings_changeName1
  Scenario: Change Name - Alphanumeric and Sp.Character - Happy Path
    When I clear element with xpath "//input[@formcontrolname='name']"
    And I type "Jalpa1$ Teacher#%" into element with xpath "//input[@formcontrolname='name']"
    And I wait for 2 sec
    And I click on element with xpath "//div[@class='cdk-overlay-container']//button[2]"
    And I wait for 2 sec
    Then element with xpath "//div[@class='horizontal-group']//table" should be displayed
    And I wait for 1 sec
    And element with xpath "//div[@class='horizontal-group']//table" should contain text "Jalpa1$ Teacher#%"
    And element with xpath "//div[@class='info']" should contain text "Jalpa1$ Teacher#%"
    When I click on element with xpath "//span[text()='Change Your Name']"
    And I wait for 3 sec
    Then element with xpath "//mat-dialog-container[@role='dialog']" should be displayed
    And I clear element with xpath "//input[@formcontrolname='name']"
    And I wait for 3 sec
    And I type "J S" into element with xpath "//input[@formcontrolname='name']"
    And I click on element with xpath "//div[@class='cdk-overlay-container']//button[2]"
    Then element with xpath "//div[@class='horizontal-group']//table" should be displayed
    And I wait for 4 sec
    And element with xpath "//div[@class='horizontal-group']//table" should contain text "J S"
    And element with xpath "//div[@class='info']" should contain text "J S"

  @settings_changeName2
  Scenario: Change Name - This Field is Required
    And I wait for 1 sec
    When I remove text from element with xpath "//input[@formcontrolname='name']"
    And I wait for 1 sec
    Then element with xpath "//div[@class='cdk-overlay-container']//button[2]" should be disabled
    When I click on element with xpath "//mat-dialog-container[@role='dialog']"
    And I click on element with xpath "//h1"
    And I wait for 1 sec
    Then element with xpath "//mat-error" should be displayed
    And element with xpath "//mat-error" should contain text "This field is required"

  @settings_changeName3
  Scenario: Change Name - Max.256 Charcters including 1 space
    When I clear element with xpath "//input[@formcontrolname='name']"
    And I type "qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq`1234567890-=QWERTYUIOP[]\ASDFGHJKL;'ZXCVBNM,./ ~!@#$%^&*()_+qwertyuiop{}|asdfghjkl:â€zxcvbnm<>?wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwweeeeeeerrrrrrrrr256" into element with xpath "//input[@formcontrolname='name']"
    And I wait for 2 sec
    And I click on element with xpath "//div[@class='cdk-overlay-container']//button[2]"
    And I wait for 2 sec
    Then element with xpath "//div[@class='horizontal-group']//table" should be displayed
    And I wait for 1 sec
    And element with xpath "//div[@class='horizontal-group']//table" should contain text "qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq`1234567890-=QWERTYUIOP[]\ASDFGHJKL;'ZXCVBNM,./ ~!@#$%^&*()_+qwertyuiop{}|asdfghjkl:â€zxcvbnm<>?wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwweeeeeeerrrrrrrrr256"
    And element with xpath "//div[@class='info']" should contain text "qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq`1234567890-=QWERTYUIOP[]\ASDFGHJKL;'ZXCVBNM,./ ~!@#$%^&*()_+qwertyuiop{}|asdfghjkl:â€zxcvbnm<>?wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwweeeeeeerrrrrrrrr256"
    When I click on element with xpath "//span[text()='Change Your Name']"
    And I wait for 3 sec
    Then element with xpath "//mat-dialog-container[@role='dialog']" should be displayed
    And I clear element with xpath "//input[@formcontrolname='name']"
    And I wait for 3 sec
    And I type "JS Teacher" into element with xpath "//input[@formcontrolname='name']"
    And I click on element with xpath "//div[@class='cdk-overlay-container']//button[2]"
    Then element with xpath "//div[@class='horizontal-group']//table" should be displayed
    And I wait for 2 sec
    And element with xpath "//div[@class='horizontal-group']//table" should contain text "JS Teacher"
    And element with xpath "//div[@class='info']" should contain text "JS Teacher"

  @settings_changeName4
  Scenario: Change Name - Min. 2 characters + 1 space - Positive
    When I clear element with xpath "//input[@formcontrolname='name']"
    And I type "J S" into element with xpath "//input[@formcontrolname='name']"
    And I wait for 2 sec
    And I click on element with xpath "//div[@class='cdk-overlay-container']//button[2]"
    And I wait for 2 sec
    Then element with xpath "//div[@class='horizontal-group']//table" should be displayed
    And I wait for 1 sec
    And element with xpath "//div[@class='horizontal-group']//table" should contain text "J S"
    And element with xpath "//div[@class='info']" should contain text "J S"
    When I click on element with xpath "//span[text()='Change Your Name']"
    And I wait for 3 sec
    Then element with xpath "//mat-dialog-container[@role='dialog']" should be displayed
    And I clear element with xpath "//input[@formcontrolname='name']"
    And I wait for 3 sec
    And I type "JS Teacher" into element with xpath "//input[@formcontrolname='name']"
    And I click on element with xpath "//div[@class='cdk-overlay-container']//button[2]"
    Then element with xpath "//div[@class='horizontal-group']//table" should be displayed
    And I wait for 4 sec
    And element with xpath "//div[@class='horizontal-group']//table" should contain text "JS Teacher"
    And element with xpath "//div[@class='info']" should contain text "JS Teacher"

  @settings_changeName5
  Scenario: Change Name - Trailing  space is not allowed
    When I clear element with xpath "//input[@formcontrolname='name']"
    And I type "Jalpa Teacher " into element with xpath "//input[@formcontrolname='name']"
    Then element with xpath "//div[@class='mat-dialog-content']" should contain text "Should contain only first and last name"

  @settings_changeName6
  Scenario: Change Name - Leading space is not allowed
    When I clear element with xpath "//input[@formcontrolname='name']"
    And I type " Jalpa Teacher" into element with xpath "//input[@formcontrolname='name']"
    Then element with xpath "//div[@class='mat-dialog-content']" should contain text "Should contain only first and last name"