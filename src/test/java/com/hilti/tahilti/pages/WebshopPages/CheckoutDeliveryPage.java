package com.hilti.tahilti.pages.WebshopPages;

import org.openqa.selenium.By;

import com.hilti.utils.*;

public class CheckoutDeliveryPage extends Page{

	public enum FieldName implements Storable {
		
		ADDRESS_CONFIRMATION, // section
		USE_OUR_SUGGESTION_BUTTON, // in ADDRESS_CONFIRMATION section
		ADD_NEW_DELIVERY_ADDRESS_BUTTON,
		CREATE_NEW_DELIVERY_ADDRESS_BUTTON,
		ADD_NEW_DELIVERY_ADDRESS, // section
		NEW_COMPANY_NAME_TEXTFIELD,
		NEW_ADDRESS_STREET_TEXTFIELD,
		NEW_ADDRESS_CITY_TEXTFIELD,
		NEW_ADDRESS_STATE_DROPDOWN,
		NEW_ADDRESS_STATE_DROPDOWN_CONTENT,
		NEW_ADDRESS_ZIPCODE_TEXTFIELD,
		ADDRESS_RADIOBUTTON, // in DELIVERY_ADDRESS_FORM section
		BACK_TO_PREVIOUS_STEP_BUTTON,
		CONTINUE_BUTTON, // in DELIVERY_ADDRESS_FORM section
		CARRIER_INSTRUCTIONS_TEXTFIELD, // in DELIVERY_ADDRESS_FORM section
		CHANGE_DELIVERY_ADDRESS_BUTTON, // in DELIVERY_ADDRESS_FORM section
		CHANGE_DELIVERY_ADDRESS_POPUP,
		CHANGE_DELIVERY_CONTACT_BUTTON,
		CHANGE_DELIVERY_CONTACT_POPUP,
		DATE_PICKER, // In XXX_DELIVERY section
		DELIVERY_SHIPPING_PRICE, // In XXX_DELIVERY section
		CALENDAR_POPUP, // In XXX_DELIVERY section
		CALENDAR_POPUP_CLOSE_BUTTON, // in CALENDAR_POPUP section
		POPUP_CLOSE_BUTTON,
		DELIVERY_ADDRESS_FORM, //section
		TAX_EXEMPT_BUTTON, // in DELIVERY_ADDRESS_FORM section
		TAX_EXEMPT_POPUP,
		SHIP_TO_A_HILTI_CENTER_RADIOBUTTON, // in DELIVERY_ADDRESS_FORM section
		STORELOCATOR_POPUP,
		STANDARD_DELIVERY, //section
		COURIER_NEXT_DAY_BY_NOON_DELIVERY, //section
		DELIVERY_RADIOBUTTON, // in DELIVERY_ADDRESS_FORM section
		REQUEST_SINGLE_SHIPMENT_CHECKBOX,
		INFORMATION_BUTTON,
		INFORMATION_POPUP, //section
		USE_MY_LOCATION_BUTTON,
		MAP_LOADING_INDICATOR,
		HILTI_CENTER_NAME,
		SELECT_HILTI_CENTER_BUTTON,
		CHANGE_HILTI_CENTER_POPUP,
		ADDRESS_NOT_FOUND_MESSAGE, //in section CHANGE_DELIVERY_ADDRESS_POPUP
		SEARCH_ADDRESS_INPUT, //in section CHANGE_DELIVERY_ADDRESS_POPUP
		ADDRESS_LIST_POSITION_2, //in section AVAILABLE_DELIVERY_ADDRESSES_LIST
		CHOOSE_AS_SHIPPING_ADDRESS, //in section AVAILABLE_DELIVERY_ADDRESSES_LIST
		CURRENT_ADDRESS, //in section AVAILABLE_DELIVERY_ADDRESSES_LIST
		AVAILABLE_DELIVERY_ADDRESSES_LIST,
		SHIPPING_METHOD,
		EDIT_COLUMNS_BUTTON, //in section CHANGE_DELIVERY_ADDRESS_POPUP
		EDIT_COLUMNS_OVERLAY,
		EDIT_COLUMNS_CHECKBOX, //in section EDIT_COLUMNS_OVERLAY
		SECOND_DISPLAYED_CLOUMN, //in section CHANGE_DELIVERY_ADDRESS_POPUP
		SHOW_ALL_COLUMNS_BUTTON, //in section CHANGE_DELIVERY_ADDRESS_POPUP
		CLOSE_EDIT_COLUMNS_OVERLAY, //in section EDIT_COLUMNS_OVERLAY
		DISPLAYED_CLOUMNS, //in section CHANGE_DELIVERY_ADDRESS_POPUP
		CREATE_NEW_DELIVERY_ADDRESS_EMPTY_SEARCH,
		CANCEL_BUTTON,
		NEW_ADDRESS_COMPANY_TEXTFIELD,
		DISPLAYED_DELIVERY_ADDRESS, 
		CLEAR_SEARCH_BUTTON, //in section CHANGE_DELIVERY_ADDRESS_POPUP
		VALIDATION_ERROR_COMPANY, //ADD_NEW_DELIVERY_ADDRESS
		VALIDATION_ERROR_STREET, //ADD_NEW_DELIVERY_ADDRESS
		VALIDATION_ERROR_CITY, //ADD_NEW_DELIVERY_ADDRESS
		VALIDATION_ERROR_STATE, //ADD_NEW_DELIVERY_ADDRESS
		VALIDATION_ERROR_ZIP_CODE, //ADD_NEW_DELIVERY_ADDRESS
		FIND_HILTI_CENTER_TEXTFIELD, //On find hilti center popup
		SEARCH_HILTI_CENTER_BUTTON,
		SELECTED_HILTI_STORE_ADDRESS,
		CHANGE_HILTI_CENTER_BUTTON,
		SECOND_HILTI_CENTER_NAME,
		CURRENTLY_SELECTED_HILTI_STORE_NOTIFICATION,
		PAGE_LOADING_INDICATOR,
		
