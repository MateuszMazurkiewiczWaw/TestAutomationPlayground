package com.hybris.utils;

import static com.hybris.utils.Tools.glueString;
import static java.io.File.separator;
import static org.apache.commons.lang3.StringUtils.EMPTY;

/**
 * This class contains helper methods for project configuration.
 * @author Mateusz Mazurkiewicz
 * @see Configuration
 */
public class ConfigHelper {

	/**
	 *	Returns a string representing location of the given WebDriver executable.
	 * @param webDriverType		chosen WebDriver
	 * @return	location of WebDriver executable
	 * @see WebDriverType
	 */
    public static String getWebDriverLocation(WebDriverType webDriverType){

	if(WebDriverType.CHROME_WIN.equals(webDriverType)){
		return glueString(Configuration.getProjectLocation(), separator, WebDriverType.CHROME_WIN.getDriverLocation());
	}else if(WebDriverType.CHROME_MAC.equals(webDriverType)) {
		return glueString(Configuration.getProjectLocation(), separator, WebDriverType.CHROME_MAC.getDriverLocation());
	}else if(WebDriverType.IE.equals(webDriverType)){
		return glueString(Configuration.getProjectLocation(), separator, WebDriverType.IE.getDriverLocation());
	}else if(WebDriverType.OPERA.equals(webDriverType)) {
		return glueString(Configuration.getProjectLocation(), separator, WebDriverType.OPERA.getDriverLocation());
	} else{
	    return EMPTY;
	}
    }
}
