package com.hybris.utils;

import org.openqa.selenium.*;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import static com.hybris.functions.ClickFunctions.clickIn;
import static com.hybris.functions.MainFunctions.waitForNSeconds;
import static com.hybris.utils.MapCreator.fieldMap;
import static com.hybris.utils.PageMapper.getRequiredPage;
import static com.hybris.utils.Tools.sleeper;
import static com.hybris.utils.WebDriverProvider.driver;
import static org.apache.commons.lang3.StringUtils.*;
import static org.junit.Assert.assertTrue;
import static org.openqa.selenium.support.ui.ExpectedConditions.visibilityOf;
import static org.openqa.selenium.support.ui.ExpectedConditions.visibilityOfElementLocated;


/**
 * Represents the current web page. Includes a Map storage for fields and various methods for interacting with them.
 * This class is extended by classes defining project-specific hybris including Field declarations.
 * @author Mateusz Mazurkiewicz
 * @see Field
 */
public class Page {
	/**
	 * Date format used in {@link Page#setText(Field, String)}.
	 */
	public static final DateFormat dateFormatYMDHMS = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	/**
	 * Script used to delay test execution until (if present) any Ajax scripts are done.
	 */
	static final String SCRIPT_WAIT_FOR_AJAX =
			"if(window.hasOwnProperty('jQuery')) {" +
					"  return window.jQuery.active == 0;" +
					"} else {" +
					"  return true;" +
					"}";

	/**
	 * Stores current page fields.
	 */
	protected Map<String, Field> fields = new HashMap<>();

	/**
	 * Adds a field to the current page.
	 * @param fieldName		name of the added field
	 * @param field			Field object to be added
	 * @see Field
	 * @see Storable
	 * @throws RuntimeException if a field with given name already exists on the page
	 */
	public void addField(Storable fieldName, Field field) {

		if(fields.containsKey(fieldName.toString()))
			throw new RuntimeException("Field of the specified name is already defined on the page: " + fieldName);

		fields.put(fieldName.toString(), field);
	}

	/**
	 * Returns the current page field with a given name.
	 * @param fieldName	name of the field
	 * @return the current page field with a given name
	 * @throws RuntimeException if there is no defined field with the given name
	 */
	public Field getField(String elementName) {

		Field field = this.fields.get(elementName);

		if(field == null)
			throw new RuntimeException("Field \"" + elementName + "\" not defined on page.");

		return field;
	}

	/**
	 * Returns whether the page has a field defined.
	 * @param fieldName name of the field
	 * @return whether the field is defined in this page
	 */
	public boolean hasField(String fieldName) {
		return this.fields.get(fieldName) != null;
	}

	/**
	 * Checks if there are any alerts present. If there are, switches control to the alert.
	 * If there are no alerts, waits for the current page to load completely.
	 * @see WebDriver#switchTo()
	 * @see WebDriverWait
	 */

	public static String lastUrl=WebDriverProvider.driver().getCurrentUrl();
	public static Boolean firstUrl=true;

	public void waitForPage() {

		try{

			WebDriverProvider.driver().switchTo().alert();

		}catch(NoAlertPresentException nape){

			WebDriverWait wait = new WebDriverWait(WebDriverProvider.driver(), WebDriverProvider.pageLoadTime);
			if (firstUrl){
				Log.logInfo("Wait until load: " + WebDriverProvider.driver().getCurrentUrl());
				firstUrl=false;
			}
			if (!lastUrl.equalsIgnoreCase(WebDriverProvider.driver().getCurrentUrl())) {
				Log.logInfo("Wait until load: " + WebDriverProvider.driver().getCurrentUrl());
				lastUrl=WebDriverProvider.driver().getCurrentUrl();
			}
			try {
				wait.until((WebDriver driver) -> {
					return ((JavascriptExecutor) driver).executeScript("return document.readyState").equals("complete");
				});
			} catch (WebDriverException e){
				throw new RuntimeException("TimeOut! Page did not load completely in " + WebDriverProvider.pageLoadTime + "seconds.");
			} // TODO: Catch NullPointerException

		}
	}

