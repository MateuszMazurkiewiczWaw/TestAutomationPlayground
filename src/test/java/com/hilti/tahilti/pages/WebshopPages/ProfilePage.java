

package com.hilti.tahilti.pages.WebshopPages;

import org.openqa.selenium.By;

import com.hilti.utils.*;

public class ProfilePage extends Page{

	public enum FieldName implements Storable {	

		YOUR_ACCOUNT,
		CHANGE_EMAIL_FORM,
		EDIT_EMAIL_BUTTON,
		EMAIL_CHANGE_TEXTFIELD,
		EMAIL_CHANGE_SHOW_PASSWORD_CHECKBOX,
		CONFIRM_PASSWORD_TEXFIELD,
		EMAIL_CHANGE_BUTTON,
		EMAIL_CHANGE_CANCEL_BUTTON,
		PASSWORD_CHANGE_CANCEL_BUTTON,
		YOUR_LOGIN_DATA,
		MESSAGE_BOX,
		PLEASE_CONTACT_CUSTOMER_SERVICE_LINK,
		SUCCESS_MESSAGE_BOX,
		ALERT_MESSAGE_BOX,
		EMAIL_ERROR_MESSAGE_BOX,
		PASSWORD_ERROR_MESSAGE_BOX,
		PASSWORD_SUCCESS_MESSAGE_BOX,
		EDIT_PASSWORD_BUTTON,
		PASSWORD_CHANGE_BUTTON,
		NEW_PASSWORD_TEXTFIELD,
		REPEAT_NEW_PASSWORD_TEXTFIELD,
		CHANGE_PASSWORD_FORM,
		CURRENT_PASSWORD_TEXTFIELD,
		CONTACT_DATA_EDIT_BUTTON,
		DUMMY_EMAIL_ADDRESS,
		YOUR_CONTACT_DATA,
		CONTACT_DATA_TITLE_FIELD,
		CONTACT_DATA_FIRST_NAME_FIELD,
		CONTACT_DATA_LAST_NAME_FIELD,
		CONTACT_DATA_FUNCTION_FIELD,
		CONTACT_DATA_PHONE_FIELD,
		CONTACT_DATA_MOBILE_PHONE_FIELD,
		CONTACT_DATA_FAX_FIELD,
		CONTACT_DATA_NEWSLETTER_CONFIRMATION_CHECKBOX,
		FAX_ERROR_MESSAGE_BOX,
		PHONE_ERROR_MESSAGE_BOX,
		MOBILE_PHONE_ERROR_MESSAGE_BOX,
		FIRST_NAME_TEXTFIELD,
		LAST_NAME_TEXTFIELD,
		PHONE_TEXTFIELD,
		MOBILE_PHONE_TEXTFIELD,
		FAX_TEXTFIELD,
		YOUR_CONTACT_DATA_SAVE_BUTTON,
		CONTACT_DATA_CANCEL_BUTTON,
		YOUR_COMPANY_DATA,
		COMPANY_NAME_ROW,
		SECOND_COMPANY_NAME_ROW,
		STREET_ADDRESS_ROW,
		SECOND_STREET_ADDRESS_ROW,
		CITY_ROW,
		STATE_ROW,
		ZIP_CODE_ROW,
		COUNTRY_ROW,
		TRADE_ROW,
		NO_OF_EMPLOYEES_ROW,
		CONTACT_CUSTOMER_SERVICE_LINK,
		AGREE_AND_ACCEPT_CHECKBOX,
		TITLE_SELECTION_DROPDOWN,
		FUNCTION_SELECTION_DROPDOWN,
		OTHER_FUNCTION,
		MS_TITLE,
		COMPANY_TITLE,
		FOREMAN_FUNCTION,
		OPEN_DASHBOARD_BUTTON,
		ACCOUNT_DASHBOARD,
		GO_TO_YOUR_SUBMITTALS_LINK,
		
	}
	
