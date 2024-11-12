Feature: Quiz with SC Question - Text

  Background:
    Given I open url "http://ask-qa.portnov.com/"
    And I type "rayuhlig@starsect.net" into element with xpath "//input[@formcontrolname='email']"
    And I type "12345r" into element with xpath "//input[@formcontrolname='password']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for 3 sec
    When I click on element with xpath "//h5[contains(text(), 'Quizzes')]"
    And I wait for 3 sec
    When I click on element with xpath "//*[text()='Create New Quiz']"
    And I wait for 3 sec
    And I type "Natalia Quiz Test" into element with xpath "//input[@formcontrolname='name']"
    When I click on element with xpath "//mat-icon[contains(text(), 'add_circle')]/../../..//*[@type='button']"
    And I click on element with xpath "//mat-panel-title[contains(text(), 'Q1')]/../../..//*[contains(text(), 'Single-Choice')]"

  @quiz_sc_text1
  Scenario Outline: Quiz with SC Question - Text - min 1 character allowed
    When I type <question> into element with xpath "//mat-panel-title[contains(text(), 'Q1')]/../../..//*[@formcontrolname='question']"
    And I wait for 3 sec
    And I type <option1> into element with xpath "//*[@placeholder='Option 1*']"
    And I wait for 3 sec
    And I type <option2> into element with xpath "//*[@placeholder='Option 2*']"
    And I wait for 3 sec
    And I click on element with xpath "//*[@placeholder='Option 1*']//ancestor::mat-radio-group//mat-radio-button"
    And I click on element with xpath "//span[contains(text(), 'Save')]"
    And I wait for 3 sec
    Then element with xpath "//mat-panel-title[contains(text(), 'Natalia Quiz Test')]" should be displayed
    And I wait for 3 sec
#    to delete a quiz
    When I click on element with xpath "//mat-panel-title[contains(text(), 'Natalia Quiz Test')]"
    And I wait for 3 sec
    And I click on element with xpath "//mat-panel-title[contains(text(), 'Natalia Quiz Test')]/../../..//*[text()='Delete']"
    And I wait for 3 sec
    And I click on element with xpath "//ac-modal-confirmation/..//*[text()='Delete']"
    And I wait for 3 sec
    Then element with xpath "//mat-panel-title[contains(text(), 'Natalia Quiz Test')]" should not be present
    Examples:
      |question |option1|option2|
      | "A"     | "B"   | "C"   |

  @quiz_sc_text2
  Scenario Outline: Quiz with SC Question - Text - max 1000 character allowed
    When I type <question> into element with xpath "//mat-panel-title[contains(text(), 'Q1')]/../../..//*[@formcontrolname='question']"
    And I wait for 3 sec
    And I type <option1> into element with xpath "//*[@placeholder='Option 1*']"
    And I wait for 3 sec
    And I type <option2> into element with xpath "//*[@placeholder='Option 2*']"
    And I wait for 3 sec
    And I click on element with xpath "//*[@placeholder='Option 1*']//ancestor::mat-radio-group//mat-radio-button"
    And I click on element with xpath "//span[contains(text(), 'Save')]"
    And I wait for 3 sec
    Then element with xpath "//mat-panel-title[contains(text(), 'Natalia Quiz Test')]" should be displayed
    And I wait for 3 sec
