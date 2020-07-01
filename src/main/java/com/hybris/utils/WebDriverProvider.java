package com.hybris.utils;

import org.openqa.selenium.Dimension;
import org.openqa.selenium.Point;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.ie.InternetExplorerDriver;
import org.openqa.selenium.opera.OperaDriver;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.remote.RemoteWebDriver;
import org.openqa.selenium.safari.SafariDriver;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.concurrent.TimeUnit;

import static java.lang.System.setProperty;
import static org.apache.commons.lang3.StringUtils.EMPTY;
import static org.openqa.selenium.ie.InternetExplorerDriver.INTRODUCE_FLAKINESS_BY_IGNORING_SECURITY_DOMAINS;

/**
 * Based on JBehave PropertyWebDriverProvider class. Provides a WebDriver of selected browser.
 * @author Mateusz Mazurkiewicz
 * @see DesiredCapabilities
 * @see RemoteWebDriver
 */
public class WebDriverProvider {
    /**
     * Thread-local WebDriver instance.
     */
    private static ThreadLocal<WebDriver> driver;
    private static String operatingSystem = Tools.getOperatingSystem();
    public static Integer pageLoadTime = 60;
    public static Integer scriptLoadTime = 30;
    public static Integer implicitlyWaitTime = 30;
    
    /**
     * Initializes the {@link WebDriverProvider#driver}. Chooses the proper browser (pulls it from {@link System} properties), maximizes its window,
     * deletes all cookies and sets the timeouts values.
     * @see WebDriverProvider#createWebDriver(String)
     * @see WebDriver.Window#maximize()
     * @see WebDriver.Timeouts#pageLoadTimeout(long, TimeUnit)
     * @see WebDriver.Timeouts#setScriptTimeout(long, TimeUnit)
     * @see WebDriver.Timeouts#implicitlyWait(long, TimeUnit)
     */

  public static void initialize() {
    String browser = System.getProperty("browser", "chrome").toLowerCase(); 
    
    driver = createWebDriver(browser);
    driver.get().manage().window().setPosition(new Point(0, 0));
    setDriverResolution();
    driver.get().manage().deleteAllCookies();
	driver.get().manage().timeouts().pageLoadTimeout(pageLoadTime, TimeUnit.SECONDS);
	driver.get().manage().timeouts().setScriptTimeout(scriptLoadTime, TimeUnit.SECONDS);
	driver.get().manage().timeouts().implicitlyWait(implicitlyWaitTime, TimeUnit.SECONDS);

  }
  
  public static void overrideImplicityWait(int seconds){
	  driver.get().manage().timeouts().implicitlyWait(Long.valueOf(seconds), TimeUnit.SECONDS);
  }
  
  public static void setDriverResolution(){
	  Dimension screenResolution = Tools.getScreenResolution();
	  Dimension targetResolution = new Dimension(1920, 1080);
	  if (operatingSystem.contains("Mac")){
	  	if (screenResolution.getWidth() > targetResolution.getWidth()){
	      	driver.get().manage().window().setSize(targetResolution);
	  	} else {
	  		driver.get().manage().window().setSize(screenResolution);
	  	}
	  } else {
	  	if (screenResolution.getWidth() > targetResolution.getWidth()){
	      	driver.get().manage().window().setSize(targetResolution);
	  	} else {
	  		driver.get().manage().window().maximize();
	  	}
	  }
  }

