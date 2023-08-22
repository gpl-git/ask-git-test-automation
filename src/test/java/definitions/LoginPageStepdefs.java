package definitions;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import org.assertj.core.api.Assertions;
import org.openqa.selenium.By;
import org.openqa.selenium.support.ui.WebDriverWait;
import static org.assertj.core.api.Assertions.assertThat;
import static support.TestContext.getDriver;


public class LoginPageStepdefs {
    @Then("I enter my {string} address in the email field and {string} in the password field mm")
    public void iEnterMyAddressInTheEmailFieldAndInThePasswordFieldMm(String email, String pwd)
    {
        getDriver().findElement(By.xpath("//*[@formcontrolname='email']")).sendKeys(email);
        getDriver().findElement(By.xpath("//*[@formcontrolname='password']")).sendKeys(pwd);

    }


    @Given("I open Quiz Application to login to our assessment as student mm")
    public void iOpenQuizApplicationToLoginToOurAssessmentAsStudentMm()
    {
        getDriver().get("http://ask-qa.portnov.com/#/login");
    }

    @And("click on {string} button mm")
    public void clickOnButtonMm(String buttonname)
    {
        getDriver().findElement(By.xpath("//span[contains(text(),'"+buttonname+"')]")).click();
    }

  /*  @Then("I should successfully login to the student page. mm")
    public void iShouldSuccessfullyLoginToTheStudentPageMm()
    {

       String stu =getDriver().findElement(By.xpath("//*[@class='info']/p[contains(text(),'STUDENT')]")).getText();
        //String stu =getDriver().findElement(By.xpath("//*[@class='ng-star-inserted']/following::h4")).getText();
       //String stu=getDriver().findElement(By.xpath("//ac-side-menu/mat-list/header/div/p")).getText();

        //System.out.println("Heelo I am there");
        assertThat(stu).isEqualTo("STUDEN");
       System.out.println(stu);
    }*/


    @Then("I get a Authentication failed message mm")
    public void iGetAAuthenticationFailedMessageMm()
    {
        assertThat(getDriver().findElement(By.xpath("//simple-snack-bar[contains(text(),'Authentication failed')]")).isDisplayed()).isTrue();
        //new WebDriverWait(getDriver(), 5, 100).until(ExpectedConditions.presenceOfElementLocated(By.xpath("//simple-snack-bar[contains(text(), ‘Authentication failed’)]")));
    }

    @Then("I enter my {string} address in the email field")
    public void iEnterMyAddressInTheEmailField(String email)
    {
        getDriver().findElement(By.xpath("//*[@formcontrolname='email']")).sendKeys(email);
    }

    @Then("I click on password field")
    public void iClickOnPasswordField()
    {
        getDriver().findElement(By.xpath("//*[@formcontrolname='password']")).click();
    }

    @And("I get an error {string}")
    public void iGetAnError(String error)
    {
        String err=getDriver().findElement(By.xpath("//*[@id='mat-error-0']")).getText();
        assertThat(err).isEqualTo(error);
    }

    @Then("I should successfully login to the {string} page. mm")
    public void iShouldSuccessfullyLoginToThePageMm(String role) {
        String stu =getDriver().findElement(By.xpath("//*[@class='info']/p[contains(text(),"+role+")]")).getText();
        assertThat(stu).isEqualTo(role);
    }


    @And("I should get an error {string}")
    public void iShouldGetAnError(String error)
    {
        String err1=getDriver().findElement(By.xpath("//*[@class='mat-error ng-star-inserted']")).getText();
        assertThat(err1).isEqualTo(error);
    }

    @Then("password field needs to be masked")
    public void passwordFieldNeedsToBeMasked()
    {
        assertThat(getDriver().findElement(By.xpath("//*[@formcontrolname='password']")).getAttribute("type")).isEqualTo("password");
    }


}