#    to delete a quiz
    When I click on element with xpath "//mat-panel-title[contains(text(), 'Natalia Quiz Test')]"
    And I wait for 3 sec
    And I click on element with xpath "//mat-panel-title[contains(text(), 'Natalia Quiz Test')]/../../..//*[text()='Delete']"
    And I wait for 3 sec
    And I click on element with xpath "//ac-modal-confirmation/..//*[text()='Delete']"
    And I wait for 3 sec
    Then element with xpath "//mat-panel-title[contains(text(), 'Natalia Quiz Test')]" should not be present
    Examples:
      |question |option1|option2|
      |"Dic0LFo6ETK3GiHaJqJJWibp5LL1VleFZactmE0YVbIJOXpcmaqFUeYGGgZb0JgOZvKPxKLSQT9ayraV6O8qwOvAULu6lSzia0HT28ZxdUJuOSdDgEK9oUCsFWHJ74BwSDoEf2IaQjfXbnvblY4hsCwtjU4JhcG5Eb8i7GpIKqdxG4oaUrgahmwEkIiAB2AfOzPWLxwZXBraqXJcy8UVcjG8W02PZTc2vgX2r6NmL5FpdlNGbpH4xp0ujXFFxfRiZNomBtW4C4H4sbuL4bRdZs2UlATuOUrtOYNO2dSH0SrPkl3LNOCgw8JXbS83uwBugPydjEZ4A8hXz7Pv1gxuFziBsECLNb4jWhafvQtrlLYtGShJTTeuiHpKxJZCvRHhv42SNpheEBC7jvoN4yDLO39KWeyOBls9yzpAsGx8H2jW6TpNmHrmyfdcXOK7AV9swSitenybHlPqLhdVt5CosaJKfjSLzDn8sBN20JScNbAmPDyXqWRsn1OEa7T9GnR6rSoyfjTNQzO7u1yxl2QVJ23Vu97XgZCLyRhHYxfERH1CrYXweHL9rG0rpzEZBRPl3gIsrf77hthE1ZwUFP3qyC2bPk0gCCHKs2tBKAdzbrQZ8gQUzo1rodRX3ehEj4L1P0cSksF3EimPA6b86By8kympryFw8SS3nq8W4ngcAhgjdl8DUV8f7PMlxFVbtMvSmeJc3HjJ7D1ddv6zjclc6WVYRz9KjbrqzsY7pqfcwmBIP9P3VFqFX31CSw8VP3AQnsqNziYzlOQ1SgNVLdOcKrxcNjuqMO3z6CRjAtDthMPYMbhUvAQgOwnGOQGm8i2p7n3XLiDhyUvS6PJCaXiX8OVdKCwBwWYpcPfNF1JtLSZOQLhf4pufcVztkOfHCQQbcOQUWbcBmxiUmYko0xn6dK3woyXGrFtHQ5eJG8WhbsxgB1Fh3kz97lJA8SRyMZDkDommN9h7txHq8z7jA4KYM2xUBRYK2pM8mljuzAfb"|  "Dic0LFo6ETK3GiHaJqJJWibp5LL1VleFZactmE0YVbIJOXpcmaqFUeYGGgZb0JgOZvKPxKLSQT9ayraV6O8qwOvAULu6lSzia0HT28ZxdUJuOSdDgEK9oUCsFWHJ74BwSDoEf2IaQjfXbnvblY4hsCwtjU4JhcG5Eb8i7GpIKqdxG4oaUrgahmwEkIiAB2AfOzPWLxwZXBraqXJcy8UVcjG8W02PZTc2vgX2r6NmL5FpdlNGbpH4xp0ujXFFxfRiZNomBtW4C4H4sbuL4bRdZs2UlATuOUrtOYNO2dSH0SrPkl3LNOCgw8JXbS83uwBugPydjEZ4A8hXz7Pv1gxuFziBsECLNb4jWhafvQtrlLYtGShJTTeuiHpKxJZCvRHhv42SNpheEBC7jvoN4yDLO39KWeyOBls9yzpAsGx8H2jW6TpNmHrmyfdcXOK7AV9swSitenybHlPqLhdVt5CosaJKfjSLzDn8sBN20JScNbAmPDyXqWRsn1OEa7T9GnR6rSoyfjTNQzO7u1yxl2QVJ23Vu97XgZCLyRhHYxfERH1CrYXweHL9rG0rpzEZBRPl3gIsrf77hthE1ZwUFP3qyC2bPk0gCCHKs2tBKAdzbrQZ8gQUzo1rodRX3ehEj4L1P0cSksF3EimPA6b86By8kympryFw8SS3nq8W4ngcAhgjdl8DUV8f7PMlxFVbtMvSmeJc3HjJ7D1ddv6zjclc6WVYRz9KjbrqzsY7pqfcwmBIP9P3VFqFX31CSw8VP3AQnsqNziYzlOQ1SgNVLdOcKrxcNjuqMO3z6CRjAtDthMPYMbhUvAQgOwnGOQGm8i2p7n3XLiDhyUvS6PJCaXiX8OVdKCwBwWYpcPfNF1JtLSZOQLhf4pufcVztkOfHCQQbcOQUWbcBmxiUmYko0xn6dK3woyXGrFtHQ5eJG8WhbsxgB1Fh3kz97lJA8SRyMZDkDommN9h7txHq8z7jA4KYM2xUBRYK2pM8mljuzAfb"|  "Dic0LFo6ETK3GiHaJqJJWibp5LL1VleFZactmE0YVbIJOXpcmaqFUeYGGgZb0JgOZvKPxKLSQT9ayraV6O8qwOvAULu6lSzia0HT28ZxdUJuOSdDgEK9oUCsFWHJ74BwSDoEf2IaQjfXbnvblY4hsCwtjU4JhcG5Eb8i7GpIKqdxG4oaUrgahmwEkIiAB2AfOzPWLxwZXBraqXJcy8UVcjG8W02PZTc2vgX2r6NmL5FpdlNGbpH4xp0ujXFFxfRiZNomBtW4C4H4sbuL4bRdZs2UlATuOUrtOYNO2dSH0SrPkl3LNOCgw8JXbS83uwBugPydjEZ4A8hXz7Pv1gxuFziBsECLNb4jWhafvQtrlLYtGShJTTeuiHpKxJZCvRHhv42SNpheEBC7jvoN4yDLO39KWeyOBls9yzpAsGx8H2jW6TpNmHrmyfdcXOK7AV9swSitenybHlPqLhdVt5CosaJKfjSLzDn8sBN20JScNbAmPDyXqWRsn1OEa7T9GnR6rSoyfjTNQzO7u1yxl2QVJ23Vu97XgZCLyRhHYxfERH1CrYXweHL9rG0rpzEZBRPl3gIsrf77hthE1ZwUFP3qyC2bPk0gCCHKs2tBKAdzbrQZ8gQUzo1rodRX3ehEj4L1P0cSksF3EimPA6b86By8kympryFw8SS3nq8W4ngcAhgjdl8DUV8f7PMlxFVbtMvSmeJc3HjJ7D1ddv6zjclc6WVYRz9KjbrqzsY7pqfcwmBIP9P3VFqFX31CSw8VP3AQnsqNziYzlOQ1SgNVLdOcKrxcNjuqMO3z6CRjAtDthMPYMbhUvAQgOwnGOQGm8i2p7n3XLiDhyUvS6PJCaXiX8OVdKCwBwWYpcPfNF1JtLSZOQLhf4pufcVztkOfHCQQbcOQUWbcBmxiUmYko0xn6dK3woyXGrFtHQ5eJG8WhbsxgB1Fh3kz97lJA8SRyMZDkDommN9h7txHq8z7jA4KYM2xUBRYK2pM8mljuzAfb"|

  @quiz_sc_text3
  Scenario Outline: Quiz with SC Question - Text - special characters allowed
    When I type <question> into element with xpath "//mat-panel-title[contains(text(), 'Q1')]/../../..//*[@formcontrolname='question']"
    And I wait for 3 sec
    And I type <option1> into element with xpath "//*[@placeholder='Option 1*']"
    And I wait for 3 sec
    And I type <option2> into element with xpath "//*[@placeholder='Option 2*']"
    And I wait for 3 sec
    And I click on element with xpath "//*[@placeholder='Option 1*']//ancestor::mat-radio-group//mat-radio-button"
    And I click on element with xpath "//span[contains(text(), 'Save')]"
    And I wait for 3 sec
    Then element with xpath "//mat-panel-title[contains(text(), 'Natalia Quiz Test')]" should be displayed
    And I wait for 3 sec
