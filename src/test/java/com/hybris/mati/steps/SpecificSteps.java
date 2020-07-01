package com.hybris.mati.steps;

import static com.hybris.functions.MainFunctions.waitForElement;
import static com.hybris.utils.PageMapper.getRequiredPage;
import static org.apache.commons.lang3.StringUtils.containsIgnoreCase;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import java.util.ArrayList;
import java.util.List;

import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.WebDriverException;
import org.openqa.selenium.WebElement;

import com.hybris.functions.BrowserFunctions;
import com.hybris.functions.CompareFunctions;
import com.hybris.functions.MainFunctions;
import com.hybris.utils.BackgroundSteps;
import com.hybris.utils.Buffer;
import com.hybris.utils.Log;
import com.hybris.utils.Page;
import com.hybris.utils.Tools;
import com.hybris.utils.WebDriverProvider;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

/**
 * Cucumber steps specific to TA-hybris project
 * @author Mateusz Mazurkiewicz
 */
public class SpecificSteps {

    @Then("^(.+): ([^ ]+) (is|are) ([not ]*)visible$")
    public void isFieldDisplayed(String pageName, String elementName, String type, String not) {       
	        switch (not){
	        	case("not "):
	        		WebDriverProvider.overrideImplicityWait(1);
	        		assertFalse("Field " + elementName + " is visible.", getRequiredPage(pageName).isDisplayed(elementName));
	        		break;
	        	case(""):
	        		waitForElement(pageName, elementName);
	        		assertTrue("Field " + elementName + " is not visible.", getRequiredPage(pageName).isDisplayed(elementName));
	        		break;
	        }       
    }
    
    @Then("^(.+): Section ([^ ]+) is ([not ]*)visible$")
    public void isSectionDisplayed(String pageName, String sectionName, String not) {   
    	switch (not){
    		case("not "):
    			WebDriverProvider.overrideImplicityWait(1);
	            assertFalse("Section " + sectionName + " is visible.", getRequiredPage(pageName).isDisplayed(sectionName));
	            break;
    		case(""):
	    		waitForElement(pageName, sectionName);
	            assertTrue("Section " + sectionName + " is not visible.", getRequiredPage(pageName).isDisplayed(sectionName));
	            break;
    	}
    }
    
    @Then("^(.+): In section ([^ ]+) all PASSWORD_SECURITY_REQUIREMENTS are (valid|invalid)$")
    public void isPasswordValid(String pageName, String sectionName, String type){
    	WebDriverProvider.overrideImplicityWait(1);
    	WebElement sectionElement = getRequiredPage(pageName).getField(sectionName).getWebElement();
    	
    	boolean isPasswordValid;
    	try {
    		sectionElement.findElement(getRequiredPage(pageName).getField("PASSWORD_SECURITY_REQUIREMENTS_VALID").getLocator());
    		isPasswordValid = true;
    	} catch (NoSuchElementException exception){
    		isPasswordValid = false;
    	}
    	
    	switch (type){
    	case("invalid"):    		
    		assertFalse("PASSWORD_SECURITY_REQUIREMENTS are valid.", isPasswordValid);
    		break;
    	case("valid"):
    		assertTrue("PASSWORD_SECURITY_REQUIREMENTS are invalid.", isPasswordValid);
    		break;
    	} 
    }
   
    @Then("^(.+): In section ([^ ]+) ([^ ]+) of PASSWORD_SECURITY_REQUIREMENTS are valid$")
    public void isNumberOfPasswordRequirementsValid(String pageName, String sectionName, int expectedNumberOfItems){
    	WebDriverProvider.overrideImplicityWait(1);
    	WebElement sectionElement = getRequiredPage(pageName).getField(sectionName).getWebElement();    	
    	int actualNumberOfItems = sectionElement.findElements(getRequiredPage(pageName).getField("PASSWORD_SECURITY_REQUIREMENTS_VALID").getLocator()).size();    	
    	assertTrue("Actual number of items: " + actualNumberOfItems + " expected: " + expectedNumberOfItems, expectedNumberOfItems == actualNumberOfItems); 
    }
    