	/**
	 * Waits for a specified field in section to load with a timeout of 10 seconds.
	 * @param section section containing the field
	 * @param field field
	 * @see WebDriverWait
	 */
	public void waitForLoadElementInSection(Field section, Field field){

		WebDriverWait wait = new WebDriverWait(WebDriverProvider.driver(), WebDriverProvider.scriptLoadTime);
		try {
			wait.until(visibilityOf(section.getWebElement().findElement(field.getLocator())));
		} catch (Exception e){
			throw new RuntimeException("Required element with xpath " + field.getLocator() + " in section located by "+section.getLocator()+",  was not found on page. " +
					"Wait Time for element after completely load page is " + WebDriverProvider.scriptLoadTime + " seconds.");
		}
	}


	/**
	 * Waits for a specified field to load with a timeout of 10 seconds.
	 * @param field name of the field
	 * @see WebDriverWait
	 */
	public void waitForLoadElement(Field field){

		WebDriverWait wait = new WebDriverWait(WebDriverProvider.driver(), WebDriverProvider.scriptLoadTime);
		try {
			wait.until(visibilityOfElementLocated(field.getLocator()));
		} catch (Exception e){
			throw new RuntimeException("Required element with xpath " + field.getLocator() + ",  was not found on page. " +
				"Wait Time for element after completely load page is " + WebDriverProvider.scriptLoadTime + " seconds.");
		}
	}

	/**
	 * Waits for the specified field to load, clicks it and waits for the page to load after clicking.
	 * @param fieldName	name of the field
	 * @see WebElement#click()
	 * @see Page#waitForLoadElement(Field)
	 * @see Page#waitForPage()
	 */
	public void click(String fieldName) {

		Field field = getField(fieldName);

		waitForLoadElement(field);
		switchToFrames(field.getFrames());
		WebElement weField = WebDriverProvider.driver().findElement(field.getLocator());
		//scrollIntoView(field);
		weField.click();

		waitForPage();
	}

	/**
	 * Moves the mouse pointer to the location of specified field.
	 * @param fieldName	name of the field
	 * @see Actions#moveToElement(WebElement)
	 */
	public void pointMouse(String fieldName) {

		Field field = getField(fieldName);
		switchToFrames(field.getFrames());
		new Actions(WebDriverProvider.driver()).moveToElement(field.getWebElement()).perform();
	}

	/**
	 * Clicks the field containing given text in the list of specified fields
	 * @param fieldName		name of the fields
	 * @param text			clicked text
	 * @see Page#getTextFromWebElement(WebElement)
	 */
	public void clickFieldContainsSpecifiedText(String fieldName, String text) {

		waitForPage();
		text = text.replaceAll("\\s+", EMPTY).replace(EMPTY + (char)160, EMPTY);

		Field field = getField(fieldName);
		switchToFrames(field.getFrames());

		for(WebElement item : field.getWebElements())
		{
			if(containsIgnoreCase(getTextFromWebElement(item), text)){

				item.click();
				break;
			}
		}
	}

	/**
	 * Clicks the field with given text in the list of specified fields
	 * @param fieldName		name of the fields
	 * @param text			clicked text
	 * @see Page#getTextFromWebElement(WebElement)
	 */
	public void clickFieldWithSpecifiedText(String fieldName, String text) {

		waitForPage();
		text = text.replaceAll("\\s+", EMPTY).replace(EMPTY + (char)160, EMPTY);

		Field field = getField(fieldName);
		switchToFrames(field.getFrames());

		for(WebElement item : WebDriverProvider.driver().findElements(field.getLocator()))
		{
			if(equalsIgnoreCase(getTextFromWebElement(item), text)){

				item.click();
				break;
			}
		}
	}