    /**
     * Returns a thread-local WebDriver instance. If applicable, executes a curl command to pre-input proxy credentials.<br>
     *     Supported browsers:
     *     <ul>
     *         <li>Mozilla Firefox (firefox)</li>
     *         <li>Internet Explorer (ie)</li>
     *         <li>Google Chrome (chrome) - <b>default</b></li>
     *         <li>Opera Browser (opera)</li>
     *     </ul>
     * @param browser name of the desired browser
     * @return a thread-local WebDriver instance of chosen browser
     * @throws RuntimeException if an unsupported browser is requested
     * @see ConfigHelper#getWebDriverLocation(WebDriverType)
     */
	private static ThreadLocal<WebDriver> createWebDriver(final String browser) {
		
		final boolean useGrid = Boolean.parseBoolean(System.getProperty("grid.use", "false"));
		final String hubAddress = System.getProperty("grid.hub.address", "http://10.1.2.8:4444/wd/hub");
		
		return new ThreadLocal<WebDriver>() {
			@Override
			protected WebDriver initialValue() {
                Log.logInfo("Web driver initialize...");

                if(useGrid) {
                    
                    DesiredCapabilities capabilities;
                    
                    switch(browser) {
                    case "firefox":
                        capabilities = DesiredCapabilities.firefox();
                        break;
                        
                    case "ie":
                        capabilities = DesiredCapabilities.internetExplorer();
                        capabilities.setCapability(INTRODUCE_FLAKINESS_BY_IGNORING_SECURITY_DOMAINS, true);
                        capabilities.setCapability("ignoreZoomSetting", true);
                        break;
                        
                    case "chrome":
                        capabilities = DesiredCapabilities.chrome();
                        capabilities.setCapability("disable-popup-blocking", true);
                        break;

                    case "opera":
                        capabilities = DesiredCapabilities.operaBlink();
                        capabilities.setCapability("disable-popup-blocking", true);
                        break;


                        default:
                        throw new RuntimeException("unsupported browser: " + browser);
                    }
                    Log.logInfo("Use browser: " + browser);
                    URL gridUrl = null;
                    try {
                        
                        gridUrl = new URL(hubAddress);
                    } catch (MalformedURLException e) {
                        
                        e.printStackTrace();
                    }

                    setBrowserVersion(capabilities);
                    
                    return new RemoteWebDriver(gridUrl, capabilities);
                    
                } else {
                    Log.logInfo("Selected browser: " + browser);
                    switch(browser) {
                    case "firefox":
                        return new FirefoxDriver();

                    case "safari":
                         return new SafariDriver();
                        
                    case "ie":
                            setProperty(Configuration.IE_WEBDRIVER_PROPERTY, ConfigHelper.getWebDriverLocation(WebDriverType.IE));
                        return new InternetExplorerDriver();
                        
                    case "chrome":
                    		Log.logInfo("OS: " + operatingSystem);
                    		if (operatingSystem.contains("Mac")){
                    			setProperty(Configuration.CHROME_WEBDRIVER_PROPERTY, ConfigHelper.getWebDriverLocation(WebDriverType.CHROME_MAC));
                    		} else if (operatingSystem.contains("Win")){
                    			setProperty(Configuration.CHROME_WEBDRIVER_PROPERTY, ConfigHelper.getWebDriverLocation(WebDriverType.CHROME_WIN));	
                    		} else {
                    			Log.logError("OS: " + operatingSystem + " not supported.");
                    		}
                        return new ChromeDriver();

                    case "opera":
                            setProperty(Configuration.OPERA_WEBDRIVER_PROPERTY, ConfigHelper.getWebDriverLocation(WebDriverType.OPERA));
                        return new OperaDriver();

                    default:
                        throw new RuntimeException("unsupported browser: " + browser);
                    }

                }

            }
        };
    }

    /**
     * If not empty, get the browser.version {@link System} property and sets it to provided capabilities object.
     * @param capabilities  capabilities object for browser settings
     * @see DesiredCapabilities#setVersion(String)
     */
    public static void setBrowserVersion(DesiredCapabilities capabilities){

        String browserVersion = System.getProperty("browser.version");

        if(!EMPTY.equals(browserVersion)){

           Log.logInfo("Selected browser.version: " + browserVersion);
            capabilities.setVersion(browserVersion);
        }
    }

    /**
     * Returns the {@link WebDriverProvider#driver} object.
     * @return the WebDriver object.
     */
    public static WebDriver driver() {
        return driver.get();
    }

    /**
     * Closes the current WebDriver window and sets the {@link WebDriverProvider#driver} to null.
     */
    public static void quit() {
        
        if(driver != null) {
        
            driver.get().quit();
            driver = null;
        }
    }

    public static void setPageLoadTimeout(int timeout) {
        driver.get().manage().timeouts().pageLoadTimeout(timeout, TimeUnit.SECONDS);
        Log.logInfo("Page loading timeout set to "+timeout+" seconds.");
    }

    public static void restorePageLoadTimeout() {
        driver.get().manage().timeouts().pageLoadTimeout(pageLoadTime, TimeUnit.SECONDS);
        Log.logInfo("Page loading timeout reset to "+pageLoadTime+" seconds.");
    }
}