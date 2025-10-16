@reg @regression
Feature: Registration Demo - Password and Confirm Password

  Background:
    Given I open url "http://ask-qa.portnov.com/#/registration"
    Then I should see page title contains "Assessment Control"
    When I type "John" into element with xpath "//*[@formcontrolname='firstName']"
    And I type "Doe" into element with xpath "//*[@formcontrolname='lastName']"
    When I type "Spat1967@armyspy.co" into element with xpath "//*[@formcontrolname='email']"
    And I type "ASK-22" into element with xpath "//*[@formcontrolname='group']"


  @reg_fName @smoke
  Scenario: Registration - Password Happy Path
    When I type "123456" into element with xpath "//*[@formcontrolname='password']"
    And I type "123456" into element with xpath "//*[@formcontrolname='confirmPassword']"
    When I click on element with xpath "//*[@type='submit']"
    And I wait for element with xpath "//ac-registration-confirmation-page" to be present
    Then element with xpath "//h4" should be displayed
    Then element with xpath "//h4" should contain text "You have been Registered."
    And I wait for 3 sec

  @reg_password_positive
  Scenario Outline: Password - Positive Input  Outline
    When I type <password> into element with xpath "//*[@formcontrolname='password']"
    When I type <confirmPassword> into element with xpath "//*[@formcontrolname='confirmPassword']"
    When I click on element with xpath "//*[@type='submit']"
    And I wait for element with xpath "//ac-registration-confirmation-page" to be present
    Then element with xpath "//h4" should contain text <message>
    Examples:
      | password |confirmPassword|   message|

#      1.exactly min 5 characters
      | "Abcd1"               |"Abcd1"   |    "You have been Registered." |
      | "Abcd#123"            |"Abcd#123"| "You have been Registered." |

#      2.password limit 32 characters
      | "passwordlimitcheck@32passwordlim"    |"passwordlimitcheck@32passwordlim" | "You have been Registered." |

#      3.without characters only numbers and special characters
      | "12345@" |"12345@"|    "You have been Registered." |

#      4.only special characters within limit
      | "^&%@$%^&"      |"^&%@$%^&"   |    "You have been Registered." |

  #      5.only numbers within limit
      | "123456"      |"123456"   |    "You have been Registered." |


  @reg_password_confirmpassword_negative
  Scenario Outline: password and confirm password - Negative Input  Outline
    When I type <password> into element with xpath "//*[@formcontrolname='password']"
    When I type <confirmPassword> into element with xpath "//*[@formcontrolname='confirmPassword']"
    When I click on element with xpath "//*[@type='submit']"
    Then element with xpath "//mat-error[@class='mat-error ng-star-inserted']" should contain text <message1>
    And element with xpath "//mat-error[@class='mat-error ng-star-inserted']" should contain text <message2>
    Examples:
      |password|confirmPassword|message1|message2|

#      1.empty string
      |""|""|"This field is required"|"This field is required"|

#      2.password and confirm password contains space in between
      |"Test 123456"|"Test 123456"|"Whitespaces are not allowed"|"Whitespaces are not allowed"|

#      3.long password and confirm password more than 32 chracters
#   This is a known issue JIRA SEP25-SEP25-148
      |"passwordlimitcheck@32passwordlim!@34w4twt" |"passwordlimitcheck@32passwordlim!@34w4twt"|"enter 32 characters only"|"enter 32 characters only"|

#     4. one space only in password and confirm password
      | " "|" "| "Whitespaces are not allowed"|"Whitespaces are not allowed"|

#      5.less than min characters in password and confirm password
      |"abc"|"abc"|"Should be at least 5 characters"|"Should be at least 5 characters"|

#      6.leading space
      |" abc123"|" abc123"|"Whitespaces are not allowed"|"Whitespaces are not allowed"|

#  7.trailing space
      |"abc123 "|"abc123 "|"Whitespaces are not allowed"|"Whitespaces are not allowed"|

  @reg_Password_negative
  Scenario: no password - Negative Input
    When I type "" into element with xpath "//*[@formcontrolname='password']"
    When I type "Test1" into element with xpath "//*[@formcontrolname='confirmPassword']"
    When I click on element with xpath "//*[@type='submit']"
    Then element with xpath "//mat-error" should contain text "This field is required"


  @reg_confirm_negative
  Scenario: no confirm password - Negative Input
    When I type "Test1" into element with xpath "//*[@formcontrolname='password']"
    When I type "" into element with xpath "//*[@formcontrolname='confirmPassword']"
    When I click on element with xpath "//*[@type='submit']"
    Then element with xpath "//mat-error" should contain text "This field is required"

  @reg_Both_negative
  Scenario: passwords do not match
    When I type "12345" into element with xpath "//*[@formcontrolname='password']"
    When I type "123456" into element with xpath "//*[@formcontrolname='confirmPassword']"
    When I click on element with xpath "//*[@type='submit']"
    Then element with xpath "//mat-error" should contain text "Entered passwords should match"