		CREATE_NEW_DELIVERY_CONTACT_BUTTON,
		SEARCH_CONTACT_INPUT,
		AVAILABLE_DELIVERY_CONTACTS_LIST,
		FIRST_DISPLAYED_CONTACT_CLOUMN,
		DISPLAYED_CONTACT_CLOUMNS,
		CREATE_NEW_DELIVERY_CONTACT_EMPTY_SEARCH,
		ADD_NEW_DELIVERY_CONTACT,
		CONTACT_VALIDATION_ERROR_TITLE,
		CONTACT_VALIDATION_ERROR_FIRST_NAME,
		CONTACT_VALIDATION_ERROR_LAST_NAME,
		CONTACT_VALIDATION_ERROR_FUNCTION,
		CONTACT_VALIDATION_ERROR_PHONE,
		CLEAR_CONTACT_SEARCH_BUTTON,
		DISPLAYED_DELIVERY_CONTACT,
		NEW_CONTACT_TITLE_DROPDOWN,
		NEW_CONTACT_TITLE_DROPDOWN_CONTENT,
		NEW_CONTACT_FIRST_NAME_TEXTFIELD,
		NEW_CONTACT_LAST_NAME_TEXTFIELD,
		NEW_CONTACT_FUNCTION_DROPDOWN,
		NEW_CONTACT_FUNCTION_DROPDOWN_CONTENT,
		NEW_CONTACT_PHONE_TEXTFIELD,
		SELECT_CONTACT_TABLE,
		SELECT_CONTACT_TABLE_HEADER,
		FIRST_NAME_COLUMN, // in SELECT_CONTACT_TABLE
		LAST_NAME_COLUMN, // in SELECT_CONTACT_TABLE
		FUNCTION_COLUMN, // in SELECT_CONTACT_TABLE
		FIRST_NAME_COLUMN_SORT_BUTTON, // in SELECT_CONTACT_TABLE_HEADER
		LAST_NAME_COLUMN_SORT_BUTTON, // in SELECT_CONTACT_TABLE_HEADER
		FUNCTION_COLUMN_SORT_BUTTON, // in SELECT_CONTACT_TABLE_HEADER
		LOCATION_ERROR_MESSAGE
				
	}
	
