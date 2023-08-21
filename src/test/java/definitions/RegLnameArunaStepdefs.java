package definitions;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.apache.maven.surefire.shared.lang3.RandomStringUtils;
import org.openqa.selenium.By;

import static org.assertj.core.api.Assertions.assertThat;
import static support.TestContext.getDriver;

public class RegLnameArunaStepdefs {

    @When("I type {string} into first name field")
    public void iTypeIntoFirstNameField(String fname) {
        getDriver().findElement(By.xpath("//*[@formcontrolname = 'firstName']")).sendKeys(fname);
    }
    @When("I type {string} into last name field")
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

    @And("I type {string} into the email field")
    public void iTypeIntoTheEmailField(String email) {
        getDriver().findElement(By.xpath("//*[@formcontrolname='email']")).sendKeys(email);
    }

    @Then("Registration confirmation msg {string} should be displayed")
    public void registrationConfirmationMsgShouldBeDisplayed(String msg) {
        String confMsg = getDriver().findElement(By.xpath("//h4")).getText();
        System.out.println(confMsg);
        assertThat(confMsg.equals(msg)).isTrue();
    }

    @Then("Error msg {string} should be displayed")
    public void errorMsgShouldBeDisplayed(String expErrmsg) {
        String actErrmsg = getDriver().findElement(By.xpath("//mat-error")).getText();
        System.out.println(actErrmsg);
        assertThat(actErrmsg.equals(expErrmsg)).isTrue();
    }

    @When("I type {int} characters into last name field")
    public void iTypeCharactersIntoLastNameField(int numOfchars) {
        Boolean useLetters = true;
        Boolean useNumbers = true;
        String genString = RandomStringUtils.random(numOfchars, useLetters, useNumbers);
        System.out.println(genString);
        getDriver().findElement(By.xpath("//*[@formcontrolname = 'lastName']")).sendKeys(genString);
    }
}