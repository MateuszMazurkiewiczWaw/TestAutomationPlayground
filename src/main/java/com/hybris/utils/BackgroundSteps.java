package com.hybris.utils;

import cucumber.api.Scenario;
import cucumber.api.java.After;
import cucumber.api.java.Before;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;

import java.awt.*;


/**
 * Contains Cucumber background steps, executed before and after each Scenario.
 *
 * @author Mateusz Mazurkiewicz
 * 
 */
public class BackgroundSteps {
	
	public static boolean keepBufferSession = false;

    /**
     * Initializes the WebDriver, moves the mouse pointer out of browser window and initializes the Buffer. Executed before each scenario.
     *
     * @see WebDriverProvider
     * @see Buffer
     */

    @Before
    public void before() {

        // init browser
        WebDriverProvider.initialize();

        // Move mouse pointer out of browser window. Works only for machines which are not listed in LocalMachines.xml
        if(!Tools.getMachineList().contains(Tools.getMachineName())){
        	try {
	            new Robot().mouseMove(0,(int) GraphicsEnvironment.getLocalGraphicsEnvironment().getMaximumWindowBounds().getHeight() + 100);
	        } catch (HeadlessException | AWTException e) {
	            Log.logError("Exception when moving mouse pointer out of browser window");
	            e.printStackTrace();
	        }
        }
        
        if (!keepBufferSession){
	        // re-init buffer
	        Buffer.initialize();
        }
    }

    /**
     * Takes a screenshot if scenario failed, exits the WebDriver and logs scenario status. Executed after each scenario.
     *
     * @param scenario checked scenario
     * @see TakesScreenshot#getScreenshotAs(OutputType)
     * @see WebDriverProvider
     * @see Log
     */
    @After
    public void after(Scenario scenario) {
    	String downscaleValue = "100";
    	
        if (scenario.isFailed()) {
            JavascriptExecutor js = (JavascriptExecutor) WebDriverProvider.driver();
            js.executeScript("document.body.style.zoom='" + downscaleValue + "%'");
            Log.logInfo("Page for screen shot are scaled to " + downscaleValue + "%");
            byte[] screenshot = ((TakesScreenshot) WebDriverProvider.driver()).getScreenshotAs(OutputType.BYTES);
            scenario.embed(screenshot, "image/png");

        }

        if (scenario.isFailed()) {
            if (Tools.getMachineList().contains(Tools.getMachineName())) {
                // leave the browser open in order to try to complete test manually
                Log.logInfo("Browser will not be closed due to current machine-name appearance in LocalMachine.xml file.");
            } else {
                WebDriverProvider.quit();
            }
        } else {
            WebDriverProvider.quit();
        }

        // report scenario status
        Log.logStatus(scenario.getName(), scenario.getStatus());
    }

}