#    to delete a quiz
    When I click on element with xpath "//mat-panel-title[contains(text(), 'Natalia Quiz Test')]"
    And I wait for 3 sec
    And I click on element with xpath "//mat-panel-title[contains(text(), 'Natalia Quiz Test')]/../../..//*[text()='Delete']"
    And I wait for 3 sec
    And I click on element with xpath "//ac-modal-confirmation/..//*[text()='Delete']"
    And I wait for 3 sec
    Then element with xpath "//mat-panel-title[contains(text(), 'Natalia Quiz Test')]" should not be present
    Examples:
      |question                        |option1                           |option2                          |
      |"!#$%&'()*+,-./:;<=>?@[\]^_`{}~"|"!#$%&'()*+,-./:;<=>?@[\]^_`{}~"  |"!#$%&'()*+,-./:;<=>?@[\]^_`{}~" |

  @quiz_sc_text4
  Scenario Outline: Quiz with SC Question - Text - Delete Question
    When I type <question> into element with xpath "//mat-panel-title[contains(text(), 'Q1')]/../../..//*[@formcontrolname='question']"
    And I wait for 3 sec
    And I type <option1> into element with xpath "//*[@placeholder='Option 1*']"
    And I wait for 3 sec
    And I type <option2> into element with xpath "//*[@placeholder='Option 2*']"
    And I wait for 3 sec
    And I click on element with xpath "//*[@placeholder='Option 1*']//ancestor::mat-radio-group//mat-radio-button"
    And I wait for 3 sec
    And I click on element with xpath "//span[contains(text(), 'Delete Question')]/ancestor::button"
    And I click on element with xpath "//span[contains(text(), 'Delete')]/ancestor::button[@aria-label='Close dialog']"
    And I wait for 3 sec
    Then element with xpath "//mat-panel-title[contains(text(), 'Q1')]/../../..//*[@formcontrolname='question']" should not be present
    Examples:
      |question  |option1     |option2     |
      |"Question"|  "Answer 1"|  "Answer 2"|
      |    ""    |      ""    |     ""     |