	/**
	 * Switches to frames with specified names.
	 * @param frames	names of the frames
	 * @see WebDriver#switchTo()
	 */
	protected void switchToFrames(String... frames) {

		WebDriver driver = WebDriverProvider.driver();

		driver.switchTo().defaultContent();

		for(String frame : frames)
			driver.switchTo().frame(frame);
	}

	/**
	 * Sets the specified field's value.
	 *     <ul>
	 *     <li><b>Text fields:</b> inputs the given value</li>
	 *     <li><b>Lists:</b> selects the given value</li>
	 *     <li><b>Groups:</b> clicks the field containing given text</li>
	 *     <li><b>Checkbox:</b> sets the chosen value (true/false)</li>
	 *     </ul>
	 * @param fieldName		name of the field
	 * @param value			value to be set
	 * @throws RuntimeException if an unsupported field type is given
	 */
	public void setFieldValue(String fieldName, String value) {

		Field field = getField(fieldName);

		switch(field.getFieldType()) {
			case TEXT:
				setText(field, value);
				break;

			case LIST:
				setList(field, value);
				break;

			case GROUP:
				clickFieldContainsSpecifiedText(fieldName, value);
				break;

			case CHECKBOX:
				if(field.isSelected() != Boolean.parseBoolean(value.toLowerCase())) field.click();
				break;

			default:
				throw new RuntimeException("Field type not supported: " + field.getFieldType());
		}
	}

	/**
	 * Gets the field on specified position and inputs the given value.
	 * @param position		position number
	 * @param fieldName		name of the field
	 * @param fieldValue	value to be input
	 * @see Page#getWebElementOnSpecificPosition(String, int)
	 * @see WebElement#sendKeys(CharSequence...)
	 */
	public void setFieldValuesInSpecifiedPositionNumber(int position, String fieldName, String fieldValue){

		WebElement item = getWebElementOnSpecificPosition(fieldName, position);
		item.clear();
		item.sendKeys(fieldValue);
		waitForPage();
	}

	/**
	 * Gets the specified field and inputs given value. If it contains the {@link Constants#NOW} constant, it is replaced by the current time.
	 * @param field		name of the field
	 * @param value		value to be input
	 * @see WebElement#sendKeys(CharSequence...)
	 */
	private void setText(Field field, String value) {
		switchToFrames(field.getFrames());
		WebElement weField = field.getWebElement();

		weField.clear();
		weField.sendKeys(value);

		waitForPage();
	}

	/**
	 * Sets the value of the specified list to a given value.
	 * @param field		name of the list field
	 * @param value		value to be set
	 * @see Select#selectByVisibleText(String)
	 */
	private void setList(Field field, String value) {

		switchToFrames(field.getFrames());
		new Select(field.getWebElement()).selectByVisibleText(value);
		waitForPage();
	}

	/**
	 * Returns text from the first selected option in specified list-type field.
	 * @param field		name of the list field
	 * @return text from the first selected option
	 */
	private String getList(Field field) {

		switchToFrames(field.getFrames());
		return new Select(field.getWebElement()).getFirstSelectedOption().getText().trim();
	}

	/**
	 * Returns the String value of specified field. Supported types:
	 * <ul>
	 *     <li>BUTTON</li>
	 *     <li>TEXT</li>
	 *     <li>IMAGE</li>
	 *     <li>LIST</li>
	 *     <li>DIV</li>
	 *     <li>GROUP</li>
	 *     <li>LINK</li>
	 *     <li>CHECKBOX</li>
	 * </ul>
	 * @param fieldName name of the field
	 * @return value of the specified field
	 * @throws RuntimeException if an unsupported field type is given
	 */
	public String getFieldValue(String fieldName) {

		Field field = getField(fieldName);
		waitForLoadElement(field);

		switch(field.getFieldType()) {
			case BUTTON:

			case TEXT:
				return getText(field);

			case IMAGE:
				return getImage(field);

			case LIST:
				return getList(field);

			case DIV:
				return getDivText(field);

			case GROUP:
				return getFieldValues(fieldName).get(0);

			case LINK:
				return getTitleFromLink(field);

			case CHECKBOX:
				return Boolean.toString(field.isSelected());

			default:
				throw new RuntimeException("Field type not supported: " + field.getFieldType());
		}
	}

