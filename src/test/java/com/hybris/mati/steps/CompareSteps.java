package com.hybris.mati.steps;

import static com.hybris.functions.MainFunctions.waitForElement;
import static com.hybris.functions.MainFunctions.waitForElementInSection;
import static com.hybris.utils.PageMapper.getRequiredPage;
import static org.apache.commons.lang3.StringUtils.containsIgnoreCase;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import java.util.List;

import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import com.hybris.functions.CompareFunctions;
import com.hybris.functions.MainFunctions;
import com.hybris.mati.pages.WebshopPages.WebshopMainPage;
import com.hybris.utils.Buffer;
import com.hybris.utils.Log;
import com.hybris.utils.Page;
import com.hybris.utils.Tools;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

/**
 * CompareSteps class contains Cucumber step definitions related to comparing WebElement values,
 * values from Buffer, and values used as parameters.
 *
 * @author Mateusz Mazurkiewicz
 * @see CompareFunctions
 * @see Buffer
 */
public class CompareSteps {
 
    @Then("^(.+): Element ([^ ]+) contains remembered value (.+)$")
    public void isRowContainsRememberedValue(String pageName, String fieldName, String rememberedValue) {
    	CompareFunctions.isFieldContainingValue(pageName, fieldName, Buffer.get(rememberedValue));
    }
    
    @Then("^(.+): In section ([^ ]+) element ([^ ]+) is (disabled|enabled)$")
    public void isFieldInSectionDisabled(String pageName, String sectionName, String fieldName, String accessibility){
    	switch (accessibility){
    		case "disabled":
    			assertFalse("Field " + fieldName + " is enabled.", getRequiredPage(pageName).getFieldsWebElementFromSection(sectionName, fieldName).isEnabled());
    			break;
    		case "enabled":
    			assertTrue("Field " + fieldName + " is disabled.", getRequiredPage(pageName).getFieldsWebElementFromSection(sectionName, fieldName).isEnabled());
    			break;
    	}    	
    }
    
    @Then("^(.+): Element ([^ ]+) is (disabled|enabled)$")
    public void isFieldDisabled(String pageName, String fieldName, String accessibility){
    	switch (accessibility){
    		case "disabled":
    			boolean isEnabled = getRequiredPage(pageName).getField(fieldName).isEnabled();
	    			if (isEnabled) {
	    				boolean isDisabledByClass = getRequiredPage(pageName).getField(fieldName).getWebElement().getAttribute("class").contains("is-disabled");
	    				if (isDisabledByClass){
	    					isEnabled = false;
	    				}
	    			}
    			assertFalse("Field " + fieldName + " is enabled.", isEnabled);
    			break;
    		case "enabled":
    			assertTrue("Field " + fieldName + " is disabled.", getRequiredPage(pageName).getField(fieldName).isEnabled());
    			break;
    	}    	
    }

    @Then("^(.+): Section ([^ ]+) ([not ]*)contains text (.+)$")
    public void checkIfSectionContainsValues(String pageName, String sectionName, String not, String text) {
    	text = Tools.getEnvironmentTestData(text);	
    	MainFunctions.waitForNSeconds(1);

    	switch (not){
    		case "not ":
    			CompareFunctions.sectionNotContainsText(pageName, sectionName, text);
    			break;
    		case "":
    			CompareFunctions.sectionContainsText(pageName, sectionName, text);
    			break;
    	}       
    }  
    
    @Then("^(.+): Section ([^ ]+) ([not ]*)contains element (.+)$")
    public void checkIfSectionContainsElement(String pageName, String sectionName, String not, String element) {
    	switch (not){
    		case "not ":
    			CompareFunctions.sectionNotContainsElement(pageName, sectionName, element);
    			break;
    		case "":
    			CompareFunctions.sectionContainsElement(pageName, sectionName, element);
    			break;
    	}       
    }  
    
    @Then("^(.+): In section ([^ ]+) in field ([^ ]+) text is (visible|masked)$")
    public void checkIfTextIsMasked(String pageName, String sectionName, String fieldName, String visibility){
    	MainFunctions.waitForNSeconds(1);
    	switch (visibility){
	    	case "masked":
	    		CompareFunctions.isTextMasked(pageName, fieldName);
	    		break;
	    	case "visible":
	    		CompareFunctions.isTextNotMasked(pageName, fieldName);
	    		break;
	    }
    }
    
