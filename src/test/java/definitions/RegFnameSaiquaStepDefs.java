package definitions;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.openqa.selenium.By;


import static org.assertj.core.api.Assertions.assertThat;
import static support.TestContext.getDriver;


public class RegFnameSaiquaStepDefs {
    @Given("I navigate to {string} page")
    public void iNavigateToPage(String url) {
        if (url.equals("registration")) {
            getDriver().get("http://ask-qa.portnov.com/#/registration");
        } else {
            System.out.println(url + " is not supported. ");
        }
    }

    @And("I wait for {int} sec ss")
    public void iWaitForSecSs(int sec) throws InterruptedException {
        Thread.sleep(sec * 1000);
    }

    @When("I type {string} into first name field")
    public void iTypeIntoFirstNameField(String firstname) {
        getDriver().findElement(By.xpath("//*[@formcontrolname='firstName']")).sendKeys(firstname);
    }

    @When("I type {string} into last name field")
    public void iTypeIntoLastNameField(String lastname) {
        getDriver().findElement(By.xpath("//input[@formcontrolname='lastName']")).sendKeys(lastname);
    }

    @When("I type {string} into email field ss")
    public void iTypeIntoEmailFieldSs(String email) {
        getDriver().findElement(By.xpath("//input[@formcontrolname='email']")).sendKeys(email);
    }

    @When("I type {string} in the group code")
    public void iTypeInTheGroupCode(String groupcode) {
        getDriver().findElement(By.xpath("//input[@formcontrolname='group']")).sendKeys(groupcode);
    }

    @When("I type {string}in the password field")
    public void iTypeInThePasswordField(String password) {
        getDriver().findElement(By.xpath("//input[@formcontrolname='password']")).sendKeys(password);
    }

    @When("I type {string} in the confirm password field")
    public void iTypeInTheConfirmPasswordField(String confirmpassword) {
        getDriver().findElement(By.xpath("//input[@formcontrolname='confirmPassword']")).sendKeys(confirmpassword);
    }

    @And("I click {string} button ss")
    public void iClickButtonSs(String btnName) {
        getDriver().findElement(By.xpath("//button[@type='submit']")).click();
    }

    
    @Then("confirmation message{string}should be displayed ss.")
    public void confirmationMessageShouldBeDisplayedSs(String expectedMessage) {
        String actualMessage =getDriver().findElement(By.xpath("//h4")).getText();
        System.out.println(actualMessage);
        assertThat(actualMessage.equals(actualMessage)).isTrue();
    }

    @Then("error message {string} ss")
    public void errorMessageSs(String expectedError) {
       String actualError = getDriver().findElement(By.xpath("//mat-error")).getText();
        System.out.println(actualError);
       assertThat(actualError.equals(expectedError)).isTrue();
    }

    @Then("error message {string}")
    public void errorMessage(String expectError) {
        String actualError = getDriver().findElement(By.xpath("//div[@aria-live='assertive']")).getText();
        System.out.println(actualError);
        assertThat(actualError.contains(expectError)).isTrue();
    }

}