	public List<String> getFieldValuesWithOutSubNodes(String fieldName) {

		switchToFrames(getField(fieldName).getFrames());

		List<WebElement> groupItems = getFieldWebElementsValues(fieldName);

		return groupItems.stream()
				.map(item -> ((JavascriptExecutor)WebDriverProvider.driver()).executeScript("return jQuery(arguments[0]).contents().filter(function() {return this.nodeType == Node.TEXT_NODE;}).text();",item).toString())
				.collect(Collectors.toList());

	}


	/**
	 * Returns a list of values from the specified fields.
	 * @param fieldName		name of the fields
	 * @return list of field values
	 * @see Page#getFieldWebElementsValues(String)
	 * @see Page#getValueAttributeFromWebElement(WebElement)
	 */
	public List<String> getFieldValues(String fieldName) {

		switchToFrames(getField(fieldName).getFrames());

		List<WebElement> groupItems = getFieldWebElementsValues(fieldName);

		return groupItems.stream()
				.map(this::getValueAttributeFromWebElement)
				.collect(Collectors.toList());

	}

	/**
	 * Returns the value of specified field on given position.
	 * @param position		number of position
	 * @param fieldName		name of the field
	 * @return value of specified field on given position
	 * @see Page#getFieldWebElementsValues(String)
	 * @see Page#getValueAttributeFromWebElement(WebElement)
	 */
	public String getFieldValuesInSpecifiedPositionNumber(int position, String fieldName){

		List<WebElement> groupItems = getFieldWebElementsValues(fieldName);

		if(groupItems.size() < position) {
			Log.logInfo("The "+fieldName+" list is smaller than "+position+". Unable to get value from position "+position+ "");
			return EMPTY;
		}

		return getValueAttributeFromWebElement(groupItems.get(position - 1));
	}

	/**
	 * Returns a String value of specified {@link WebElement}. If available, gets the "value" attribute, if not, the text value.
	 * @param webElementItem	specified element
	 * @return String value of the specified WebElement
	 * @see WebElement#getAttribute(String)
	 * @see WebElement#getText()
	 */
	private String getValueAttributeFromWebElement(WebElement webElementItem){

		String value = webElementItem.getAttribute("value");

		return value == null ? webElementItem.getText().trim() : value.trim();
	}

	/**
	 * Returns a {@link WebElement} specified by the given field name.
	 * @param fieldName		name of the field
	 * @return a WebElement specified by the given field name.
	 * @see WebDriver#findElement(By)
	 */
	public WebElement getFieldWebElementsValue(String fieldName){

		return getField(fieldName).getWebElement();
	}
	
	public String getWebElementText(String fieldName){
		return getField(fieldName).getWebElement().getText();
	}

	/**
	 * Returns a list of {@link WebElement}s representing fields with specified by given name.
	 * @param fieldName		name of the fields
	 * @return a list of WebElements specified by given name
	 * @see WebDriver#findElements(By)
	 */
	public List<WebElement> getFieldWebElementsValues(String fieldName){

		return getField(fieldName).getWebElements();
	}

	/**
	 * Returns the text value of specified field.
	 * @param field		name of the field
	 * @return text value of specified field
	 * @see WebDriver#findElement(By)
	 */
	private String getDivText(Field field){

		return field.getWebElement().getText();
	}