    @Then("^(.+): ([not ]*)contains text (.+)$")
    public void wholePageContainsText(String pageName, String not, String desiredText){
    	String wholeSiteText = getRequiredPage(pageName).getField("WHOLE_SITE_CONTENT").getWebElement().getText();    		
    		desiredText = Tools.getEnvironmentTestData(desiredText);    		
	    	switch (not){
	    	case "not ":	
	    		assertFalse("Page " + pageName + " contains text: " + desiredText, 
	    				containsIgnoreCase(wholeSiteText, desiredText));
	    		break;
	    	case "":
	    		assertTrue("Page " + pageName + " not contains text: " + desiredText, 
	    				containsIgnoreCase(wholeSiteText, desiredText));
	    		break;
	    	}
    }
    
    @Then("^(.+): Element ([^ ]+) contains text (.+)$")
    public void isTextVisibeInElement(String pageName, String elementName, String desiredText){
    	desiredText = Tools.getEnvironmentTestData(desiredText);
    	MainFunctions.waitForElement(pageName, elementName);
    	String actualText = getRequiredPage(pageName).getField(elementName).getWebElement().getText();
    	
    	if (pageName.equals("Tool Management Page")) {
    		actualText = Tools.sanitizeString(actualText);
    		desiredText = Tools.sanitizeString(desiredText);
    	}
    	
    	assertTrue("Element " + elementName + " does not contain value: '" + desiredText + "' actual value: '" + actualText + "'", containsIgnoreCase(actualText, desiredText));
    }
    
    @Then("^(.+): In ([^ ]+) row ([^ ]+) ([not ]*)contains remembered value (.+)$")
    public void rowHasRememberedValue(String pageName, String tableName, int rowNumber, String not, String rememberedValue){
    	rememberedValue = Buffer.get(rememberedValue);
    	String actualRowValue = Page.getWholeRowValues(pageName, tableName, rowNumber);
    	switch (not){
    		case "not ":
		    	assertFalse("Row: " + rowNumber + " contains: '" + rememberedValue + "' actual value: '" + actualRowValue + "'", 
		    			containsIgnoreCase(actualRowValue, rememberedValue));
		    	break;
    		case "":
		    	assertTrue("Row: " + rowNumber + " not contains: '" + rememberedValue + "' actual value: '" + actualRowValue + "'", 
		    			containsIgnoreCase(actualRowValue, rememberedValue));	
		    	break;
    	}	
    }
    
    @Then("^(.+): In ([section ]*)([^ ]+) element ([^ ]+) ([not ]*)contains remembered value ([^ ]+)$")
    public void fieldInSectionHasRememberedValue(String pageName, String section, String sectionName, String elementName, String not, String rememberedValue){
    	rememberedValue = Buffer.get(rememberedValue);
    	String actualValue;
    	
		if (elementName.equals("ORG_REFERENCE_TEXTFIELD") || elementName.equals("INVENTORY_KEY_TEXTFIELD")) {
			actualValue = getRequiredPage(pageName).getFieldsWebElementFromSection(sectionName, elementName).getAttribute("value");
		} else {
			actualValue = getRequiredPage(pageName).getFieldsWebElementFromSection(sectionName, elementName).getText();
		}

    	switch (not){
    		case "not ":
		    	assertFalse("In section: " + sectionName + " element: " + elementName + " contains: '" + rememberedValue + "' actual value: '" + actualValue + "'", 
		    			containsIgnoreCase(actualValue, rememberedValue));
		    	break;
    		case "":
		    	assertTrue("In section: " + sectionName + " element: " + elementName + " not contains: '" + rememberedValue + "' actual value: '" + actualValue + "'", 
		    			containsIgnoreCase(actualValue, rememberedValue));	
		    	break;
    	}	
    }
    
    @Then("^(.+): In ([section ]*)([^ ]+) element ([^ ]+) ([not ]*)contains numeric part of remembered value ([^ ]+)$")
    public void fieldInSectionHasRememberedNumericPartOfValue(String pageName, String section, String sectionName, String elementName, String not, String rememberedValue){
    	rememberedValue = Buffer.get(rememberedValue);
    	String numericValue = String.valueOf(Tools.sanitizeIntegerFromString(rememberedValue));
    	String actualValue = getRequiredPage(pageName).getFieldsWebElementFromSection(sectionName, elementName).getText();

    	switch (not){
    		case "not ":
		    	assertFalse("In section: " + sectionName + " element: " + elementName + " contains numeric value: '" + rememberedValue + "' actual value: '" + actualValue + "'", 
		    			containsIgnoreCase(actualValue, numericValue));
		    	break;
    		case "":
		    	assertTrue("In section: " + sectionName + " element: " + elementName + " not contains numeric value: '" + rememberedValue + "' actual value: '" + actualValue + "'", 
		    			containsIgnoreCase(actualValue, numericValue));	
		    	break;
    	}	
    }
    
