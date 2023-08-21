package definitions;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.apache.maven.surefire.shared.lang3.RandomStringUtils;
import org.openqa.selenium.By;

import static org.assertj.core.api.Assertions.assertThat;
import static support.TestContext.getDriver;

public class RegStepDefs {

    @When("I type {string} into first name field")
    public void iTypeIntoFirstNameField(String fname) {
        getDriver().findElement(By.xpath("//*[@formcontrolname = 'firstName']")).sendKeys(fname);
    }
    @When("I type {string} into  last name field")
    public void iTypeIntoLastNameField(String lname) {
        getDriver().findElement(By.xpath("//*[@formcontrolname = 'lastName']")).sendKeys(lname);
    }

    @And("I type {string} into group code field")
    public void iTypeIntoGroupCodeField(String grpcode) {
        getDriver().findElement(By.xpath("//*[@formcontrolname = 'group']")).sendKeys(grpcode);
    }

    @Then("I type {string} into confirm password field")
    public void iTypeIntoConfirmPasswordField(String confirmpswd) {
        getDriver().findElement(By.xpath("//*[@formcontrolname = 'confirmPassword']")).sendKeys(confirmpswd);
    }

    @Then("error message {string}")
    public void errorMessage(String expectedError) {
        String actualError = getDriver().findElement(By.xpath("//mat-error")).getText();
        System.out.println(actualError);
        assertThat(actualError.equals(expectedError)).isTrue();
    }

    @Then("confirmation message {string} should be displayed")
    public void confirmationMessageShouldBeDisplayed(String expMessage) {
        String actMessage = getDriver().findElement(By.xpath("//h4")).getText();
        System.out.println(actMessage);
        assertThat(actMessage.equals(expMessage)).isTrue();
    }

    @When("I type {int} characters into last name field")
    public void iTypeCharactersIntoLastNameField(int num) {
        boolean useLetters =true;
        boolean useNumbers = true;
        String generatedString = RandomStringUtils.random(num, useLetters, useNumbers);
        System.out.println(generatedString);
        getDriver().findElement(By.xpath("//*[@formcontrolname = 'lastName']")).sendKeys(generatedString);
    }
}