package com.hybris.utils;

import org.openqa.selenium.By;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.WebElement;

import java.util.List;

/**
 * An object representing a field on a website. Specified by FieldType and By locator (id, xpath, etc.).
 * @author Mateusz Mazurkiewicz
 * @see FieldType
 * @see By
 */
public class Field {

	private FieldType fieldType;
	private By locator;
	private String[] frames;

	/**
	 * Field constructor. Sets the fieldType, locator and frames variables to parameter values.
	 * @param fieldType		BUTTON, CHECKBOX, TEXT etc.
	 * @param locator 		id, xpath, classname, etc.
	 * @param frames		field frame names
	 */
	public Field(FieldType fieldType, By locator, String... frames) {
		this.fieldType = fieldType;
		this.locator = locator;
		this.frames = frames;
	}

	/**
	 * Returns the field's type.
	 * @return the field's type
	 */
	public FieldType getFieldType() {
		return fieldType;
	}

	/**
	 * Sets the field's type.
	 * @param fieldType	field type to be set. TEXT, BUTTON, CHECKBOX, etc.
	 * @see FieldType
	 */
	public void setFieldType(FieldType fieldType) {
		this.fieldType = fieldType;
	}

	/**
	 * Returns the field's locator.
	 * @return the field's locator
	 */
	public By getLocator() {
		return locator;
	}

	/**
	 * Sets the field's locator.
	 * @param locator	By locator (xpath, id, classname etc.)
	 * @see By
	 */
	public void setLocator(By locator) {
		this.locator = locator;
	}

	/**
	 * Returns the field's frame names.
	 * @return the field's frame names
	 */
	public String[] getFrames() {
		return frames;
	}

	/**
	 * Sets the field's frame names.
	 * @param frames	array of frame names
	 */
	public void setFrames(String[] frames) {
		this.frames = frames;
	}

	/**
	 * Returns whether the field is selected.
	 * @return whether the field is selected
	 * @see WebElement#isSelected()
     */
	public boolean isSelected() {
		return getWebElement().isSelected();
	}

	/**
	 * Returns whether the field is displayed. If the element is not found, returns false.
	 * @return whether the field is displayed
	 * @see WebElement#isSelected()
     */
	public boolean isDisplayed() {
		try {
			return getWebElement().isDisplayed();
		} catch (NoSuchElementException e) {
			return false;
		}
	}

	/**
	 * Returns whether the field is enabled. If the element is not found, returns false.
	 * @return whether the field is enabled
	 * @see WebElement#isEnabled()
     */
	public boolean isEnabled() {
		return getWebElement().isEnabled();
	}

	/**
	 * Returns the {@link WebElement} for the field.
	 * @return the WebElement for the field
	 * @see Page#getFieldWebElementsValue(String)
     */
	public WebElement getWebElement() {
		return WebDriverProvider.driver().findElement(locator);
	}

	/**
	 * Returns a list of {@link WebElement}s for the field's locator.
	 * @return a list of WebElements matching the fields locator
	 * @see Page#getFieldWebElementsValues(String)
     */
	public List<WebElement> getWebElements() {
		return WebDriverProvider.driver().findElements(locator);
	}

	/**
	 * Clicks the field.
	 */
	public void click() {
		getWebElement().click();
	}
}
