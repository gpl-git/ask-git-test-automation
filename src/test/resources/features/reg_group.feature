@regression @reg_group
Feature: Registration Page Group Code Field Testing

  @smoke @reg_group1
  Scenario: Group Code field Behaviour positive check

    When I open url "http://ask-qa.portnov.com/#/registration"
    Then I should see page title contains "Assessment Control"

    When I type "JoeM" into element with xpath "//*[@formcontrolname='firstName']"
    And I type "MCSUKER" into element with xpath "//*[@formcontrolname='lastName']"
    And I type "Kang1933@gustr.com" into element with xpath "//*[@formcontrolname='email']"
    And I type "ABC123" into element with xpath "//*[@formcontrolname='group']"
    And I type "123456" into element with xpath "//*[@formcontrolname='password']"
    And I type "123456" into element with xpath "//*[@formcontrolname='confirmPassword']"

    When I click on element with xpath "//*[@type='submit']"
    Then I wait for element with xpath "//ac-registration-confirmation-page" to be present
    And element with xpath "//h4" should contain text "You have been Registered."
    And I wait for 2 sec

  @regression @reg_GroupCode_neg
  Scenario: Group Code field Behaviour negative check - more than 10 characters
    When I open url "http://ask-qa.portnov.com/#/registration"
    Then I should see page title contains "Assessment Control"

    When I type "Mason" into element with xpath "//*[@formcontrolname='firstName']"
    And I type "Winton" into element with xpath "//*[@formcontrolname='lastName']"
    And I type "Befornes69@teleworm.us" into element with xpath "//*[@formcontrolname='email']"
    When I type "dfndkfd5678564445 " into element with xpath "//*[@formcontrolname='group']"
    And I type "123456" into element with xpath "//*[@formcontrolname='password']"
    And I type "123456" into element with xpath "//*[@formcontrolname='confirmPassword']"
    When I click on element with xpath "//*[@type='submit'] "

    Then element with xpath "//mat-error" should be displayed
    Then element with xpath "//mat-error" should contain text "Should no more than 10 characters"

    And I wait for 2 sec



