@RegistrationFirstname

Feature: Creating Scenarios for Registration First Name


  @RegistrationFirstname1
  Scenario: Steps for First name accepts alphanumeric and special characters.
    Given I navigate to "registration" page
    And I wait for 2 sec ss
    When I type "abc123@$*" into first name field
    And I wait for 2 sec
    When I type "abc" into last name field
    When I type "abc@xyz.com" into email field ss
    And I wait for 2 sec
    When I type "ABC" in the group code
    When I type "12345"in the password field
    When I type "12345" in the confirm password field
    And I wait for 2 sec
    And I click "Register Me" button ss
    Then confirmation message"You have been registered."should be displayed ss.
    And I wait for 2 sec


  @RegistrationFirstname2
  Scenario: Steps for empty first name field generates and displays an error message
    Given I navigate to "registration" page
    When I type "" into first name field
    When I type "abc" into last name field
    When I type "abc@xyz.com" into email field ss
    And I wait for 2 sec
    When I type "ABC" in the group code
    When I type "12345"in the password field
    When I type "12345" in the confirm password field
    And I wait for 2 sec
    And I click "Register Me" button ss
    Then error message "This field is required" ss
    And I wait for 2 sec


  @RegistrationFirstname3
  Scenario: Steps for whitespaces not allowed in the first name field
    Given I navigate to "registration" page
    When I type " " into first name field
    When I type "abc" into last name field
    When I type "abc@xyz.com" into email field ss
    And I wait for 2 sec
    When I type "ABC" in the group code
    When I type "12345"in the password field
    When I type "12345" in the confirm password field
    And I wait for 2 sec
    And I click "Register Me" button ss
    Then error message "Whitespaces are not allowed" ss
    And I wait for 2 sec

  @RegistrationFirstname4
  Scenario: Steps for trailing whitespaces not allowed in the first name field
    Given I navigate to "registration" page
    When I type "Alice  " into first name field
    When I type "abc" into last name field
    When I type "abc@xyz.com" into email field ss
    And I wait for 2 sec
    When I type "ABC" in the group code
    When I type "12345"in the password field
    When I type "12345" in the confirm password field
    And I wait for 2 sec
    And I click "Register Me" button ss
    Then error message "Whitespaces are not allowed" ss
    And I wait for 2 sec

  @RegistrationFirstname5
  Scenario: Steps for  whitespaces in between the first name field displays an error message.
    Given I navigate to "registration" page
    When I type "Ali ce  " into first name field
    When I type "abc" into last name field
    When I type "abc@xyz.com" into email field ss
    And I wait for 2 sec
    When I type "ABC" in the group code
    When I type "12345"in the password field
    When I type "12345" in the confirm password field
    And I wait for 2 sec
    And I click "Register Me" button ss
    Then error message "Whitespaces are not allowed" ss
    And I wait for 2 sec

  @RegstrationFirstname6
  Scenario: Steps for first name with only 1 character is accepted.
    Given I navigate to "registration" page
    When I type "A" into first name field
    When I type "Adam" into last name field
    When I type "abc@xyz.com" into email field ss
    And I wait for 2 sec
    When I type "ABC" in the group code
    When I type "12345"in the password field
    When I type "12345" in the confirm password field
    And I wait for 2 sec
    And I click "Register Me" button ss
    Then confirmation message"You have been registered."should be displayed ss.
    And I wait for 2 sec

  @RegstrationFirstname7
  Scenario: Steps for first name with 1 character more than minimum (i.e. 1+1 ) is accepted.
    Given I navigate to "registration" page
    When I type "A@" into first name field
    When I type "Adam" into last name field
    When I type "abc@xyz.com" into email field ss
    And I wait for 2 sec
    When I type "ABC" in the group code
    When I type "12345"in the password field
    When I type "12345" in the confirm password field
    And I wait for 2 sec
    And I click "Register Me" button ss
    Then confirmation message"You have been registered."should be displayed ss.
    And I wait for 2 sec

  @RegstrationFirstname8
  Scenario: Steps for first name with max 254 characters is accepted.
    Given I navigate to "registration" page
    When I type "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" into first name field
    When I type "A" into last name field
    When I type "abc@xyz.com" into email field ss
    And I wait for 2 sec
    When I type "ABC" in the group code
    When I type "12345"in the password field
    When I type "12345" in the confirm password field
    And I wait for 2 sec
    And I click "Register Me" button ss
    Then confirmation message"You have been registered."should be displayed ss.
    And I wait for 2 sec


  @RegstrationFirstname9
  Scenario: Steps for first name with one less than max i.e.253 characters is accepted.
    Given I navigate to "registration" page
    When I type "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" into first name field
    When I type "A" into last name field
    When I type "abc@xyz.com" into email field ss
    And I wait for 2 sec
    When I type "ABC" in the group code
    When I type "12345"in the password field
    When I type "12345" in the confirm password field
    And I wait for 2 sec
    And I click "Register Me" button ss
    Then confirmation message"You have been registered."should be displayed ss.
    And I wait for 2 sec

  @RegstrationFirstname10
  Scenario: Steps for first name with one more than max i.e.255 characters displays an error message.
    Given I navigate to "registration" page
    When I type "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" into first name field
    Then I wait for 1 sec
    When I type "A" into last name field
    When I type "abc@xyz.com" into email field ss
    And I wait for 2 sec
    When I type "ABC" in the group code
    When I type "12345"in the password field
    When I type "12345" in the confirm password field
    And I wait for 2 sec
    And I click "Register Me" button ss
    And I wait for 2 sec
    Then error message "Data too long for column 'name' at row 1"
    And I wait for 1 sec




