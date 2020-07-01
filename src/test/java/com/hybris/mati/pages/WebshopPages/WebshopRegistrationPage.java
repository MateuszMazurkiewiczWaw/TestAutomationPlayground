package com.hybris.mati.pages.WebshopPages;

import org.openqa.selenium.By;

import com.hybris.utils.*;

public class WebshopRegistrationPage extends Page{

	public enum FieldName implements Storable {
		BACK_TO_REGISTRATION_FORM_BUTTON,
		EMAIL_ADDRESS_TEXTFIELD,	
		EMAIL_ERROR_MESSAGE,
		ENTER_PASSWORD_TEXTFIELD,
		PASSWORD_SECURITY_REQUIREMENTS_VALID, // in REGISTRATION_FORM section
		REGISTRATION_FORM,
		REGISTER_NOW_BUTTON,
		REPEAT_PASSWORD_TEXTFIELD,
		SEND_ACTIVATION_EMAIL_AGAIN_BUTTON,
		SHOW_PASSWORDS_CHECKBOX,
		TERMS_OF_CONDITION_CHECKBOX,
		THANK_YOU_FOR_REGISTERING_BANNER
	}
	
	public WebshopRegistrationPage(){	
		addField(FieldName.BACK_TO_REGISTRATION_FORM_BUTTON, new Field(FieldType.BUTTON, By.id("registrationBackToStep1")));
		addField(FieldName.EMAIL_ADDRESS_TEXTFIELD, new Field(FieldType.TEXT, By.id("registration-email")));
		addField(FieldName.EMAIL_ERROR_MESSAGE, new Field(FieldType.TEXT, By.xpath("//span[contains(@id, 'error') and contains(@id, 'email')]")));
		addField(FieldName.ENTER_PASSWORD_TEXTFIELD, new Field(FieldType.TEXT, By.id("registration-password-new")));
		addField(FieldName.PASSWORD_SECURITY_REQUIREMENTS_VALID, new Field(FieldType.TEXT, By.xpath(".//ul[contains(@class, 'requirements-list')]/li[contains(@class, 'valid')]")));
	    addField(FieldName.REGISTRATION_FORM, new Field(FieldType.DIV, By.id("registerForm")));
		addField(FieldName.REGISTER_NOW_BUTTON, new Field(FieldType.BUTTON, By.id("submitRegistration")));	
		addField(FieldName.REPEAT_PASSWORD_TEXTFIELD, new Field(FieldType.TEXT, By.id("registration-password-repeat")));
		addField(FieldName.SEND_ACTIVATION_EMAIL_AGAIN_BUTTON, new Field(FieldType.BUTTON, By.id("registrationResendEmail")));
		addField(FieldName.SHOW_PASSWORDS_CHECKBOX, new Field(FieldType.CHECKBOX, By.xpath("//label[@for='show-passwords-registration']")));
		addField(FieldName.TERMS_OF_CONDITION_CHECKBOX, new Field(FieldType.CHECKBOX, By.xpath("//div[contains(@class, 'registration-terms')]//label")));
		addField(FieldName.THANK_YOU_FOR_REGISTERING_BANNER, new Field(FieldType.DIV, By.id("successMessage")));
	}
}