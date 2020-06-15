package com.hilti.functions;

import org.apache.commons.lang3.StringUtils;
import org.junit.Assert;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.WebElement;

import com.hilti.utils.*;

import java.math.BigDecimal;
import java.util.Collection;
import java.util.List;
import static org.apache.commons.lang3.StringUtils.containsIgnoreCase;

import static com.hilti.functions.MainFunctions.waitForElement;
import static com.hilti.utils.PageMapper.getRequiredPage;
import static com.hilti.utils.Tools.evaluateStatement;
import static com.hilti.utils.Tools.getNumberFromAmount;
import static com.hilti.utils.WebDriverProvider.driver;
import static org.apache.commons.lang3.StringUtils.*;
import static org.junit.Assert.*;
/**
 *  Class contains methods used in steps related to comparing values given by user to WebElements and values saved in Buffer.
 *  Hybris recommended version 5.5
 *  TA-CORE
 *  @author Mateusz Mazurkiewicz
 *  @version 1.0
 */

public class CompareFunctions {
    /**
     *  Checks if specified field's value equals the given value.
     * * @param pageName          name of the page containing the field/section
     * @param sectionName       name of the field/section
     * @param expectedValue     expected value
     * @see Page#getFieldValue(String)
     * @see Assert#assertEquals(Object, Object)
     */
    public static void positionHasValue(String pageName, String sectionName, String expectedValue) {
        waitForElement(pageName, sectionName);
        assertEquals("Expected value: " + expectedValue + ", actual value: " + getRequiredPage(pageName).getFieldValue(sectionName), expectedValue, getRequiredPage(pageName).getFieldValue(sectionName));
    }

    /**
     *  Checks if specified field contains the given value (ignores case).
     * @param pageName          name of the page containing the field
     * @param fieldName         name of the field
     * @param expectedValue     expected contained value
     * @see Page#getFieldValue(String)
     * @see StringUtils#containsIgnoreCase(CharSequence, CharSequence)
     */
    public static void fieldContainsValue(String pageName, String fieldName, String expectedValue) {
        waitForElement(pageName, fieldName);
        String value = getRequiredPage(pageName).getFieldValue(fieldName);
        assertTrue("Expected value:" + expectedValue + ", actual value: " + value, containsIgnoreCase(value, expectedValue));
    }

    /**
     * Checks if specified column contains a field with given value(text).
     * @param pageName      name of the page containing the column
     * @param columnName    name of the column
     * @param searchedText  value(text) expected to be found in column
     * @see Page#findWebElementWithSpecifiedText(List, String)
     * @see Page#getFieldWebElementsValues(String)
     */
    public static void columnHasValue(String pageName, String columnName, String searchedText) {
        waitForElement(pageName, columnName);
        WebElement value=getRequiredPage(pageName).findWebElementWithSpecifiedText(getRequiredPage(pageName).getFieldWebElementsValues(columnName), searchedText);
        assertTrue("Searched column: \"" + columnName + "\", searched text: " + searchedText, value != null);
    }



    /**
     *  Counts fields in the specified section and compares their number to a given value.
     * @param pageName              name of the page containing the section
     * @param sectionName           name of the section containing the fields
     * @param expectedRowsNumber    expected number of fields
     */
    public static void amountOfRowsIsEquals(String pageName, String sectionName,int expectedRowsNumber) {
        int actualSize = WebDriverProvider.driver().findElements(getRequiredPage(pageName).getField(sectionName).getLocator()).size();
         assertTrue("Expected row amount: " + expectedRowsNumber + ", actual row size: " + actualSize, expectedRowsNumber == actualSize);
    }

    /**
     *  Checks if specified field contains the given value (ignores case). If the given value is a valid Buffer key, it checks for the value taken from Buffer.
     * @param pageName      name of the page containing the field
     * @param fieldName     name of the field
     * @param expectedValue expected value or Buffer key
     * @see Buffer
     * @see StringUtils#containsIgnoreCase(CharSequence, CharSequence)
     */
    public static void isFieldContainingValue(String pageName, String fieldName, String expectedValue) {
        String valueInField = driver().findElement(getRequiredPage(pageName).getField(fieldName).getLocator()).getText();
        assertTrue("Expected value: " + expectedValue + ", value in Field: " + valueInField, containsIgnoreCase(valueInField.replaceAll(" ", EMPTY), expectedValue.replaceAll(" ", EMPTY)));
    }

