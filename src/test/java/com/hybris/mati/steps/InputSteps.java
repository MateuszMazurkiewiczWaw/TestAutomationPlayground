package com.hybris.mati.steps;

import static com.hybris.functions.MainFunctions.waitForElementInSection;
import static com.hybris.functions.MainFunctions.waitForElement;
import static com.hybris.utils.PageMapper.getRequiredPage;

import java.util.List;

import org.openqa.selenium.WebElement;

import com.hybris.functions.CompareFunctions;
import com.hybris.functions.InputFunctions;
import com.hybris.functions.MainFunctions;
import com.hybris.utils.Buffer;
import com.hybris.utils.Log;
import com.hybris.utils.Page;
import com.hybris.utils.Tools;

import cucumber.api.java.en.And;
import cucumber.api.java.en.When;

/**
 * Steps for input actions.
 * @author Mateusz Mazurkiewicz
 */
public class InputSteps {

	@When("^(.+): In section ([^ ]+) in field ([^ ]+) type and remember ([^ ]+) as (.+)$")
	public void insertValueAndRememberIt(String pageName, String sectionName, String fieldName, String value, String nameToRemember) {
		waitForElement(pageName, sectionName);
		waitForElement(pageName, fieldName);
			if (value.equals("RANDOM_EMAIL_ADDRESS")){
				value = Tools.randomizeEmailAddress();
			} else if (value.contains("_RANDOM_CHARACTERS")){
				int numberOfCharacters = Tools.sanitizeIntegerFromString(value);
				value = Tools.randomizeString(numberOfCharacters);
			}
		InputFunctions.setValueInField(pageName, fieldName, value);
		Buffer.set(nameToRemember, value);
	}
	
	@When("^(.+): In section ([^ ]+) in field ([^ ]+) type in (.+)$")
	public void insertValueInElementInSection(String pageName, String sectionName, String fieldName, String value) {
		value = Tools.getEnvironmentTestData(value);		
		if (Buffer.containsKey(value)) {
			value = Buffer.get(value);
		}
		waitForElement(pageName, sectionName);
		waitForElement(pageName, fieldName);
			if (value.equals("RANDOM_EMAIL_ADDRESS")){
				value = Tools.randomizeEmailAddress();
			}
			if (sectionName.equals("QUICK_ITEM_ENTRY") && fieldName.equals("QUICK_ITEM_ENTRY_TEXTFIELD")){
				getRequiredPage(pageName).getFieldWebElementsValue(fieldName).click();
				MainFunctions.waitForNSeconds(1);
				getRequiredPage(pageName).getFieldWebElementsValue(fieldName).sendKeys(value);
			} else if (sectionName.equals("CREDIT_CARD_OVERLAY_FORM") && fieldName.equals("CARD_NUMBER_TEXTFIELD")){
				getRequiredPage(pageName).getFieldsWebElementFromSection(sectionName, fieldName).click();
				MainFunctions.waitForNSeconds(1);
				InputFunctions.setValueToActiveElement(value);
			} else if (sectionName.equals("CREDIT_CARD_OVERLAY_FORM") && fieldName.equals("CVC_NUMBER_TEXTFIELD")){
				getRequiredPage(pageName).getFieldsWebElementFromSection(sectionName, fieldName).click();
				MainFunctions.waitForNSeconds(1);
				InputFunctions.setValueToActiveElement(value);
			} else {
				InputFunctions.setValueInField(pageName, fieldName, value);
			}
	}

    @And("^(.+): If (chat|call back) is open then in section ([^ ]+) in field ([^ ]+) type in (.+)$")
    public void insertValueInElementInSectionConditional(String pageName, String condition, String sectionName, String elementName, String value){
    	switch (condition){
    		case ("chat"):
    			if (Tools.isChatOpen()){
    				waitForElementInSection(pageName, sectionName, elementName);
    				InputFunctions.setValueInField(pageName, elementName, value);
    			} else {
    				Log.logInfo("Chat is currently closed. Skipping step.");
    			}
    		break;
    		case ("call back"):
    			if (Tools.isChatOpen()){
    				waitForElementInSection(pageName, sectionName, elementName);
    				InputFunctions.setValueInField(pageName, elementName, value);
    			} else {
    				Log.logInfo("Call back is currently closed. Skipping step.");
    			}
    		break;
    	}  	
    }
    