    @Then("^(.+): In ([^ ]+) row ([^ ]+) column ([^ ]+) has ([^ ]+) characters value of remembered (.+)$")
    public void rowHasRememberedValueConsistingOfCharactersNumber(String pageName, String tableName, int rowNumber, int columnNumber, int numberOfChars, String rememberedValue){
    	rememberedValue = Buffer.get(rememberedValue);
    	String actualRowValue = Page.getCellValueByColumnInRow(pageName, tableName, rowNumber, columnNumber);
    	assertTrue("Row: " + rowNumber + " column: " + columnNumber + " doesn't contain value: '" + rememberedValue + "' actual value: '" + actualRowValue + "'", 
    			rememberedValue.contains(actualRowValue));
    	int actualValueLength = actualRowValue.length();
    	int rememberedValueLength = rememberedValue.substring(0, numberOfChars).length();
    	assertTrue("Row: " + rowNumber + " column: " + columnNumber + " value doesn't equal: '" + rememberedValueLength + "' actual value: '" + actualValueLength + "'", 
    			actualValueLength == rememberedValueLength);
    }
    
    @Then("^(.+): Element ([^ ]+) has ([^ ]+) characters value of remembered (.+)$")
    public void elementHasRememberedValueConsistingOfCharactersNumber(String pageName, String elementName, int numberOfChars, String rememberedValue){
    	rememberedValue = Buffer.get(rememberedValue);
    	String actualRowValue = getRequiredPage(pageName).getField(elementName).getWebElement().getText();
    	assertTrue("Element: " + elementName + " doesn't contain value: '" + rememberedValue + "' actual value: '" + actualRowValue + "'", 
    			rememberedValue.contains(actualRowValue));
    	int actualValueLength = actualRowValue.length();
    	int rememberedValueLength = rememberedValue.substring(0, numberOfChars).length();
    	assertTrue("Element: " + elementName + " value doesn't equal: '" + rememberedValueLength + "' actual value: '" + actualValueLength + "'", 
    			actualValueLength == rememberedValueLength);
    }
    
    @Then("^(.+): In ([^ ]+) ([^ ]+) is sorted (ascending|descending)$")
    public void isColumnSorted(String pageName, String tableName, String columnName, String sortType){
    	List<String> actualColumnValues = Page.getColumnValuesList(pageName, tableName, columnName);
			if(columnName.contains("DATE")){
				assertTrue(Tools.isDateListSorted(actualColumnValues, sortType));
			} else {
				assertTrue(Tools.isListSorted(actualColumnValues, sortType));
			}
    }
    
    @Then("^(.+): In ([^ ]+) row ([^ ]+) ([not ]*)contains text (.+)$")
    public void rowContainsText(String pageName, String tableName, int rowNumber, String not, String text){
    	text = Tools.getEnvironmentTestData(text);
    	String actualRowValue = Page.getWholeRowValues(pageName, tableName, rowNumber);
    	switch (not){
    		case "not ":
		    	assertFalse("Row: " + rowNumber + " contains: '" + text + "' actual value: '" + actualRowValue + "'", 
		    			containsIgnoreCase(actualRowValue, text));
		    	break;
    		case "":
		    	assertTrue("Row: " + rowNumber + " not contains: '" + text + "' actual value: '" + actualRowValue + "'", 
		    			containsIgnoreCase(actualRowValue, text));	
		    	break;
    	}	
    }
    
    @Then("^(.+): In ([^ ]+) in row ([^ ]+) ([^ ]+) is ([not ]*)visible$")
    public void isElementInRowVisible(String pageName, String tableName, int rowNumber, String elementName, String not){
    	List<WebElement> rows = Page.getTableRows(pageName, tableName);
    	WebElement element = rows.get(rowNumber - 1).findElement(getRequiredPage(pageName).getField(elementName).getLocator());
    	
    	switch(not){
    	case "":
    		assertTrue("Element: " + elementName + " is not visible.", element.isDisplayed());
    		break;
    	case "not ":
    		assertFalse("Element: " + elementName + " is visible.", element.isDisplayed());
    		break;
    	}
    	
    }
    
