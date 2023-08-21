@Registration
  Feature: Last Name field verification

    Background:
      Given I open "registration" page

    @reg1
    Scenario: Alphanumeric and special characters are allowed
      When I type "Emma" into first name field
      When I type "123!@#DFGH*&%ABC" into  last name field
      And  I type "iabbsupply@crosswaytransport.net" into email field
      And I type "abc" into group code field
      And I type "ABC123" into password field
      Then I type "ABC123" into confirm password field
      And I click "Register Me" button
      And I wait for 1 sec
      Then confirmation message "You have been Registered." should be displayed
      And I wait for 2 sec

    @reg2
    Scenario: Min number allowed in Last Name filed
      When I type "Emma" into first name field
      When I type "1" into  last name field
      And  I type "iabbsupply@crosswaytransport.net" into email field
      And I type "abc" into group code field
      And I type "ABC123" into password field
      Then I type "ABC123" into confirm password field
      And I click "Register Me" button
      And I wait for 2 sec
      Then confirmation message "You have been Registered." should be displayed
      And I wait for 2 sec
      
    @reg3
    Scenario:  Last Name filed required
      When I type "Emma" into first name field
      When I type "" into  last name field
      And  I type "iabbsupply@crosswaytransport.net" into email field
      And I type "abc" into group code field
      And I type "ABC123" into password field
      Then I type "ABC123" into confirm password field
      And I click "Register Me" button
      Then error message "This field is required"
      And I wait for 2 sec


    @reg4
    Scenario: Last Name field max num of characters
#      This is a known issue JUL23-
      When I type "E" into first name field
#      When I type "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" into  last name field
     When I type 254 characters into last name field
      And  I type "iabbsupply@crosswaytransport.net" into email field
      And I type "abc" into group code field
      And I type "ABC123" into password field
      Then I type "ABC123" into confirm password field
      And I click "Register Me" button
      And I wait for 1 sec
      Then confirmation message "You have been Registered." should be displayed
      And I wait for 2 sec