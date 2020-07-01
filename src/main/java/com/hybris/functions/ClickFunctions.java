package com.hybris.functions;

import org.openqa.selenium.By;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebDriverException;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;

import com.hybris.utils.Log;
import com.hybris.utils.Page;
import com.hybris.utils.Tools;
import com.hybris.utils.WebDriverProvider;

import java.util.List;

import static com.hybris.functions.MainFunctions.waitForElement;
import static com.hybris.utils.PageMapper.getRequiredPage;
import static com.hybris.utils.WebDriverProvider.driver;
import static org.apache.commons.lang3.StringUtils.containsIgnoreCase;
import static org.openqa.selenium.By.xpath;

/**
 * Class contains methods used in steps related to WebElement interactions (clicks).
 * Hybris recommended version 5.5
 * TA-CORE
 *
 * @author Mateusz Mazurkiewicz
 * @version 1.0
 */
public class ClickFunctions {

    /**
     * Waits for the field to load and clicks it.
     *
     * @param pageName  name of the page containing the field
     * @param fieldName name of the field to be clicked
     * @see MainFunctions#waitForElement(String, String)
     * @see Page#click(String)
     */
    public static void clickIn(String pageName, String fieldName) {
       waitForElement(pageName, fieldName);

       //getRequiredPage(pageName).scrollIntoView(getRequiredPage(pageName).getField(fieldName));
        try {
            WebDriverProvider.driver().findElement(getRequiredPage(pageName).getField(fieldName).getLocator()).click();
        } catch (WebDriverException e){
            throw new WebDriverException("Element found " + getRequiredPage(pageName).getField(fieldName).getLocator() + " is covered by another element.");
        }

    }

    /**
     * Clicks the specified field a given number of times.
     *
     * @param pageName  name of the page containing the field
     * @param fieldName name of the field to be clicked
     * @param number    number of times the field will be clicked
     * @see Page#click(String)
     */
    public static void clickNTimes(String pageName, String fieldName, int number) {
        for (int i = 0; i < number; i++) getRequiredPage(pageName).click(fieldName);
    }

    /**
     * Clicks the specified field for a given position.
     *
     * @param pageName  name of the page containing the field
     * @param position  number of position
     * @param fieldName name of the field to be clicked
     * @see Page#getWebElementOnSpecificPosition(String, int)
     * @see Page#click(String)
     */
    public static void clickFieldFromSpecifiedPosition(String pageName, int position, String fieldName) {
        getRequiredPage(pageName).getWebElementOnSpecificPosition(fieldName, position).click();
    }

    /**
     * Simulates a right-click on a specified field.
     *
     * @param pageName  name of the page containing the field
     * @param fieldName name of the field to be right-clicked
     * @see Actions#contextClick(WebElement)
     */
    public static void rightClick(String pageName, String fieldName) {

        WebElement element = getRequiredPage(pageName).getFieldWebElementsValue(fieldName);

        Actions action = new Actions(driver());
        action.contextClick(element).perform();
    }

    /**
     * Simulates a double-click on a specified field.
     *
     * @param pageName  name of the page containing the field
     * @param fieldName name of the field to be double-clicked
     * @see Actions#doubleClick(WebElement)
     */
    public static void doubleClick(String pageName, String fieldName) {

        Actions action = new Actions(driver());
        action.doubleClick(driver().findElement(getRequiredPage(pageName).getField(fieldName).getLocator())).perform();
    }

    /**
     * In the specified section, finds an element with given text and double-clicks it.
     *
     * @param pageName      name of the page containing the section
     * @param sectionName   name of the section
     * @param expectedValue text present on the element to be double-clicked
     * @see Actions#doubleClick(WebElement)
     * @see Page#getFieldWebElementsValues(String)
     */
    public static void doubleClickFieldInSection(String pageName, String sectionName, String expectedValue) {

        List<WebElement> elementsList;
        elementsList = getRequiredPage(pageName).getFieldWebElementsValues(sectionName);
        for (WebElement el : elementsList) {
            if (containsIgnoreCase(el.getText(), expectedValue)) {
                doubleClick(pageName, el.getText());
                break;
            }
        }
    }

    /**
     * Finds a link containing specified text and clicks it.
     *
     * @param textOnLink text present on the link to be clicked
     * @see WebElement#click()
     * @see WebDriver#findElement(By)
     * @see By#xpath(String)
     */
    public static void clickLinkWithSpecifiedText(String textOnLink) {
        WebElement link = WebDriverProvider.driver().findElement(xpath(Tools.glueString("//*[text()='", textOnLink, "']")));
        link.click();

    }

    /**
     * Clicks and drags across the selected element.
     *
     * @param canvas element to drag across
     * @see Actions#dragAndDropBy(WebElement, int, int)
     */
    public static void dragAndDrop(WebElement canvas) {
        Actions builder = new Actions(WebDriverProvider.driver());
        builder.build();
        builder.clickAndHold(canvas).dragAndDropBy(canvas, 100, 0).release().perform();
    }
    
    
    public static void clickElementWithOffset(WebElement element, int xOffset, int yOffset){
    	Dimension dimension = element.getSize();
    	Log.logInfo("Element size is: " + dimension.toString() + " moving cursor by: " + xOffset + "px horizontally and " + yOffset + "px vertically."); 
    	Actions build = new Actions(WebDriverProvider.driver());
    	build.moveToElement(element, xOffset, yOffset).click().build().perform();
    }
    
    public static void moveCursorToElement(WebElement element){
    	Actions build = new Actions(WebDriverProvider.driver());
    	build.moveToElement(element).build().perform();
    }
    
    public static void clickElementInSectionInPosition(String pageName, String sectionName, String elementName, int position){
		getRequiredPage(pageName).getFieldsWebElementsFromSection(sectionName, elementName).get(position - 1).click();
    }


}