    /**
     *  Gets value (if it is a valid Buffer key, the value is taken from Buffer) and checks if it contains a given String (ignores case).
     * @param inputValue    Buffer key or value
     * @param expectedString    expected contained value
     * @see Buffer
     * @see StringUtils#containsIgnoreCase(CharSequence, CharSequence)
     */
    public static void valueContainsString(String inputValue, String expectedString) {
        if(Buffer.containsKey(expectedString)) {
            expectedString = Buffer.get(expectedString);
        }
        if(Buffer.containsKey(inputValue)) {
            inputValue = Buffer.get(inputValue);
        }
        assertTrue("Expected Value: " + expectedString + ", input value: " + inputValue, containsIgnoreCase(inputValue, expectedString));
    }

    /**
     *  Checks if the given field's value is equal to specified value (if it is a valid Buffer key, the value is taken from Buffer).
     * @param pageName      name of the page containing the field
     * @param fieldName     name of the field
     * @param statement     expected value / key in Buffer
     * @see Buffer
     * @see Tools#getNumberFromAmount(String)
     */
    public static void isValueEqualsAsStatementResult(String pageName, String fieldName, String statement) {
        waitForElement(pageName, fieldName);
        BigDecimal rememberedValue;

        if(Buffer.containsKey(statement))
            rememberedValue = getNumberFromAmount(Buffer.get(statement));
        else
            rememberedValue = getNumberFromAmount(statement);
        assertTrue("Expected value: " + rememberedValue + ", value in Field: " + getNumberFromAmount(getRequiredPage(pageName).getFieldValue(fieldName)), rememberedValue.compareTo(getNumberFromAmount(getRequiredPage(pageName).getFieldValue(fieldName))) == 0);
    }


    /**
     *  Gets value from the Buffer and checks if it equals a given String (ignores case).
     * @param rememberedName    Buffer key
     * @param expectedString    expected value
     * @see Buffer
     * @see StringUtils#equalsIgnoreCase(CharSequence, CharSequence)
     */
    public static void valueHasEqualsString(String rememberedName, String expectedString) {
        if(Buffer.containsKey(rememberedName)){
            rememberedName = Buffer.get(rememberedName);
        }
        assertTrue("Expected Value: " + expectedString + ", remembered value: " + rememberedName, equalsIgnoreCase(rememberedName, expectedString));
    }

    //TODO zmodyfikować i dopracować
    public static void fieldHasEqualsIgnoreCase(String pageName, String valueToCompare, String expectedValue){
        waitForElement(pageName, valueToCompare);
        valueToCompare=getRequiredPage(pageName).getFieldValuesInSpecifiedPositionNumber(WebDriverProvider.driver()
                        .findElements(getRequiredPage(pageName).getField(valueToCompare).getLocator()).size(), valueToCompare);
        assertTrue("Expected Value: " + expectedValue + ", remembered value: " + valueToCompare, equalsIgnoreCase(expectedValue, valueToCompare));
    }

    /**
     * Gets value of provided key from the Buffer and compares it to calculated value of the statement (statement may include explicitly given values as well as Buffer keys).
     * @param expectedValue     String representation of the statement (e.g. 2*KEY, KEY1+KEY2)
     * @see Buffer
     * @see Tools#getNumberFromAmount(String)
     * @see Tools#evaluateStatement(String)
     */
    public static void checkRememberedValue(String rememberedValue, String expectedValue) {
        BigDecimal bdValue = Buffer.containsKey(rememberedValue) ? getNumberFromAmount(Buffer.get(rememberedValue)) : getNumberFromAmount(rememberedValue);
        assertTrue("Expected Value: " + evaluateStatement(expectedValue) + ", remembered value: " + bdValue, evaluateStatement(expectedValue).compareTo(bdValue) == 0);
    }

    /**
     * Calculates the values of two given statements and compares the results.
     * @param value         String representation of the first statement (e.g. 2*KEY)
     * @param expectedValue String representation of the second statement (e.g. KEY1+KEY2)
     * @see Tools#evaluateStatement(String)
     */
    public static void isValueEqualsExpectedValue(String value, String expectedValue) {
   	 	BigDecimal _value = evaluateStatement(expectedValue).setScale(2, BigDecimal.ROUND_HALF_UP);
   	 	BigDecimal _expectedValue = evaluateStatement(value).setScale(2, BigDecimal.ROUND_HALF_UP);
       assertTrue("Expected Value: " + _expectedValue  + ", statement value: " + _value, _value.compareTo(_expectedValue) == 0);
   }

