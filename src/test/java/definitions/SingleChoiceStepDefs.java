package definitions;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.apache.commons.lang3.RandomStringUtils;
import org.openqa.selenium.By;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.WebElement;

import java.util.List;
import static support.TestContext.getDriver;


public class SingleChoiceStepDefs {
    @Given("I open {string} page")

    public void iOpenPage(String url) {
        if (url.equals("login")) {
            getDriver().get("http://ask-qa.portnov.com/#/login");
        } else if (url.equals("registration")) {
            getDriver().get("http://ask-qa.portnov.com/#/registration");
        } else {
            System.out.printf(url + " is not supported.");
        }
    }

    @And("I wait for {int} sec")
    public void iWaitForSec(int sec) throws InterruptedException {
        Thread.sleep(sec * 1000);
    }

    @When("I type {string} into email field")
    public void iTypeIntoEmailField(String email) {
        getDriver().findElement(By.xpath("//*[@formcontrolname='email']")).sendKeys(email);
    }

    @When("I type {string} into password field")
    public void iTypeIntoPasswordField(String password) {
        getDriver().findElement(By.xpath("//*[@formcontrolname='password']")).sendKeys(password);
    }

    @And("I click {string} button")
    public void iClickButton(String btnName) {
        getDriver().findElement(By.xpath("//span[contains(text(),'" + btnName + "')]")).click();
    }

    @When("I click {string} menu item")
    public void iClickMenuItem(String menuItem) {
        getDriver().findElement(By.xpath("//h5[contains(text(),'" + menuItem + "')]")).click();
    }

    @When("I type {string} as quiz name")
    public void iTypeQuizName(String quizTitle) {
        getDriver().findElement(By.xpath("//*[@formcontrolname='name']")).sendKeys(quizTitle);
    }

    @And("I add a question")
    public void iAddAQuestion() {
        getDriver().findElement(By.xpath("//mat-icon[text()='add_circle']")).click();
    }

    @When("I select {string} question")
    public void iSelectQuestion(String questionType) {
        getDriver().findElement(By.xpath("//div[contains(text(), '" + questionType + "')]//preceding-sibling::div")).click();
    }


    @When("I type {string} into question field of {string}")
    public void iTypeIntoQuestionFieldOf(String questionText, String questionNum) {
        getDriver().findElement(By.xpath("//mat-panel-title[contains(text(), '" + questionNum + "')]/following::textarea[@formcontrolname='question']")).sendKeys(questionText);

    }

    @And("I type {string} into {string} option field of {string}")
    public void iTypeIntoOptionFieldOf(String optionText, String optionNum, String questionNum) {
        getDriver().findElement(By.xpath("//mat-panel-title[contains(text(), '" + questionNum + "')]//following::textarea[@placeholder='" + optionNum + "*']")).sendKeys(optionText);
    }

    @And("I add option")
    public void iAddOption() {
        getDriver().findElement(By.xpath("//span[contains(text(), 'Add Option')]")).click();
    }

    @And("I select {string} as a correct option in {string}")
    public void iSelectAsACorrectOptionIn(String optionNum, String questionNum) {
        getDriver().findElement(By.xpath(" //mat-panel-title[contains(text(), '" + questionNum + "')]//following::textarea[@placeholder='" + optionNum + "*']//ancestor::mat-form-field/preceding-sibling::mat-radio-button")).click();
    }

    @When("I click on {string} gear button")
    public void iClickOnGearButton(String optionNum) {
        getDriver().findElement(By.xpath("//textarea[@placeholder='" + optionNum + "*']//following::button//*[contains(text(), 'settings')]")).click();
    }

    @Then("button is enabled")
    public void buttonIsEnabled() {
        boolean btnDisabled = false;
        String actualAttribute = getDriver().findElement(By.xpath("//span[text()='Delete Option']")).getAttribute("disabled");
        assert (actualAttribute.equals(String.valueOf(btnDisabled)));
    }

    @And("I delete the option")
    public void iDeleteTheOption() {
        getDriver().findElement(By.xpath("//span[text()='Delete Option']")).click();
    }

    @Then("button is disabled")
    public void buttonIsDisabled() {
        boolean btnDisabled = true;
        String actualAttribute = getDriver().findElement(By.xpath("//span[text()='Delete Option']")).getAttribute("disabled");
        assert (actualAttribute.equals(String.valueOf(btnDisabled)));
    }

    @And("I exit gear menu")
    public void iExitGearMenu() {
        getDriver().findElement(By.xpath("//mat-icon[text()='clear']")).click();
    }

