package definitions;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import java.sql.*;

import org.junit.Before;
import org.openqa.selenium.chrome.ChromeDriver;

import static org.assertj.core.api.Assertions.assertThat;
import static support.TestContext.getDriver;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class PortnovStepdefs {
    // Connection object
    static Connection con = null;
    // Statement object
    private static Statement stmt;
    // Constant for Database URL
    public static String DB_URL = "ask-qa.portnov.com";
    //Database Username
    public static String DB_USER = "testuser";
    // Database Password
    public static String DB_PASSWORD = "password";


    @Before
    public void setUp() throws Exception {
        try{
            // Database connection
            String dbClass = "ask-qa.portnov.com";
            Class.forName(dbClass).newInstance();
            // Get connection to DB
            DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            // Statement object to send the SQL statement to the Database
            stmt = con.createStatement();
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }

    @Given("Open the {string} page")
    public void openThePage(String url) {
        getDriver().get(url);
    }

    @Then("Title should be {string}")
    public void titleShouldBe(String title) {
        assertThat(getDriver().getTitle()).isEqualTo(title);
    }

    @And("Element with xpath {string} should be present")
    public void elementWithXpathShouldBePresent(String xpath) {
        assertThat(getDriver().findElements(By.xpath(xpath)).stream().anyMatch(WebElement::isDisplayed)).isTrue();
    }

    @When("Type {string} into element with xpath {string}")
    public void typeIntoElementWithXpath(String text, String xpath) {
        getDriver().findElement(By.xpath(xpath)).sendKeys(text);
    }

    @Then("Click on element with xpath {string}")
    public void clickOnElementWithXpath(String xpath) {
        getDriver().findElement(By.xpath(xpath)).click();




    }

    @Then("Verify forgot-password")
    public void verifyForgotPassword() {
        // Database connection variables
        String jdbcURL = "jdbc:mysql://ask-qa.portnov.com:3308/application"; // Replace 'yourDatabaseName' with the actual name of the database
        String dbUsername = "testuser";
        String dbPassword = "password";

        try {
            // Step 1: Establish a database connection
            Connection connection = DriverManager.getConnection(jdbcURL, dbUsername, dbPassword);
            System.out.println("Database connected!");

            // Step 2: Create a statement
            Statement statement = connection.createStatement();
            System.out.println("Statement Created");
            // Step 3: Execute a query
            String query = "SELECT activationCode FROM users WHERE email = 'aleksfilin@btcmod.com';";
            ResultSet resultSet = statement.executeQuery(query);
            System.out.println("SQuery sent");

            // Step 4: Process the results
            while (resultSet.next()) {
                String activationCode = resultSet.getString("activationCode");
                String url = "http://ask-qa.portnov.com/#/reset-password/15361/" + activationCode;
                System.out.println("Activation Code: " + activationCode);
                getDriver().get(url); // Navigating to the URL in the browser
            }

            // Close resources
            resultSet.close();
            statement.close();
            connection.close();
            System.out.println("Database connection closed.");

        } catch (Exception e) {
            e.printStackTrace(); // Print exception details
            System.out.println("Error connecting to the database or executing query.");
        }
    }

    @And("Element with xpath {string} should not be present")
    public void elementWithXpathShouldNotBePresent(String xpath) {
        assertThat(getDriver().findElements(By.xpath(xpath)).stream().anyMatch(WebElement::isDisplayed)).isFalse();
    }

    @And("Url should be {string}")
    public void urlShouldBe(String url) {
        assertThat(getDriver().getCurrentUrl()).isEqualTo(url);
    }
}