    @Given("^(.+): If (section|element) ([^ ]+) is visible click (.+)$")
    public void clickElementIfSectionIsVisible(String pageName, String sectionElement, String sectionName, String fieldName){
    	MainFunctions.waitForNSeconds(2);
    	WebDriverProvider.overrideImplicityWait(1);
    	if (CompareFunctions.isElementVisible(pageName, sectionName)){
    		try {
    			getRequiredPage(pageName).getField(fieldName).click();
    			Log.logInfo("On page: " + pageName + " section: " + sectionName + " is visible. Clicking: " + fieldName);
    			MainFunctions.waitForNSeconds(1);
    		} catch (WebDriverException webDriverException){
    			Log.logInfo("On page: " + pageName + " section: " + sectionName + " is not visible.");
    		}
    	} else {
    		Log.logInfo("On page: " + pageName + " section: " + sectionName + " is not visible.");
    	}
    }
    
    @Given("^(.+): If in section ([^ ]+) element ([^ ]+) is visible click it$")
    public void clickElementIfVisibleInSection(String pageName, String sectionName, String elementName){
    	MainFunctions.waitForNSeconds(2);
    	WebDriverProvider.overrideImplicityWait(1);
    	if (CompareFunctions.isElementVisibleInSection(pageName, sectionName, elementName)){
    		try {
    			getRequiredPage(pageName).getFieldsWebElementFromSection(sectionName, elementName).click();
    			Log.logInfo("On page: " + pageName + " in section: " + sectionName + " element: " + elementName + " is visible. Clicking it.");
    		} catch (WebDriverException webDriverException){
    			Log.logInfo("On page: " + pageName + " in section: " + sectionName + " element: " + elementName + " is not visible.");
    		}
    	} else {
    		Log.logInfo("On page: " + pageName + " in section: " + sectionName + " element: " + elementName + " is not visible.");
    	}
    }
    
    
   
    @And("^(.+): Close ([^ ]+)([ section]*)$")
    public void closeElement(String pageName, String element, String section){
    	if (element.equals("MESSAGE_BOX")){
    		getRequiredPage(pageName).getField("MESSAGE_BOX_CLOSE_BUTTON").click();
    	} else if (element.equals("EDIT_COLUMNS_DROPDOWN_MENU")){
    		getRequiredPage(pageName).getField("EDIT_COLUMNS_DROPDOWN_MENU_CLOSE_BUTTON").click();
    	} else if (element.equals("ACCOUNT_DASHBOARD") || element.equals("LOG_IN_OR_REGISTER")){
    		getRequiredPage("Webshop Main Page").getField("CLOSE_BUTTON").click();
    	} else if (element.equals("CHANGE_DELIVERY_ADDRESS_POPUP") || element.equals("STORELOCATOR_POPUP") || element.equals("CHANGE_DELIVERY_CONTACT_POPUP")){
    		getRequiredPage("Checkout Delivery Page").getField("POPUP_CLOSE_BUTTON").click();
    	}
    }
    
    @And("^(.+): In section ([^ ]+) element ([^ ]+) contains text (.+)$")
    public void isSectionElementContainingValue(String pageName, String sectionName, String elementName, String desiredText){
    	desiredText = Tools.getEnvironmentTestData(desiredText);
    	if (pageName.contains("Checkout")){
    		MainFunctions.waitForNSeconds(1);
			MainFunctions.waitForElementDisappear("Checkout Delivery Page", "PAGE_LOADING_INDICATOR"); // same locator on every Checkout page
        }
    	
    	String actualValue = "";
    	if (sectionName.equals("FAVORITE_LIST") || sectionName.equals("COMPANY_LIST") && elementName.equals("NEW_LIST_NAME_TEXTFIELD")){
    		actualValue = getRequiredPage(pageName).getField(elementName).getWebElement().getAttribute("placeholder");
    	} else {
    		actualValue = getRequiredPage(pageName).getFieldsWebElementFromSection(sectionName, elementName).getText();
    	}
    	assertTrue("Element " + elementName + " does not contain value: '" + desiredText + "' actual value: '" + actualValue + "'", containsIgnoreCase(actualValue, desiredText));
    }
    
