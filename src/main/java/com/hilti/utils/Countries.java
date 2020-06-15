package com.hilti.utils;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import com.hilti.tahilti.steps.BrowserSteps;

/**
 * This class contains methods related to country codes.
 * @author Mateusz Mazurkiewicz
 *
 * 
 **/
public class Countries {
	
	public static final Map<String, String> countriesMap = new HashMap<String, String>();
	public static String currentCountry = "";
	public static String currentLanguageAndCountry = "";
	
	public static String getCountryCode(String countryName){
		if (countriesMap.isEmpty()){
			generateCountriesHashMap();
		}
		currentCountry = countriesMap.get(countryName);
		return currentCountry;
	}
	
	private static void generateCountriesHashMap(){
		Locale.setDefault(Locale.ENGLISH);
		  for (String iso : Locale.getISOCountries()) {
		        Locale locale = new Locale("", iso);
		        countriesMap.put(locale.getDisplayCountry(), iso);
		   }
	}
	
	public static void setLanguageAndCountry(){
		String currentLanguage = BrowserSteps.currentLanguage;
		if (!currentLanguage.equals("")){
			currentLanguage = currentLanguage.toLowerCase();
			currentLanguageAndCountry = new StringBuilder(currentLanguage).append("_").append(currentCountry).toString();
			Log.logInfo("Active locale: " + currentLanguageAndCountry);
		} else {
			currentLanguageAndCountry = currentCountry;
			Log.logInfo("Only one language available for country: " + currentCountry);
		}
	}

}