	/**
	 * Returns the value of 'title' attribute from the specified field.
	 * @param field		name of the field
	 * @return title attribute of specified field
	 * @see WebElement#getAttribute(String)
	 */
	private String getTitleFromLink(Field field){

		switchToFrames(field.getFrames());
		return field.getWebElement().getAttribute("title").trim();
	}

	/**
	 * Returns the value attribute of the given field. If the value attribute is not available, returns the text value.
	 * @param field		name of the field
	 * @return the value of given field
	 * @see WebElement#getAttribute(String)
	 * @see WebElement#getText()
	 */
	private String getText(Field field) {

		switchToFrames(field.getFrames());
//		WebElement weField = WebDriverProvider.driver().findElement(field.getLocator());
//
//		if(weField.getAttribute("value") != null)
//			return weField.getAttribute("value").trim();
//		else
//			return weField.getText().trim();	// TODO: is it any different than getValueAttributeFromWebElement(WebElement) ?
		return getValueAttributeFromWebElement(field.getWebElement());
	}

	/**
	 * Returns the given image's description ("alt" attribute) if available.
	 * @param field		name of the image field
	 * @return given image's description
	 * @see WebElement#getAttribute(String)
	 */
	private String getImage(Field field) {

		switchToFrames(field.getFrames());
		String alt = field.getWebElement().getAttribute("alt");

		return alt == null ? EMPTY : alt.trim();

	}

	/**
	 * Returns whether the specified field is displayed.
	 * @param fieldName		name of the field
	 * @return whether specified field is displayed
	 * @see WebElement#isDisplayed()
	 */
	public boolean isDisplayed(String fieldName) {

		Field field = getField(fieldName);
		switchToFrames(field.getFrames());

		try {
			return field.getWebElements().size() > 0 && field.getWebElement().isDisplayed();
		} catch (StaleElementReferenceException e) {
			Log.logInfo("StaleElementReferenceException caught on "+fieldName+" field.");
			return field.getWebElements().size() > 0 && field.getWebElement().isDisplayed();
		}
	}

	/**
	 * Asserts if the given field is displayed.
	 * @param fieldName		name of the field
	 * @see Page#isDisplayed(String)
	 */
	public void assertWebElementIsDisplayed(String fieldName){

		assertTrue("Field with name: "+fieldName+ " should be displayed!", isDisplayed(fieldName));
	}

	/**
	 * Returns a {@link WebElement} specified by given locator.
	 * @param by	locator - xpath, classname, id, etc.
	 * @return a WebElement specified by locator
	 * @see WebDriver#findElement(By)
	 */
	public WebElement getWebElement(By by){

		try {
			return WebDriverProvider.driver().findElement(by);

		} catch(NoSuchElementException e) {

			Log.logInfo("Element by "+by.toString()+"  does not exist.");
			return null;
		}
	}

	/**
	 * Returns the text of given WebElement, removing all whitespaces. If text is not available, gets the title attribute.
	 * @param webElement	given element
	 * @return text of given WebElement
	 * @see WebElement#getText()
	 * @see WebElement#getAttribute(String)
	 */
	public static String getTextFromWebElement(WebElement webElement){

		String webElementText = webElement.getText().replaceAll("\\s+", EMPTY).replace(EMPTY + (char) 160, EMPTY);

		// if no text is present (e.g. link with embedded image), let's try title attribute
		return webElementText.isEmpty() && webElement.getAttribute("title") != null ? webElement.getAttribute("title").replaceAll("\\s+", EMPTY).replace(EMPTY + (char) 160, EMPTY) : webElementText;
	}

	/**
	 * Returns a {@link WebElement} representing the found field. The found field is identified by name, as child of field containing specified text among the chosen field list.
	 * @param searchedName		text expected in parent field
	 * @param fieldName			name of the child field
	 * @param groupOfFields		name of the field list
	 * @return	a WebElement representing the found field
	 */
	public WebElement getWebElementFromGroupOfElementsContainingSpecifiedText(String searchedName, String fieldName, String groupOfFields){

		List<WebElement> groupItems = getFieldWebElementsValues(groupOfFields);

		for (WebElement webElement : groupItems) {

			if(containsIgnoreCase(webElement.getText(), searchedName)) {

				return webElement.findElement(getField(fieldName).getLocator());
			}
		}
		Log.logInfo(groupOfFields+" list does not contain "+searchedName);
		return null;
	}