# Negative testing
  @quiz_sc_text5
  Scenario Outline: Quiz with SC Question - Text - empty field
    When I type <question> into element with xpath "//mat-panel-title[contains(text(), 'Q1')]/../../..//*[@formcontrolname='question']"
    And I wait for 3 sec
    And I type <option1> into element with xpath "//*[@placeholder='Option 1*']"
    And I wait for 3 sec
    And I type <option2> into element with xpath "//*[@placeholder='Option 2*']"
    And I wait for 3 sec
    And I click on element with xpath "//*[@placeholder='Option 1*']//ancestor::mat-radio-group//mat-radio-button"
    And I click on element with xpath "//span[contains(text(), 'Save')]"
    And I wait for 3 sec
    Then element with xpath "//mat-error[contains(text(), 'This field is required')]" should be displayed
    And I wait for 3 sec
    Examples:
      |question  |option1   |option2   |
      | ""       |"Answer 1"|"Answer 2"|
      |"Question"|  ""      |"Answer 2"|
      |"Question"|"Answer 1"|    ""    |

  @quiz_sc_text6
  Scenario Outline: Quiz with SC Question - Text - 1001 characters not allowed
    When I type <question> into element with xpath "//mat-panel-title[contains(text(), 'Q1')]/../../..//*[@formcontrolname='question']"
    And I wait for 3 sec
    And I type <option1> into element with xpath "//*[@placeholder='Option 1*']"
    And I wait for 3 sec
    And I type <option2> into element with xpath "//*[@placeholder='Option 2*']"
    And I wait for 3 sec
    And I click on element with xpath "//*[@placeholder='Option 1*']//ancestor::mat-radio-group//mat-radio-button"
    And I click on element with xpath "//span[contains(text(), 'Save')]"
    And I wait for 3 sec
    Then element with xpath "//mat-error[contains(text(), '1000')]" should be displayed
    And I wait for 3 sec
    Examples:
      |question |option1|option2|