    @And("^(.+): Press ([^ ]+) on a keyboard$")
    public void pressButton(String pageName, String button){
    	Keys key = null;
    	switch (button){
    		case "ENTER":
    			key = Keys.RETURN;
    			break;
    		case "ESCAPE": 
    			key = Keys.ESCAPE;
    			break;
    	}
    	BrowserFunctions.pressButtonOnKeyboard(key);
    }
    
    @And("^(.+): In ([^ ]+) in row ([^ ]+) remember value of ([^ ]+) as (.+)$")
    public void rememberValueOfElementInRow(String pageName, String tableName, int rowNumber, String elementName, String nameToRemember){
    	List<WebElement> rows = Page.getTableRows(pageName, tableName);
    	WebElement element = rows.get(rowNumber - 1).findElement(getRequiredPage(pageName).getField(elementName).getLocator());
    	Buffer.set(nameToRemember, element.getText());
    }
    
    @Then("^(.+): ([Section ]*)([^ ]+) contains (more|less) than ([^ ]+) (.+)$")
    public void isThereMoreLessNumberOfElements(String pageName, String section, String sectionName, String moreLess, int expectedNumberOfElements, String elementName){
    	int actualNumberOfElements = Page.countElementsInSection(pageName, sectionName, elementName);
    	switch (moreLess){
	    	case "more":
	    		assertTrue("There is less elements than: " + expectedNumberOfElements + " visble. Actual number: " + actualNumberOfElements, 
	    				expectedNumberOfElements < actualNumberOfElements);
	    		break;
	    	case "less":
	    		assertTrue("There is more elements than: " + expectedNumberOfElements + " visble. Actual number: " + actualNumberOfElements,
	    				expectedNumberOfElements > actualNumberOfElements);
	    		break;
    	}	
    }
    
    @Then("^(.+): In section ([^ ]+) there (is|are) exactly ([^ ]+) ([^ ]+) (element|elements)$")
    public void isNumberOfElementsEqualInSection(String pageName, String sectionName, String isAre, String expectedNumberOfElements, String elementName, String elements){
    	if (Buffer.containsKey(expectedNumberOfElements)){
    		expectedNumberOfElements = Buffer.get(expectedNumberOfElements);
    	}
    	int actualNumberOfElements = Page.countElementsInSection(pageName, sectionName, elementName);
	    assertTrue("Number of elements not equal to: " + expectedNumberOfElements + ". Actual number: " + actualNumberOfElements, 
	    		Integer.valueOf(expectedNumberOfElements) == actualNumberOfElements);
    }
    
    @Then("^(.+): In section ([^ ]+) there (is|are) at (most|least) ([^ ]+) ([^ ]+) (element|elements)$")
    public void isThereAtLeastAtMostNumberOfElements(String pageName, String sectionName, String isAre, String mostLeast, int expectedNumberOfElements, String elementName, String elements){
    	int actualNumberOfElements = Page.countElementsInSection(pageName, sectionName, elementName);
    	switch (mostLeast){
    		case "most":
    	 		assertTrue("There is more elements than: " + expectedNumberOfElements + " visble. Actual number: " + actualNumberOfElements, 
	    				expectedNumberOfElements + 1 > actualNumberOfElements);
    			break;
    		case "least":
    			assertTrue("There is less elements than: " + expectedNumberOfElements + " visble. Actual number: " + actualNumberOfElements, 
	    				expectedNumberOfElements - 1 < actualNumberOfElements);
    			break;
    	}    	
    }
    
