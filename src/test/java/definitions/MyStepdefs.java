package definitions;

import io.cucumber.java.en.When;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;

import static support.TestContext.getDriver;



public class MyStepdefs {
    @When("I remove text from element with xpath {string}")
    public void iRemoveTextFromElementWithXpath(String xpath) {
        getDriver().findElement(By.xpath(xpath)).sendKeys(Keys.BACK_SPACE);
        getDriver().findElement(By.xpath(xpath)).sendKeys(Keys.BACK_SPACE);
        getDriver().findElement(By.xpath(xpath)).sendKeys(Keys.BACK_SPACE);
    }
}
