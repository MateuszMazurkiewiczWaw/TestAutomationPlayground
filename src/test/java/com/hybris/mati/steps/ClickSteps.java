package com.hybris.mati.steps;

import static com.hybris.functions.ClickFunctions.clickIn;
import static com.hybris.functions.MainFunctions.waitForElementInSection;
import static com.hybris.functions.MainFunctions.waitForNSeconds;
import static com.hybris.utils.PageMapper.getRequiredPage;

import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.StaleElementReferenceException;
import org.openqa.selenium.WebDriverException;
import org.openqa.selenium.WebElement;

import com.hybris.functions.BrowserFunctions;
import com.hybris.functions.ClickFunctions;
import com.hybris.functions.MainFunctions;
import com.hybris.mati.pages.WebshopPages.WebshopMainPage;
import com.hybris.utils.Buffer;
import com.hybris.utils.Log;
import com.hybris.utils.Page;
import com.hybris.utils.Tools;
import com.hybris.utils.WebDriverProvider;
import static org.apache.commons.lang3.StringUtils.containsIgnoreCase;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.When;

/**
 * ClickSteps class contains Cucumber step definitions for steps related to WebElement interaction (clicks).
 * @author Mateusz Mazurkiewicz
 * @see ClickFunctions
 */
public class ClickSteps {

    /**
     *  Clicks the specified field in the given section of the page.
     * @param pageName      name of the page containing the section
     * @param sectionName   name of the section containing the field
     * @param fieldName     name of the field to be clicked
     * @see ClickFunctions#clickIn(String, String)
     */
    @When("^(.+): In (section|element) ([^ ]+) click ([^ ]+)$")
    public void clickInSection(String pageName,  String fieldType, String sectionName, String elementName) {
    	waitForElementInSection(pageName, sectionName, elementName);
    	if (elementName.equals("MONTHLY_FEE_LEARN_MORE_BUTTON") || elementName.equals("ONE_TIME_LEARN_MORE_BUTTON") || 
    			elementName.equals("YEARLY_FEE_LEARN_MORE_BUTTON") || elementName.equals("CLASS_FILTERBAR")){
    		int offsetX = 0; // top left corner
    		int offsetY = 0; // top left corner
    		switch (elementName){
    		case "MONTHLY_FEE_LEARN_MORE_BUTTON":
    			offsetX = 130;
    			offsetY = 26; // works for element size: (285, 55)
    			break;
    		case "ONE_TIME_LEARN_MORE_BUTTON":
    			offsetX = 200;
    			offsetY = 26;
    			break;
    		case "YEARLY_FEE_LEARN_MORE_BUTTON":
    			offsetX = 120;
    			offsetY = 26;
    			break;
    		case "CLASS_FILTERBAR":
    			offsetX = 50;
    			offsetY = 25;
    			break;
    		}
    		ClickFunctions.clickElementWithOffset(getRequiredPage(pageName).getFieldsWebElementFromSection(sectionName, elementName), offsetX, offsetY);
    	} else {
    		try {
    			getRequiredPage(pageName).getFieldsWebElementFromSection(sectionName, elementName).click();
        	} catch (WebDriverException webDriverException){
        		if (pageName.contains("Checkout")){
        			MainFunctions.waitForElementDisappear("Checkout Delivery Page", "PAGE_LOADING_INDICATOR"); // same locator on every Checkout page
        			getRequiredPage(pageName).getFieldsWebElementFromSection(sectionName, elementName).click();
        		} else {
        			throw webDriverException;
        		}
        	}	
    	}
    	
    	if (elementName.equals("USE_MY_LOCATION_BUTTON")){
    		verifyLocation(pageName);
    	} else if (pageName.contains("Checkout")){
			MainFunctions.waitForElementDisappear("Checkout Delivery Page", "PAGE_LOADING_INDICATOR"); // same locator on every Checkout page
        }
    }
    
    
    @And("^(.+): Click outside of (section|element) ([^ ]+)$")
    public void clickOutsideOfSectionOrElement(String pageName, String sectionElement, String elementName){
    	ClickFunctions.clickElementWithOffset(getRequiredPage(pageName).getFieldWebElementsValue(elementName), -50, -50);
    }
    
