package com.hilti.utils;

import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.StringUtils;
import org.jsoup.Jsoup;
import org.openqa.selenium.By;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;

import java.awt.Toolkit;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static com.hilti.utils.PageMapper.getRequiredPage;
import static org.apache.commons.lang3.StringUtils.EMPTY;
import static org.openqa.selenium.support.ui.ExpectedConditions.visibilityOfElementLocated;
/**
 * This class contains various methods used in Cucumber step definition functions (not directly related to Page objects).
 * @author Mateusz Mazurkiewicz
 */
public class Tools {

	/**
	 * Returns the BigDecimal number extracted from provided string (removing all non-numeric characters and detecting the decimal point).
	 * @param amount e.g.: PLN1,234.56, PLN1.234,56, 12,34 zł itp
	 * @return e.g.: 1234.56 - as BigDecimal
	 * @throws NumberFormatException if the provided string is not valid
	 */
	public static BigDecimal getNumberFromAmount(String amount) {
	    
		// remove all whitespaces and non-breaking spaces
		amount = amount.replaceAll("\\s+", EMPTY).replace(EMPTY + (char)160, EMPTY);
		
		// replace digit separator from , to . between digits
		String[] amountTab = amount.split("");
		StringBuilder sb = new StringBuilder();
		
		for(int i=0; i < amountTab.length; i++){
			if(amountTab[i].equals(",")){
				if(i>0 && (i+1)<=amountTab.length){
					if(StringUtils.isNumeric(amountTab[i-1])&&StringUtils.isNumeric(amountTab[i+1])){
						sb.append(".");
					}
				}
			}else{
				sb.append(amountTab[i]);
			}
		}
		
		amount = sb.toString();
		
		//amount = amount.replace(separatorToRemove, "");		
		// Remove below if statement, after requirements update
		if (amount.contains("FREE")){
			amount = "0";
		}		
		
		amount=amount.replaceAll("[^0-9,.]",EMPTY);		
		
		// String -> BigDecimal 
		BigDecimal number;
		try {
			amount = amount.replace(",", EMPTY);
			number = new BigDecimal(amount);
			
		} catch(NumberFormatException nfEx) {
			// add information on unexpected value and re-throw exception
			nfEx.initCause(new NumberFormatException("Unexpected value - not a number: " + amount));
			throw nfEx;
		}
		
		return number;
	}
	
	/**
	 * Evaluates statement with numbers, amounts and remembered (in Buffer) variables, e.g:<br>
	 * CENA1 + CENA2<br>
	 * CENA * 0.8<br>
	 * <b>[!]</b> Does not support parenthesis.<br>
	 * <b>[!]</b> Performs operations in order given in statement, e.g.: 1+2*3 -> 9 (not 7!).  
	 * @param statement		string representation of the statement to evaluate
	 * @return a BigDecimal number as a result of statement evaluation
	 */	
	public static BigDecimal evaluateStatement(String statement) {
	    		
		String[] values = statement.split("\\+|\\-|\\)|\\(|/|\\*");
    	List<BigDecimal> numbers = new ArrayList<>();
    	List<String> symbols = new ArrayList<>();
    	List<Integer> nullPositions = new ArrayList<>();
    	Matcher m = Pattern.compile("\\+|\\-|\\)|\\(|/|\\*").matcher(statement);
    	ScriptEngineManager mgr = new ScriptEngineManager();
        ScriptEngine engine = mgr.getEngineByName("JavaScript");
        int index = 0;
    	
    	while (m.find()) {
    		symbols.add(m.group());
    	}
    	
    	for(String val : values){
    		if(Buffer.containsKey(val)){
    			val = Buffer.get(val);
    		}
    		
    		if(val == null){
    			nullPositions.add(index);
    		}else{
    			if(val.contains("%")){
            		BigDecimal tmp = new BigDecimal(100);
            		BigDecimal number = getNumberFromAmount(val);
            		number = number.divide(tmp); // TODO: RoundingMode
            		numbers.add(number);
            		
        		}else{
        			numbers.add(getNumberFromAmount(val));
        		}
    		}
    		index++;
    	}

    	if(nullPositions.size()!=0){
    		for(int i =0; i < nullPositions.size() ; i++){
        		if(nullPositions.get(i)==0){
        			symbols.set(i, EMPTY);
        		}else{
        			symbols.set(i-1, EMPTY);
        		}
        	}
    	}
    	
    	StringBuilder sb = new StringBuilder();
    	for(int i=0; i<numbers.size(); i++){
    		sb.append(numbers.get(i));
    		if((i+nullPositions.size())<symbols.size())
    			sb.append(symbols.get(i+nullPositions.size()));
    	}
    	
    	BigDecimal result = new BigDecimal(0);
    	try{
    		result = new BigDecimal(engine.eval(sb.toString()).toString());
    	}catch(ScriptException exception){
    		Log.logError(exception.getMessage());
    	}
    	
    	Log.logInfo("Evaluated statement value: " + result);
    	
    	return result;
	}