    @And("^(.+): In section ([^ ]+) element ([^ ]+) on position ([^ ]+) contains text or value (.+)$")
    public void isElementInSectionOnPositionContainingText(String pageName, String sectionName, String elementName, int position, String desiredText){
    	WebElement element = getRequiredPage(pageName).getFieldsWebElementsFromSection(sectionName, elementName).get(position - 1);
    	String actualText;
    	if (elementName.equals("TABLE_AMOUNT_TEXTFIELD")){
    		actualText = element.getAttribute("value");
    	} else {
    		actualText = element.getText();	
    	}    	
    	assertTrue("Element: " + elementName + " on position: " + position + " in section: " + sectionName + 
    			" doesn't contain text/value: " + desiredText + " actual text/value: " + actualText,
    			containsIgnoreCase(actualText, desiredText));
    }
    
    /*
     *  Checks if it's equal not contains!
     */
    @And("^(.+): In ([^ ]+) in row ([^ ]+) ([^ ]+) contains remebered value (.+)$")
    public void isRememberedTextVisibleInTextBoxInRow(String pageName, String tableName, int rowNumber, String elementName, String rememberedValue){
    	rememberedValue = Tools.getEnvironmentTestData(rememberedValue);
    	if (Buffer.containsKey(rememberedValue)) {
    		rememberedValue = Buffer.get(rememberedValue);
    	}
    	List<WebElement> rows = Page.getTableRows(pageName, tableName);
    	WebElement element = rows.get(rowNumber - 1).findElement(getRequiredPage(pageName).getField(elementName).getLocator());
    	String actualValue = element.getAttribute("value");
    	if (elementName.equals("PRODUCT_ID_IN_ROW")){
    		actualValue = element.getText();
    	}
    	assertTrue("Element: " + elementName + " doesn't contain remembered value: " + rememberedValue + ". Actual value: " + actualValue, containsIgnoreCase(actualValue, rememberedValue));;
    }
    
    @Then("^(.+): In ([section ]*)([^ ]+) element ([^ ]+) is ([not ]*)visible$")
    public void isElementVisibleInSection(String pageName, String section, String sectionName, String elementName, String not){
    	switch(not){
    		case "not ":
    			CompareFunctions.sectionNotContainsElement(pageName, sectionName, elementName);
    			break;
    		case "":
    			assertTrue("Element: " + elementName + " is not visible in " + sectionName, 
    	    			getRequiredPage(pageName).getFieldsWebElementFromSection(sectionName, elementName).isDisplayed());
    			break;
    	}	
    }
    
    @Then("^(.+): ([Section ]*)([^ ]+) might be visible$")
    public void mightBeVisible(String pageName, String sectionName, String elementName){
    	try{
    		assertTrue(getRequiredPage(pageName).getField(elementName).isDisplayed());
    	} catch (AssertionError error){
    		Log.logInfo("Element: " + elementName + " is not visible.");
    	}
    }
   
    @And("^(.+): On ([^ ]+) (category|product|element) (.+) is visible$")
    public void isCategoryVisibleOnList(String pageName, String listName, String catProdEle, String categoryName){
    	categoryName = Tools.getEnvironmentTestData(categoryName);
    	By itemLocator = WebshopMainPage.getProductOrCategoryVisibilityLocator(categoryName);
    	assertTrue("Category: " + categoryName + " not visible on list: " + listName, 
	    			getRequiredPage(pageName).getField(listName).getWebElement().findElement(itemLocator).isDisplayed());
    }
    
    @And("^(.+): Section ([^ ]+) ([not ]*)contains remembered value ([^ ]+)$")
    public void isSectionContainingRememberedValue(String pageName, String sectionName, String not, String rememberedValue){
    	rememberedValue = Buffer.get(rememberedValue);
    	switch (not){
    	case "":
    		assertTrue("Section: " + sectionName + " not contains value: " + rememberedValue, 
    				containsIgnoreCase(getRequiredPage(pageName).getField(sectionName).getWebElement().getText(), rememberedValue));
    		break;
    	case "not ":
    		assertFalse("Section: " + sectionName + " contains value: " + rememberedValue, 
    				containsIgnoreCase(getRequiredPage(pageName).getField(sectionName).getWebElement().getText(), rememberedValue));
    		break;
    	}
    	
    }
    
