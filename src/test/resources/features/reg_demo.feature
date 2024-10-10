@reg_demo
  Feature: Registration Demo - First Name

    Background:
      Given I open url "http://ask-qa.portnov.com/#/login"
      Then I should see page title contains "Portnov"
      When I click on element with xpath "//span[contains(text(),'Register Now')]"
      And I wait for 1 sec
      When I type "White" into element with xpath "//input[@formcontrolname='lastName']"
      When I type "abc@123.com" into element with xpath "//input[@formcontrolname='email']"
      When I type "ABC" into element with xpath "//input[@formcontrolname='group']"
      When I type "12345" into element with xpath "//input[@formcontrolname='password']"
      When I type "12345" into element with xpath "//input[@formcontrolname='confirmPassword']"

      @reg_demo1
      Scenario: Happy Path
        When I type "Alice" into element with xpath "//input[@formcontrolname='firstName']"
        And I click on element with xpath "//span[contains(text(),'Register Me')]"
        And I wait for 1 sec
        Then element with xpath "//h4" should be displayed
        Then element with xpath "//h4" should have text as "You have been Registered."

        @reg_demo2
        Scenario: This field is required
          When I type "" into element with xpath "//input[@formcontrolname='firstName']"
          And I click on element with xpath "//span[contains(text(),'Register Me')]"