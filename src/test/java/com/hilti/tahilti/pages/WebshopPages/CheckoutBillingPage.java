package com.hilti.tahilti.pages.WebshopPages;

import org.openqa.selenium.By;

import com.hilti.utils.*;

public class CheckoutBillingPage extends Page{

	public enum FieldName implements Storable {
	
		BILLING_INFORMATION_FORM, //section
		CONTINUE_BUTTON, // in BILLING_INFORMATION_FORM section
		BACK_TO_PREVIOUS_STEP_BUTTON,
		CHECKOUT_HEADLINE,
		SHOPPING_CART_BREADCRUMB,
		ORDER_SUMMARY_BREADCRUMB,
		PICKUP_LOCATION_BREADCRUMB,
		PICKUP_DETAILS_BREADCRUMB,
		BILLING_INFORMATION_BREADCRUMB,
		YOUR_ACCOUNT_NUMBER_COLUMN,
		BILLING_ADDRESS_COLUMN,
		PAYMENT_METHOD_COLUMN,
		PURCHASE_ORDER_NUMBER_COLUMN,
		PURCHASE_ORDER_DOCUMENT_COLUMN,
		PURCHASE_ORDER_NUMBER_TEXTFIELD,
		PURCHASE_ORDER_NUMBER_LEARNMORE_BUTTON,
		PURCHASE_ORDER_DOCUMENT_LEARNMORE_BUTTON,
		PURCHASE_ORDER_DOCUMENT_SELECT_FILE_LINK,
		CREDIT_CARD_METHOD_RADIOBUTTON,
		INVOICE_METHOD_RADIOBUTTON,
		PAYMENT_METHOD_ADDITIONAL_INFO,
		PURCHASE_ORDER_NUMBER_LEARNMORE_POPUP,
		PURCHASE_ORDER_DOCUMENT_LEARNMORE_POPUP,
		DELIVERY_INFORMATION_BREADCRUMB,
		INVOICE_METHOD_CLICKANDCOLLECT_RADIOBUTTON,
		ENTER_CARD_INFORMATION_BUTTON,
		CREDIT_CARD_OVERLAY,
		CREDIT_CARD_TYPE_DROPDOWN_BUTTON,
		CARD_NUMBER_TEXTFIELD,
		CREDIT_CARD_TYPE_LIST,
		CREDIT_CARD_OVERLAY_CONTENT,
		CREDIT_CARD_EXPIRY_MONTH_DROPDOWN_BUTTON,
		CREDIT_CARD_EXPIRY_MONTH_LIST,
		CREDIT_CARD_EXPIRY_YEAR_DROPDOWN_BUTTON,
		CREDIT_CARD_EXPIRY_YEAR_LIST,
		CVC_NUMBER_TEXTFIELD,
		SUBMIT_CREDIT_CARD_DATA_BUTTON,
		CREDIT_CARD_OVERLAY_FORM,
	}
	