	public ProfilePage(){
	
		addField(FieldName.YOUR_ACCOUNT, new Field(FieldType.LINK, By.xpath("//div[contains(@class, 'm-account-introduction a-page')]")));
		addField(FieldName.CHANGE_EMAIL_FORM, new Field(FieldType.DIV, By.xpath("//form[@id='update-email' and not(contains(@style, 'none'))]")));
		addField(FieldName.EDIT_EMAIL_BUTTON, new Field(FieldType.BUTTON, By.xpath("//a[contains(@class, 'js-form-toggle-trigger-email')]")));
		addField(FieldName.EMAIL_CHANGE_TEXTFIELD, new Field(FieldType.TEXT, By.id("change-email-address")));
		addField(FieldName.EMAIL_CHANGE_SHOW_PASSWORD_CHECKBOX, new Field(FieldType.CHECKBOX, By.xpath("//label[contains(@for, 'show-passwords-change-email')]")));
		addField(FieldName.CONFIRM_PASSWORD_TEXFIELD, new Field(FieldType.TEXT, By.id("confirm-password")));
		addField(FieldName.EMAIL_CHANGE_BUTTON, new Field(FieldType.BUTTON, By.xpath("//button[@id='change-email']")));
		addField(FieldName.EMAIL_CHANGE_CANCEL_BUTTON, new Field(FieldType.BUTTON, By.xpath("//button[@id='cancel']")));
		addField(FieldName.PASSWORD_CHANGE_CANCEL_BUTTON, new Field(FieldType.BUTTON, By.xpath("//div[@class='m-account-form-password-actions-cancel']/button")));
		addField(FieldName.YOUR_LOGIN_DATA, new Field(FieldType.DIV, By.xpath("//div[contains(@class, 'o-account-credentials')]")));
		addField(FieldName.MESSAGE_BOX, new Field(FieldType.DIV, By.xpath("//div[@class='m-message-text']")));
		addField(FieldName.PLEASE_CONTACT_CUSTOMER_SERVICE_LINK, new Field(FieldType.DIV, By.xpath("//a[@data-trigger='#contact_overlay']")));
		addField(FieldName.SUCCESS_MESSAGE_BOX, new Field(FieldType.TEXT, By.xpath("//div[@id='globalMessages']//div[contains(@class, 'm-message--success')]")));
		addField(FieldName.ALERT_MESSAGE_BOX, new Field(FieldType.TEXT, By.xpath("//div[@id='globalMessages']//div[contains(@class, 'm-message--alert')]")));
		addField(FieldName.EMAIL_ERROR_MESSAGE_BOX, new Field(FieldType.TEXT, By.id("change_email_error")));
		addField(FieldName.PASSWORD_ERROR_MESSAGE_BOX, new Field(FieldType.TEXT, By.id("change_password_error")));
		addField(FieldName.PASSWORD_SUCCESS_MESSAGE_BOX, new Field(FieldType.TEXT, By.id("success-message")));
		addField(FieldName.EDIT_PASSWORD_BUTTON, new Field(FieldType.BUTTON, By.xpath("//a[contains(@class, 'js-form-toggle-trigger-password')]")));
		addField(FieldName.PASSWORD_CHANGE_BUTTON, new Field(FieldType.BUTTON, By.xpath("//button[@id='update-password']")));
		addField(FieldName.NEW_PASSWORD_TEXTFIELD, new Field(FieldType.TEXT, By.id("register-password")));
		addField(FieldName.REPEAT_NEW_PASSWORD_TEXTFIELD, new Field(FieldType.TEXT, By.id("register-password-2")));
		addField(FieldName.CHANGE_PASSWORD_FORM, new Field(FieldType.DIV, By.xpath("//form[@id='update-password' and not(contains(@style, 'none'))]")));
		addField(FieldName.CURRENT_PASSWORD_TEXTFIELD, new Field(FieldType.TEXT, By.id("current-password")));
		addField(FieldName.DUMMY_EMAIL_ADDRESS, new Field(FieldType.TEXT, By.id("dummy-email-address")));
		addField(FieldName.CONTACT_DATA_EDIT_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//a[@href='#editContactData']")));
		addField(FieldName.YOUR_CONTACT_DATA, new Field(FieldType.SECTION, By.xpath("//div[contains(@class, 'o-account-form')]")));
		addField(FieldName.CONTACT_DATA_TITLE_FIELD, new Field(FieldType.DIV, By.xpath(".//label[@for='title']")));
		addField(FieldName.CONTACT_DATA_FIRST_NAME_FIELD, new Field(FieldType.DIV, By.xpath(".//label[@for='firstName']")));
		addField(FieldName.CONTACT_DATA_LAST_NAME_FIELD, new Field(FieldType.DIV, By.xpath(".//label[@for='lastName']")));
		addField(FieldName.CONTACT_DATA_FUNCTION_FIELD, new Field(FieldType.DIV, By.xpath(".//label[@for='function']")));
		addField(FieldName.CONTACT_DATA_PHONE_FIELD, new Field(FieldType.DIV, By.xpath(".//div[contains(@class, 'a-input')]/label[@for='phone']")));
		addField(FieldName.CONTACT_DATA_MOBILE_PHONE_FIELD, new Field(FieldType.DIV, By.xpath(".//div[contains(@class, 'a-input')]/label[@for='mobilePhone']")));
		addField(FieldName.CONTACT_DATA_FAX_FIELD, new Field(FieldType.DIV, By.xpath(".//div[contains(@class, 'a-input')]/label[@for='fax']")));
		addField(FieldName.CONTACT_DATA_NEWSLETTER_CONFIRMATION_CHECKBOX, new Field(FieldType.DIV, By.id("emailNewsletter-field")));
		addField(FieldName.FAX_ERROR_MESSAGE_BOX, new Field(FieldType.SECTION, By.xpath("//div[@id='contact_form_error_message' and contains(., 'fax')]")));
		addField(FieldName.PHONE_ERROR_MESSAGE_BOX, new Field(FieldType.SECTION, By.xpath("//div[@id='contact_form_error_message' and contains(., 'phone') and not(contains(., 'mobile'))]")));
		addField(FieldName.MOBILE_PHONE_ERROR_MESSAGE_BOX, new Field(FieldType.SECTION, By.xpath("//div[@id='contact_form_error_message' and contains(., 'mobile')]")));
		addField(FieldName.FIRST_NAME_TEXTFIELD, new Field(FieldType.TEXT, By.id("firstName")));
		addField(FieldName.LAST_NAME_TEXTFIELD, new Field(FieldType.TEXT, By.id("lastName")));
		addField(FieldName.PHONE_TEXTFIELD, new Field(FieldType.TEXT, By.id("phone")));
		addField(FieldName.MOBILE_PHONE_TEXTFIELD, new Field(FieldType.TEXT, By.id("mobilePhone")));
		addField(FieldName.FAX_TEXTFIELD, new Field(FieldType.TEXT, By.id("fax")));
		addField(FieldName.YOUR_CONTACT_DATA_SAVE_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//button[contains(@class, 'js-form-update-watcher-submit')]")));
		addField(FieldName.CONTACT_DATA_CANCEL_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//button[contains(@class, 'js-form-update-watcher-reset')]")));
		addField(FieldName.YOUR_COMPANY_DATA, new Field(FieldType.SECTION, By.xpath("//div[@class='m-account-companydata']")));
		addField(FieldName.COMPANY_NAME_ROW, new Field(FieldType.DIV, By.xpath(".//div[@class='m-account-companydata-row' and contains(., 'Company name') and not(contains(., '2'))]")));
		addField(FieldName.SECOND_COMPANY_NAME_ROW, new Field(FieldType.DIV, By.xpath(".//div[@class='m-account-companydata-row' and contains(., 'Company name 2')]")));
		addField(FieldName.STREET_ADDRESS_ROW, new Field(FieldType.DIV, By.xpath(".//div[@class='m-account-companydata-row' and contains(., 'Street address') and not(contains(., '2'))]")));
		addField(FieldName.SECOND_STREET_ADDRESS_ROW, new Field(FieldType.DIV, By.xpath(".//div[@class='m-account-companydata-row' and contains(., 'Street address 2')]")));
		addField(FieldName.CITY_ROW, new Field(FieldType.DIV, By.xpath(".//div[@class='m-account-companydata-row' and contains(., 'City')]")));
		addField(FieldName.STATE_ROW, new Field(FieldType.DIV, By.xpath(".//div[@class='m-account-companydata-row' and contains(., 'State')]")));
		addField(FieldName.ZIP_CODE_ROW, new Field(FieldType.DIV, By.xpath(".//div[@class='m-account-companydata-row' and contains(., 'Zip')]")));
		addField(FieldName.COUNTRY_ROW, new Field(FieldType.DIV, By.xpath(".//div[@class='m-account-companydata-row' and contains(., 'Country')]")));
		addField(FieldName.TRADE_ROW, new Field(FieldType.DIV, By.xpath(".//div[@class='m-account-companydata-row' and contains(., 'Trade')]")));
		addField(FieldName.NO_OF_EMPLOYEES_ROW, new Field(FieldType.DIV, By.xpath(".//div[@class='m-account-companydata-row' and contains(., 'employees')]")));
		addField(FieldName.CONTACT_CUSTOMER_SERVICE_LINK, new Field(FieldType.LINK, By.xpath("//a[@data-trigger-hash='#contact_callus']")));
		addField(FieldName.AGREE_AND_ACCEPT_CHECKBOX, new Field(FieldType.DIV, By.xpath(".//div[@id='myprofile-agreement-field']")));
		addField(FieldName.TITLE_SELECTION_DROPDOWN, new Field(FieldType.SECTION, By.id("title-field")));
		addField(FieldName.FUNCTION_SELECTION_DROPDOWN, new Field(FieldType.SECTION, By.xpath("//span[@id='function-field']")));
		addField(FieldName.OTHER_FUNCTION, new Field(FieldType.LINK, By.xpath(".//li[contains(@class, 'active-result') and contains(., 'Other')]")));
		addField(FieldName.MS_TITLE, new Field(FieldType.LINK, By.xpath(".//li[contains(@class, 'active-result') and contains(., 'Ms')]")));
		addField(FieldName.COMPANY_TITLE, new Field(FieldType.LINK, By.xpath(".//li[contains(@class, 'active-result') and contains(., 'Company')]")));
		addField(FieldName.FOREMAN_FUNCTION, new Field(FieldType.LINK, By.xpath(".//li[contains(@class, 'active-result') and contains(., 'Foreman')]")));
		addField(FieldName.OPEN_DASHBOARD_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//a[contains(@class, 'm-nav-meta-loginlink')]")));
		addField(FieldName.ACCOUNT_DASHBOARD, new Field(FieldType.DIV, By.xpath("//div[contains(@class, 'm-account-dashboard visible')]")));
		addField(FieldName.GO_TO_YOUR_SUBMITTALS_LINK, new Field(FieldType.LINK, By.xpath("//a[@href='/myaccount-submittals#account-navigation' and @id='FavoriteListsPanelLink3']")));
	}
	
}