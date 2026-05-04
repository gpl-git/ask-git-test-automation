@registration @email_reg
Feature: Registration PageEmail Behavior

  Background:
    Given I open url "http://ask-qa.portnov.com/#/registration"
    Then I should see page title as "Assessment Control @ Portnov"
    When I type "Preeti" into element with xpath "//*[@formcontrolname='firstName']"
    And I type "Kul" into element with xpath "//*[@formcontrolname='lastName']"
    And I type "abc" into element with xpath "//*[@formcontrolname='group']"
    And I type "12345" into element with xpath "//*[@formcontrolname='password']"
    And I type "12345" into element with xpath "//*[@formcontrolname='confirmPassword']"

  @smoke @email1
  Scenario: EmailRegistration happy path
    When I type "preeti.k@test.com" into element with xpath "//*[@formcontrolname='email']"
    And I wait for 2 sec
    Then I click on element with xpath "//button[@type='submit']"
    Then I wait for element with xpath "//ac-registration-confirmation-page" to be present
    And element with xpath "//h4[normalize-space()='You have been Registered.']" should contain text "You have been Registered."

  @smoke @email3
  Scenario:EmailRegistration Email is required
    When I type "" into element with xpath "//*[@formcontrolname='email']"
    And I wait for 2 sec
    Then I click on element with xpath "//button[@type='submit']"
    And element with xpath "//mat-error" should be displayed
    Then element with xpath "//mat-error" should contain text "This field is required"

  @smoke @email2
  Scenario:EmailRegistration White spaces not allowed
    When I type "preeti k@test.com" into element with xpath "//*[@formcontrolname='email']"
    And I wait for 2 sec
    Then I click on element with xpath "//button[@type='submit']"
    And element with xpath "//mat-error" should be displayed
    Then element with xpath "//mat-error" should contain text "Should be a valid email address"

  @smoke @email4
  Scenario Outline: EmailRegistration negative scenarios
    When I type <text> into element with xpath <xpath>
    And I wait for <sec> sec
    Then I click on element with xpath "//button[@type='submit']"
    And I wait for 1 sec
      #Then element with xpath "//mat-error" should be displayed
    Then element with xpath <xpath1> should contain text <text1>
    Examples:
      | text                | xpath                           | sec                    |xpath1 | text1|
        # 1 is space before @
      | "preetik y@test.com" | "//*[@formcontrolname='email']" | 1                     |"//mat-error"| "Should be a valid email address"|
        #2 is 64 characters after @ - supposed to error out but does not
      | "eiuwejqhwejkqwehqwjkehqwjkehqwheqjwkheqjwehjqwjkqhekjqewe@ghfgfffggffkjhkfghjkfjkfjkjfhkkjhkfjhkfgjkjkfjghwqekkj.tcs"            | "//*[@formcontrolname='email']" | 4   | "//mat-error" | "Should be a valid email address" |
        #3 is 65 characters before @ - supposed to error out but does not
      | "jhgjhgjhhi87675653fghgjlj989787gljerwjjwleiejkrkjqwejwqy3@wejwejkqwehqwjkehqwjkehqwheqjwkheqjwehjqwjkqhekjqwhqkehqw.tdt"         | "//*[@formcontrolname='email']" | 4   | "//mat-error" | "Should be a valid email address" |
        #4 is space after @
      | "preetik@te st.com"                                                                                                               | "//*[@formcontrolname='email']" | 4   | "//mat-error" | "Should be a valid email address" |
          #5 is valid email 129 characters -- should error out but does not error out
      | "yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy@tst.gut" | "//*[@formcontrolname='email']" | 0   | "//mat-error" | "Should be a valid email address" |
        # 6 is missing @ symbol
      | "preetiktest.com"                                                                                                                 | "//*[@formcontrolname='email']" | 4   | "//mat-error" | "Should be a valid email address" |
        # 7 is missing domain -- should not error out but erroring out
      | "testk@"                                                                                                                          | "//*[@formcontrolname='email']" | 4   | "//mat-error" | "Should be a valid email address" |
        # 8 is missing dot in the domain -- should error out but does not error out
      | "preetiky@testcom"                                                                                                                | "//*[@formcontrolname='email']" | 4   | "//mat-error" | "Should be a valid email address" |
     # 9 is missing top level domain - APR26-279
      | "preetiky@testcom" | "//*[@formcontrolname='email']" | 4   |"//mat-error"| "Should be a valid email address"                    |




  @smoke @emailtests
  Scenario Outline: EmailRegistration happy path tests
    When I type <text> into element with xpath "//*[@formcontrolname='email']"
    Examples:
      | text |
      |"preeti.k@abc.com"|
      |" A"             |
      |"jhgjhgjhhi87675653fghgjjlj989787gljerwjjwle;ejkrkjqwejwqkjlkqwje@wejqhwejkqwehqwjkehqwjkehqwheqjwkheqjwehjqwjkqhekjqwhjqkehqwhwe"               |
      |"preet_K@anc.com"                                                                                                                                |
      |"preetik@gnb.com"                                                                                                                            |
      |"preeti.t@test.exam.com"                                                                                                                     |
      |"preeti!@#$%^&*()'.,_+@test.com"|