	public CheckoutDeliveryPage(){
		
		addField(FieldName.ADDRESS_CONFIRMATION, new Field(FieldType.DIV, By.xpath("(//div[contains (@class, 'm-confirm-adress-popup')])[1]")));
		addField(FieldName.USE_OUR_SUGGESTION_BUTTON, new Field(FieldType.BUTTON, By.xpath("//a[contains(@href, 'proposalAccepted=true')]")));
		addField(FieldName.ADD_NEW_DELIVERY_ADDRESS_BUTTON, new Field(FieldType.BUTTON, By.id("submitButton")));
		addField(FieldName.CREATE_NEW_DELIVERY_ADDRESS_BUTTON, new Field(FieldType.BUTTON, By.xpath("//button[@name='newdeliveryaddress']")));
		addField(FieldName.ADD_NEW_DELIVERY_ADDRESS, new Field(FieldType.TEXT, By.id("deliveryaddress")));
		addField(FieldName.NEW_COMPANY_NAME_TEXTFIELD, new Field(FieldType.TEXT, By.id("company")));
		addField(FieldName.NEW_ADDRESS_STREET_TEXTFIELD, new Field(FieldType.TEXT, By.id("streetname")));
		addField(FieldName.NEW_ADDRESS_CITY_TEXTFIELD, new Field(FieldType.TEXT, By.id("town")));
		addField(FieldName.NEW_ADDRESS_COMPANY_TEXTFIELD, new Field(FieldType.TEXT, By.id("company")));
		addField(FieldName.NEW_ADDRESS_STATE_DROPDOWN, new Field(FieldType.DIV, By.id("region-field")));
		addField(FieldName.NEW_ADDRESS_STATE_DROPDOWN_CONTENT, new Field(FieldType.LIST, By.xpath("//div[@id='region_chosen']//ul[@class='chosen-results']")));
		addField(FieldName.NEW_ADDRESS_ZIPCODE_TEXTFIELD, new Field(FieldType.TEXT, By.id("postalcode")));
		addField(FieldName.ADDRESS_RADIOBUTTON, new Field(FieldType.RADIO, By.xpath(".//div[@id='deliveryAddress-div']/input")));
		addField(FieldName.BACK_TO_PREVIOUS_STEP_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//a[contains(@class, 'a-link--back')]")));
		addField(FieldName.CONTINUE_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//button[@class='a-button js-submit-btn']")));
		addField(FieldName.CARRIER_INSTRUCTIONS_TEXTFIELD, new Field(FieldType.TEXT, By.id("carrierInstructions")));
		addField(FieldName.CHANGE_DELIVERY_ADDRESS_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//a[contains(@class, 'o-delivery-change')]")));
		addField(FieldName.CHANGE_DELIVERY_CONTACT_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//span[@data-overlay-event-prefix='deliverycontact']")));
		addField(FieldName.CHANGE_DELIVERY_ADDRESS_POPUP, new Field(FieldType.DIV, By.id("manageaddresses")));
		addField(FieldName.CHANGE_DELIVERY_CONTACT_POPUP, new Field(FieldType.DIV, By.id("managecontact")));
		addField(FieldName.DATE_PICKER, new Field(FieldType.BUTTON, By.xpath(".//a[contains(@class, 'datepicker-button')]")));
		addField(FieldName.DELIVERY_SHIPPING_PRICE, new Field(FieldType.BUTTON, By.xpath(".//span[contains(@class, 'delivery-shipping-price')]")));
		addField(FieldName.CALENDAR_POPUP, new Field(FieldType.BUTTON, By.xpath(".//div[@class='picker__box']")));		
		addField(FieldName.CALENDAR_POPUP_CLOSE_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//button[contains(@class, 'datepicker-close')]")));		
		addField(FieldName.POPUP_CLOSE_BUTTON, new Field(FieldType.BUTTON, By.xpath("//span[contains(@class, 'featherlight-close')]")));
		addField(FieldName.DELIVERY_ADDRESS_FORM, new Field(FieldType.SECTION, By.xpath("//div[contains(@class, 'container-fluid a-spacing-pt--m')]")));
		addField(FieldName.TAX_EXEMPT_BUTTON, new Field(FieldType.LINK, By.xpath(".//a[contains(@class, 'tooltipstered') and contains(., 'TAX')]")));
		addField(FieldName.TAX_EXEMPT_POPUP, new Field(FieldType.TEXT, By.xpath("//div[@class='tooltipster-content']")));
		addField(FieldName.SHIP_TO_A_HILTI_CENTER_RADIOBUTTON, new Field(FieldType.RADIO, By.id("hiltiCenterAddress-div")));
		addField(FieldName.STORELOCATOR_POPUP, new Field(FieldType.DIV, By.xpath("//div[contains(@class, 'js-map-storelocator')]")));
		addField(FieldName.STANDARD_DELIVERY, new Field(FieldType.DIV, By.id("delivery_01-div")));
		addField(FieldName.COURIER_NEXT_DAY_BY_NOON_DELIVERY, new Field(FieldType.DIV, By.id("delivery_NE-div")));
		addField(FieldName.DELIVERY_RADIOBUTTON, new Field(FieldType.RADIO, By.xpath(".//input[@name='deliveryTypeId']")));
		addField(FieldName.REQUEST_SINGLE_SHIPMENT_CHECKBOX, new Field(FieldType.RADIO, By.id("completeDeliveryFlag-field")));
		addField(FieldName.INFORMATION_BUTTON, new Field(FieldType.BUTTON, By.xpath("//div[@class='o-delivery-info-tooltip']/a")));
		addField(FieldName.INFORMATION_POPUP, new Field(FieldType.BUTTON, By.xpath("//div[@class='tooltipster-content']")));
		addField(FieldName.USE_MY_LOCATION_BUTTON, new Field(FieldType.LINK, By.id("storelocator_deliveryinformation_map-current")));
		addField(FieldName.MAP_LOADING_INDICATOR, new Field(FieldType.DIV, By.xpath("//div[@id='storelocator_deliveryinformation' and(contains(@class, 'is-loading'))]")));
		addField(FieldName.HILTI_CENTER_NAME, new Field(FieldType.TEXT, By.xpath("(.//span[@class='hilti-center-name'])[1]")));
		addField(FieldName.SELECT_HILTI_CENTER_BUTTON, new Field(FieldType.BUTTON, By.xpath("(.//button[contains(@class, 'js-map-storeselector')])[1]")));
		addField(FieldName.ADDRESS_NOT_FOUND_MESSAGE, new Field(FieldType.DIV, By.xpath(".//tr[@class='is-empty-fallback']")));
		addField(FieldName.SEARCH_ADDRESS_INPUT, new Field(FieldType.TEXT, By.id("selectaddress_search_input")));
		addField(FieldName.ADDRESS_LIST_POSITION_2, new Field(FieldType.TEXT, By.xpath(".//tbody/tr[2]")));
		addField(FieldName.CHOOSE_AS_SHIPPING_ADDRESS, new Field(FieldType.BUTTON, By.xpath(".//td[contains(@class,'is-hover')]/a[contains(@class,'a-address-selector')]")));
		addField(FieldName.AVAILABLE_DELIVERY_ADDRESSES_LIST, new Field(FieldType.DIV, By.id("manageaddresses")));
		addField(FieldName.SHIPPING_METHOD, new Field(FieldType.DIV, By.xpath("//div[@id='delivery-types']")));
		addField(FieldName.EDIT_COLUMNS_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//button[contains(@class,'dropdown-toggle')]")));
		addField(FieldName.EDIT_COLUMNS_OVERLAY, new Field(FieldType.BUTTON, By.xpath("//ul[@class='dropdown-menu is-shown']")));
		addField(FieldName.EDIT_COLUMNS_CHECKBOX, new Field(FieldType.BUTTON, By.xpath(".//input[@type='checkbox']"))); 
		addField(FieldName.SECOND_DISPLAYED_CLOUMN, new Field(FieldType.BUTTON, By.xpath("//table[@id='selectaddress']//th[contains(@id,'selectaddress-col-2')]//span[@class='th-inner']")));
		addField(FieldName.CHANGE_HILTI_CENTER_POPUP, new Field(FieldType.SECTION, By.xpath("//div[contains(@class, 'featherlight-inner')]")));
		addField(FieldName.SHOW_ALL_COLUMNS_BUTTON, new Field(FieldType.BUTTON, By.xpath("(//button[contains(@class, 'btn a-button-tertiary')])[2]")));
		addField(FieldName.CLOSE_EDIT_COLUMNS_OVERLAY, new Field(FieldType.BUTTON, By.xpath(".//span[@class='a-tooltip-closer js-dropdown-closer']")));
		addField(FieldName.DISPLAYED_CLOUMNS, new Field(FieldType.BUTTON, By.xpath(".//th[contains(@id,'selectaddress-col-') and not(contains(@class, 'no-sort'))]")));
		addField(FieldName.CREATE_NEW_DELIVERY_ADDRESS_EMPTY_SEARCH, new Field(FieldType.BUTTON, By.xpath(".//a[@href='#deliveryaddress']")));
		addField(FieldName.CANCEL_BUTTON, new Field(FieldType.BUTTON, By.name("cancel")));
		addField(FieldName.CLEAR_SEARCH_BUTTON, new Field(FieldType.BUTTON, By.xpath("//form[@id='selectaddress_search_form']//div[@class='m-form-search-reset']")));
		addField(FieldName.DISPLAYED_DELIVERY_ADDRESS, new Field(FieldType.TEXT, By.id("deliveryAddress-div")));
		addField(FieldName.VALIDATION_ERROR_COMPANY, new Field(FieldType.TEXT, By.xpath(".//span[@id='company-field']/span[@class='a-error']")));
		addField(FieldName.VALIDATION_ERROR_STREET, new Field(FieldType.TEXT, By.xpath(".//span[@id='streetname-field']/span[@class='a-error']")));
		addField(FieldName.VALIDATION_ERROR_CITY, new Field(FieldType.TEXT, By.xpath(".//span[@id='town-field']/span[@class='a-error']")));
		addField(FieldName.VALIDATION_ERROR_STATE, new Field(FieldType.TEXT, By.xpath(".//span[@id='region-field']/span[@class='a-error']")));
		addField(FieldName.VALIDATION_ERROR_ZIP_CODE, new Field(FieldType.TEXT, By.xpath(".//span[@id='postalcode-field']/span[@class='a-error']")));
		addField(FieldName.CURRENT_ADDRESS, new Field(FieldType.TEXT, By.xpath(".//tr[@class='js-overlay-close is-selected']")));
		addField(FieldName.FIND_HILTI_CENTER_TEXTFIELD, new Field(FieldType.TEXT, By.id("storelocator_deliveryinformation_input")));
		addField(FieldName.SEARCH_HILTI_CENTER_BUTTON, new Field(FieldType.BUTTON, By.id("storelocator_deliveryinformation_submit")));
		addField(FieldName.SELECTED_HILTI_STORE_ADDRESS, new Field(FieldType.TEXT, By.xpath(".//span[@id='storelocator_deliveryinformation_selectedstore']")));
		addField(FieldName.CHANGE_HILTI_CENTER_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//span[contains(@class, 'js-change-hilti-center')]")));
		addField(FieldName.SECOND_HILTI_CENTER_NAME, new Field(FieldType.TEXT, By.xpath("(.//span[@class='hilti-center-name'])[2]")));
		addField(FieldName.CURRENTLY_SELECTED_HILTI_STORE_NOTIFICATION, new Field(FieldType.TEXT, By.xpath(".//div[@class='m-message-title a-heading-copy a-icon-checked']")));
		addField(FieldName.PAGE_LOADING_INDICATOR, new Field(FieldType.DIV, By.xpath("//div[contains(@class, 'js-preloader')]")));
		addField(FieldName.CREATE_NEW_DELIVERY_CONTACT_BUTTON, new Field(FieldType.BUTTON, By.xpath("//button[@name='newdeliverycontact']")));
		addField(FieldName.SEARCH_CONTACT_INPUT, new Field(FieldType.TEXT, By.id("selectcontact_search_input")));
		addField(FieldName.AVAILABLE_DELIVERY_CONTACTS_LIST, new Field(FieldType.DIV, By.id("selectcontact")));
		addField(FieldName.FIRST_DISPLAYED_CONTACT_CLOUMN, new Field(FieldType.BUTTON, By.xpath("//table[@id='selectcontact']//th[not(@data-default-column='')]")));
		addField(FieldName.DISPLAYED_CONTACT_CLOUMNS, new Field(FieldType.BUTTON, By.xpath(".//th[contains(@id,'selectcontact-col-')]")));
		addField(FieldName.CREATE_NEW_DELIVERY_CONTACT_EMPTY_SEARCH, new Field(FieldType.BUTTON, By.xpath(".//a[@href='#deliverycontact']")));
		addField(FieldName.ADD_NEW_DELIVERY_CONTACT, new Field(FieldType.TEXT, By.id("deliverycontact")));
		addField(FieldName.CONTACT_VALIDATION_ERROR_TITLE, new Field(FieldType.TEXT, By.xpath(".//span[@id='title-field']/span[@class='a-error']")));
		addField(FieldName.CONTACT_VALIDATION_ERROR_FIRST_NAME, new Field(FieldType.TEXT, By.xpath(".//span[@id='firstName-field']/span[@class='a-error']")));
		addField(FieldName.CONTACT_VALIDATION_ERROR_LAST_NAME, new Field(FieldType.TEXT, By.xpath(".//span[@id='lastName-field']/span[@class='a-error']")));
		addField(FieldName.CONTACT_VALIDATION_ERROR_FUNCTION, new Field(FieldType.TEXT, By.xpath(".//span[@id='function-field']/span[@class='a-error']")));
		addField(FieldName.CONTACT_VALIDATION_ERROR_PHONE, new Field(FieldType.TEXT, By.xpath(".//span[@id='phone-field']/span[@class='a-error']")));
		addField(FieldName.CLEAR_CONTACT_SEARCH_BUTTON, new Field(FieldType.BUTTON, By.xpath("//form[@id='selectcontact_search_form']//div[@class='m-form-search-reset']")));
		addField(FieldName.DISPLAYED_DELIVERY_CONTACT, new Field(FieldType.TEXT, By.xpath("//p[contains(@class,'m-delivery-contact-copy')]")));
		
		
		addField(FieldName.NEW_CONTACT_TITLE_DROPDOWN, new Field(FieldType.DIV, By.id("title-field")));
		addField(FieldName.NEW_CONTACT_TITLE_DROPDOWN_CONTENT, new Field(FieldType.LIST, By.xpath("//div[@id='title_chosen']//ul[@class='chosen-results']")));
		addField(FieldName.NEW_CONTACT_FIRST_NAME_TEXTFIELD, new Field(FieldType.TEXT, By.id("firstName")));
		addField(FieldName.NEW_CONTACT_LAST_NAME_TEXTFIELD, new Field(FieldType.TEXT, By.id("lastName")));
		addField(FieldName.NEW_CONTACT_FUNCTION_DROPDOWN, new Field(FieldType.DIV, By.id("function-field")));
		addField(FieldName.NEW_CONTACT_FUNCTION_DROPDOWN_CONTENT, new Field(FieldType.LIST, By.xpath("//div[@id='function_chosen']//ul[@class='chosen-results']")));
		addField(FieldName.NEW_CONTACT_PHONE_TEXTFIELD, new Field(FieldType.TEXT, By.id("phone")));
		addField(FieldName.SELECT_CONTACT_TABLE, new Field(FieldType.DIV, By.xpath("//table[@id='selectcontact']/tbody")));
		addField(FieldName.SELECT_CONTACT_TABLE_HEADER, new Field(FieldType.DIV, By.xpath("//table[@id='selectcontact']/thead")));
		addField(FieldName.FIRST_NAME_COLUMN, new Field(FieldType.DIV, By.xpath(".//td[2]")));
		addField(FieldName.LAST_NAME_COLUMN, new Field(FieldType.DIV, By.xpath(".//td[3]")));
		addField(FieldName.FUNCTION_COLUMN, new Field(FieldType.DIV, By.xpath(".//td[4]")));
		addField(FieldName.FIRST_NAME_COLUMN_SORT_BUTTON, new Field(FieldType.DIV, By.xpath(".//th[2]")));
		addField(FieldName.LAST_NAME_COLUMN_SORT_BUTTON, new Field(FieldType.DIV, By.xpath(".//th[3]")));
		addField(FieldName.FUNCTION_COLUMN_SORT_BUTTON, new Field(FieldType.DIV, By.xpath(".//th[4]")));
		addField(FieldName.LOCATION_ERROR_MESSAGE, new Field(FieldType.DIV, By.xpath("//div[contains(@class, 'm-message--error') and not(contains(@class, 'is-hidden'))]")));
	}
}