#     Bug report - 1001 characters are allowed in Question, Option1, Option2 fields. Quiz was created
      |"Dic0LFo6ETK3GiHaJqJJWibp5LL1VleFZactmE0YVbIJOXpcmaqFUeYGGgZb0JgOZvKPxKLSQT9ayraV6O8qwOvAULu6lSzia0HT28ZxdUJuOSdDgEK9oUCsFWHJ74BwSDoEf2IaQjfXbnvblY4hsCwtjU4JhcG5Eb8i7GpIKqdxG4oaUrgahmwEkIiAB2AfOzPWLxwZXBraqXJcy8UVcjG8W02PZTc2vgX2r6NmL5FpdlNGbpH4xp0ujXFFxfRiZNomBtW4C4H4sbuL4bRdZs2UlATuOUrtOYNO2dSH0SrPkl3LNOCgw8JXbS83uwBugPydjEZ4A8hXz7Pv1gxuFziBsECLNb4jWhafvQtrlLYtGShJTTeuiHpKxJZCvRHhv42SNpheEBC7jvoN4yDLO39KWeyOBls9yzpAsGx8H2jW6TpNmHrmyfdcXOK7AV9swSitenybHlPqLhdVt5CosaJKfjSLzDn8sBN20JScNbAmPDyXqWRsn1OEa7T9GnR6rSoyfjTNQzO7u1yxl2QVJ23Vu97XgZCLyRhHYxfERH1CrYXweHL9rG0rpzEZBRPl3gIsrf77hthE1ZwUFP3qyC2bPk0gCCHKs2tBKAdzbrQZ8gQUzo1rodRX3ehEj4L1P0cSksF3EimPA6b86By8kympryFw8SS3nq8W4ngcAhgjdl8DUV8f7PMlxFVbtMvSmeJc3HjJ7D1ddv6zjclc6WVYRz9KjbrqzsY7pqfcwmBIP9P3VFqFX31CSw8VP3AQnsqNziYzlOQ1SgNVLdOcKrxcNjuqMO3z6CRjAtDthMPYMbhUvAQgOwnGOQGm8i2p7n3XLiDhyUvS6PJCaXiX8OVdKCwBwWYpcPfNF1JtLSZOQLhf4pufcVztkOfHCQQbcOQUWbcBmxiUmYko0xn6dK3woyXGrFtHQ5eJG8WhbsxgB1Fh3kz97lJA8SRyMZDkDommN9h7txHq8z7jA4KYM2xUBRYK2pM8mljuzAfb1"|"Answer 1"|"Answer 2"|
      |"Question"|"Dic0LFo6ETK3GiHaJqJJWibp5LL1VleFZactmE0YVbIJOXpcmaqFUeYGGgZb0JgOZvKPxKLSQT9ayraV6O8qwOvAULu6lSzia0HT28ZxdUJuOSdDgEK9oUCsFWHJ74BwSDoEf2IaQjfXbnvblY4hsCwtjU4JhcG5Eb8i7GpIKqdxG4oaUrgahmwEkIiAB2AfOzPWLxwZXBraqXJcy8UVcjG8W02PZTc2vgX2r6NmL5FpdlNGbpH4xp0ujXFFxfRiZNomBtW4C4H4sbuL4bRdZs2UlATuOUrtOYNO2dSH0SrPkl3LNOCgw8JXbS83uwBugPydjEZ4A8hXz7Pv1gxuFziBsECLNb4jWhafvQtrlLYtGShJTTeuiHpKxJZCvRHhv42SNpheEBC7jvoN4yDLO39KWeyOBls9yzpAsGx8H2jW6TpNmHrmyfdcXOK7AV9swSitenybHlPqLhdVt5CosaJKfjSLzDn8sBN20JScNbAmPDyXqWRsn1OEa7T9GnR6rSoyfjTNQzO7u1yxl2QVJ23Vu97XgZCLyRhHYxfERH1CrYXweHL9rG0rpzEZBRPl3gIsrf77hthE1ZwUFP3qyC2bPk0gCCHKs2tBKAdzbrQZ8gQUzo1rodRX3ehEj4L1P0cSksF3EimPA6b86By8kympryFw8SS3nq8W4ngcAhgjdl8DUV8f7PMlxFVbtMvSmeJc3HjJ7D1ddv6zjclc6WVYRz9KjbrqzsY7pqfcwmBIP9P3VFqFX31CSw8VP3AQnsqNziYzlOQ1SgNVLdOcKrxcNjuqMO3z6CRjAtDthMPYMbhUvAQgOwnGOQGm8i2p7n3XLiDhyUvS6PJCaXiX8OVdKCwBwWYpcPfNF1JtLSZOQLhf4pufcVztkOfHCQQbcOQUWbcBmxiUmYko0xn6dK3woyXGrFtHQ5eJG8WhbsxgB1Fh3kz97lJA8SRyMZDkDommN9h7txHq8z7jA4KYM2xUBRYK2pM8mljuzAfb1"|"Answer 2"|
      |"Question"|"Answer 1"|"Dic0LFo6ETK3GiHaJqJJWibp5LL1VleFZactmE0YVbIJOXpcmaqFUeYGGgZb0JgOZvKPxKLSQT9ayraV6O8qwOvAULu6lSzia0HT28ZxdUJuOSdDgEK9oUCsFWHJ74BwSDoEf2IaQjfXbnvblY4hsCwtjU4JhcG5Eb8i7GpIKqdxG4oaUrgahmwEkIiAB2AfOzPWLxwZXBraqXJcy8UVcjG8W02PZTc2vgX2r6NmL5FpdlNGbpH4xp0ujXFFxfRiZNomBtW4C4H4sbuL4bRdZs2UlATuOUrtOYNO2dSH0SrPkl3LNOCgw8JXbS83uwBugPydjEZ4A8hXz7Pv1gxuFziBsECLNb4jWhafvQtrlLYtGShJTTeuiHpKxJZCvRHhv42SNpheEBC7jvoN4yDLO39KWeyOBls9yzpAsGx8H2jW6TpNmHrmyfdcXOK7AV9swSitenybHlPqLhdVt5CosaJKfjSLzDn8sBN20JScNbAmPDyXqWRsn1OEa7T9GnR6rSoyfjTNQzO7u1yxl2QVJ23Vu97XgZCLyRhHYxfERH1CrYXweHL9rG0rpzEZBRPl3gIsrf77hthE1ZwUFP3qyC2bPk0gCCHKs2tBKAdzbrQZ8gQUzo1rodRX3ehEj4L1P0cSksF3EimPA6b86By8kympryFw8SS3nq8W4ngcAhgjdl8DUV8f7PMlxFVbtMvSmeJc3HjJ7D1ddv6zjclc6WVYRz9KjbrqzsY7pqfcwmBIP9P3VFqFX31CSw8VP3AQnsqNziYzlOQ1SgNVLdOcKrxcNjuqMO3z6CRjAtDthMPYMbhUvAQgOwnGOQGm8i2p7n3XLiDhyUvS6PJCaXiX8OVdKCwBwWYpcPfNF1JtLSZOQLhf4pufcVztkOfHCQQbcOQUWbcBmxiUmYko0xn6dK3woyXGrFtHQ5eJG8WhbsxgB1Fh3kz97lJA8SRyMZDkDommN9h7txHq8z7jA4KYM2xUBRYK2pM8mljuzAfb1"|

  @quiz_sc_text7
  Scenario Outline: Quiz with SC Question - Text - Cyrillic characters not allowed
    When I type <question> into element with xpath "//mat-panel-title[contains(text(), 'Q1')]/../../..//*[@formcontrolname='question']"
    And I wait for 3 sec
    And I type <option1> into element with xpath "//*[@placeholder='Option 1*']"
    And I wait for 3 sec
    And I type <option2> into element with xpath "//*[@placeholder='Option 2*']"
    And I wait for 3 sec
    And I click on element with xpath "//*[@placeholder='Option 1*']//ancestor::mat-radio-group//mat-radio-button"
    And I click on element with xpath "//span[contains(text(), 'Save')]"
    And I wait for 3 sec
    Then element with xpath "//mat-error[contains(text(), 'latin')]" should be displayed
    And I wait for 3 sec
    Examples:
      |question                                                           |option1                                                           |option2                                                           |