    /**
     *  Compares the given field's value to calculated value of the statement (statement may include explicitly given values as well as Buffer keys).
     * @param fieldName     name of the field
     * @param expectedValue     String representation of the statement (e.g. 2*KEY, KEY1+KEY2)
     * @see Tools#evaluateStatement(String)
     */
    public static void isFieldValueAsSumStatementResult(String pageName, String fieldName, BigDecimal expectedValue) {
        assertTrue("Expected Value: " + expectedValue + ", actual value: " + getRequiredPage(pageName).getFieldValue(fieldName), getNumberFromAmount(getRequiredPage(pageName).getFieldValue(fieldName)).compareTo(expectedValue) == 0);
    }

    /**
     *  Checks if value of the specified field is different from a given value.
     * @param value         real value in field
     * @param unexpectedValue   value to check against
     */
    public static void fieldNotHaveValue(String value, String unexpectedValue) {
        assertNotEquals("Unexpected value: " + unexpectedValue + ", actual value: " + value, unexpectedValue, value);
    }

    /**
     *  Counts fields in the specified section and checks if their number is bigger than a given value.
     * @param pageName              name of the page containing the section
     * @param sectionName           name of the section containing the fields
     * @param expectedRowsNumber    number to compare
     */
    public static void rowsNumberIsGreater(String pageName, String sectionName, int expectedRowsNumber) {
        waitForElement(pageName, sectionName);
        int actualSize = WebDriverProvider.driver().findElements(getRequiredPage(pageName).getField(sectionName).getLocator()).size();
        assertTrue("Expected row amount: " + expectedRowsNumber + ", actual size: " + actualSize,expectedRowsNumber < actualSize);
    }

    /**
     *  Checks if value in the specified field is equal to value calculated from given statement.
     * @param pageName          name of the page containing the field
     * @param fieldName         name of the field
     * @param rememberedValue   String representation of the statement (e.g. 2*KEY, KEY1+KEY2)
     */
    public static void rowValueIsEqual(String pageName, String fieldName, String rememberedValue) {
        BigDecimal actualSize = getNumberFromAmount(getRequiredPage(pageName).getFieldValue(fieldName));
        assertTrue("Expected value: " + evaluateStatement(rememberedValue) + ", actual value: " + actualSize, actualSize.compareTo(evaluateStatement(rememberedValue))==0);
    }

    /**
     * Performs a >=, <= or == comparison between given values (or corresponding values from the Buffer).
     * @param firstValue    first value or Buffer key
     * @param operator      ">=", "<=" or "==" operator
     * @param secondValue   second value or Buffer key
     * @see Buffer
     */
    public static void valueIsNotLessOrNotHigh(String firstValue, String operator, String secondValue) {

        if(Buffer.containsKey(firstValue)){
            firstValue = Buffer.get(firstValue);
        }
        if(Buffer.containsKey(secondValue)){
            secondValue = Buffer.get(secondValue);
        }
        switch(operator){
            case ">=" :
                assertTrue("First value: " + firstValue + " " + operator + " second value: " + secondValue, Double.parseDouble(firstValue.replaceAll("[a-zA-Z\\s\"]+", EMPTY)) >= Double.parseDouble(secondValue.replaceAll("[a-zA-Z\\s\"]+", EMPTY)));
                break;

            case "<=":
                assertTrue("First value: " + firstValue + " " + operator + " second value: " + secondValue, Double.parseDouble(firstValue.replaceAll("[a-zA-Z\\s\"]+", EMPTY)) <= Double.parseDouble(secondValue.replaceAll("[a-zA-Z\\s\"]+", EMPTY)));
                break;
            case "==":
                assertTrue("First value: " + firstValue + " " + operator + " second value: " + secondValue, Double.parseDouble(firstValue.replaceAll("[a-zA-Z\\s\"]+", EMPTY)) == Double.parseDouble(secondValue.replaceAll("[a-zA-Z\\s\"]+", EMPTY)));
                break;
        }
    }

    /**
     * Checks if specified field is enabled on given position.
     * @param pageName      name of the page containing the field
     * @param position      position number
     * @param fieldName     name of the field
     * @see WebElement#isEnabled()
     * @see Page#getFieldWebElementsValues(String)
     */
    public static void isFieldNotEnabledOnPosition(String pageName, int position, String fieldName) {
        assertFalse("Field name: " + fieldName + " is enabled on checked position: " + position, getRequiredPage(pageName).getFieldWebElementsValues(fieldName).size() > 0 && getRequiredPage(pageName)
                .getFieldWebElementsValues(fieldName).get(position - 1).isEnabled());
    }

