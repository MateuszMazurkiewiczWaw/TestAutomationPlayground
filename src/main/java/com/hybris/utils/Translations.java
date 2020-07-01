package com.hybris.utils;

import java.io.File;
import java.io.FileNotFoundException;

/**
 * This class contains methods related to translation files handling.
 * @author Mateusz Mazurkiewicz
 *
 * 
 **/
public class Translations {
	
	private static final String thisProjectMainFolderName = "qa";
	private static final String translationFilesPath = "src/hybris/bin/custom/hybris/hybrisstorefront2/web/webroot/WEB-INF/messages/";
	private static final String defaultTranslationFile = "base.properties";
	
	public static String getTranslationFile(String country) throws FileNotFoundException{
		if (country.equals("")){	
			Log.logError("Country has to be specified!");
			System.exit(0);
		}
		
		String mainProjectPath = getMainProjectPath(getCurrentPath());
		String completePathToTranslationFiles = new StringBuilder(mainProjectPath).append(translationFilesPath).toString();
		File[] translationFilesList = new File(completePathToTranslationFiles).listFiles();
		
		if (translationFilesList != null){
			int i = 0;
			boolean translationForCountryAvailable = false;
			while (i < translationFilesList.length){
				if (translationFilesList[i].getName().contains(country)){
					translationForCountryAvailable = true;
					break;
				}
				i++;
			}
			String pathToTranslationFile = "";
			try {
				if (translationForCountryAvailable){
					pathToTranslationFile = translationFilesList[i].toString();
				} else {
					pathToTranslationFile = getDefaultTranslationFile();
					Log.logError("Translation file has not been found for country: " + country + " default translation file will be used: " + defaultTranslationFile);
				}			
			} catch (ArrayIndexOutOfBoundsException excpetion){
				Log.logError("Translation file for country code: " + country + " not found");
				System.exit(0);
			}
			return pathToTranslationFile;
		} else {		
			throw new FileNotFoundException("Translation file: " + completePathToTranslationFiles + " not found.");
		}
	}
	
	private static String getMainProjectPath(String currentPath){
		return currentPath.replaceAll(thisProjectMainFolderName + "(.+)", "");
	}
	
	private static String getCurrentPath(){
		return Configuration.getProjectLocation();
	}
	
	public static String getDefaultTranslationFile(){
		String mainProjectPath = getMainProjectPath(getCurrentPath());
		String completePathToTranslationFiles = new StringBuilder(mainProjectPath).append(translationFilesPath).toString();
		return new StringBuilder(completePathToTranslationFiles).append(defaultTranslationFile).toString();
	}

}