    @Then("^(.+): The SHOPPING_CART contains ([^ ]+) (item|items)$")
    public void isCartContainingNumberOfItems(String pageName, int numberOfItems, String itemItems){
    	String cartText = getRequiredPage("Webshop Main Page").getField("SHOPPING_CART_BUTTON").getWebElement().getText();

    	int cartItemContentNumber = Integer.valueOf((cartText).replace("[", "").replace("]", ""));
    	assertTrue("There is: " + cartItemContentNumber + " items in shopping cart, instead of " + numberOfItems, 
    			cartItemContentNumber == numberOfItems);
    }
    
    @Then("^(.+): The SHOPPING_CART contains (more|less) than ([^ ]+) (item|items)$")
    public void isCartContainingMoreOrLessNumberOfItems(String pageName, String moreLess, int numberOfItems, String itemItems){
    	String cartText = getRequiredPage("Webshop Main Page").getField("SHOPPING_CART_BUTTON").getWebElement().getText();

    	int cartItemContentNumber = Integer.valueOf((cartText).replace("[", "").replace("]", ""));
    	switch (moreLess){
	    	case "more":
	    		assertTrue("Shopping cart contains less items than: " + numberOfItems + " Actual number: " + cartItemContentNumber, 
	    				numberOfItems < cartItemContentNumber);
	    		break;
	    	case "less":
	    		assertTrue("Shopping cart contains more items than: " + numberOfItems + " Actual number: " + cartItemContentNumber,
	    				numberOfItems > cartItemContentNumber);
	    		break;
    	}	
    }
    
    @When("^(.+): In section ([^ ]+) element ([^ ]+) in position ([^ ]+) is selected$")
    public void isElementSelectedInPosition(String pageName, String sectionName, String elementName, int position){
    	CompareFunctions.isElementSelectedInPosition(pageName, sectionName, elementName, position);
    }
    
    @And("^(.+): Element ([^ ]+) has value ([^ ]+)$")
    public void isElementContainingValueAttribute(String pageName, String elementName, String desiredValue){
    	desiredValue = Tools.getEnvironmentTestData(desiredValue);
    	CompareFunctions.isElementValueAttributeEqualToDesiredText(pageName, elementName, desiredValue);
    }
    
    @And("^(.+): In section ([^ ]+) element ([^ ]+) has value ([^ ]+)$")
    public void isElementInSectionContainingValueAttribute(String pageName, String sectionName, String elementName, String desiredValue){
    	desiredValue = Tools.getEnvironmentTestData(desiredValue);
    	CompareFunctions.isElementInSectionValueAttributeEqualToDesiredText(pageName, sectionName, elementName, desiredValue);
    }
    
    @And("^(.+): In section ([^ ]+) element ([^ ]+) is empty$")
    public void isElementInSectionContainingEmptyValueAttribute(String pageName, String sectionName, String elementName){
    	CompareFunctions.isElementInSectionValueAttributeEmpty(pageName, sectionName, elementName);
    }
    
    @When("^(.+): Remember value of ([^ ]+) as ([^ ]+)$")
    public void rememberFieldValue(String pageName, String elementName, String nameToRemember){
    	String valueToRemember;
    	if (elementName.equals("FIND_hybris_CENTER_INPUT")){
    		valueToRemember = getRequiredPage(pageName).getField(elementName).getWebElement().getAttribute("data-map-location");
    	} else {
    		valueToRemember = getRequiredPage(pageName).getField(elementName).getWebElement().getText();
    		if (elementName.equals("TWO_STARS_REVIEWS_DISPLAYED_COUNT")){
    			valueToRemember = String.valueOf(Tools.sanitizeIntegerFromString(valueToRemember));
    		}
    	}
    	
		Buffer.set(nameToRemember, valueToRemember);
    }
    
    @Then("^(.+): In ([^ ]+) remember value of ([^ ]+) in position ([^ ]+) as ([^ ]+)$")
    public void rememberValueOfElementInSectionInPosition(String pageName, String sectionName, String elementName, int position, String nameToRemember){
    	if (sectionName.equals("CLASS_FILTERBAR") && elementName.equals("FILTERBAR_RADIOBUTTON_COUNTER_LABEL") || elementName.equals("FILTERBAR_CHECKBOX_COUNTER_LABEL")){
    		position--;
    	}
		String valueToRemember = getRequiredPage(pageName).getFieldsWebElementsFromSection(sectionName, elementName).get(position - 1).getText();
		Buffer.set(nameToRemember, valueToRemember);
    }
    