    @Then("{string} is displayed on the list of quizzes")
    public void isDisplayedOnTheListOfQuizzes(String quizTitle) {
        List<WebElement> titles = getDriver().findElements(By.xpath("mat-panel-title"));
        for (WebElement title : titles) {
            if (title.getText().contains(quizTitle)) {
                title.isDisplayed();
            }
        }
    }

    @And("I click on the quiz {string}")
    public void iClickOnTheQuiz(String quizTitle) {
        getDriver().findElement(By.xpath("//mat-panel-title[contains(text(),'" + quizTitle + "')]")).click();
    }

    @And("I click delete {string} quiz")
    public void iClickDeleteQuiz(String quizTitle) {
        getDriver().findElement(By.xpath("//mat-panel-title[contains(text(), '" + quizTitle + "')]//ancestor::mat-expansion-panel-header//following-sibling::div//button/span[text()='Delete']")).click();
        getDriver().findElement(By.xpath("//ac-modal-confirmation/div/button/*[contains(text(), 'Delete')]")).click();
    }


    @Then("text {string} appears in {string} option field")
    public void textAppearsInOptionField(String optionText, String optionField) {
        String actualField = getDriver().findElement(By.xpath("//textarea[@placeholder='" + optionField + "*']")).getText();
        assert (actualField.equalsIgnoreCase(optionText));
    }

    @And("I add {int} more options in {string}")
    public void iAddMoreOptionsIn(int numberOfOptions, String questionNum) {
        for (int i = 3; i <= numberOfOptions; i++) {
            getDriver().findElement(By.xpath("//span[contains(text(), 'Add Option')]")).click();
            getDriver().findElement(By.xpath("//mat-panel-title[contains(text(), '" + questionNum + "')]//following::textarea[@placeholder='Option " + i + "*']")).sendKeys("Option " + i);
        }
    }


    @Then("the quiz preview should contain {string}")
    public void theQuizPreviewShouldContain(String numOptions) {
        assert (getDriver().findElement(By.xpath("//ac-quiz-preview//*[contains(text(), '" + numOptions + "')]")).isDisplayed());
    }


    @And("I {string} the quiz {string}")
    public void iTheQuiz(String btnPreview, String quizTitle) {
        getDriver().findElement(By.xpath("//mat-panel-title[contains(text(), '" + quizTitle + "')]//ancestor::mat-expansion-panel-header//following-sibling::div//button/span[text()='" + btnPreview + "']")).click();

    }

    @Then("the quiz preview should not contain {string}")
    public void theQuizPreviewShouldNotContain(String numOptions) {
        List<WebElement> options = getDriver().findElements(By.xpath("//ac-quiz-preview"));
        for (WebElement option : options) {
        if (option.getText().contains(numOptions)) {
            assert option.isDisplayed();
        }
      }
    }

    @Then("options error messages should be displayed")
    public void optionsErrorMessagesShouldBeDisplayed() {
        assert(getDriver().findElement(By.xpath("//mat-error"))).isDisplayed();
    }

    @Then("options error messages should say {string}")
    public void optionsErrorMessagesShouldSay(String optionsErrorMessage) {
    String actualErrorMessage = (getDriver().findElement(By.xpath("//mat-error")).getText());
    assert (actualErrorMessage.equals(optionsErrorMessage));
    }

    @Then("options should only contain {string} and {string}")
    public void optionsShouldOnlyContainAnd(String a, String b) {
        List<WebElement>optionText = getDriver().findElements(By.xpath("//ac-quiz-preview//mat-radio-button"));
        assert (String.valueOf(optionText).equals(a));
        assert (String.valueOf(optionText).equals(b));

      }

    @And("I type {int} characters into {string} option field of {string}")
    public void iTypeCharactersIntoOptionFieldOf(int num, String optionNum, String questionNum) {
        boolean useLetters = true;
        boolean useNumbers = true;
       String generatedString = RandomStringUtils.random(num, useLetters, useNumbers);
        getDriver().findElement(By.xpath("//mat-panel-title[contains(text(), '" + questionNum + "')]//following::textarea[@placeholder='" + optionNum + "*']")).sendKeys(generatedString);

    }

    @Then("Option {int} should contain {int} characters")
    public void optionShouldContainCharacters(int optionNum, int expectedSize) {
     int actualSize = getDriver().findElement(By.xpath("//ac-quiz-preview//mat-radio-button[1]")).getText().length();
        System.out.println(actualSize);
        assert (actualSize == expectedSize);
    }
}







