@RegGroupCode
Feature: git steps
  @reg1
  Scenario: Registration - Group code
    Given I open url "http://ask-qa.portnov.com/#/registration"
    Then I type "Hey" into element with xpath "//input[@id='mat-input-0']"
    Then I type "Ray" into element with xpath "//input[@id='mat-input-1']"
    When I type "kaareboy@yourbrandsites.com" into element with xpath " //input[@id='mat-input-2']"
    When I type "fall21" into element with xpath "//input[@id='mat-input-4']"
    When I type "fall21" into element with xpath "//input[@id='mat-input-5']"
    Then I click on element with xpath "//span[contains(text(),'Register Me')]"
    When element with xpath "//mat-errogitr[@id='mat-error-4']" should be displayed