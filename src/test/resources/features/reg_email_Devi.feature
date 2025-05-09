reg_demo
Feature: Registration -demo

  Background:
    Given I open url "http://ask-qa.portnov.com/#/registration"
    When I type "Johnathan12" into element with xpath "//input[@formcontrolname='firstName']"
    When I type "Fredd12" into element with xpath "//input[@formcontrolname='lastName']"
   #When I type "reg22@x1y1z2.com" into element with xpath "//input[@formcontrolname='email']"
    When I type "KKK22" into element with xpath "//input[@formcontrolname='group']"
    When I type "test123" into element with xpath "//input[@formcontrolname='password']"
    When I type "test123" into element with xpath "//input[@formcontrolname='confirmPassword']"

  @email_Valid_Invalid
  Scenario Outline: Reg email - Positive/Negative
    When I type <text> into element with xpath "//input[@formcontrolname='email']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for 5 sec
    Then element with xpath <xpath2> should be displayed
    Then element with xpath <xpath2> should contain text <message>
    Examples:
      | text                                                                                                                                | xpath2                                                               | message                   |
       #1.1 182 Alpha numberic numbers special charaters
      |"dv-name123@domain.org"                                                                                                             | "//h4"                                                               | "You have been Registered." |
      #1.2. 185 Email 127 fails issue APR25-189
      |"ABCDEFGHIJABCDEFGHIJABCDEFGHIJABCABCABCDEFGHIJABCDEFGHIJABCDEFGH@ABCDEFGHIJABCDEFGHIJABCDEFGHIJABCABCABCDEFGHIJABCDEFGHI127.com"   | "//h4"                                                               | "You have been Registered." |
      #1.3. 190 Email 128
      |"ABCDEFGHIJABCDEFGHIJABCDEFGHIJABCABCABCDEFGHIJABCDEFGHIJABCDEFGH@ABCDEFGHIJABCDEFGHIJABCDEFGHIJABCABCABCDEFGHIJABCDEFGHIJ128.com"  | "//h4"                                                               | "You have been Registered." |
      #1.4  205 Local = 64, Domain = 1, TLD = 2
      |"ABCDEFGHIJABCDEFGHIJABCDEFGHIJABCABCABCDEFGHIJABCDEFGHIJABCDEFGH@l.co"                                                             | "//h4"                                                               | "You have been Registered." |
      #1.5. 200 Local=1, Domain=63, Top level =2
      |"A@ABCDEFGHIJABCDEFGHIJABCDEFGHIJABCABCABCDEFGHIJABCDEFGHIJABCDE63.ok"                                                              | "//h4"                                                               | "You have been Registered." |
      #1.6. 208 Local = 1, Domain = 1, TLD 63
      |"c@l.ABCDEFGHIJABCDEFGHIJABCDEFGHIJABCABCABCDEFGHIJABCDEFGHIJABCDEFG"                                                               | "//h4"                                                               | "You have been Registered." |
      #1.7.213 local =6, domain = 10
      |"local6@domain10aa"                                                                                                                 | "//h4"                                                               | "You have been Registered." |
 #1.8.201 local = 63, domain = 1, TLD =1
      |"ABCDEFGHIJABCDEFGHIJABCDEFGHIJABCABCABCDEFGHIJABCDEFGHIJABCDE63@a.c"                                                               | "//h4"                                                               | "You have been Registered." |
      #1.9 Local=65, Domain=63, TLD=0
      |"ABCDEFGHIJABCDEFGHIJABCDEFGHIJABCABCABCDEFGHIJABCDEFGHIJABCDEFGH@ABCDEFGHIJABCDEFGHIJABCDEFGHIJABCABCABCDEFGHIJABCDEFGHIJABCDEFG"  | "//h4"                                                               | "You have been Registered." |
      #1.10 Alpha numberic numbers special charaters
      |"abc@abc   "                                                                                                                        | "//*[@role='alert' and text() =  'Should be a valid email address']" | "Should be a valid email address"|
      #1.11. 183 Email cant be empty
      | " "                                                                                                                                 | "//*[@role='alert']" | "This field is required"|
       #1.12. 184 White spaces
      |"abc@abc "                                                                                                                          | "//*[@role='alert' and text() =  'Should be a valid email address']" | "Should be a valid email address"|
      #1.13.210 local = 1, Domain = 1, TLD =64
      |"c@l.ABCDEFGHIJABCDEFGHIJABCDEFGHIJABCABCABCDEFGHIJABCDEFGHIJABCDEFGH"                                                              | "//*[@role='alert' and text() =  'Should be a valid email address']" | "Should be a valid email address" |
      #1.14 #211 local = 0, Domain =0, TLD =64
      |".ABCDEFGHIJABCDEFGHIJABCDEFGHIJABCABCABCDEFGHIJABCDEFGHIJABCDEFGH"                                                                 | "//*[@role='alert' and text() =  'Should be a valid email address']" | "Should be a valid email address"|
      #1.15
      |"ABCDEFGHIJABCDEFGHIJABCDEFGHIJABCABCABCDEFGHIJABCDEFGHIJABCDEFGHI@local65.com"                                                     | "//*[@role='alert' and text() =  'Should be a valid email address']" | "Should be a valid email address"|
      # 1.16 203 Local=65, domain = 20, TLD =3
      |"ABCDEFGHIJABCDEFGHIJABCDEFGHIJABCABCABCDEFGHIJABCDEFGHIJABCDEFG65@domain20domain20abcd.com"                                        | "//*[@role='alert' and text() =  'Should be a valid email address']" | "Should be a valid email address"|
      #1.17 206 local= 1, domain = 64, TLD = 2
      | "d@ABCDEFGHIJABCDEFGHIJABCDEFGHIJABCABCABCDEFGHIJABCDEFGHIJABCDEFGH.co "                                                            | "//*[@role='alert' and text() =  'Should be a valid email address']" | "Should be a valid email address"|
      #1.18  193 Email 129
      | "ABCDEFGHIJABCDEFGHIJABCDEFGHIJABCABCABCDEFGHIJABCDEFGHIJABCDEFGH@ABCDEFGHIJABCDEFGHIJABCDEFGHIJABCABCABCDEFGHIJABCDEFGHIJK129.com" | "//simple-snack-bar"                                                 | "Data too long for column 'email' at row 1"|

