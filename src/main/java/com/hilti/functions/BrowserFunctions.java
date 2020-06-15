package com.hilti.functions;

import org.junit.Assert;
import org.openqa.selenium.*;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.remote.RemoteWebDriver;

import com.hilti.utils.Configuration;
import com.hilti.utils.Log;
import com.hilti.utils.Tools;
import com.hilti.utils.WebDriverProvider;

import java.awt.AWTException;
import java.awt.Robot;
import java.awt.event.KeyEvent;
import java.util.ArrayList;
import java.util.Date;

import static com.hilti.utils.WebDriverProvider.driver;
import static org.apache.commons.lang3.StringUtils.containsIgnoreCase;

/**
 * Class contains functions for service browser behavior;
 * @author Mateusz Mazurkiewicz
 * @version 1.0
 */

public class BrowserFunctions {
    /**
     * Opens chosen website - URL is read from config file.
     * @param pageName  page identifier in config file
     * @see WebDriver#get(String)
     */
    public static void openUrl(String pageName) {
        try {
            driver().get(Configuration.getParameterValue(Tools.glueString(pageName, "_", "url")));
            Log.logInfo("Opened website: " + driver().getCurrentUrl());
        } catch (WebDriverException e){
            throw new RuntimeException("TimeOut! Page did not load completely in " + WebDriverProvider.pageLoadTime + " seconds.");
        } catch (NullPointerException e) {
            throw new RuntimeException("URL for page: "+pageName+" is not defined in config.");
        }
    }

    /**
     *  Sets WebDriver's window size to specified dimensions.
     * @param width     requested window width
     * @param height    requested window height
     * @see WebDriver.Window#setSize(Dimension)
     */
    public static void setWindowSize(int width, int height) {

        driver().manage().window().setSize(new Dimension(width, height));
        Log.logInfo("Window size set to " + width + "x" + height);
    }
    
    public static void setDefaultWindowSize() {
    	WebDriverProvider.setDriverResolution();
        Log.logInfo("Window size set to default.");
    }

    /**
     *  Closes currently active WebDriver window.
     *  @see WebDriver#close()
     *  @see WebDriver#switchTo()
     */
    public static void closeLastWindow() {

        ArrayList<String> tabs = new ArrayList<> (WebDriverProvider.driver().getWindowHandles());
        int size = tabs.size();
        if (size >= 2){
	        WebDriverProvider.driver().switchTo().window(tabs.get(size - 1)).close();
	        WebDriverProvider.driver().switchTo().window(tabs.get(size - 2));
        } else {
        	Log.logInfo("There is only one tab open. Skipping step.");
        }
    }
    
    public static void closeSelectedWindow(int window){
        ArrayList<String> tabs = new ArrayList<> (WebDriverProvider.driver().getWindowHandles());
        int size = tabs.size();
        if (size >= 1){
	        WebDriverProvider.driver().switchTo().window(tabs.get(window - 1)).close();
        } else {
        	Log.logInfo("There is no tabs open. Skipping step.");
        }
    }

    /**
     *  Closes currently active website.
     *  @see WebDriver#switchTo()
     */
    public static void closePage() {

    	driver().findElement(By.cssSelector("body")).sendKeys(Keys.CONTROL +"t");
        ArrayList<String> tab2 = new ArrayList<> (driver().getWindowHandles());
        driver().switchTo().window(tab2.get(0)).close();
        driver().switchTo().window(tab2.get(1));
    }

    /**
     * Opens a new tab in WebDriver.
     * @see BrowserFunctions#switchToNextTab(String)
     * @see RemoteWebDriver#getCapabilities()
     */
    public static void openNewTab() {
    	String operatingSystem = Tools.getOperatingSystem();
     //   Actions action = new Actions(WebDriverProvider.driver());

        switch(((RemoteWebDriver) WebDriverProvider.driver()).getCapabilities().getBrowserName()) {
            case "chrome":
            	//It should be like this: action.sendKeys(Keys.chord(Keys.COMMAND, "t")).build().perform();
            	//But below is a temporal workaround because of a bug: https://bugs.chromium.org/p/chromedriver/issues/detail?id=30
            	if (operatingSystem.contains("Mac")){
            		try {
						Robot robot = new Robot();
						robot.keyPress(KeyEvent.VK_META);
						robot.keyPress(KeyEvent.VK_T);
						robot.keyRelease(KeyEvent.VK_T);
						robot.keyRelease(KeyEvent.VK_META);
						switchToNextTab();
					} catch (AWTException e) {
						e.printStackTrace();
					}
            	} else if (operatingSystem.contains("Win")){
            		
            		//Hopefully temporal workaround
            		try {
						Robot robot = new Robot();
						robot.keyPress(KeyEvent.VK_CONTROL);
						robot.keyPress(KeyEvent.VK_T);
						robot.keyRelease(KeyEvent.VK_T);
						robot.keyRelease(KeyEvent.VK_CONTROL);
						switchToNextTab();
					} catch (AWTException e) {
						e.printStackTrace();
					}
            		
            		//Used to be as below somehow stopped working.
            		//action.sendKeys(Keys.chord(Keys.CONTROL, "t")).build().perform();
            		
            		switchToNextTab();
        		} else {
        			Log.logError("OS: " + operatingSystem + " not supported.");
        		}
                break;
        }
    }
    