    @Then("^(.+): In section ([^ ]+) all elements ([^ ]+) are ([un]*)checked$")
    public void areAllElementsCheckedInSection(String pageName, String sectionName, String elementName, String checkedUnchecked){
    	int elements = Page.countElementsInSection(pageName, sectionName, elementName);
    	int i = 1;
    	switch (checkedUnchecked){
	    	case "":
	        	while (i <= elements){
	        		CompareFunctions.isElementSelectedInPosition(pageName, sectionName, elementName, i);
	        		i++;
	        	}
	        	break;
	    	case "un":
	        	while (i <= elements){
	        		CompareFunctions.isElementNotSelectedInPosition(pageName, sectionName, elementName, i);
	        		i++;
	        	}
	        	break;
	    }	
    }
    
    @Then("^(.+): In section ([^ ]+) element ([^ ]+) is ([un]*)checked$")
    public void isCheckboxCheckedInSection(String pageName, String sectionName, String elementName, String checkedUnchecked){
    	switch (checkedUnchecked){
	    	case "":
	        	CompareFunctions.isElementSelected(pageName, sectionName, elementName);
	        	break;
	    	case "un":
	        	CompareFunctions.isElementNotSelected(pageName, sectionName, elementName);
	        	break;
	    }	
    }
    
    @And("^(.+): If (chat|call back) is open then in section ([^ ]+) field ([^ ]+) contains value (.+)$")
    public void fieldContainsTextInSectionConditional(String pageName, String condition, String sectionName, String elementName, String desiredValue){
    	desiredValue = Tools.getEnvironmentTestData(desiredValue);
    	
    	switch (condition){
    		case ("chat"):
    			if (Tools.isChatOpen()){
    				waitForElementInSection(pageName, sectionName, elementName);
    				String actualValue = getRequiredPage(pageName).getFieldsWebElementFromSection(sectionName, elementName).getAttribute("value");
    				assertTrue("Element: " + elementName + " doesn't contain value: '" + desiredValue + "' actual value: '" + actualValue + "'",
    						containsIgnoreCase(actualValue, desiredValue));
    			} else {
    				Log.logInfo("Chat is currently closed. Skipping step.");
    			}
    		break;
    		case ("call back"):
    			if (Tools.isChatOpen()){
    				waitForElementInSection(pageName, sectionName, elementName);
    				String actualValue = getRequiredPage(pageName).getFieldsWebElementFromSection(sectionName, elementName).getAttribute("value");
    				assertTrue("Element: " + elementName + " doesn't contain value: '" + desiredValue + "' actual value: '" + actualValue + "'",
    						containsIgnoreCase(actualValue, desiredValue));
    			} else {
    				Log.logInfo("Call back is currently closed. Skipping step.");
    			}
    		break;
    	}  	
    }
    
    @And("^(.+): If (chat|call back) is open then section ([^ ]+) contains text (.+)$")
    public void fieldContainsTextConditional(String pageName, String condition, String sectionName, String desiredText){
    	desiredText = Tools.getEnvironmentTestData(desiredText);
    	switch (condition){
    		case ("chat"):
    			if (Tools.isChatOpen()){
    				waitForElement(pageName, sectionName);
    				String actualText = getRequiredPage(pageName).getFieldWebElementsValue(sectionName).getText();
    				assertTrue("Section: " + sectionName + " doesn't contain text: '" + desiredText + "' actual text: '" + actualText + "'",
    						containsIgnoreCase(actualText, desiredText));
    			} else {
    				Log.logInfo("Chat is currently closed. Skipping step.");
    			}
    			break;
    		case ("call back"):
    			if (Tools.isChatOpen()){
    				waitForElement(pageName, sectionName);
    				String actualText = getRequiredPage(pageName).getFieldWebElementsValue(sectionName).getText();
    				assertTrue("Section: " + sectionName + " doesn't contain text: '" + desiredText + "' actual text: '" + actualText + "'",
    						containsIgnoreCase(actualText, desiredText));
    			} else {
    				Log.logInfo("Call back is currently closed. Skipping step.");
    			}
    			break;
    	}  	
    }
    