#     Bug report - Cyrillic characters are allowed in Question, Option1, Option2 fields. Quiz was created
      |"АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдежзийклмнопрстуфхцчшщъыьэюя" |"Answer 1"                                                        |"Answer 2"                                                        |
      |"Question"                                                         |"АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдежзийклмнопрстуфхцчшщъыьэюя"|"Answer 2"                                                        |
      |"Question"                                                         |"Answer 1"                                                        |"АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдежзийклмнопрстуфхцчшщъыьэюя"|

#  Possible tests for characters:
#    "Greek characters"   |"ΑΒΓΔΕΖΗΘΙΚΛΜΝΞΟΠΡΣΤΥΦΧΨΩαβγδεζηθικλμνξοπρστυφχψω"|
#    "Chinese characters" |"你好中国人文化字"|
#    "Japanese characters"|"あいうえおかきくけこさしすせそ"|
#    "Arabic characters"  |"ابتثجحخدذرزسشصضطظعغفقكلمنهوي"|


  @quiz_sc_text8
  Scenario Outline: Quiz with SC Question - Text - only white space
    When I type <question> into element with xpath "//mat-panel-title[contains(text(), 'Q1')]/../../..//*[@formcontrolname='question']"
    And I wait for 3 sec
    And I type <option1> into element with xpath "//*[@placeholder='Option 1*']"
    And I wait for 3 sec
    And I type <option2> into element with xpath "//*[@placeholder='Option 2*']"
    And I wait for 3 sec
    And I click on element with xpath "//*[@placeholder='Option 1*']//ancestor::mat-radio-group//mat-radio-button"
    And I click on element with xpath "//span[contains(text(), 'Save')]"
    And I wait for 3 sec
    Then element with xpath "//mat-error[contains(text(), 'latin')]" should be displayed
    And I wait for 3 sec
    Examples:
      |question  |option1   |option2      |
# Bug report - Only white space is allowed in Question, Option1, Option2 fields. . Quiz was created
      |" "       |"Answer 1"| "Answer 2"  |
      |"Question"|   " "    | "Answer 2"  |
      |"Question"|"Answer 1"|    " "      |