    @And("^(.+): If (chat|call back) is open then in section ([^ ]+) click (.+)$")
    public void clickElementInSectionConditional(String pageName, String condition, String sectionName, String elementName){
    	switch (condition){
    		case ("chat"):
    			if (Tools.isChatOpen()){
    				waitForElementInSection(pageName, sectionName, elementName);
    				getRequiredPage(pageName).getFieldsWebElementFromSection(sectionName, elementName).click();
    			} else {
    				Log.logInfo("Chat is currently closed. Skipping step.");
    			}
    		break;
       		case ("call back"):
    			if (Tools.isChatOpen()){
    				waitForElementInSection(pageName, sectionName, elementName);
    				getRequiredPage(pageName).getFieldsWebElementFromSection(sectionName, elementName).click();
    			} else {
    				Log.logInfo("Call back is currently closed. Skipping step.");
    			}
    		break;
    	}  	
    }
    
    @When("^(.+): On ([^ ]+) click (product|category) (.+)$")
    public void clickItemOnList(String pageName, String listName, String productCategory, String itemName) {
    	itemName = Tools.getEnvironmentTestData(itemName);
    	MainFunctions.waitForElement(pageName, listName);
    	By itemLocator = WebshopMainPage.getProductOrCategoryOnListLocator(itemName);
    	getRequiredPage(pageName).getField(listName).getWebElement().findElement(itemLocator).click();
    	
    	if (listName.equals("PRODUCT_OR_CATEGORY_LIST")){
    		MainFunctions.waitForElementDisappear(pageName, "PRODUCT_OR_CATEGORY_LOADING_INDICATOR");
    	}
    }
    
    @And("^(.+): If section ([^ ]+) contains text (.+) click ([^ ]+) else click (.+)$")
    public void conditionalClicking(String pageName, String sectionName, String desiredText, String trueElement, String falseElement){
    	desiredText = Tools.getEnvironmentTestData(desiredText);
    	String actualText = getRequiredPage(pageName).getField(sectionName).getWebElement().getText();
    	if (containsIgnoreCase(actualText, desiredText)){
    		getRequiredPage(pageName).getFieldsWebElementFromSection(sectionName, trueElement).click();
    	} else {
    		getRequiredPage(pageName).getFieldsWebElementFromSection(sectionName, falseElement).click();
    	}
    }

    /**
     *  Simulates a double-click on a specified field.
     * @param pageName      name of the page containing the field
     * @param fieldName     name of the field to be double-clicked
     * @see ClickFunctions#doubleClick(String, String)
     */
    @When("^(.+): double click ([^ ]+)$")
    public void doubleClick(String pageName, String fieldName)  {
        doubleClick(pageName, fieldName);
    }

    @When("^(.+): (Check|Uncheck) ([^ ]+)$")
    public void checkOrUncheckCheckbox(String pageName, String action, String fieldName) {
        //clickIn(pageName, fieldName);
        WebDriverProvider.driver().findElement(getRequiredPage(pageName).getField(fieldName).getLocator()).click();
        waitForNSeconds(1);
    }
    
    @When("^(.+): In section ([^ ]+) (check|uncheck) ([^ ]+)$")
    public void checkOrUncheckCheckboxInSection(String pageName, String sectionName, String markType, String checkBox) {
    	if (checkBox.equals("TERMS_OF_CONDITION_CHECKBOX")){
    		ClickFunctions.clickElementWithOffset(getRequiredPage(pageName).getField(checkBox).getWebElement(), 10, 0);
    	} else {
        	getRequiredPage(pageName).getFieldsWebElementFromSection(sectionName, checkBox).click();
    	}
    }

    @Given("^(.+): Click ([^ ]+)$")
    public void click(String pageName, String elementName) {
        
        if (elementName.equals("SUMMARY_PRINT_BUTTON")) {
            ClickFunctions.clickElementWithOffset(getRequiredPage(pageName).getFieldWebElementsValue(elementName), 0, 0);
        } else {
        	try {
        		clickIn(pageName, elementName);
        	} catch (WebDriverException webDriverException){
        		if (pageName.contains("Checkout")){
        			MainFunctions.waitForElementDisappear("Checkout Delivery Page", "PAGE_LOADING_INDICATOR"); // same locator on every Checkout page
        			clickIn(pageName, elementName);
        		} else {
        			throw webDriverException;
        		}
        	}
        }
        
        if (elementName.equals("LOG_IN_OR_REGISTER_BUTTON") || elementName.equals("HAMBURGER_BUTTON")){
            waitForNSeconds(1);
        } else if (elementName.equals("USE_MY_LOCATION_BUTTON")){
        	verifyLocation(pageName);
        } else if (pageName.contains("Checkout")){
        	try {
        		MainFunctions.waitForElementDisappear("Checkout Delivery Page", "PAGE_LOADING_INDICATOR"); // same locator on every Checkout page
        	} catch (StaleElementReferenceException e) {
        		Log.logInfo("StaleElementReferenceException caught while waiting for PAGE_LOADING_INDICATOR to dissappear on page: " + pageName);
        	}
        }
    }
    
