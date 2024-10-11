@quiz_title

Feature: Quiz title
  Background:
    Given I open url "http://ask-qa.portnov.com/#/login"
    Then I should see page title contains "Portnov"
    When I type "ask_instr@aol.com" into element with xpath "//input[@formcontrolname='email']"
    And I type "ABC123" into element with xpath "//input[@formcontrolname='password']"
    When I click on element with xpath "//button[@type='submit']"
    And I wait for 1 sec
    When I click on element with xpath " //h5[contains(text(),'Quizzes')]"
    And I wait for 1 sec
    When I click on element with xpath "//span[text()='Create New Quiz']"
    And I wait for 1 sec

  @quiz_title1
  Scenario: Quiz title-alphanumeric and special characters
    When I type "Quiz 1 title with alphanumeric & special characters!!!" into element with xpath "//input[@formcontrolname='name']"
    And I click on element with xpath "//mat-icon[text()='add_circle']"
    And I click on element with xpath "//div[contains(text(),'Single-Choice')]"
    And I type "Q1" into element with xpath "//textarea[@formcontrolname='question']"
    And I type "Option1" into element with xpath "(//textarea[@formcontrolname='option'])[1]"
    And I type "Option2" into element with xpath "(//textarea[@formcontrolname='option'])[2]"
    And I click on element with xpath "(//div[@class='mat-radio-container'])[4]"
    When I click on element with xpath "//button/span[contains(text(),'Save')]"
    And I wait for element with xpath "//div[@class='quizzes']" to be present
    Then element with xpath "//div[@class='quizzes']" should contain text "Quiz 1 title with alphanumeric & special characters!!!"
    And I wait for 5 sec

  @quiz_title2
  Scenario: Quiz title-Minimum 1 character
    When I type "Q" into element with xpath "//input[@formcontrolname='name']"
    And I click on element with xpath "//mat-icon[text()='add_circle']"
    And I click on element with xpath "//div[contains(text(),'Single-Choice')]"
    And I type "Q1" into element with xpath "//textarea[@formcontrolname='question']"
    And I type "Option1" into element with xpath "(//textarea[@formcontrolname='option'])[1]"
    And I type "Option2" into element with xpath "(//textarea[@formcontrolname='option'])[2]"
    And I click on element with xpath "(//div[@class='mat-radio-container'])[4]"
    When I click on element with xpath "//button/span[contains(text(),'Save')]"
    And I wait for element with xpath "//div[@class='quizzes']" to be present
    Then element with xpath "//div[@class='quizzes']" should contain text "Q"
    And I wait for 5 sec

  @quiz_title3
  Scenario: Quiz title-Maximum 1000 characters
    When I type "jslfjfoegyhgpabiajsauejfllsaheojfljsjfjlsjliewofhsahfuoe7934080uljf7901upj1=akajguiajfiflkkjfasjsojlsjsjfjfeuejauoajljefuwuqjahihajldhfyowqjffoafjalufoufjuoujaoajajoualjouoajfoaojuaolajsouojlaohlshfyqjaoajquuojaljlamv;isbiusnbs[slgigigigjgjggjgsjgjgirgjnjlsfjljlwjdfowelfvjsulenlfjsvojflsmvljofleljjfljjdoweljldjfodsfjlsmdfsljljflsjlfjljsaljflsjfowjfjlsjfljlsjfljslajsdojfljfsljlfjosjsljlajosjfljljfasljfldjfljlsjfljfljlsdjflsjdfljlsajaljldsjlfjlsjdlsjflsdlfjlsdjfljslfjlsjfljlafjlsdjfljsdljflsajfldjlajlfdjlsjdlfjlsdjflsjlkajfldsjljfljsaljljfljslajflsjljalfjlsdjffljlfjlsjaljalfjlsjfljsafweljljdsfjsdmfldsjfljdslfjlsdjflsdjfljljflsjlkdsjljfljsdjlsfjlsdfuwjlsdfjmlskfjlsajdljfdsljffldsajfdseojlsdjlfjlsfjjlsdjflsjdfljsdljflsjdjsflsksljljflsjlfjljsaljflsjfowjfjlsjfljlsjfljslajsdojfljfsljlfjosjsljlajosjfljljfasljfldjfljlsjfljfljlsdjflsjdfljlsajaljldsjlfjlsjdlsjflsdlfjlsdjfljslfjlsjfljlafjlsdjfljsdljflsajfldjlajlfdjlsjdlfjlsdjflsjlkajfldsjljfljsaljljfljslajflsjljalfjlsdjffljlfjlsjaljalfjlsjfljsafwe" into element with xpath "//input[@formcontrolname='name']"
    And I wait for 3 sec
    And I click on element with xpath "//mat-icon[text()='add_circle']"
    And I wait for 2 sec
    And I click on element with xpath "//div[contains(text(),'Single-Choice')]"
    And I wait for 2 sec
    And I type "Q1" into element with xpath "//textarea[@formcontrolname='question']"
    And I type "Option1" into element with xpath "(//textarea[@formcontrolname='option'])[1]"
    And I type "Option2" into element with xpath "(//textarea[@formcontrolname='option'])[2]"
    And I wait for 2 sec
    And I click on element with xpath "(//div[@class='mat-radio-container'])[4]"
    And I wait for 2 sec
    When I click on element with xpath "//button/span[contains(text(),'Save')]"
    And I wait for element with xpath "//div[@class='quizzes']" to be present
    And I wait for 3 sec
    Then element with xpath "//div[@class='quizzes']" should contain text "jslfjfoegyhgpabiajsauejfllsaheojfljsjfjlsjliewofhsahfuoe7934080uljf7901upj1=akajguiajfiflkkjfasjsojlsjsjfjfeuejauoajljefuwuqjahihajldhfyowqjffoafjalufoufjuoujaoajajoualjouoajfoaojuaolajsouojlaohlshfyqjaoajquuojaljlamv;isbiusnbs[slgigigigjgjggjgsjgjgirgjnjlsfjljlwjdfowelfvjsulenlfjsvojflsmvljofleljjfljjdoweljldjfodsfjlsmdfsljljflsjlfjljsaljflsjfowjfjlsjfljlsjfljslajsdojfljfsljlfjosjsljlajosjfljljfasljfldjfljlsjfljfljlsdjflsjdfljlsajaljldsjlfjlsjdlsjflsdlfjlsdjfljslfjlsjfljlafjlsdjfljsdljflsajfldjlajlfdjlsjdlfjlsdjflsjlkajfldsjljfljsaljljfljslajflsjljalfjlsdjffljlfjlsjaljalfjlsjfljsafweljljdsfjsdmfldsjfljdslfjlsdjflsdjfljljflsjlkdsjljfljsdjlsfjlsdfuwjlsdfjmlskfjlsajdljfdsljffldsajfdseojlsdjlfjlsfjjlsdjflsjdfljsdljflsjdjsflsksljljflsjlfjljsaljflsjfowjfjlsjfljlsjfljslajsdojfljfsljlfjosjsljlajosjfljljfasljfldjfljlsjfljfljlsdjflsjdfljlsajaljldsjlfjlsjdlsjflsdlfjlsdjfljslfjlsjfljlafjlsdjfljsdljflsajfldjlajlfdjlsjdlfjlsdjflsjlkajfldsjljfljsaljljfljslajflsjljalfjlsdjffljlfjlsjaljalfjlsjfljsafwe"
    And I wait for 5 sec

  @quiz_title4
  Scenario: Quiz title-Maximum 1000+1 characters
    When I type "ajslfjfoegyhgpabiajsauejfllsaheojfljsjfjlsjliewofhsahfuoe7934080uljf7901upj1=akajguiajfiflkkjfasjsojlsjsjfjfeuejauoajljefuwuqjahihajldhfyowqjffoafjalufoufjuoujaoajajoualjouoajfoaojuaolajsouojlaohlshfyqjaoajquuojaljlamv;isbiusnbs[slgigigigjgjggjgsjgjgirgjnjlsfjljlwjdfowelfvjsulenlfjsvojflsmvljofleljjfljjdoweljldjfodsfjlsmdfsljljflsjlfjljsaljflsjfowjfjlsjfljlsjfljslajsdojfljfsljlfjosjsljlajosjfljljfasljfldjfljlsjfljfljlsdjflsjdfljlsajaljldsjlfjlsjdlsjflsdlfjlsdjfljslfjlsjfljlafjlsdjfljsdljflsajfldjlajlfdjlsjdlfjlsdjflsjlkajfldsjljfljsaljljfljslajflsjljalfjlsdjffljlfjlsjaljalfjlsjfljsafweljljdsfjsdmfldsjfljdslfjlsdjflsdjfljljflsjlkdsjljfljsdjlsfjlsdfuwjlsdfjmlskfjlsajdljfdsljffldsajfdseojlsdjlfjlsfjjlsdjflsjdfljsdljflsjdjsflsksljljflsjlfjljsaljflsjfowjfjlsjfljlsjfljslajsdojfljfsljlfjosjsljlajosjfljljfasljfldjfljlsjfljfljlsdjflsjdfljlsajaljldsjlfjlsjdlsjflsdlfjlsdjfljslfjlsjfljlafjlsdjfljsdljflsajfldjlajlfdjlsjdlfjlsdjflsjlkajfldsjljfljsaljljfljslajflsjljalfjlsdjffljlfjlsjaljalfjlsjfljsafwe" into element with xpath "//input[@formcontrolname='name']"
    And I wait for 3 sec
    And I click on element with xpath "//mat-icon[text()='add_circle']"
    And I wait for 2 sec
    And I click on element with xpath "//div[contains(text(),'Single-Choice')]"
    And I wait for 2 sec
    And I type "Q1" into element with xpath "//textarea[@formcontrolname='question']"
    And I type "Option1" into element with xpath "(//textarea[@formcontrolname='option'])[1]"
    And I type "Option2" into element with xpath "(//textarea[@formcontrolname='option'])[2]"
    And I wait for 2 sec
    And I click on element with xpath "(//div[@class='mat-radio-container'])[4]"
    And I wait for 2 sec
    When I click on element with xpath "//button/span[contains(text(),'Save')]"
    And I wait for element with xpath "//div[@class='quizzes']" to be present
    And I wait for 3 sec
    Then element with xpath "//div[@class='quizzes']" should not contain text "ajslfjfoegyhgpabiajsauejfllsaheojfljsjfjlsjliewofhsahfuoe7934080uljf7901upj1=akajguiajfiflkkjfasjsojlsjsjfjfeuejauoajljefuwuqjahihajldhfyowqjffoafjalufoufjuoujaoajajoualjouoajfoaojuaolajsouojlaohlshfyqjaoajquuojaljlamv;isbiusnbs[slgigigigjgjggjgsjgjgirgjnjlsfjljlwjdfowelfvjsulenlfjsvojflsmvljofleljjfljjdoweljldjfodsfjlsmdfsljljflsjlfjljsaljflsjfowjfjlsjfljlsjfljslajsdojfljfsljlfjosjsljlajosjfljljfasljfldjfljlsjfljfljlsdjflsjdfljlsajaljldsjlfjlsjdlsjflsdlfjlsdjfljslfjlsjfljlafjlsdjfljsdljflsajfldjlajlfdjlsjdlfjlsdjflsjlkajfldsjljfljsaljljfljslajflsjljalfjlsdjffljlfjlsjaljalfjlsjfljsafweljljdsfjsdmfldsjfljdslfjlsdjflsdjfljljflsjlkdsjljfljsdjlsfjlsdfuwjlsdfjmlskfjlsajdljfdsljffldsajfdseojlsdjlfjlsfjjlsdjflsjdfljsdljflsjdjsflsksljljflsjlfjljsaljflsjfowjfjlsjfljlsjfljslajsdojfljfsljlfjosjsljlajosjfljljfasljfldjfljlsjfljfljlsdjflsjdfljlsajaljldsjlfjlsjdlsjflsdlfjlsdjfljslfjlsjfljlafjlsdjfljsdljflsajfldjlajlfdjlsjdlfjlsdjflsjlkajfldsjljfljsaljljfljslajflsjljalfjlsdjffljlfjlsjaljalfjlsjfljsafwe"
    And I wait for 3 sec

  @quiz_title5
  Scenario: Quiz title-Leading and trailing space characters to be eliminated when Quiz is saved in the List of Quizzes
    When I type "    Quiz-with-spaces   " into element with xpath "//input[@formcontrolname='name']"
    And I click on element with xpath "//mat-icon[text()='add_circle']"
    And I click on element with xpath "//div[contains(text(),'Single-Choice')]"
    And I type "Q1" into element with xpath "//textarea[@formcontrolname='question']"
    And I type "Option1" into element with xpath "(//textarea[@formcontrolname='option'])[1]"
    And I type "Option2" into element with xpath "(//textarea[@formcontrolname='option'])[2]"
    And I click on element with xpath "(//div[@class='mat-radio-container'])[4]"
    When I click on element with xpath "//button/span[contains(text(),'Save')]"
    Then element with xpath "//mat-panel-title[contains(text(),'    Quiz-with-spaces   ')]" should be displayed
    When I click on element with xpath "//mat-panel-title[contains(text(),'    Quiz-with-spaces   ')]"
    When I click on element with xpath "//mat-panel-title[contains(text(),'Madhu Demo TQ - SS')]/../../..//*[text()='Delete']"
    And I click on element with xpath "//ac-modal-confirmation/..//*[text()='Delete']"