    @And("^(.+): ([^ ]+) has ([^ ]+) (row|rows)$")
    public void isNumberOfRowsAsExpected(String pageName, String tableName, int numberOfRowsExpected, String rowRows){
    	int numberOfRowsActual = Page.getTableRows(pageName, tableName).size();
    	assertTrue("Actual number of rows: " + numberOfRowsActual + " expected: " + numberOfRowsExpected, 
    			numberOfRowsActual == numberOfRowsExpected);
    }
    
    @And("^(.+): Every attribute ([^ ]+) of element ([^ ]+) contains value (.+)$")
    public void isEveryAttributeOfElementContainingValue(String pageName, String attributeName, String elementName, String desiredValue){
    	desiredValue = Tools.getEnvironmentTestData(desiredValue);
    	CompareFunctions.isElementsAttributesEqualToDesiredText(pageName, elementName, attributeName, desiredValue);
    }
    
    @And("^(.+): Remembered values ([^ ]+) and ([^ ]+) are (equal|not equal)$")
    public void compareRememberedValues(String pageName, String rememberedValue1, String rememberedValue2, String comparisionType){
    	rememberedValue1 = Buffer.get(rememberedValue1);
    	rememberedValue2 = Buffer.get(rememberedValue2);
    	switch(comparisionType){
    	case "equal" :
    		assertTrue("Value '" + rememberedValue1 + "' is not equal to '" + rememberedValue2 + "'", rememberedValue1.equals(rememberedValue2));
    		break;
    	case "not equal" :
    		assertFalse("Value '" + rememberedValue1 + "' is equal to '" + rememberedValue2 + "'", rememberedValue1.equals(rememberedValue2));
    		break;
    	}
    	
    }
    
    
   @And("^(.+): In ([^ ]+) remember row number of row which contains text ([^ ]+) as ([^ ]+)$")
   public void rememberRowNumberOfRowContainingText(String pageName, String tableName, String desiredText, String nameToRemeber){
	   if (Buffer.containsKey(desiredText)){
		   desiredText = Buffer.get(desiredText);
	   }
	   
	   List<WebElement> wholeTable = Page.getTableRows(pageName, tableName);
	   List<String> wholeTableText = Page.getTextFromWebElementsList(wholeTable);
	   
	   
	   int rowNumber = Tools.getIndexOfStringInList(wholeTableText, desiredText);
	   if (rowNumber > -1){
		   Buffer.set(nameToRemeber, String.valueOf(rowNumber + 1));
	   } else {
		   Assert.fail("Row with desired text: '" + desiredText + "' has not been found in " + tableName);
	   }
	   
   }   
   
   @Then("^(.+): Page title contains text (.+)$")
   public void checkIfPageTitleContainsText(String pageName, String text) {
	   text = Tools.getEnvironmentTestData(text);
	   CompareFunctions.isPageTitleContainingText(text);
   }
   
   @Then("^(.+): In element ([^ ]+) attribute ([^ ]+) is equal to(?: remembered value | )([^ ]+)$")
   public void isElementsAttributeEqualToDesiredText(String pageName, String elementName, String attributeName, String desiredAttributeValue){
	   desiredAttributeValue = Tools.getEnvironmentTestData(desiredAttributeValue);
	   if (Buffer.containsKey(desiredAttributeValue)) {
		   desiredAttributeValue = Buffer.get(desiredAttributeValue);
	   }
	   CompareFunctions.isElementsAttributeEqualToDesiredText(pageName, elementName, attributeName, desiredAttributeValue);
   	}
   
   @Then("^(.+): In section ([^ ]+) in element ([^ ]+) attribute ([^ ]+) is equal to(?: remembered value | )([^ ]+)$")
   public void isSectionElementsAttributeEqualToDesiredText(String pageName, String sectionName, String elementName, String attributeName, String desiredAttributeValue){
	   desiredAttributeValue = Tools.getEnvironmentTestData(desiredAttributeValue);
	   if (Buffer.containsKey(desiredAttributeValue)) {
		   desiredAttributeValue = Buffer.get(desiredAttributeValue);
	   }
	   CompareFunctions.isElementsAttributeInSectionEqualToDesiredText(pageName, sectionName, elementName, attributeName, desiredAttributeValue); 
   	}
   
   
}
