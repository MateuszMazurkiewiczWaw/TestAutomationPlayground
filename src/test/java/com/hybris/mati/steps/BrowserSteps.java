package com.hybris.mati.steps;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.When;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.assertFalse;

import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.TimeoutException;
import org.openqa.selenium.WebDriver;

import com.hybris.functions.BrowserFunctions;
import com.hybris.functions.MainFunctions;
import com.hybris.utils.Configuration;
import com.hybris.utils.Countries;
import com.hybris.utils.Log;
import com.hybris.utils.Tools;
import com.hybris.utils.WebDriverProvider;
import static com.hybris.utils.PageMapper.getRequiredPage;

/**
 * BrowserSteps class contains Cucumber step definitions for browser related steps.
 * @author Mateusz Mazurkiewicz
 * @see BrowserFunctions
 */
public class BrowserSteps {
	
	public static String currentLanguage = "";
	
	public static void setCurrentLanguage(){
		WebDriverProvider.overrideImplicityWait(1);
		try {			
			currentLanguage = getRequiredPage("Webshop Main Page").getFieldWebElementsValue("CURRENT_LANGUAGE").getText();
			Log.logInfo("Current language: " + currentLanguage);
		} catch (NoSuchElementException exception){
			// it has to be cleared if there are more tests executed.
			currentLanguage = "";
			Log.logInfo("No language navigation bar. Skipping language set.");			
		}
		Countries.setLanguageAndCountry();
		Configuration.loadTranslations();
	}
  
	@Given("^General: open ([^ ]+) for (.+)$")
    public void openUrlForCountry(String pageName, String countryName) {
		String url = Configuration.getParameterValue(Tools.glueString(pageName, "_", "url"));
		String contryCode = Countries.getCountryCode(countryName).toLowerCase();
		url = url.replace("<COUNTRY_CODE>", contryCode);
        try {
        	WebDriverProvider.driver().get(url);
        } catch (TimeoutException e){
    		try {
    			Log.logInfo("TimeoutException caught. Trying to refresh...");
    			WebDriverProvider.driver().navigate().refresh();
    		} catch (TimeoutException ex){
    			Log.logError("TimeoutException caught. Trying to proceed anyway...");
    		}    			
    	}
        setCurrentLanguage();
    }
	
	@Given("^General: open ([^ ]+) (item|range) page$")
    public void openItemRangePage(String itemRangeNumber, String itemRange) {
		String currentUrl = BrowserFunctions.getCurrentUrl();
		String urlWithoutURI = currentUrl.replaceAll(".com(.+)", ".com/");
        WebDriverProvider.driver().get(urlWithoutURI + itemRangeNumber);
    }
	
	@Given("^General: Search for (.+) on site (.+)$")
    public void openSearchUrlForCountry(String searchString, String countryName) {
		String url = Configuration.getParameterValue(Tools.glueString("search_page", "_", "url"));
		String contryCode = Countries.getCountryCode(countryName).toLowerCase();
		url = url.replace("<COUNTRY_CODE>", contryCode);
		url = Tools.glueString(url, searchString);
        WebDriverProvider.driver().get(url);
        // Below line not currently needed.
        //setCurrentLanguage();
    }
	
    /**
     *  Opens a new tab in WebDriver.
     *  @see BrowserFunctions#openNewTab()
     */
    @When("^General: open new tab$")
    public void openNewTab() {
        BrowserFunctions.openNewTab();
    }
    
    @And("^General: Refresh current page$")
    public void refreshCurrentPage(){
    	BrowserFunctions.refreshPage();
    }

    @And("^General: Lose focus$")
    public void loseFocus(){
    	BrowserFunctions.loseFocus();
    	//getRequiredPage(pageName).getField("WHOLE_SITE_CONTENT").click(); - Alternative solution but sometimes it clicks on links (very center of a page).
    }
    
    
    @When("^General: Wait ([^ ]+) (second|seconds)$")
    public void waitForFewSeconds(String numberOfSeconds, String secondSeconds){
    	MainFunctions.waitForNSeconds(Integer.valueOf(numberOfSeconds));
    }
    
    @When("^General: Scroll to the (bottom|top)$")
    public void scrollPage(String scrollDirection){
    	MainFunctions.waitForNSeconds(1);
    	WebDriver driver = WebDriverProvider.driver();
    	JavascriptExecutor jse = (JavascriptExecutor)driver;
    	switch (scrollDirection){
    		case ("bottom"):
    			jse.executeScript("window.scrollTo(0, document.body.scrollHeight)");
    			break;
    		case ("top"):	
    			jse.executeScript("window.scrollTo(0, 0)");
				break;
    	}
    }
    
