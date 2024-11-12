@password

Feature: Settings: Teacher - Change Password

  @password2
  Scenario Outline: Change password with different inputs
    Given I open url "http://ask-qa.portnov.com"
    When I type "ronj66@meta68.xyz" into element with xpath "//input[@formcontrolname='email']"
    When I type <Current_Password> into element with xpath "//input[@formcontrolname='password']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for 3 sec
    Then element with xpath "//mat-list[@class='mat-list']//p" should contain text "TEACHER"
    When I click on element with xpath "//h5[contains(text(),'Settings')]"
    And I click on element with xpath "//div[@class='right']//button[span[text()='Change Your Password']]"
    And I wait for 1 sec
    Then element with xpath "//h1[@id='mat-dialog-title-0']" should contain text "Changing Password"
    When I type <Current_Password> into element with xpath "//div[@class='mat-dialog-content']//input[@placeholder='Password']"
    And I type <New_Password> into element with xpath "//div[@class='mat-dialog-content']//input[@placeholder='New Password']"
    And I type <Confirm_Password> into element with xpath "//div[@class='mat-dialog-content']//input[@placeholder='Confirm New Password']"
    And I click on element with xpath "//div[@class='mat-dialog-actions']//span[text()='Change']"
    Then element with xpath <my_xpath> should contain text <Error_message>
    And I wait for 2 sec

    Examples:
      | Current_Password                    | New_Password                        | Confirm_Password                    | Error_message                       |  my_xpath                                             |
      | "password"                          | ""                                  | ""                                  | "This field is required"            |  "//mat-dialog-container//mat-form-field//mat-error" |
      | "password"                          | "ab c12"                            | "abc12"                             | "Whitespaces are not allowed"       |  "//mat-dialog-container//mat-form-field//mat-error" |
      | "password"                          | "abc12"                             | "ab c12"                            | "Whitespaces are not allowed"       |  "//mat-dialog-container//mat-form-field//mat-error" |
      | "password"                          | "abc12"                             | "12abc"                             | "Entered passwords should match"    |  "//mat-dialog-container//mat-form-field//mat-error" |
      | "password"                          | "1234"                              | "1234"                              | "Should be at least 5 characters"   |  "//mat-dialog-container//mat-form-field//mat-error" |
      | "password"                          | "12345"                             | "12345"                             | ""                                  |  "//mat-dialog-container//mat-form-field"            |
      | "12345"                             | "asdas8541a84dwdasd48a4wda64s8d4a"  | "asdas8541a84dwdasd48a4wda64s8d4a"  | ""                                  |  "//mat-dialog-container//mat-form-field"            |
      | "asdas8541a84dwdasd48a4wda64s8d4a"  | "asdas8541a84dwdasd48a4wda64s8d4a0" | "asdas8541a84dwdasd48a4wda64s8d4a0" | ""                                  |  "//mat-dialog-container//mat-form-field"            |
       # Password filed excepts more than 32 characters, Bug report: OCT24-620
      | "asdas8541a84dwdasd48a4wda64s8d4a0" | "パスワード"                           | "パスワード"                           | ""                                  |  "//mat-dialog-container//mat-form-field"            |
       # Password filed excepts none Alphanumeric & Special characters, Bug report: OCT24-621
      | "パスワード"                           | "!@#$%^&"                           | "!@#$%^&"                           | ""                                  |  "//mat-dialog-container//mat-form-field"            |