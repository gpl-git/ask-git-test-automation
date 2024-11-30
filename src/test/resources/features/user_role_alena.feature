@changerole

Feature: User's management - Student - Change User's Role

  Background:
    Given I open url "http://ask-qa.portnov.com/#/login"
    Then I should see page title as "Assessment Control @ Portnov"
    When I type "9cyf5@wsypc.com" into element with xpath "//input[@formcontrolname='email']"
    When I type "123456" into element with xpath "//input[@formcontrolname='password']"
    And I click on element with xpath "//span[@class='mat-button-wrapper']"
    And I wait for 5 sec

  @changerole1
  Scenario: Change User's Role
    When I click on element with xpath "//h5[contains(text(), 'Management')]"
    And I wait for 3 sec
    When I click on element with xpath "//h4[contains(text(), 'Alena Student')]"
    And I wait for 15 sec
    When I click on element with xpath "//button[@class='mat-raised-button mat-accent']"
    And I wait for 3 sec
    When I click on element with xpath "//div[@role='menu']//*[contains(text(),'school')]"
    And I wait for 5 sec
    When I click on element with xpath "//span[contains(text(),'Change Role')]"
    And I wait for 3 sec
    Then element with xpath "//tr//*[contains(text(), 'User Role')]/.." should contain text "TEACHER"
    And I wait for 1 sec
      #find our new teacher in the list of Teachers
    When I click on element with xpath "//h5[contains(text(),'Management')]"
    And I wait for 3 sec
    When I click on element with xpath "//div[contains(text(),'Teachers')]"
    And I wait for 3 sec
    When I click on element with xpath "//h4[contains(text(), 'Alena Student')]"
    And I wait for 5 sec
      #change to student
    When I click on element with xpath "//button[@class='mat-raised-button mat-accent']"
    And I wait for 3 sec
    When I click on element with xpath "//div[@role='menu']//*[contains(text(),'school')]"
    And I wait for 5 sec
    When I click on element with xpath "//span[contains(text(),'Change Role')]"
    And I wait for 3 sec
    Then element with xpath "//tr//*[contains(text(), 'User Role')]/.." should contain text "STUDENT"
    And I wait for 1 sec







