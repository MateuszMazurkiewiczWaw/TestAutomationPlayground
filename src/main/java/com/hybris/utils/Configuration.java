package com.hybris.utils;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Properties;

import static java.lang.System.getProperty;
/**
 * Class contains configuration for the project. Includes operations on System properties and loading them from a config file.
 * Config files are stored in test project directory and selected by CI environment (Jenkins).
 * @author Mateusz Mazurkiewicz
 * @see Properties
 */
public class Configuration {

	private static Properties properties;
	
	public static final String CHROME_WEBDRIVER_PROPERTY = "webdriver.chrome.driver";
	public static final String IE_WEBDRIVER_PROPERTY = "webdriver.ie.driver";
	public static final String OPERA_WEBDRIVER_PROPERTY = "webdriver.opera.driver";
	public static final String configFileName = "config.properties";
	public static final String translationExceptionListFilePath = "src/main/resources/TranslationExceptions.properties";
	private static final String encoding = "UTF-8";
	
	static {
		properties = new Properties();
		InputStream inputStreamConfig = null;
		try {
		    inputStreamConfig = Configuration.class.getClassLoader().getResourceAsStream(configFileName);
		    properties.load(inputStreamConfig);
		} catch (FileNotFoundException e) {
			Log.logError("Config file not found: " + inputStreamConfig);
			e.printStackTrace();
			System.exit(1);
			
		} catch (IOException e) {
			Log.logError("Error when processing config file " + inputStreamConfig);
			e.printStackTrace();
			System.exit(2);	
		}
	}
	
	public static void loadTranslations(){
		File translationExceptionsFile = null;
		
		String defaultTranslationFileName = Translations.getDefaultTranslationFile();
		File defaultTranslationFile = null;
		
		String translationFileName = Countries.currentLanguageAndCountry;
		File translationFile = null;
		try {
			translationExceptionsFile = new File(translationExceptionListFilePath); 
			defaultTranslationFile = new File(defaultTranslationFileName);
			translationFile = new File(Translations.getTranslationFile(translationFileName));
		} catch (FileNotFoundException e1) {
			e1.printStackTrace();
			System.exit(0);			
		}	
		
		//load exceptions list
		try {
			BufferedReader bufferReader = new BufferedReader(new InputStreamReader(new FileInputStream(translationExceptionsFile), encoding));
			properties.load(bufferReader);
			Log.logInfo("Translation exceptions file has been loaded from path: " + translationExceptionsFile);
		} catch (FileNotFoundException e) {
			Log.logError("Default translation file not found: " + translationExceptionsFile);
			e.printStackTrace();
			System.exit(1);
		} catch (IOException e) {
			Log.logError("Error when processing default translation file " + translationExceptionsFile);
			e.printStackTrace();
			System.exit(2);	
		}
		
		// load base.properties
		try {
			BufferedReader bufferReader = new BufferedReader(new InputStreamReader(new FileInputStream(defaultTranslationFile), encoding));
			properties.load(bufferReader);	
			Log.logInfo("Translation default file has been loaded from path: " + defaultTranslationFile);
		} catch (FileNotFoundException e) {
			Log.logError("Default translation file not found: " + defaultTranslationFile);
			e.printStackTrace();
			System.exit(1);
		} catch (IOException e) {
			Log.logError("Error when processing default translation file " + defaultTranslationFile);
			e.printStackTrace();
			System.exit(2);	
		}
		
		//Overwrite base.properties by country file, leaving not translated labels from base.properties
		if (!translationFileName.equals(defaultTranslationFileName)){
			try {			
				BufferedReader bufferReader = new BufferedReader(new InputStreamReader(new FileInputStream(translationFile), encoding));
				properties.load(bufferReader);
				Log.logInfo("Translation file has been loaded from path: " + translationFile);
			} catch (FileNotFoundException e) {
				Log.logError("Translation file not found: " + translationFile);
				e.printStackTrace();
				System.exit(1);
			} catch (IOException e) {
				Log.logError("Error when processing translation file " + translationFile);
				e.printStackTrace();
				System.exit(2);	
			}
		}
	}

	/**
	 * Returns the specified property.
	 * @param name	property name
	 * @return the specified property
	 */
	public static String getParameterValue(String name) {
		return properties.getProperty(name);
	}
	
	public static boolean containsKey (String keyName){
		return properties.containsKey(keyName);
	}

	/**
	 * Returns the "user.dir" property.
	 * @return user.dir property
	 */
	public static String getProjectLocation(){
	    return getProperty("user.dir");
	}
}