    @And("^(.+): In section ([^ ]+) move cursor to element (.+)$")
    public void moveCursorToElement(String pageName, String sectionName, String elementName){
    	ClickFunctions.moveCursorToElement(getRequiredPage(pageName).getFieldsWebElementFromSection(sectionName, elementName));
    }
    
    @And("^(.+): In ([^ ]+) in row ([^ ]+) (click|check) (.+)$")
    public void clickInRow(String pageName, String tableName, String rowNumber, String clickCheck, String elementName){
    	if (Buffer.containsKey(rowNumber)){
    		rowNumber = Buffer.get(rowNumber);
    	}
    	int rowNumberNumeric = Integer.valueOf(rowNumber);
    	
    	List<WebElement> rows = Page.getTableRows(pageName, tableName);
    	WebElement element = rows.get(rowNumberNumeric - 1).findElement(getRequiredPage(pageName).getField(elementName).getLocator());
    	element.click();
    }
    
    @And("^(.+): In ([^ ]+) in row ([^ ]+) move cursor to element (.+)$")
    public void moveCursorInRow(String pageName, String tableName, String rowNumber, String elementName){
    	if (Buffer.containsKey(rowNumber)){
    		rowNumber = Buffer.get(rowNumber);
    	}
    	int rowNumberNumeric = Integer.valueOf(rowNumber);
    	
    	List<WebElement> rows = Page.getTableRows(pageName, tableName);
    	WebElement element = rows.get(rowNumberNumeric - 1).findElement(getRequiredPage(pageName).getField(elementName).getLocator());
    	ClickFunctions.moveCursorToElement(element);
    }
        
    @And("^(.+): In section ([^ ]+) click element ([^ ]+) in position (.+)$")
    public void clickElementInSectionInPosition(String pageName, String sectionName, String elementName, int position){
    	ClickFunctions.clickElementInSectionInPosition(pageName, sectionName, elementName, position);
    }
    
    @And("^(.+): Click element with text (.+)$")
    public void clickElementWithText(String pageName, String elementName, String text){
    	ClickFunctions.clickLinkWithSpecifiedText(text);
    }
    
    @And("^(.+): In section ([^ ]+) click element with text (.+)$")
    public void clickElementWithTextInSection(String pageName, String sectionName, String text){
    	text = Tools.getEnvironmentTestData(text);
    	if (Buffer.containsKey(text)){
    		text = Buffer.get(text);
    	}
    	WebElement section = getRequiredPage(pageName).getField(sectionName).getWebElement();
    	section.findElement(By.xpath(".//*[contains(., '" + text + "')]")).click();
    }
    
    @And("^(.+): Open ([^ ]+) in new tab$")
    public void openLinkInNewTab(String pageName, String elementName){
    	WebElement element = getRequiredPage(pageName).getFieldWebElementsValue(elementName);
    	BrowserFunctions.openLinkInNewTab(element);
    }
    
    @And("^(.+): In section ([^ ]+) open ([^ ]+) in new tab$")
    public void openLinkFromSectionInNewTab(String pageName, String sectionName, String elementName){
    	WebElement element = getRequiredPage(pageName).getFieldsWebElementFromSection(sectionName, elementName);
    	BrowserFunctions.openLinkInNewTab(element);
    }
    
    private static void verifyLocation(String pageName){
    	waitForNSeconds(1);
    	if (getRequiredPage(pageName).getField("LOCATION_ERROR_MESSAGE").isDisplayed()){
			getRequiredPage(pageName).getFieldWebElementsValue("FIND_hybris_CENTER_TEXTFIELD").sendKeys("Feldkircher Strasse 100, 9494 Schaan, Liechtenstein");
			getRequiredPage(pageName).getFieldWebElementsValue("SEARCH_hybris_CENTER_BUTTON").click();
			MainFunctions.waitForElementDisappear(pageName, "MAP_LOADING_INDICATOR");
		}
    }    
}