    @And("^(.+): If (chat|call back) is open then in section ([^ ]+) attribute ([^ ]+) of field ([^ ]+) contains value (.+)$")
    public void fieldsAttributeContainsValueInSectionConditional(String pageName, String condition, String sectionName, String attributeName, String elementName, String value){
    	switch (condition){
    	case ("chat"):
    		if (Tools.isChatOpen()){
    			waitForElementInSection(pageName, sectionName, elementName);
    			CompareFunctions.isElementsAttributeInSectionEqualToDesiredText(pageName, elementName, sectionName, attributeName, value);
    		} else {
    			Log.logInfo("Chat is currently closed. Skipping step.");
    		}
    	break;
    	case ("call back"):
    		if (Tools.isChatOpen()){
    			waitForElementInSection(pageName, sectionName, elementName);
    			CompareFunctions.isElementsAttributeInSectionEqualToDesiredText(pageName, elementName, sectionName, attributeName, value);
    		} else {
    			Log.logInfo("Call back is currently closed. Skipping step.");
    		}
    	break;
    	}  	
    }    
	
	@When("^(.+): In element ([^ ]+) type in remembered value (.+)$")
	public void insertRememberedValueInElement(String pageName, String elementName, String rememberedName) {
		rememberedName = Buffer.get(rememberedName);		

		waitForElement(pageName, elementName);
		InputFunctions.setValueInField(pageName, elementName, rememberedName);
	}
	
	@When("^(.+): In element ([^ ]+) type in and remember ([^ ]+) random characters as (.+)$")
	public void insertRandomValueInElementAndRememberIt(String pageName, String elementName, int lenght, String nameToRemember) {
		waitForElement(pageName, elementName);
		String randomizedValue = Tools.randomizeString(lenght);
		InputFunctions.setValueInField(pageName, elementName, randomizedValue);
		Buffer.set(nameToRemember, randomizedValue);
	}
	
	@When("^(.+): In element ([^ ]+) type in ([^ ]+) random characters$")
	public void insertRandomValueInElement(String pageName, String elementName, int lenght) {
		waitForElement(pageName, elementName);
		String randomizedValue = Tools.randomizeString(lenght);
		InputFunctions.setValueInField(pageName, elementName, randomizedValue);
	}
	
	@When("^(.+): In element ([^ ]+) type in value (.+)$")
	public void insertValueInElement(String pageName, String elementName, String value) {
		value = Tools.getEnvironmentTestData(value);
		waitForElement(pageName, elementName);
			if (value.equals("RANDOM_EMAIL_ADDRESS")){
				value = Tools.randomizeEmailAddress();
			}
		InputFunctions.setValueInField(pageName, elementName, value);
	}
	
	@When("^(.+): In ([^ ]+) in row ([^ ]+) in element ([^ ]+) type in and remember ([^ ]+) random ([numeric ]*)characters as (.+)$")
	public void insertRandomValueInElementInTableRowAndRememberIt(String pageName, String tableName, int rowNumber, String elementName, int lenght, String stringType, String nameToRemember) {
		String randomizedValue = null;
		List<WebElement> rows = Page.getTableRows(pageName, tableName);
    	WebElement element = rows.get(rowNumber - 1).findElement(getRequiredPage(pageName).getField(elementName).getLocator());
		switch (stringType){
			case ("numeric "):
				randomizedValue = Tools.randomizeNumber(lenght);
				break;
			case (""):
				randomizedValue = Tools.randomizeString(lenght);
				break;
		}
		element.clear();
    	element.sendKeys(randomizedValue);
		Buffer.set(nameToRemember, randomizedValue);
	}
	
	@And("^(.+): In ([section ]*)([^ ]+) clear value of ([^ ]+)$")
	public void clearFieldValueInSection(String pageName, String section, String sectionName, String elementName){
		InputFunctions.clearFieldValueInSection(pageName, sectionName, elementName);
	}
	
    @When("^(.+): In ([^ ]+) in row ([^ ]+) in element ([^ ]+) type in value (.+)$")
    public void insertValueInElementInTableRow(String pageName, String tableName, int rowNumber, String elementName,  String value) {
        if (Buffer.containsKey(value)) {
            value = Buffer.get(value);
        }
        List<WebElement> rows = Page.getTableRows(pageName, tableName);
        WebElement element = rows.get(rowNumber - 1).findElement(getRequiredPage(pageName).getField(elementName).getLocator());
        element.clear();
        element.sendKeys(value);
    }
}
