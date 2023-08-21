package definitions;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;
import static support.TestContext.getDriver;

public class QuizTotalQuestonsPSvStepDefs {
    @Given("I open {string} page ps")
    public void iOpenPagePs(String url) {
        if (url.equals("login")) {
            getDriver().get("http://ask-qa.portnov.com/#/login");
        } else if (url.equals("registration")) {
            getDriver().get("http://ask-qa.portnov.com/#/registration");
        } else {
            System.out.printf(url + " is not supported.");
        }
    }

    @When("I type {string} into {string} field ps")
    public void iTypeIntoFieldPs(String email, String field) {
        getDriver().findElement(By.xpath("//*[@formcontrolname='" + field + "']")).sendKeys(email);
    }

    @And("I click {string} button ps")
    public void iClickButtonPs(String btnName) {
        getDriver().findElement(By.xpath("//span[contains(text(),'" + btnName + "')]")).click();
    }

    @When("I click {string} menu item ps")
    public void iClickMenuItemPs(String menuItem) {
        getDriver().findElement(By.xpath("//h5[contains(text(),'" + menuItem + "')]")).click();
    }

    @And("I wait for {int} sec ps")
    public void iWaitForSecPs(int sec) throws InterruptedException {
        Thread.sleep(sec * 1000);
    }

    @When("I type {string} as quiz name ps")
    public void iTypeAsQuizNamePs(String quizTitle) {
        getDriver().findElement(By.xpath("//*[@formcontrolname='name']")).sendKeys(quizTitle);
    }

    @And("I add a question ps")
    public void iAddAQuestionPs() {
        getDriver().findElement(By.xpath("//mat-icon[text()='add_circle']")).click();
    }

    @Then("Error message {string} should be displayed ps")
    public void errorMessageShouldBeDisplayedPs(String text) {
        getDriver().findElement(By.xpath("//*[contains(text(),'" + text + "')]"));
    }

    @When("I select {string} question in {string} ps")
    public void iSelectQuestionInPs(String questionType, String questionNum) {
        getDriver().findElement(By.xpath("//mat-panel-title[contains(text(),'" + questionNum + "')]/../../..//*[contains(text(),'" + questionType + "')]")).click();
    }

    @When("I type {string} into question field of {string} ps")
    public void iTypeIntoQuestionFieldOfPs(String questionText, String questionNum) {
        getDriver().findElement(By.xpath("//mat-panel-title[contains(text(),'" + questionNum + "')]/../../..//*[@formcontrolname='question']")).sendKeys(questionText);
    }

    @Then("{string} is displayed on the list of quizzes ps")
    public void isDisplayedOnTheListOfQuizzesPs(String quizTitle) {
        List<WebElement> titles = getDriver().findElements(By.xpath("mat-panel-title"));
        for (WebElement title : titles) {
            if (title.getText().contains(quizTitle)) {
                title.isDisplayed();
            }
        }
    }

    @And("I delete {string} ps")
    public void iDeletePs(String quizTitle) {
        getDriver().findElement(By.xpath("//mat-panel-title[contains(text(),'"+quizTitle+"')]")).click();
        getDriver().findElement(By.xpath("//mat-panel-title[contains(text(),'"+quizTitle+"')]/../../..//span[contains(text(),'Delete')]")).click();
        getDriver().findElement(By.xpath("//*[@class='mat-dialog-actions']//*[contains(text(),'Delete')]")).click();
    }

    @And("{string} should contain {string} ps")
    public void shouldContainPs(String quizTitle, String numQuestions) {
        String actualText = getDriver().findElement(By.xpath("//mat-panel-title[contains(text(),'"+quizTitle+"')]/../..//mat-panel-description")).getText();
        assertThat(actualText).containsIgnoringCase(numQuestions);
    }

    @And("{string} should contain {string} in Panel of the Quiz ps")
    public void shouldContainInPanelOfTheQuizPs(String quizTitle, String numQuestions) {
        String actualText = getDriver().findElement(By.xpath("//mat-panel-title[contains(text(),'"+quizTitle+"')]/../../..//*[contains(text(),'Total Questions')]/..")).getText();
        assertThat(actualText).containsIgnoringCase(numQuestions);
    }

    @When("I click on {string} in the list of Quizzes ps")
    public void iClickOnInTheListOfQuizzesPs(String quizTitle) {
        getDriver().findElement(By.xpath("//mat-panel-title[contains(text(),'"+quizTitle+"')]")).click();
    }

    @And("I add {int} Textual questions ps")
    public void iAddTextualQuestionsPs(int num) throws InterruptedException {
        for (int i = 1; i <= num; i++) {
            getDriver().findElement(By.xpath("//mat-icon[contains(text(),'add_circle')]")).click();
                    Thread.sleep(1000);
            getDriver().findElement(By.xpath("//*[contains(text(),'Q" + i + "')]/../../..//*[contains(text(),'Textual')]")).click();
                    String xpath = "//*[contains(text(),'Q" + i + "')]/../../..//*[@placeholder='Question *']";
                    getDriver().findElement(By.xpath(xpath)).sendKeys("Question " + i);
        }
    }

    @Then("{string} assignment should contain {string} questions ps")
    public void assignmentShouldContainQuestionsPs(String assignmentName, String numQuestions) {
        String actualText = getDriver().findElement(By.xpath("//td[contains(text(),'"+assignmentName+"')]/..//td[contains(text(),'"+numQuestions+"')]")).getText();
        assertThat(actualText).containsIgnoringCase(numQuestions);}
}

