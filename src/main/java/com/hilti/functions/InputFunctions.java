package com.hilti.functions;

import org.openqa.selenium.WebElement;

import com.hilti.utils.Buffer;
import com.hilti.utils.FieldType;
import com.hilti.utils.Log;
import com.hilti.utils.Page;
import com.hilti.utils.Tools;

import static com.hilti.utils.PageMapper.getRequiredPage;
import static com.hilti.utils.Tools.isValueContainedInListElements;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 *  Class contains methods used in steps related to data inputs in WebDriver.
 *  Hybris recommended version 5.5
 *  TA-CORE
 *  @author Mateusz Mazurkiewicz
 *  @version 1.0
 */
public class InputFunctions {
    /**
     * Generates a random alphanumeric code of given length and saves it in the Buffer.
     * @param codeLength    length of generated code
     * @param codeName      key under which it will be set in Buffer
     * @see Buffer
     * @see Tools#generateCode(int)
     */
    public static void generateAndRememberCode(int codeLength, String codeName) {
        Buffer.set(codeName, Tools.generateCode(codeLength));
    }

    /**
     * Sets the field's value to specified value (taken from Buffer if it's a valid key). Works for text, list and group fields.
     * @param pageName          name of the page containing the field
     * @param fieldName         name of the field
     * @param rememberedValue   value or Buffer key
     * @throws RuntimeException if field type is GROUP and given value is not available
     * @see Buffer
     * @see Page#setFieldValue(String, String)
     */
    public static void setValueInField(String pageName, String fieldName, String rememberedValue) {
        if(Buffer.containsKey(rememberedValue)){
            rememberedValue = Buffer.get(rememberedValue);
        }
        Log.logInfo("Input value: " + rememberedValue);
        if(getRequiredPage(pageName).getField(fieldName).getFieldType().equals(FieldType.GROUP) && !isValueContainedInListElements(getRequiredPage(pageName).getFieldValues(fieldName), rememberedValue)) {
            throw new RuntimeException("Unable to input " + rememberedValue + " into " + fieldName + " field.");
        } else {
            getRequiredPage(pageName).setFieldValue(fieldName, rememberedValue);
        }
    }

    /**
     * Adds the given value to specified field's value.
     * @param pageName      name of the page containing the field
     * @param fieldName     name of the field
     * @param value         value to be added
     * @see Page#setFieldValue(String, String)
     * @see Page#getFieldValue(String)
     */
    public static void appendTextInField(String pageName, String fieldName,String value) {

        getRequiredPage(pageName).setFieldValue(fieldName, getRequiredPage(pageName).getFieldValue(fieldName) + value);
    }

    /**
     * Clicks a chosen value from a list of elements.
     * @param pageName      name of the page containing the fields
     * @param fieldName     name of the field(s)
     * @param value         text present on the element to be clicked
     * @see Page#findWebElementWithSpecifiedText(List, String)
     * @see Page#getFieldWebElementsValues(String)
     */
    public static void chooseValueFromField(String pageName, String fieldName, String value) {
        List<WebElement> listOfElements = getRequiredPage(pageName).getFieldWebElementsValues(fieldName);
        getRequiredPage(pageName).findWebElementWithSpecifiedText(listOfElements, value).click();
    }

    public static void  selectFieldIntoSection (String pageName, String sectionName,String value){

        String attribute;
        List<WebElement> elements = getRequiredPage(pageName).getFieldWebElementsValues(sectionName);

        for(WebElement item : elements) {

            attribute= item.getAttribute("data-item") != null ? item.getAttribute("data-item").trim() : item.getAttribute("title").trim();
            if( attribute.equalsIgnoreCase(value)){
                item.click();
                break;
            }
        }
    }

    /**
     * Inputs a specified value from a remembered list into a field in specified position. Remembered list must have a form of String with values divided by semicolons ("val1; val2; val3").
     * @param pageName          name of the page containing the fields
     * @param positionNumber    position number of the field
     * @param fieldName         name of the field
     * @param position          position of the value in remembered list
     * @param fieldValue        Buffer key of remembered list of values
     * @see Buffer
     * @see Page#setFieldValuesInSpecifiedPositionNumber(int, String, String)
     */
    public static void insertValueFromList(String pageName, int positionNumber, String fieldName, int position, String fieldValue) {

        List<String> list = new ArrayList<>();
        Arrays.asList(Buffer.get(fieldValue).split(";")).stream().forEach(a -> list.add(a.trim()));
        getRequiredPage(pageName).setFieldValuesInSpecifiedPositionNumber(positionNumber,fieldName, list.get(position-1));
    }
    
    public static void clearFieldValue(String pageName, String elementName){
    	getRequiredPage(pageName).getField(elementName).getWebElement().clear();
    }
    
    public static void clearFieldValueInSection(String pageName, String sectionName, String elementName){
    	getRequiredPage(pageName).getFieldsWebElementFromSection(sectionName, elementName).clear();
    }
    
    public static void setValueToActiveElement(String value){
    	BrowserFunctions.switchToActiveElement().sendKeys(value);
    }


}