	/**
	 *	Returns a WebElement with specified text found in the given list of WebElements.
	 * @param listOfElements	list of WebElements
	 * @param searchedText		text to find by
	 * @return a WebElement with specified text
	 * @see WebElement#getText()
	 */
	public WebElement findWebElementWithSpecifiedText(List<WebElement> listOfElements, String searchedText){

		for(WebElement item : listOfElements){

			if(equalsIgnoreCase(item.getText(), searchedText))
				return item;
		}

		return null;
	}

	/**
	 * Returns a WebElement from a given position in the specified field list.
	 * @param fieldName		name of the field list
	 * @param position		element's position in the list
	 * @return a WebElement on specified position
	 * @see Page#getFieldWebElementsValues(String)
	 */
	public WebElement getWebElementOnSpecificPosition(String fieldName, int position){

		return getFieldWebElementsValues(fieldName).get(position - 1);
	}

	/**
	 * Sends the specified key input to the given WebElement. Currently only works for ENTER key.
	 * @param webElement	given element
	 * @param keyName		name of the key to 'press'
	 * @see WebElement#sendKeys(CharSequence...)
	 */
	public void pressKeyOnField(WebElement webElement, String keyName){

		switch(keyName) {

			case "ENTER":
				webElement.sendKeys(Keys.ENTER);
				break;

			default:
				Log.logInfo("The: " + keyName + " is not supported. Please implement me.");
				break;
		}
	}

	/**
	 * Checks if the given field requires a sleep by getting it's value from the Field Map. If needed, sleeps the thread for the matching number of seconds.
	 * @param fieldName		name of the field
	 * @see MapCreator#getFieldMap()
	 */
	public static void sleepIfFieldNeedSleeper(String fieldName) {
		for (String key : fieldMap.keySet()) {
			if (key.equals(fieldName)) {
				sleeper(Integer.parseInt(fieldMap.get(key))*1000);
				break;
			}
		}
	}

	/**
	 * This method is dedicated to ProductListPage. It expands the list of products by clicking the "Load more" button until all products are displayed.
	 * @param pageName			name of the page ("Lista produktow")
	 * @param loadMoreButton	name of the field representing "Load more" button
	 * @param itemsName			name of the field list representing products
	 */
	public void expandAllList(String pageName, String loadMoreButton, String itemsName){ // TODO: unused parameter?
		boolean isDisplayed;
		isDisplayed=getRequiredPage(pageName).isDisplayed(loadMoreButton);
		while (isDisplayed) {
			clickIn(pageName, loadMoreButton);
			waitForNSeconds(1);
			isDisplayed=getRequiredPage(pageName).isDisplayed(loadMoreButton);
			}
	}

	/**
	 * Checks the given string for presence of brackets and checks the buffer for value found between them. If the key is registered in the Buffer, returns its value.
	 * @param value		String to be checked for bracketed keys
	 * @return value of the found key
	 * @see Buffer
	 */
	public String extractValueFromBracketsIfBufferContainsKey(String value)
	{
		StringBuilder result = new StringBuilder();
		Character c;
		StringBuilder token;

		for(int i=0; i<value.length(); i++) {

			c = value.charAt(i);

			if(c.equals('(')){

				token = new StringBuilder();

				while(true){

					c = value.charAt(++i);

					if(!c.equals(')')) {

						token.append(c);
					} else {

						if(Buffer.containsKey(token.toString())) {
							result.append(Buffer.get(token.toString()));
						} else {
							result.append("(").append(token.toString()).append(")");
						}
						c = value.charAt(++i);
						break;
					}
				}
			}

			result.append(c);
		}

		return result.toString();
	}

