@Groupcode
Feature:Registration-Groupcode

  Background:

    Given I open url "http://ask-qa.portnov.com/#/registration"
    When I type "August" into element with xpath "//input[@formcontrolname='firstName']"
    And I type "Super" into element with xpath "//input[@formcontrolname='lastName']"
    When I type "Anctoesend1965@teleworm.us" into element with xpath "//input[@formcontrolname='email']"
    When  I type "Super" into element with xpath "//input[@formcontrolname='password']"
    And I type "Super" into element with xpath "//input[@formcontrolname='confirmPassword']"

  @Groupcode1
  Scenario: Registration-Groupcode Happy Path

    And I type "ABCD" into element with xpath "//input[@formcontrolname='group']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for 2 sec
    And I wait for element with xpath "//h4" to be present
    And element with xpath "//h4" should contain text "You have been Registered"

  @groupcode2
  Scenario: Allowable characters: Alphanumeric & Special characters
    When I type "A@?." into element with xpath "//input[@formcontrolname='group']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for 2 sec
    And I wait for element with xpath "//h4" to be present
    And element with xpath "//h4" should contain text "You have been Registered"
  @groupcode3
  Scenario: Group code field required, canâ€™t be empty
    And I click on element with xpath "//button[@type='submit']"
    And I wait for 2 sec
    And element with xpath "//input[@formcontrolname='group']" should contain text "This field is required"

  @groupcode4
  Scenario: Min 1 characters
    When I type "A" into element with xpath "//input[@formcontrolname='group']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for 2 sec
    And I wait for element with xpath "//h4" to be present
    And element with xpath "//h4" should contain text "You have been Registered"

  @groupcode5:
  Scenario: Max 10 characters
    When I type "ABCDEFGHIJ" into element with xpath "//input[@formcontrolname='group']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for 2 sec
    And I wait for element with xpath "//h4" to be present
    And element with xpath "//h4" should contain text "You have been Registered"

  @groupcode6:
  Scenario: White spaces are not allowed
    When I type "  " into element with xpath "//input[@formcontrolname='group']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for 2 sec
#    Known bug
    And element with xpath "//input[@formcontrolname='group']" should contain text "White spaces are not allowed"