    public static void openLinkInNewTab(WebElement element){
    	String operatingSystem = Tools.getOperatingSystem();
        Actions action = new Actions(WebDriverProvider.driver());

        switch(((RemoteWebDriver) WebDriverProvider.driver()).getCapabilities().getBrowserName()) {
            case "chrome":
            	if (operatingSystem.contains("Mac")){
            		action.keyDown(Keys.COMMAND).click(element).keyUp(Keys.COMMAND).build().perform();
            		switchToNextTab();
            	} else if (operatingSystem.contains("Win")){
            		action.keyDown(Keys.CONTROL).click(element).keyUp(Keys.CONTROL).build().perform();
            		switchToNextTab();
        		} else {
        			Log.logError("OS: " + operatingSystem + " not supported.");
        		}
                break;
        }
    }
    

    public static int getNumberOfOpenedWindows(){
        ArrayList<String> windows = new ArrayList<> (WebDriverProvider.driver().getWindowHandles());
        return windows.size();
    }
    
    /**
     *  Switches to previous tab in WebDriver.
     *  @see WebDriver#switchTo()
     *  @see RemoteWebDriver#getCapabilities()
     */
    public static void switchToPrevTab() {
        ArrayList<String> tabs = new ArrayList<> (WebDriverProvider.driver().getWindowHandles());
        int size = tabs.size();
        
        switch(((RemoteWebDriver) WebDriverProvider.driver()).getCapabilities().getBrowserName()) {
            case "chrome":
                WebDriverProvider.driver().switchTo().window(tabs.get(size - 2));
                break;
        }
    }

    /**
     *  Switches to the next tab in WebDriver.
     *  @see WebDriver#switchTo()
     *  @see WebDriver#getWindowHandles()
     */
    public static void switchToNextTab() {

        ArrayList<String> tabs = new ArrayList<> (WebDriverProvider.driver().getWindowHandles());
        int size = tabs.size();

        switch(((RemoteWebDriver) WebDriverProvider.driver()).getCapabilities().getBrowserName()) {
            case "chrome":
                WebDriverProvider.driver().switchTo().window(tabs.get(size - 1));
                break;
        }
    }
    
    public static void switchToDesiredTab(int tabNumber) {

        ArrayList<String> tabs = new ArrayList<> (WebDriverProvider.driver().getWindowHandles());
        int size = tabs.size();

        if (tabNumber <= size){
	        switch(((RemoteWebDriver) WebDriverProvider.driver()).getCapabilities().getBrowserName()) {
	            case "chrome":
	                WebDriverProvider.driver().switchTo().window(tabs.get(tabNumber - 1));
	                break;
	        }
        } else {
        	Assert.fail("It's not possible to switch to tab number " + tabNumber + ". Number of tabs opened: " + size);
        }
    }

    /**
     *  Closes last Tab in browser.
     */
    public static void closeLastTab(){
        Actions action = new Actions(WebDriverProvider.driver());

        switch(((RemoteWebDriver) WebDriverProvider.driver()).getCapabilities().getBrowserName()) {
            case "chrome":
                closeLastWindow();
                break;
            case "firefox":
                action.sendKeys(Keys.chord(Keys.CONTROL, Keys.F4)).perform();
                break;
            case "internet explorer":
                action.sendKeys(Keys.chord(Keys.CONTROL, Keys.F4)).perform();
                break;
            default:
                closeLastWindow();
                break;
        }
    }
    