	public CheckoutBillingPage(){
		
		addField(FieldName.BILLING_INFORMATION_FORM, new Field(FieldType.SECTION, By.xpath("//form[@id='command' and contains(@action, 'billing-info')]")));
		addField(FieldName.CONTINUE_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//button[@class='a-button js-submit-btn']")));
		addField(FieldName.BACK_TO_PREVIOUS_STEP_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//a[@href='/checkout/pickup-details' and contains(@class, 'a-link--back')]")));
		addField(FieldName.CHECKOUT_HEADLINE, new Field(FieldType.SECTION, By.xpath("//h1[contains(@class, 'a-heading-h1')]")));
		addField(FieldName.SHOPPING_CART_BREADCRUMB, new Field(FieldType.LINK, By.xpath("//a[@href='/cart' and contains(., 'Cart')]")));
		addField(FieldName.ORDER_SUMMARY_BREADCRUMB, new Field(FieldType.LINK, By.xpath(".//span[@class='m-progress-step-text' and contains(., 'summary')]")));
		addField(FieldName.PICKUP_LOCATION_BREADCRUMB, new Field(FieldType.LINK, By.xpath(".//a[@href='/checkout/pickup-location' and contains(., 'location')]")));
		addField(FieldName.PICKUP_DETAILS_BREADCRUMB, new Field(FieldType.LINK, By.xpath(".//a[@href='/checkout/pickup-details' and contains(., 'details')]")));
		addField(FieldName.BILLING_INFORMATION_BREADCRUMB, new Field(FieldType.LINK, By.xpath(".//span[@class='m-progress-step' and contains(., 'Billing')]")));
		addField(FieldName.DELIVERY_INFORMATION_BREADCRUMB, new Field(FieldType.LINK, By.xpath(".//a[@href='/checkout/delivery-info' and contains(., 'Delivery')]")));
		addField(FieldName.YOUR_ACCOUNT_NUMBER_COLUMN, new Field(FieldType.SECTION, By.xpath(".//div[@class='o-billing-information-item' and contains(., 'Account number')]")));
		addField(FieldName.BILLING_ADDRESS_COLUMN, new Field(FieldType.SECTION, By.xpath(".//div[@class='o-billing-information-item' and contains(., 'Billing')]")));
		addField(FieldName.PAYMENT_METHOD_COLUMN, new Field(FieldType.SECTION, By.xpath(".//div[@class='o-billing-information-item' and contains(., 'Payment')]")));
		addField(FieldName.PURCHASE_ORDER_NUMBER_COLUMN, new Field(FieldType.SECTION, By.xpath(".//div[@class='o-billing-information-item' and contains(., 'order number')]")));
		addField(FieldName.PURCHASE_ORDER_DOCUMENT_COLUMN, new Field(FieldType.SECTION, By.xpath(".//div[@class='o-billing-information-item' and contains(., 'order document')]")));
		addField(FieldName.PURCHASE_ORDER_NUMBER_TEXTFIELD, new Field(FieldType.TEXT, By.xpath(".//input[@id='purchaseNumber']")));
		addField(FieldName.PURCHASE_ORDER_NUMBER_LEARNMORE_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//a[contains(@data-content, 'Please enter a purchase order number')]")));
		addField(FieldName.PURCHASE_ORDER_DOCUMENT_LEARNMORE_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//a[contains(@data-content, 'Upload Requirements')]")));
		addField(FieldName.PURCHASE_ORDER_DOCUMENT_SELECT_FILE_LINK, new Field(FieldType.LINK, By.xpath(".//span[@class='a-link a-link--arrow a-link--medium']")));
		addField(FieldName.CREDIT_CARD_METHOD_RADIOBUTTON, new Field(FieldType.BUTTON, By.xpath(".//div[@id='payment_ZCSC-div']")));
		addField(FieldName.INVOICE_METHOD_RADIOBUTTON, new Field(FieldType.SECTION, By.xpath(".//div[@id='payment_TA-div']")));
		addField(FieldName.INVOICE_METHOD_CLICKANDCOLLECT_RADIOBUTTON, new Field(FieldType.SECTION, By.xpath(".//div[@id='payment_Z001-div']")));
		addField(FieldName.PAYMENT_METHOD_ADDITIONAL_INFO, new Field(FieldType.SECTION, By.xpath("(//span[@class='a-label-hint'])[1]")));
		addField(FieldName.PURCHASE_ORDER_NUMBER_LEARNMORE_POPUP, new Field(FieldType.SECTION, By.xpath("//div[@class='tooltipster-box']")));
		addField(FieldName.PURCHASE_ORDER_DOCUMENT_LEARNMORE_POPUP, new Field(FieldType.SECTION, By.xpath("//div[@class='tooltipster-content']")));
		addField(FieldName.ENTER_CARD_INFORMATION_BUTTON, new Field(FieldType.BUTTON, By.xpath("//div[contains(@id, 'creditCardInfo')]//a[contains(@class, 'a-link--arrow')]")));
		addField(FieldName.CREDIT_CARD_OVERLAY, new Field(FieldType.DIV, By.id("iframeoverlay")));
		addField(FieldName.CREDIT_CARD_OVERLAY_CONTENT, new Field(FieldType.DIV, By.id("partner-frame")));
		addField(FieldName.CREDIT_CARD_TYPE_DROPDOWN_BUTTON, new Field(FieldType.BUTTON, By.id("ccins_chosen")));
		addField(FieldName.CREDIT_CARD_EXPIRY_MONTH_DROPDOWN_BUTTON, new Field(FieldType.BUTTON, By.id("expDateMonth_chosen")));
		addField(FieldName.CREDIT_CARD_EXPIRY_MONTH_LIST, new Field(FieldType.LIST, By.xpath("//*[@id='expDateMonth_chosen']/div/ul")));
		addField(FieldName.CREDIT_CARD_EXPIRY_YEAR_DROPDOWN_BUTTON, new Field(FieldType.BUTTON, By.id("expDateYear_chosen")));
		addField(FieldName.CREDIT_CARD_EXPIRY_YEAR_LIST, new Field(FieldType.LIST, By.xpath("//*[@id='expDateYear_chosen']/div/ul")));
		addField(FieldName.CVC_NUMBER_TEXTFIELD, new Field(FieldType.TEXT, By.xpath("//input[@id='cvval_display']")));
		addField(FieldName.CARD_NUMBER_TEXTFIELD, new Field(FieldType.TEXT, By.xpath("//input[@id='ccnum_display']")));
		addField(FieldName.CREDIT_CARD_TYPE_LIST, new Field(FieldType.LIST, By.xpath("//*[@id='ccins_chosen']/div/ul")));
		addField(FieldName.SUBMIT_CREDIT_CARD_DATA_BUTTON, new Field(FieldType.BUTTON, By.id("submitButton")));
		addField(FieldName.CREDIT_CARD_OVERLAY_FORM, new Field(FieldType.DIV, By.xpath("//div[@id='formContainer']")));
	}
}