package com.hybris.functions;

import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.StaleElementReferenceException;
import org.openqa.selenium.TimeoutException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebDriverException;
import org.openqa.selenium.WebElement;

import com.hybris.utils.Field;
import com.hybris.utils.Log;
import com.hybris.utils.Page;
import com.hybris.utils.Tools;
import com.hybris.utils.WebDriverProvider;

import static com.hybris.utils.PageMapper.getRequiredPage;
import static com.hybris.utils.Tools.sleeper;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

/**
 *  Class contains basic methods used in steps related to WebElement states (availability, value, etc.).
 *  Hybris recommended version 5.5
 *  TA-CORE
 *  @author Mateusz Mazurkiewicz
 *  @version 1.0
 */
public class MainFunctions {
    /**
     * Waits for a specified element(field) to load.
     * @param pageName      name of the page containing the field
     * @param elementName   name of the field
     * @see Page#waitForLoadElement(Field)
     */
    public static void waitForElement(String pageName, String elementName) {
    	Page page = getRequiredPage(pageName);
        page.waitForLoadElement(page.getField(elementName));
    }
    
    public static void waitForElementDisappear(String pageName, String elementName) throws TimeoutException{
    	WebDriverProvider.overrideImplicityWait(1);
    	int maxWaitTime = WebDriverProvider.scriptLoadTime;
    	boolean isVisible = false;
    	
    	try {
    		isVisible =	getRequiredPage(pageName).getField(elementName).isDisplayed();
    		Log.logInfo("Waiting for element: " + elementName + " to disappear...");
    	} catch (StaleElementReferenceException exception){
    		Log.logInfo("Element: " + elementName + " not visible.");   
		} catch (WebDriverException exception){
			Log.logInfo("WebDriverException caught. " + exception);
		} 
    	
    	int seconds = 0;
    	while (isVisible && seconds <= maxWaitTime){
    		try {
    			isVisible =	getRequiredPage(pageName).getField(elementName).isDisplayed();
    		} catch (StaleElementReferenceException exception) {
    			Log.logInfo("StaleElementReferenceException caught. " + exception);
    		}
    		waitForNSeconds(1);
    		seconds++;
    	}
    	
    	if (!isVisible){
    		Log.logInfo("Element: " + elementName + " has disappeared.");
    	} else {
    		Log.logError("Element: " + elementName + " hasn't dissappear in " + maxWaitTime + " seconds.");
    		throw new TimeoutException("Element: " + elementName + " did not dissappear in: " + maxWaitTime + "seconds.");
    	}
    }
    

    /**
     * Waits for a specified element(field) in section to load.
     * @param pageName      name of the page containing the page
     * @param sectionName   name of the section containing the field
     * @param elementName   name of the field
     * @see Page#waitForLoadElement(Field)
     */
    public static void waitForElementInSection(String pageName, String sectionName, String elementName) {
        Page page = getRequiredPage(pageName);
        page.waitForLoadElementInSection(page.getField(sectionName), page.getField(elementName));
    }


    /**
     * Sleeps the thread for a given number of seconds
     * @param numberOfSeconds   time to sleep in seconds
     * @see Tools#sleeper(int)
     */
    public static void waitForNSeconds(int numberOfSeconds) {
        Log.logInfo("Wait " + numberOfSeconds + " seconds.");
        sleeper(numberOfSeconds * 1000);
    }

    /**
     * Returns whether the specified field is displayed.
     * @param pageName      name of the page containing the field
     * @param fieldName     name of the field
     * @return whether the specified field is displayed
     * @see Page#isDisplayed(String)
     */
    public static Boolean fieldIsDisplayed(String pageName, String fieldName) {
        Log.logInfo("Field: " + fieldName + ", isDisplayed = " + getRequiredPage(pageName).isDisplayed(fieldName));
        return getRequiredPage(pageName).isDisplayed(fieldName);
    }

    /**
     *  Checks if the specified field is selected.
     * @param pageName      name of the page containing the field
     * @param fieldName     name of the field
     * @see WebElement#isSelected()
     */
    public static void elementIsSelected(String pageName, String fieldName){

        assertTrue("Element \"" + fieldName + "\" is not selected", (WebDriverProvider.driver().findElement(getRequiredPage(pageName).getField(fieldName).getLocator())).isSelected());
    }

    /**
     * Returns whether the specified field is enabled.
     * @param pageName      name of the page containing the field
     * @param fieldName     name of the field
     * @return whether the specified field is enabled
     * @see WebElement#isEnabled()
     */
    public static Boolean fieldIsAvailable(String pageName, String fieldName) {
        Log.logInfo("Field " + fieldName + " isAvailable=" + (WebDriverProvider.driver().findElement(getRequiredPage(pageName).getField(fieldName).getLocator())).isEnabled());
       return (WebDriverProvider.driver().findElement(getRequiredPage(pageName).getField(fieldName).getLocator())).isEnabled();
    }

    /**
     * Returns the String value of specified field.
     * @param pageName      name of the page containing the field
     * @param fieldName     name of the field
     * @return value of the specified field.
     * @see Page#getFieldValue(String)
     */
    public static String getContentFromField(String pageName, String fieldName){

        return getRequiredPage(pageName).getFieldValue(fieldName);
    }

    /**
     * Add to page javascript value
     */
    public static void addJavaScriptValue(){
        {
            WebDriver driver = WebDriverProvider.driver();
            JavascriptExecutor js = (JavascriptExecutor) driver;
            js.executeScript("xdrcft = 1;");
        }
    }

    /**
     * Check on page javascript value
     * @param check return False if page refresh
     */
    public static void checkPageRefresh(boolean check){
        WebDriver driver = WebDriverProvider.driver();
        JavascriptExecutor js = (JavascriptExecutor)driver;
        try
        {
            js.executeScript("return xdrcft;");
            Log.logInfo("The page was not refreshed.");
            assertFalse("The page WAS refreshed.", check);
        }
        catch (WebDriverException e)
        {
            Log.logInfo("The page was refreshed.");
            assertTrue("The page was NOT refreshed.", check);
        }
    }
}