    /**
     *  Closes selected Tab in browser.
     */
    public static void closeTabNumber(int tab){

        switch(((RemoteWebDriver) WebDriverProvider.driver()).getCapabilities().getBrowserName()) {
            case "chrome":
                closeSelectedWindow(tab);
                break;
            case "firefox":
                // to be defined
                break;
            case "internet explorer":
            	// to be defined
                break;
            default:
            	closeSelectedWindow(tab);
                break;
        }
    }

    /**
     *  Clear cookies in browser.
     */
    public void clearCookies(){

        WebDriverProvider.driver().manage().deleteAllCookies();
        Log.logInfo("Cleared all cookies.");
    }

    /**
     *  Refresh current page in browser.
     */
    public static void refreshPage() {
    	Log.logInfo("Refreshing page: " + driver().getCurrentUrl());
    	try {
    		WebDriverProvider.driver().navigate().refresh();
    	} catch (TimeoutException e){
    		try {
    			Log.logInfo("TimeoutException caught. Trying to refresh once more...");
    			WebDriverProvider.driver().navigate().refresh();
    		} catch (TimeoutException ex){
    			Log.logError("TimeoutException caught. Trying to proceed anyway...");
    		}    			
    	}        
    }

    /**
     *  Checks if current page's URL contains the specified value.
     * @param pageAddress   String to be checked
     * @see WebDriver#getCurrentUrl()
     */
    public static boolean pageAddressContainsUrl(String pageAddress) {
        Log.logInfo("Checking if actual page url: " + WebDriverProvider.driver().getCurrentUrl() + " contains:" + pageAddress);
        return containsIgnoreCase(WebDriverProvider.driver().getCurrentUrl(), pageAddress);
    }

    /**
     * Checks if system alert is present.
     * @return Boolean
     */
    public static boolean isAlertPresent()
    {
        try {
            WebDriverProvider.driver().switchTo().alert();
            return true;
        }
        catch (NoAlertPresentException Ex) {
            return false;
        }
    }
    
    public static void loseFocus(){
    	Actions action = new Actions(WebDriverProvider.driver());
    	action.sendKeys(Keys.TAB).build().perform();
    }
    
    public static void pressButtonOnKeyboard(Keys button){
    	Actions action = new Actions(WebDriverProvider.driver());
    	action.sendKeys(button).build().perform();
    }
    
    public static void goBack(){
    	WebDriverProvider.driver().navigate().back();
    }
    
    public static void goForward(){
    	WebDriverProvider.driver().navigate().forward();
    }
    
    public static String getPageTitle(){
    	return WebDriverProvider.driver().getTitle();
    }
    
    public static String getCurrentUrl(){
    	return WebDriverProvider.driver().getCurrentUrl();
    }
    
    public static void expireSessionByModifyingCookieValue(String cookieName, boolean refresh){
    	Cookie cookie = WebDriverProvider.driver().manage().getCookieNamed(cookieName);
    	if (cookie != null){
	    	String cookieValue = cookie.getValue();
	    	String cookieDomain = cookie.getDomain();
	    	String cookiePath = cookie.getPath();
	    	Date cookieExpiry = cookie.getExpiry();	
	    	deleteCookie(cookie); 
	    	String newValue = new StringBuilder("EXPIRED").append(cookieValue).toString();
	    	Cookie cookieNew = new Cookie(cookieName, newValue, cookieDomain, cookiePath, cookieExpiry);
	    	WebDriverProvider.driver().manage().addCookie(cookieNew);
	    	if (refresh){
	    		refreshPage();
	    	}
    	} else {
    		Assert.fail("Cookie '" + cookieName + "' not found.");
    	}
    }
    
    public static boolean doesCookiesExist(String cookieName){
    	Cookie cookie = WebDriverProvider.driver().manage().getCookieNamed(cookieName);
    	if (cookie != null){
    		return true;
    	} else {
    		return false;
    	}
    }
    
    public static void deleteCookie(Cookie cookie){
    	WebDriverProvider.driver().manage().deleteCookie(cookie);
    }
    
    public static void deleteCookie(String cookieName){
    	deleteCookie(WebDriverProvider.driver().manage().getCookieNamed(cookieName));
    }
    
    public static WebElement switchToActiveElement(){
    	return WebDriverProvider.driver().switchTo().activeElement();
    }
    
    public static void switchToDesiredFrame(WebElement frameElement){
    	WebDriverProvider.driver().switchTo().frame(frameElement);
    }
    
    public static void switchToDafaultFrame(){
    	WebDriverProvider.driver().switchTo().defaultContent();
    }

}