	/**
	 * Converts the given RGBA value to HEX.
	 * @param backgroundColor	RGBA value
	 * @return HEX value of the given colour
	 */
	public static String convertRgbaToHex(String backgroundColor) {
		
		String[] hexValue = backgroundColor.replace("rgba(", "").replace(")", "").split(",");
		 
		int hexValue1=Integer.parseInt(hexValue[0]);
		hexValue[1] = hexValue[1].trim();
		int hexValue2=Integer.parseInt(hexValue[1]);
		hexValue[2] = hexValue[2].trim();
		int hexValue3=Integer.parseInt(hexValue[2]);
		 
		return (String.format("#%02x%02x%02x", hexValue1, hexValue2, hexValue3)).toUpperCase();
	}

	/**
	 * Generates a random alphanumeric code of the given length.
	 * @param codeLength	length of the desired code
	 * @return alphanumeric code of given length
	 * @see RandomStringUtils#randomAlphanumeric(int)
	 */
	public static String generateCode(int codeLength) {

		return RandomStringUtils.randomAlphanumeric(codeLength).toUpperCase();
	}

	/**
	 * Checks if the given value is contained in (does not have to equal) given list elements.
	 * @param list	list of String values
	 * @param value	value to check
	 * @return whether the given value is contained in one of the list elements
	 */
	public static boolean isValueContainedInListElements(List<String> list, String value) {
		for(String s : list) {
			if(s.contains(value)) {
				return true;
			}
		}
		return false;
	}

	/**
	 * Sleeps the current thread for a given number of milliseconds.
	 * @param i number of milliseconds to sleep
	 */
	public static void sleeper(int i) {
		try {

			Thread.sleep(i);
		} catch (InterruptedException e) {

			e.printStackTrace();
		}
	}

	/**
	 * Waits for the specified field to load completely (for the driver to locate it).
	 * @param field		name of the field
	 * @see WebDriverWait
	 * @see org.openqa.selenium.support.ui.ExpectedConditions#visibilityOfElementLocated(By)
	 */
	//TODO: Move to Page
	public void waitForLoadElement(Field field){

		WebDriverWait wait = new WebDriverWait(WebDriverProvider.driver(), 10);
		wait.until(visibilityOfElementLocated(field.getLocator()));
		sleeper(1000);
	}

	/**
	 * Counts the elements specified by field name on the given page.
	 * @param pageName		name of the page
	 * @param elementName	name of the field list
	 * @return the number of found elements
	 * @see Page#getFieldValues(String)
	 */
	//TODO: Move to Page
	public int getPositionAmount(String pageName, String elementName){

		return getRequiredPage(pageName).getFieldValues(elementName).size();
	}
	
	/**
	 * Randomizes PESEL or ID number.
	 * @param value type of desired random
	 * @return randomized PESEL or ID.
	 */
	public static String randomizeIdentity(String value){

		
		switch (value) {
			case "RANDOM_PESEL":
				int wagePesel[], checkSumPesel;
				wagePesel = new int[] { 1, 3, 7, 9, 1, 3, 7, 9, 1, 3 };

				int year = (int) (Math.random() * 100);
				int month = (int) (Math.random() * 12 +1 );
				int day = (int) (Math.random() * 28 +1);
				int recordNumber = (int) (Math.random() * 999);
				int gender = (int) (Math.random() * 9);

				String pesel = String.format("%02d%02d%02d%03d%d", year, month, day, recordNumber, gender);

				char[] peselElem = pesel.toCharArray();
				checkSumPesel = 0;
				for (int i = 0; i < wagePesel.length; i++) {
					checkSumPesel += wagePesel[i] * Integer.parseInt(""+peselElem[i]);
				}
				checkSumPesel = (checkSumPesel%10);
				if (checkSumPesel != 0){
					checkSumPesel = 10 - checkSumPesel;
				}
				pesel = pesel + checkSumPesel;
				Log.logInfo("PESEL: " + pesel);
				return pesel;
			case "RANDOM_ID":
				int wageId[], checkSumId;
				wageId = new int[] { 7, 3, 1, 7, 3, 1, 7, 3 };

				int char1 = (int) (Math.random() * 25 + 10);
				int char2 = (int) (Math.random() * 25 + 10);
				int char3 = (int) (Math.random() * 25 + 10);
				int nbr = (int) (Math.random() * 99999 + 1);

				char[] nbrAsch = String.format("%05d", nbr).toCharArray();
				checkSumId = wageId[0] * char1 + wageId[1] * char2 + wageId[2] * char3;
				for (int i = 3; i < wageId.length; i++) {
					final int parseInt = Integer.parseInt("" + nbrAsch[i-3]);
					checkSumId += wageId[i] * parseInt;
				}
				String ID = (char)(char1+55)+""+(char)(char2+55)+""+(char)(char3+55) + ""+(checkSumId%10)+""+nbr;
				Log.logInfo("ID: " + ID);
				return ID;
			default:
				Log.logError("Unsupported random type of identity: "+value+".");
				return null;
		}
	}
	