    /**
     * Returns whether specified section/field is empty.
     * @param pageName      name of the page containing the field/section
     * @param fieldName   name of the field/section
     * @return whether specified field/section is empty.
     * @see StringUtils#isEmpty(CharSequence)
     * @see Page#getFieldValue(String)
     */
    public static Boolean checkFieldIsEmpty(String pageName, String fieldName){
        Log.logInfo("Actual value: " + getRequiredPage(pageName).getFieldValue(fieldName));
        return isEmpty(getRequiredPage(pageName).getFieldValue(fieldName));
    }

    /**
     * Checks if the specified field equals the given value (ignores case).
     * @param pageName      name of the page containing the field
     * @param fieldName     name of the field
     * @param expectedValue expected value
     * @see Page#getFieldValue(String)
     * @see StringUtils#equalsIgnoreCase(CharSequence, CharSequence)
     */
    public static void fieldHaveValue(String pageName, String fieldName, String expectedValue){
        waitForElement(pageName, fieldName);
        assertTrue("Expected value: " + expectedValue + ", actual value: " + getRequiredPage(pageName).getFieldValue(fieldName),
                getRequiredPage(pageName).getFieldValue(fieldName).equalsIgnoreCase(expectedValue));
    }

    /**
     * Checks if specified section contains all values from the provided list.
     * @param pageName          name of the page containing the section
     * @param sectionName       name of the section
     * @param stringOfValues    list of values, separated by commas ("val1, val2, val3")
     * @see Page#getFieldValues(String)
     * @see List#containsAll(Collection)
     */
    public static void sectionContainsText(String pageName, String sectionName, String desiredText) {
        waitForElement(pageName, sectionName);  
        String actualText = getRequiredPage(pageName).getField(sectionName).getWebElement().getText();
        assertTrue("Section not contains: " + desiredText + " Actual text: " + actualText, containsIgnoreCase(Tools.sanitizeString(actualText), Tools.sanitizeString(desiredText)));
    }
    
    public static void sectionNotContainsText(String pageName, String sectionName, String desiredText) {
        waitForElement(pageName, sectionName);  
        String actualText = getRequiredPage(pageName).getField(sectionName).getWebElement().getText();
        assertFalse("Section contains: " + desiredText + " Actual text: " + actualText, containsIgnoreCase(actualText, desiredText));
    }
    
    public static void sectionContainsElement(String pageName, String sectionName, String elementName) {  
    	assertTrue("Section " + sectionName + " not contains: " + elementName + " element.", getRequiredPage(pageName).getFieldsWebElementFromSection(sectionName, elementName).isDisplayed());
    } 
    
    public static void sectionNotContainsElement(String pageName, String sectionName, String element) {   
    	WebDriverProvider.overrideImplicityWait(1);
    	boolean condition;
    	try {
    		getRequiredPage(pageName).getFieldsWebElementFromSection(sectionName, element).isDisplayed();
    		condition = true;
    	} catch (NoSuchElementException e){
    		condition = false;
    	}
    	
    	assertFalse("Section " + sectionName + " contains: " + element + " element.", condition); 
    }    
    
    public static void isTextMasked(String pageName, String fieldName){
    	assertTrue("Text is not masked.", getRequiredPage(pageName).getField(fieldName).getWebElement().getAttribute("type").equals("password"));
    }
    
    public static void isTextNotMasked(String pageName, String fieldName){
    	assertTrue("Text is masked.", getRequiredPage(pageName).getField(fieldName).getWebElement().getAttribute("type").equals("text"));
    }
    
    public static boolean isElementVisible(String pageName, String elementName){
    	if (getRequiredPage(pageName).getField(elementName).isDisplayed()){
    		return true;
    	} else {
    		return false;
    	}
    }
    
    public static boolean isElementVisibleInSection(String pageName, String sectionName, String elementName){
    	try {
    		getRequiredPage(pageName).getFieldsWebElementFromSection(sectionName, elementName).isDisplayed();
    		return true;
    	} catch (NoSuchElementException e){
    		return false;
    	} 
    }
    
    public static void isElementValueAttributeEqualToDesiredText(String pageName, String elementName, String desiredText){
    	String actualText = getRequiredPage(pageName).getFieldWebElementsValue(elementName).getAttribute("value");
    	assertTrue("Elements value: '" + actualText + "' is not equal to desired text: '" + desiredText + "'", actualText.equals(desiredText));
    }
    
