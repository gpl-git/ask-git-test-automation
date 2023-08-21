@Registration
  Feature: Last Name field verification

    Background:
      Given I open "registration" page

    @regn_lastname1
    Scenario: Alphanumeric and special characters are allowed
      When I type "Emma" into first name field
      When I type "123!@#DFGH*&%ABC" into last name field
      And  I type "iabbsupply@crosswaytransport.net" into the email field
      And I type "abc" into group code field
      And I type "ABC123" into password field
      Then I type "ABC123" into confirm password field
      And I click "Register Me" button
      And I wait for 2 sec
      Then Registration confirmation msg "You have been Registered." should be displayed
      And I wait for 2 sec

    @regn_lastname2
    Scenario: Last Name can’t be empty
      When I type "Emma" into first name field
      When I type "" into last name field
      And  I type "iabbsupply@crosswaytransport.net" into the email field
      And I type "abc" into group code field
      And I type "ABC123" into password field
      Then I type "ABC123" into confirm password field
      And I click "Register Me" button
      And I wait for 1 sec
      Then Error msg "This field is required" should be displayed
      And I wait for 2 sec

    @regn_lastname3
    Scenario: Max 254 characters (When the First name is 1 char)
      When I type "A" into first name field
      When I type 254 characters into last name field
      And  I type "iabbsupply@crosswaytransport.net" into the email field
      And I type "abc" into group code field
      And I type "ABC123" into password field
      Then I type "ABC123" into confirm password field
      And I click "Register Me" button
      And I wait for 2 sec
      Then Registration confirmation msg "You have been Registered." should be displayed
      And I wait for 2 sec

    @regn_lastname4
    Scenario: Max 253 characters (When the First name is 1 char)
      When I type "A" into first name field
      When I type 253 characters into last name field
      And  I type "iabbsupply@crosswaytransport.net" into the email field
      And I type "abc" into group code field
      And I type "ABC123" into password field
      Then I type "ABC123" into confirm password field
      And I click "Register Me" button
      And I wait for 2 sec
      Then Registration confirmation msg "You have been Registered." should be displayed
      And I wait for 2 sec

    @regn_lastname5
    Scenario: Max 255 characters (When the First name is 1 char)
      # This is a known issue - Ticket JUL23-502
      When I type "A" into first name field
      When I type 255 characters into last name field
      And  I type "iabbsupply@crosswaytransport.net" into the email field
      And I type "abc" into group code field
      And I type "ABC123" into password field
      Then I type "ABC123" into confirm password field
      And I click "Register Me" button
      And I wait for 2 sec
      Then Error msg "No more than 254 chararcters allowed" should be displayed
      And I wait for 2 sec

    @regn_lastname6
    Scenario: Min 1 character
      When I type "Emma" into first name field
      When I type "$" into last name field
      And  I type "iabbsupply@crosswaytransport.net" into the email field
      And I type "abc" into group code field
      And I type "ABC123" into password field
      Then I type "ABC123" into confirm password field
      And I click "Register Me" button
      And I wait for 2 sec
      Then Registration confirmation msg "You have been Registered." should be displayed
      And I wait for 2 sec

    @regn_lastname7
    Scenario: Leading white spaces are not allowed
      When I type "Emma" into first name field
      When I type " Hello" into last name field
      And  I type "iabbsupply@crosswaytransport.net" into the email field
      And I type "abc" into group code field
      And I type "ABC123" into password field
      Then I type "ABC123" into confirm password field
      And I click "Register Me" button
      And I wait for 1 sec
      Then Error msg "Whitespaces are not allowed" should be displayed
      And I wait for 2 sec

    @regn_lastname8
    Scenario: Trailing white spaces are not allowed
      When I type "Emma" into first name field
      When I type "Hello " into last name field
      And  I type "iabbsupply@crosswaytransport.net" into the email field
      And I type "abc" into group code field
      And I type "ABC123" into password field
      Then I type "ABC123" into confirm password field
      And I click "Register Me" button
      And I wait for 1 sec
      Then Error msg "Whitespaces are not allowed" should be displayed
      And I wait for 2 sec

    @regn_lastname9
    Scenario: White spaces are not allowed in between characters
      When I type "Emma" into first name field
      When I type "He llo" into last name field
      And  I type "iabbsupply@crosswaytransport.net" into the email field
      And I type "abc" into group code field
      And I type "ABC123" into password field
      Then I type "ABC123" into confirm password field
      And I click "Register Me" button
      And I wait for 1 sec
      Then Error msg "Whitespaces are not allowed" should be displayed
      And I wait for 2 sec