	/**
	 * Returns whether the specified field is enabled.
	 * @param fieldName name of the field
	 * @return whether the specified field is enabled
	 */
	public boolean isFieldEnabled(String fieldName) {
		return getField(fieldName).isEnabled();
	}


	public void scrollIntoView(Field field){
		JavascriptExecutor js = (JavascriptExecutor) driver();
		WebElement element = driver().findElement(field.getLocator());
		js.executeScript("arguments[0].scrollIntoView(true);", element);
	}

	public WebElement getFieldsWebElementFromSection(String sectionName, String fieldName) {
		return getFieldWebElementsValue(sectionName).findElement(getField(fieldName).getLocator());
	}

	public List<WebElement> getFieldsWebElementsFromSection(String sectionName, String fieldName) {
		return getFieldWebElementsValue(sectionName).findElements(getField(fieldName).getLocator());
	}
	
	public static List<WebElement> getTableRows(String pageName, String tableName){
		List<WebElement> rows = new ArrayList<WebElement>();
		if (tableName.equals("FAVORITE_LIST_PRODUCTS_TABLE") || tableName.equals("COMPANY_LIST_PRODUCTS_TABLE") || tableName.equals("TOOLS_TABLE")){
			rows = getRequiredPage(pageName).getFieldWebElementsValue(tableName).findElements(By.xpath(".//tbody"));
		} else {
			rows = getRequiredPage(pageName).getFieldWebElementsValue(tableName).findElements(By.xpath("./tr"));
		}
		return rows;
	}
	
	public static String getWholeRowValues(String pageName, String tableName, int rowNumber){
		List<WebElement> rows = getRequiredPage(pageName).getFieldWebElementsValue(tableName).findElements(By.xpath("./tr"));
		String wholeRowText = rows.get(rowNumber - 1).getText();
		return wholeRowText;
	}
	
	public static String getCellValueByColumnInRow(String pageName, String tableName, int rowNumber, int columnNumber){
		WebElement singleCell = getRequiredPage(pageName).getFieldWebElementsValue(tableName).findElement(By.xpath("./tr[" + rowNumber + "]/td[" + columnNumber + "]"));
		String singleTextCell = singleCell.getText();
		return singleTextCell;
	}
	
	
	public List<String> getListOfAttributesValuesFromWebElements(String pageName, String elementName, String attributeName){
		List<WebElement> webElements = getRequiredPage(pageName).getFieldWebElementsValues(elementName);
		List<String> listOfAttributeValues = new ArrayList<String>();
		
		int i = 0;
		while (i < webElements.size()){
			listOfAttributeValues.add(webElements.get(i).getAttribute(attributeName));
			i++;
		}
		
		return listOfAttributeValues;
		
	}
	
	public static List<String> getColumnValuesList(String pageName, String tableName, String columnName){
		By columnLocator = getRequiredPage(pageName).getField(columnName).getLocator();
    	WebElement tableWebElement = getRequiredPage(pageName).getFieldWebElementsValue(tableName);
    	
    	List<WebElement> columnWebElements = new ArrayList<WebElement>();
    	columnWebElements = tableWebElement.findElements(columnLocator);
    	
    	return getTextFromWebElementsList(columnWebElements);
	}
	
	public static List<String> getTextFromWebElementsList(List<WebElement> webElementList){
    	List<String> columnActualValues = new ArrayList<String>();
    	int i = 0;
    	while (i < webElementList.size()) {
    		columnActualValues.add(webElementList.get(i).getText().toUpperCase());
    		i++;
    	}
    	return columnActualValues;
	}
	
	public static int countElementsInSection(String pageName, String sectionName, String elementName){
		return getRequiredPage(pageName).getFieldsWebElementsFromSection(sectionName, elementName).size();
	}
}