    public static void isElementsAttributeEqualToDesiredText(String pageName, String elementName, String attribute, String desiredText){
    	String actualAttributeValueText = getRequiredPage(pageName).getField(elementName).getWebElement().getAttribute(attribute);
    	if (actualAttributeValueText != null){
    		assertTrue("Elements attribute value: '" + actualAttributeValueText + "' is not equal to desired text: '" + desiredText + "'", containsIgnoreCase(actualAttributeValueText, desiredText));
    	} else {
    		Assert.fail("Attribute: " + attribute + " not found in element: " + elementName);
    	}
    }
    
    public static void isElementsAttributeInSectionEqualToDesiredText(String pageName, String elementName, String sectionName, String attribute, String desiredText){
    	String actualAttributeValueText = getRequiredPage(pageName).getFieldsWebElementFromSection(sectionName, elementName).getAttribute(attribute);
    	if (actualAttributeValueText != null){
    		assertTrue("Elements attribute value: '" + actualAttributeValueText + "' is not equal to desired text: '" + desiredText + "'", containsIgnoreCase(actualAttributeValueText, desiredText));
    	} else {
    		Assert.fail("Attribute: " + attribute + " not found in element: " + elementName + " in section: " + sectionName);
    	}
    }
    
    public static void isElementsAttributesEqualToDesiredText(String pageName, String elementName, String attribute, String desiredText){
    	List <WebElement> webElements = getRequiredPage(pageName).getFieldWebElementsValues(elementName);
    	if (!webElements.isEmpty()){
    		int i = 0;
    		while (i < webElements.size()){
    			String actualAttributeValueText = webElements.get(i).getAttribute(attribute);
    			assertTrue("Elements attribute value: '" + actualAttributeValueText + "' is not equal to desired text: '" + desiredText + "'", containsIgnoreCase(actualAttributeValueText, desiredText));
    			i++;
    		}   		
    	} else {
    		Assert.fail("Attribute: " + attribute + " not found in element: " + elementName);
    	}
    }
    
    public static void isElementInSectionValueAttributeEqualToDesiredText(String pageName, String sectionName, String elementName, String desiredText){
    	String actualText = getRequiredPage(pageName).getFieldsWebElementFromSection(sectionName, elementName).getAttribute("value");
    	assertTrue("Elements value: '" + actualText + "' is not equal to desired text: '" + desiredText + "'", actualText.equals(desiredText));
    }
    
    public static void isElementInSectionValueAttributeEmpty(String pageName, String sectionName, String elementName){
    	String actualText = getRequiredPage(pageName).getFieldsWebElementFromSection(sectionName, elementName).getAttribute("value");
    	assertTrue("Element's: '" + elementName + "' value attribute is not empty. Actual text: '" + actualText + "'", actualText.equals(""));
    }
    
    public static void isElementSelectedInPosition(String pageName, String sectionName, String elementName, int position){
    	 assertTrue("Element: '" + elementName +"' from postion " + position + " is not selected.", 
    			 getRequiredPage(pageName).getFieldsWebElementsFromSection(sectionName, elementName).get(position - 1).isSelected());
    }
    
    public static void isElementNotSelectedInPosition(String pageName, String sectionName, String elementName, int position){
   	 assertFalse("Element: '" + elementName +"' from postion " + position + " is selected.", 
   			 getRequiredPage(pageName).getFieldsWebElementsFromSection(sectionName, elementName).get(position - 1).isSelected());
   }
    public static void isElementSelected(String pageName, String sectionName, String elementName){
    	assertTrue("Element: '" + elementName + "' is not selected.", 
    			getRequiredPage(pageName).getFieldsWebElementFromSection(sectionName, elementName).isSelected());
    }
    
    public static void isElementNotSelected(String pageName, String sectionName, String elementName){
    	assertFalse("Element: '" + elementName + "' is selected.", 
    			getRequiredPage(pageName).getFieldsWebElementFromSection(sectionName, elementName).isSelected());
    }
    
    public static void isElementVisibleInPosition(String pageName, String sectionName, String elementName, int position){
   	 assertTrue("Element: '" + elementName +"' from postion " + position + " is not visible.", 
   			 getRequiredPage(pageName).getFieldsWebElementsFromSection(sectionName, elementName).get(position - 1).isDisplayed());
   }
    
    public static void isPageTitleContainingText(String expectedTitle){
    	String actualTitle = BrowserFunctions.getPageTitle();
    	assertTrue("Page title '" + actualTitle + "' doesn't contain text '" + expectedTitle + "'", 
    			containsIgnoreCase(actualTitle, expectedTitle));
    }
}