    @When("^(.+): Scroll to ([^ ]+)$")
    public void scrollToElement(String pageName, String elementName){
    	getRequiredPage(pageName).scrollIntoView(getRequiredPage(pageName).getField(elementName));
    }
    
    @Given("^(.+): Set browser window dimension to ([^ ]+)x([^ ]+)$")
    public void setWindowDimension(String pageName, int width, int height){
    	BrowserFunctions.setWindowSize(width, height);
    }
 
    @Given("^(.+): Set browser window dimension to default$")
    public void setWindowDimensionToDefault(String pageName){
    	BrowserFunctions.setDefaultWindowSize();
    }
    
    @Given("^(.+): If (chat|call back) is open then there (is|are) ([^ ]+) (window|windows) open$")
    public void compareNumberOfOpenedWindowsConditional(String pageName, String condition, String isAre, int desiredNumberOfWindows, String windowWindows){
    	switch (condition){
    		case ("chat"):
    	    	if (Tools.isChatOpen()){
    	    		compareNumberOfOpenedWindows(isAre, desiredNumberOfWindows, windowWindows);
    	    	} else {
    	    		Log.logInfo("Chat is currently closed. Skipping step.");
    	    	}
    		break;
    		case ("call back"):
    	    	if (Tools.isChatOpen()){
    	    		compareNumberOfOpenedWindows(isAre, desiredNumberOfWindows, windowWindows);
    	    	} else {
    	    		Log.logInfo("Call back is currently closed. Skipping step.");
    	    	}
    		break;
    	}

    }
    
    @Given("^General: There (is|are) ([^ ]+) (window|windows|tab|tabs) opened$")
    public void compareNumberOfOpenedWindows(String isAre, int desiredNumberOfWindows, String windowWindows){
    	int actualNumberOfWindows = BrowserFunctions.getNumberOfOpenedWindows();
    	assertTrue("There is: " + actualNumberOfWindows + " windows opened, instead of: " + desiredNumberOfWindows, 
    			actualNumberOfWindows == desiredNumberOfWindows);
    }
    
    @Given("^General: Switch to (previous|next) (tab|window)$")
    public void switchToPreviousWindow(String previousNext, String tabWindow){
    	switch (previousNext){
    	case "previous":
    		BrowserFunctions.switchToPrevTab();
    		break;
    	case "next":
    		BrowserFunctions.switchToNextTab();
    		break;
    	}
    }
    
    @Given("^General: Switch to tab number (.+)$")
    public void switchToDesiredTab(int tabNumber){
    	BrowserFunctions.switchToDesiredTab(tabNumber);
    }
    
    @And("^General: Discard last tab$")
    public void closeLastTab(){
    	BrowserFunctions.closeLastTab();
    }
    
    @And("^General: Discard tab number (.+)$")
    public void closeDesiredTab(int tabNumber){
    	BrowserFunctions.closeSelectedWindow(tabNumber);
    }

    @And("^General: Go (back|forward)$")
    public void goBackOrForward(String backForward){
    	switch(backForward){
    	case "back":
    		BrowserFunctions.goBack();
    		break;
    	case "forward":
    		BrowserFunctions.goForward();
    		break;
    	}
    }
    
    @And("^General: Make session expired (with|without) page refresh$")
    public void expireSession(String withWithout){
    	switch (withWithout){
    	case "with":
    		BrowserFunctions.expireSessionByModifyingCookieValue("JSESSIONID", true);
    		break;
    	case "without":
    		BrowserFunctions.expireSessionByModifyingCookieValue("JSESSIONID", false);
    		break;
    	}
    	MainFunctions.waitForNSeconds(1);
    }
    
    @And("^General: Cookie ([^ ]+) does ([not ]*)exist$")
    public void doesCookieExist(String cookieName, String not){
    	switch(not){
    	case "":
    		assertTrue("Cookie: " + cookieName + " does not exist.", BrowserFunctions.doesCookiesExist(cookieName));
    		break;
    	case " not":
    		assertFalse("Cookie: " + cookieName + " does exist.", BrowserFunctions.doesCookiesExist(cookieName));
    		break;
    	}
    }
    
    @And("^General: Delete cookie (.+)$")
    public void deleteCookie(String cookieName){
    	BrowserFunctions.deleteCookie(cookieName);
    }
    
    @And("^(.+): Switch to frame (.+)$")
    public void switchToDesiredFrame(String pageName, String frame){
    	BrowserFunctions.switchToDesiredFrame(getRequiredPage(pageName).getFieldWebElementsValue(frame));
    }
    
    @And("^General: Switch back to default frame$")
    public void switchBackToDefaultFrame(){
    	BrowserFunctions.switchToDafaultFrame();
    }
    
}