    @And("^(.+): Each ([^ ]+) contains (at least|at most) (.+) (.+)$")
    public void eachSectionContainsAtLeastAtMostElements(String pageName, String sectionName, String atLeastAtMost, int numberOfelements, String elementName){
    	List<WebElement> listOfSections = getRequiredPage(pageName).getFieldWebElementsValues(sectionName);
    	By elementLocator = getRequiredPage(pageName).getField(elementName).getLocator();
    	switch (atLeastAtMost){
    		case "at least":
				for (int i = 0; i < listOfSections.size(); i++){
					int actualNumberOfElementsInSection = listOfSections.get(i).findElements(elementLocator).size();
		    		assertTrue("Section: " + sectionName + " contains " + actualNumberOfElementsInSection + " element(s): " + elementName + ", instead of at least: " + numberOfelements, 
		    				actualNumberOfElementsInSection >= numberOfelements);
		    	}
    		break;
    		case "at most":
    			for (int i = 0; i < listOfSections.size(); i++){
    				int actualNumberOfElementsInSection = listOfSections.get(i).findElements(elementLocator).size();
    	    		assertTrue("Section: " + sectionName + " contains " + actualNumberOfElementsInSection + " element(s): " + elementName + ", instead of at most: " + numberOfelements, 
    	    				actualNumberOfElementsInSection <= numberOfelements);
    	    	}
        	break;
    	}     	
    }
    
    @And("^(.+): Select account (.+)$")
    public void selectAccount(String pageName, String accountId){
    	accountId = Tools.getEnvironmentTestData(accountId);
    	getRequiredPage(pageName).getField("CHOOSE_ACCOUNT_DROPDOWN").click();
    	WebElement element = getRequiredPage(pageName).getField("CHOOSE_ACCOUNT_DROPDOWN_CONTENT").getWebElement();
    	element.findElement(By.xpath(".//li[contains(.,'" + accountId + "')]")).click();
    	MainFunctions.waitForNSeconds(1);
    	WebDriverProvider.overrideImplicityWait(1);
    	try {
    		getRequiredPage(pageName).getField("CONTINUE_LOGIN_BUTTON").click();
    	} catch (NoSuchElementException e){
    		Log.logInfo("CONTINUE_LOGIN_BUTTON not visible no need to click.");
    	}
    }
    
    @When("^(.+): In section ([^ ]+) select account (.+)$")
    public void selectAccountInSection(String pageName, String sectionName, String accountId){
    	accountId = Tools.getEnvironmentTestData(accountId);
    	getRequiredPage(pageName).getField("CHOOSE_ACCOUNT_FROM_DASHBOARD_DROPDOWN").click();
    	WebElement element = getRequiredPage(pageName).getField("CHOOSE_ACCOUNT_DROPDOWN_CONTENT").getWebElement();
    	element.findElement(By.xpath(".//li[contains(.,'" + accountId + "')]")).click();
    	MainFunctions.waitForNSeconds(1);
    }
    
    @Then("^(.+): (Keep|Discard) remembered values$")
    public void keepRememberedValues(String pageName, String type){
    	switch (type){
    		case "Keep":
    			BackgroundSteps.keepBufferSession = true;
    	    	Log.logInfo("Buffer won't be re-initialized. Keeping remembered values.");
    	    	break;
    		case "Discard":
    			BackgroundSteps.keepBufferSession = false;
    	    	Log.logInfo("Buffer will be re-initialized. Discarding remembered values.");
    	    	break;
    	}
    }
    
    @When("^(.+): Wait for full ([^ ]+) load$")
    public void waitForSectionLoad(String pageName, String sectionName){
    	if (pageName.equals("Grid Page") && sectionName.equals("PRODUCT_LIST")){
    		MainFunctions.waitForElementDisappear(pageName, "PRODUCT_LIST_LOADING_INDICATOR");
    	} else if (pageName.equals("Item Page") || (pageName.equals("Range Page") && sectionName.equals("RATINGS_AND_REVIEWS"))){
    		MainFunctions.waitForElementDisappear(pageName, "RANGE_AND_ITEM_PAGE_LOADING_INDICATOR");
		} else if (pageName.equals("Item Page") || (pageName.equals("Range Page") && sectionName.equals("CONSULTING_AND_SUPPORT"))){
    		MainFunctions.waitForElementDisappear(pageName, "RANGE_AND_ITEM_PAGE_LOADING_INDICATOR");
		}
    	MainFunctions.waitForNSeconds(1);
    }
    