	/**
	 * Randomizes unique E-mail address.	  
	 * @return randomized unique E-mail.
	 */
	public static String randomizeEmailAddress(){
		String domain = "@hilti-holng.zzz";
		Long currentMillis = System.currentTimeMillis(); //Value will be always unique
		return String.valueOf(currentMillis) + domain;
		
	}
	
	/**
	 * Randomizes string with letters and numbers.	  
	 * @return randomized string.
	 */
	public static String randomizeString(int lenght){
		return RandomStringUtils.random(lenght, true, true).toUpperCase();
	}
	
	/**
	 * Gets current machine's name
	 * @return current machine name
	 */
	public static String getMachineName(){
		String machineName = null;
		try {
			machineName = InetAddress.getLocalHost().getHostName();
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return machineName;
	}
	
	/**
	 * Creates list of machines from LocalMachines.xml
	 * @return machine list
	 */
    public static List<String> getMachineList() {
    	
        String MACHINE_FILE_LOCATION = "src/main/resources/LocalMachines.xml";
        
        NodeList nodeList = XmlParser.parseXmlWithMachines(MACHINE_FILE_LOCATION);
        List<String> machineList = new ArrayList<>();

        for (int temp = 0; temp < nodeList.getLength(); temp++) {

            Node nNode = nodeList.item(temp);

            if (nNode.getNodeType() == Node.ELEMENT_NODE) {
                Element eElement = (Element) nNode;
                machineList.add(eElement.getElementsByTagName("name").item(0).getTextContent());
            }
        }

        return machineList;
    }
	
	/**
	 * Gets last commit unique number (incrementation).
	 * @return last commit number
	 */
	public static String getGitCommitNumber(){
		String version = null;
		try {
			Process process = Runtime.getRuntime().exec("git rev-list --count HEAD");
            BufferedReader bufferReader = new BufferedReader(new InputStreamReader(process.getInputStream()));    
            version = bufferReader.readLine();
		} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();		
		}
		return version; 
	}

	public static String glueString(String... parts){

		StringBuilder sb = new StringBuilder();

		for(String part : parts){

			sb.append(part);
		}

		return sb.toString();
	}
	
