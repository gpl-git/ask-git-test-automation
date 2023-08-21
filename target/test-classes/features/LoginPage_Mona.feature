@Login
  Feature: Automate Login Page
    #Background: Given I open Quiz Application to login to our assessment as student mm
    Scenario: Login with valid credential
         Given I open Quiz Application to login to our assessment as student mm
         Then I enter my "student1@test.com" address in the email field and "ABC123" in the password field mm
         And click on "Sign In" button mm
         Then I wait for 2 sec
         Then I should successfully login to the "STUDENT" page. mm

    Scenario Outline: Login with Invalid username
         Given I open Quiz Application to login to our assessment as student mm
         Then I enter my "<email>" address in the email field and "<password>" in the password field mm
         And click on "Sign In" button mm
         #Then I wait for 2 sec
         Then I get a Authentication failed message mm
         Then I wait for 2 sec
      Examples:
            | email                | password|
            |student@test.com      |ABC123   |
            |abc@gmail.com         |ABC123   |
            |teacher@yahoo.com     |ABC123   |

     Scenario Outline: Log in with incorrect email format
            Given I open Quiz Application to login to our assessment as student mm
            Then I enter my "<email>" address in the email field
            Then I click on password field
            Then I wait for 2 sec
            And I get an error "Should be a valid email address"
        Examples:
            | email      |
            |mm          |
            |mm@         |

      Scenario: Leaving Email field empty
            Given I open Quiz Application to login to our assessment as student mm
            Then I enter my "" address in the email field
            Then I click on password field
            Then I wait for 2 sec
            And I get an error "This field is required"

      Scenario: Login with vaild email and leaving the Password field empty
           Given I open Quiz Application to login to our assessment as student mm
           Then I enter my "student1@test.com" address in the email field and "" in the password field mm
           And click on "Sign In" button mm
           Then I wait for 2 sec
           And I should get an error "This field is required"

       Scenario Outline: Login with valid Email and incorrect Password
             Given I open Quiz Application to login to our assessment as student mm
             Then I enter my "<email>" address in the email field and "<password>" in the password field mm
             And click on "Sign In" button mm
             Then I wait for 2 sec
             Then I get a Authentication failed message mm
             Then I wait for 2 sec
          Examples:
             | email                | password|
             |student@test.com      |A  |

       Scenario Outline: Login with Invalid Email and incorrect Password
           Given I open Quiz Application to login to our assessment as student mm
           Then I enter my "<email>" address in the email field and "<password>" in the password field mm
           And click on "Sign In" button mm
           Then I wait for 2 sec
           Then I get a Authentication failed message mm
           Then I wait for 2 sec
           Examples:
            | email                | password|
            |student@test.com      |Abc  |
         
        Scenario: Verifying Login Page is Masked
               Given I open Quiz Application to login to our assessment as student mm
               Then I enter my "email" address in the email field and "password" in the password field mm
               And click on "Sign In" button mm
               Then password field needs to be masked