    @And("^(.+): In section ([^ ]+) element ([^ ]+) in position ([^ ]+) is visible$")
    public void isElementFromPositionInSectionVisible(String pageName, String sectionName, String elementName, int position){
    	CompareFunctions.isElementVisibleInPosition(pageName, sectionName, elementName, position);
    }
    
    @And("^(.+): Remember sum of values ([^ ]+) and ([^ ]+) as ([^ ]+)$")
    public void rememberSumOfTwoValuesFromBuffer(String pageName, String rememberedValue1, String rememberedValue2, String nameToRemember){
    	rememberedValue1 = Buffer.get(rememberedValue1);
    	rememberedValue2 = Buffer.get(rememberedValue2);
    	
    	int sum = Integer.valueOf(rememberedValue1) + Integer.valueOf(rememberedValue2);
    	
    	Buffer.set(nameToRemember, String.valueOf(sum));
    }
    
   
    @Given("^(.+): If test is executed between ([^ ]+) and ([^ ]+) (section|element) ([^ ]+) is visible otherwise it's not$")
    public void isChatOpenNow(String pageName, String openHour, String closeHour, String sectionElement, String elementName){
    	openHour = Tools.getEnvironmentTestData(openHour);
    	closeHour = Tools.getEnvironmentTestData(closeHour);
    	if (Tools.isHourInCertainPeriod(Tools.getCurrentTime(), openHour, closeHour)){
    		Buffer.set("isChatOpen", "true");
    		assertTrue(elementName + " is not visible.", getRequiredPage(pageName).getField(elementName).isDisplayed());
    	} else {
    		assertFalse(elementName +  " is visible.", getRequiredPage(pageName).getField(elementName).isDisplayed());
    	}
    }

    @Given("^(.+): If test is executed between ([^ ]+) and ([^ ]+) (section|element) ([^ ]+) is visible otherwise it contains text (.+)$")
    public void isCallBackOpenNow(String pageName, String openHour, String closeHour, String sectionElement, String elementName, String desiredText){
    	openHour = Tools.getEnvironmentTestData(openHour);
    	closeHour = Tools.getEnvironmentTestData(closeHour);
    	if (Tools.isHourInCertainPeriod(Tools.getCurrentTime(), openHour, closeHour)){
    		Buffer.set("isChatOpen", "true");
    		assertTrue(elementName + " is not visible.", getRequiredPage(pageName).getField(elementName).isDisplayed());
    	} else {
    		desiredText = Tools.getEnvironmentTestData(desiredText);
    		String actualText = getRequiredPage(pageName).getField(elementName).getWebElement().getText();
    		assertTrue("Element: " + elementName + " doesn't contain text: '" + desiredText + "' actual text: '" + actualText + "'", 
    				containsIgnoreCase(actualText, desiredText));
    	}
    }
    
    @Given("^(.+): Fill out FLEET_LABELING_TABLE with random ([^ ]+) characters labels$")
    public void fillOutSectionWithRandomValues(String pageName, int stringLenght){
 		List<WebElement> webElementsFirst = getRequiredPage(pageName).getFieldsWebElementsFromSection("FLEET_LABELING_TABLE", "ORG_REFERENCE_TEXTFIELD");
		List<WebElement> webElementsSecond = getRequiredPage(pageName).getFieldsWebElementsFromSection("FLEET_LABELING_TABLE", "INVENTORY_KEY_TEXTFIELD");
			for (WebElement webElementFirst : webElementsFirst){
					webElementFirst.sendKeys(Tools.randomizeString(stringLenght));
			}
			for (WebElement webElementSecond : webElementsSecond){
				webElementSecond.sendKeys(Tools.randomizeString(stringLenght));
			}
    }
    
	@When("^(.+): Generate ([^ ]+) random characters and remember as (.+)$")
	public void generateAndRememberRandomCharacters(String pageName, int lenght, String nameToRemember) {
		String randomizedValue = Tools.randomizeString(lenght);
		Buffer.set(nameToRemember, randomizedValue);
	}
	
