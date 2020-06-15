package com.hilti.tahilti.pages.WebshopPages;

import org.openqa.selenium.By;

import com.hilti.utils.*;

public class CheckoutPickupLocationPage extends Page{

	public enum FieldName implements Storable {
		
		CONTINUE_BUTTON,
		CLICK_AND_COLLECT,
		CHANGE_HILTI_CENTER_POPUP,
		ENTER_ZIP_CODE_OR_CITY_TEXTFIELD, //In CHANGE_HILTI_CENTER_POPUP section
		FIND_HILTI_CENTER_TEXTFIELD,
		CHANGE_HILTI_CENTER_BUTTON,
		SEARCH_LOCATION_BUTTON,
		SEARCH_HILTI_CENTER_BUTTON,
		SUCCESS_MESSAGE_BOX,
		ALERT_MESSAGE_BOX,
		ERROR_MESSAGE_BOX,
		HILTI_CENTER_1_RADIOBUTTON,
		HILTI_CENTER_2_RADIOBUTTON,
		HILTI_CENTER_3_RADIOBUTTON,
		STANDARD_DELIVERY_RADIOBUTTON,
		HILTI_CENTER_SELECT_BUTTON,
		CURRENTLY_SELECTED_HILTI_STORE_NOTIFICATION,
		HILTI_CENTER_NAME,
		USE_MY_LOCATION_BUTTON,
		HILTI_CENTER_ADDRESS_COLUMN,
		HILTI_CENTER_OPENING_HOURS_COLUMN,
		SECOND_HILTI_CENTER_NAME,
		LOCATION_MAP,
		SECOND_HILTI_CENTER_SELECT_BUTTON,
		MAP_LOADING_INDICATOR,
		LOCATION_ERROR_MESSAGE
	}
	
	public CheckoutPickupLocationPage(){
		
		addField(FieldName.CONTINUE_BUTTON, new Field(FieldType.BUTTON, By.xpath("//button[@class='a-button js-submit-btn']")));
		addField(FieldName.CLICK_AND_COLLECT, new Field(FieldType.SECTION, By.xpath("//div[@class='m-pickuplocation']/ancestor::div[@class='col-xs-12']")));
		addField(FieldName.CHANGE_HILTI_CENTER_POPUP, new Field(FieldType.SECTION, By.xpath("//div[contains(@class, 'featherlight-inner')]")));
		addField(FieldName.ENTER_ZIP_CODE_OR_CITY_TEXTFIELD, new Field(FieldType.TEXT, By.id("storelocator_input")));
		addField(FieldName.FIND_HILTI_CENTER_TEXTFIELD, new Field(FieldType.TEXT, By.id("storelocator_input"))); // same locator as in ENTER_ZIP_CODE_OR_CITY_TEXTFIELD but needed in ClickSteps exception
		addField(FieldName.CHANGE_HILTI_CENTER_BUTTON, new Field(FieldType.BUTTON, By.xpath("//a[@class='a-button-tertiary js-triggerlink-storelocator']")));
		addField(FieldName.SEARCH_HILTI_CENTER_BUTTON, new Field(FieldType.BUTTON, By.id("storelocator_submit"))); // same locator as in SEARCH_LOCATION_BUTTON but needed in ClickSteps exception
		addField(FieldName.SEARCH_LOCATION_BUTTON, new Field(FieldType.BUTTON, By.id("storelocator_submit")));
		addField(FieldName.SUCCESS_MESSAGE_BOX, new Field(FieldType.TEXT, By.id("pickupLocSuccMsg")));
		addField(FieldName.ALERT_MESSAGE_BOX, new Field(FieldType.TEXT, By.id("pickupLocAlertMsg")));
		addField(FieldName.ERROR_MESSAGE_BOX, new Field(FieldType.TEXT, By.id("pickupLocErrMsg")));
		addField(FieldName.HILTI_CENTER_1_RADIOBUTTON, new Field(FieldType.BUTTON, By.id("radiobutton_1-div")));
		addField(FieldName.HILTI_CENTER_2_RADIOBUTTON, new Field(FieldType.BUTTON, By.id("radiobutton_2-div")));
		addField(FieldName.HILTI_CENTER_3_RADIOBUTTON, new Field(FieldType.BUTTON, By.id("radiobutton_3-div")));
		addField(FieldName.STANDARD_DELIVERY_RADIOBUTTON, new Field(FieldType.BUTTON, By.id("radiobutton_4-div")));
		addField(FieldName.HILTI_CENTER_SELECT_BUTTON, new Field(FieldType.BUTTON, By.xpath("//li[contains(@class, 'is-open')]//button[@type='submit' and @class='js-accordion-preventor js-map-storeselector']")));
		addField(FieldName.CURRENTLY_SELECTED_HILTI_STORE_NOTIFICATION, new Field(FieldType.TEXT, By.xpath(".//div[@class='m-message-title a-heading-copy a-icon-checked']")));
		addField(FieldName.HILTI_CENTER_NAME, new Field(FieldType.TEXT, By.xpath("(//span[@class='hilti-center-name'])[1]")));
		addField(FieldName.USE_MY_LOCATION_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//button[@id='storelocator_map-current']")));
		addField(FieldName.HILTI_CENTER_ADDRESS_COLUMN, new Field(FieldType.SECTION, By.xpath("(//dl[contains (@class, 'column') and contains(., 'Address')])[5]")));
		addField(FieldName.HILTI_CENTER_OPENING_HOURS_COLUMN, new Field(FieldType.SECTION, By.xpath("(//dl[contains (@class, 'column') and contains(., 'Opening')])[5]")));
		addField(FieldName.SECOND_HILTI_CENTER_NAME, new Field(FieldType.TEXT, By.xpath("(//span[@class='hilti-center-name'])[2]")));
		addField(FieldName.LOCATION_MAP, new Field(FieldType.DIV, By.xpath(".//div[@id='storelocator']")));
		addField(FieldName.SECOND_HILTI_CENTER_SELECT_BUTTON, new Field(FieldType.BUTTON, By.xpath("(//button[@type='submit' and @class='js-accordion-preventor js-map-storeselector'])[2]")));
		addField(FieldName.MAP_LOADING_INDICATOR, new Field(FieldType.DIV, By.xpath("//div[@id='storelocator' and(contains(@class, 'is-loading'))]")));
		addField(FieldName.LOCATION_ERROR_MESSAGE, new Field(FieldType.DIV, By.xpath("//div[contains(@class, 'm-message--error') and not(contains(@class, 'is-hidden'))]")));
	}
}