	public static void createTextFile(String path, String text){
		PrintWriter writer;
		try {
			writer = new PrintWriter(path, "UTF-8");
			writer.println(text);
			writer.close();
		} catch (FileNotFoundException | UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	
	public static String getOperatingSystem(){
		return System.getProperty("os.name");
	}

	public static boolean isListSorted(List<String> acutualList, String type){
		List<String> sortedList = new ArrayList<String>(acutualList);
		
		switch (type){
		 case "ascending":
			 Collections.sort(sortedList);
			 break;
		 case "descending":
			 Collections.sort(sortedList);
			 Collections.reverse(sortedList);
			 break;
		}
		
		boolean isSorted = true;
		int i = 0;
		while (i < sortedList.size() && isSorted){
			isSorted = sortedList.get(i).toUpperCase().equals(acutualList.get(i).toUpperCase());
			i++;
		}
		
		if (!isSorted){
			Log.logError("Inconsistency found during sort validation. Value from sorted list: '" + 
					sortedList.get(i - 1) + "' does not equal value from actual list: '" + acutualList.get(i - 1) + "'");
		}
		
		return isSorted;
	}
	
	public static boolean isDateListSorted(List<String> list, String type){
		SimpleDateFormat dateFormat = new SimpleDateFormat("M/dd/yyyy", Locale.ENGLISH);
		
		List<String> millisList = new ArrayList<String>();
		int i = 0;
		while (i < list.size()){
			try {
				Date date = dateFormat.parse(list.get(i));
				millisList.add(String.valueOf(date.getTime()));
			} catch (ParseException e) {
				Log.logError("Date: '" + list.get(i) + "' is unparsable."); 
			}
			i++;
		}
		return isListSorted(millisList, type);
	}
	
	
	public static String getCurrentTime(){
		SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm");
		Date date = new Date();
		return dateFormat.format(date);
	}
	
	public static boolean isHourInCertainPeriod(String hour, String periodBeginHour, String periodEndHour){
		Log.logInfo("Time period: " +  periodBeginHour + "-" + periodEndHour + ". Desired time: " + hour);
		SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm");
		Date desiredHour = null;
		Date beginHour = null;
		Date endHour = null;
		
		try {
			desiredHour = dateFormat.parse(hour);
			beginHour = dateFormat.parse(periodBeginHour);
			endHour = dateFormat.parse(periodEndHour);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		if (desiredHour.after(beginHour) && desiredHour.before(endHour)){
			return true;
		} else {
			return false;
		}
	}
	
	public static Dimension getScreenResolution(){
		java.awt.Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
		int width = (int) screenSize.getWidth();
		int height = (int) screenSize.getHeight();
		return new Dimension(width, height);
	}
	
	public static String getEnvironmentTestData(String testData){
		String value;
		
		// QIE handling
		String productQuntityChar = "#";
		
		if (testData.contains(productQuntityChar)){
			int indexOfProductQuantityChar = testData.indexOf(productQuntityChar);
			String productQunatity = testData.substring(indexOfProductQuantityChar);
			String testDataToFind = testData.substring(0, indexOfProductQuantityChar);
			
			value = Configuration.getParameterValue(testDataToFind);
			if (value != null){
				value = value + productQunatity;
			}						
		} else {			
			value = Configuration.getParameterValue(testData);
		}
		
		if (value == null){
			Log.logInfo("Environment test data: " + testData + " not found in config file. Returning as is.");
			return testData;
		} else {			
			Log.logInfo("Environment test data for: " + testData + " is: " + value);
			value = Tools.sanitizeTranslation(testData, value);
			return unescapeHtml(value);
		}
	}
	
	/**
	 * Removes spaces and new lines from string
	 * @param stringToSanitize
	 * @return
	 */
	public static String sanitizeString(String stringToSanitize){
		return stringToSanitize.replace("\n", EMPTY).replace(" ", EMPTY);
	}
	
	public static String sanitizeTranslation(String translationKey, String translationToSanitize){
		String regex = "";
		String exceptionKey = "EXCEPTION_" + translationKey;
		if (Configuration.containsKey(exceptionKey)){
			Log.logInfo("Translation: " + translationKey + " found on exceptions list.");
			Log.logInfo("Translation before sanitizing: " + translationToSanitize);
			regex = Configuration.getParameterValue(exceptionKey);
			String afterSanitization = translationToSanitize.replaceAll(regex, "");
			Log.logInfo("Translation after sanitizing: " + afterSanitization);
			return afterSanitization;
		} else {
			Log.logInfo("Translation: " + translationKey + " not listed on exceptions list.");			
			return translationToSanitize;
		}	
	}
	
	public static boolean isChatOpen(){
		if (Buffer.containsKey("isChatOpen")){			
			return Boolean.parseBoolean(Buffer.get("isChatOpen"));
		} else {
			return false;
		}
	}
	
	public static String unescapeHtml(String text){
		String unescapedHtml = Jsoup.parse(text).text();
		Log.logInfo("Unescaping HTML in String: '" + text + "' result: '" + unescapedHtml + "'");
		return unescapedHtml;
	}
	
	public static int sanitizeIntegerFromString(String string){
		return Integer.parseInt(string.replaceAll("\\D", EMPTY));
	}
	
	public static int getIndexOfStringInList(List<String> list, String desiredString){
		int i = 0;
		boolean stringFound = false;
		while (i < list.size()){
			if (list.get(i).contains(desiredString)){
				stringFound = true;
				break;
			}
			i++;
		}
		
		if (stringFound){
			return i;
		} else {
			return -1;
		}
	}
	
	public static int getIndexOfEqualStringInList(List<String> list, String desiredString){
		int i = 0;
		boolean stringFound = false;
		while (i < list.size()){
			if (list.get(i).equals(desiredString)){
				stringFound = true;
				break;
			}
			i++;
		}
		
		if (stringFound){
			return i;
		} else {
			return -1;
		}
	}
	
	public static boolean isListContainingString (List<String> list, String desiredString){
		int i = 0;
		boolean stringFound = false;
		while (i < list.size()){
			if (list.get(i).contains(desiredString)){
				stringFound = true;
				break;
			}
			i++;
		}
		return stringFound;
	}
	
	public static boolean isListContainingEqualString (List<String> list, String desiredString){
		int i = 0;
		boolean stringFound = false;
		while (i < list.size()){
			if (list.get(i).equals(desiredString)){
				stringFound = true;
				break;
			}
			i++;
		}
		return stringFound;
	}
	
	public static List<String> getListOfCommaSeparetedString(String stringToSeparate){
		stringToSeparate = sanitizeString(stringToSeparate);
		List<String> strings = Arrays.asList(stringToSeparate.split(","));
		return strings;
	}
	
	public static String randomizeNumber(int lenght){
		return RandomStringUtils.randomNumeric(lenght);
	}
}