	@When("^(.+): Products (.+) are in top (.+) while products (.+) aren't for search term (.+)$")
	public void verifySearch(String pageName, String expectedProducts, int top, String notExpectedProducts, String searchTerm) {
		if (expectedProducts.equals("N/A")){
			Assert.fail("Skipping test. Please provide expected results for search term: " + searchTerm);
		}
		
		//create lists of expected and actual products
		List<String> listOfExpectedProducts = Tools.getListOfCommaSeparetedString(expectedProducts);
		List<String> listOfActualProducts = getRequiredPage(pageName).getListOfAttributesValuesFromWebElements(pageName, "FOUND_PRODUCTS", "id");
		
		List<String> listOfNotExpectedProducts = new ArrayList<String>();
		if (!notExpectedProducts.contains("N/A")){
			listOfNotExpectedProducts = Tools.getListOfCommaSeparetedString(notExpectedProducts);
		}
		
		List<String> listOfInconsistencies = new ArrayList<String>();
		if (top > 0){ // if "top" defined
			//expected ids
			for (int i = 0; i < listOfExpectedProducts.size(); i++){
				String expectedId = listOfExpectedProducts.get(i);
				if (Tools.isListContainingEqualString(listOfActualProducts, expectedId)){
					int actualPositionOfExpectedId = Tools.getIndexOfEqualStringInList(listOfActualProducts, expectedId) + 1;
					if (actualPositionOfExpectedId > top || actualPositionOfExpectedId == -1){
						listOfInconsistencies.add(expectedId + " (should be in top: " + top + ", is on position: " + actualPositionOfExpectedId + ")");
					}
				} else {
					listOfInconsistencies.add(expectedId + " (is missing)");
				}
				
			}
			
			//not expected ids
			if (!listOfNotExpectedProducts.isEmpty()){
				for (int i = 0; i < listOfNotExpectedProducts.size(); i++){
					String notExpectedId = listOfNotExpectedProducts.get(i);
					if (Tools.isListContainingEqualString(listOfActualProducts, notExpectedId)){
						int actualPositionOfNotExpectedId = Tools.getIndexOfEqualStringInList(listOfActualProducts, notExpectedId) + 1;
						if (actualPositionOfNotExpectedId <= top || actualPositionOfNotExpectedId == -1){
							listOfInconsistencies.add(notExpectedId + " (shouldn't be in top: " + top + ", is on position: " + actualPositionOfNotExpectedId + ")");
						}
					}
				}
			} else {
				Log.logInfo("Not expected results are not defined.");
			}
		} else if (top == 0){ // if "top" not defined
			Log.logInfo("\"Top\" is not defined!");
			for (int i = 0; i < listOfExpectedProducts.size(); i++){
				String expectedId = listOfExpectedProducts.get(i);
				if (!Tools.isListContainingEqualString(listOfActualProducts, expectedId)){
					listOfInconsistencies.add(expectedId + " (is missing)");
				}
			}
		} else {
			Assert.fail("\"Top\" has to be greater or equal to zero.");
		}
		
		String inconsistenciesIds = "";
		if (!listOfInconsistencies.isEmpty()){			
			for (int i = 0; i < listOfInconsistencies.size(); i++){
				inconsistenciesIds += listOfInconsistencies.get(i) + ", ";
			}
		}
		
		String listOfResults = "";
		for (int i = 0; i < listOfActualProducts.size(); i++){
			listOfResults += listOfActualProducts.get(i) + ", ";
		}
		
		Log.logInfo("List of expected products: " + expectedProducts.replaceAll(", $", ""));
		Log.logInfo("List of not expected products: " + notExpectedProducts.replaceAll(", $", ""));
		Log.logInfo("Results: " + listOfResults.replaceAll(", $", ""));
		assertTrue("Search results inconsistencies: " + inconsistenciesIds.replaceAll(", $", ""), listOfInconsistencies.isEmpty());	
	}
	
    @Then("^(.+): In section ([^ ]+) remember number of ([^ ]+) elements as ([^ ]+)$")
    public void rememberNumberOfElementsInSection(String pageName, String sectionName, String elementName, String nameToRemember){
    	String valueToRemember = String.valueOf(Page.countElementsInSection(pageName, sectionName, elementName)) ;
    	Buffer.set(nameToRemember, valueToRemember);
    }
}