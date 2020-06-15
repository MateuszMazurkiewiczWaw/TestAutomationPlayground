package com.hilti.tahilti.pages.WebshopPages;

import org.openqa.selenium.By;

import com.hilti.utils.*;

public class CheckoutOrderSummaryPage extends Page{

	public enum FieldName implements Storable {
	
		BILLING_INFORMATION_BREADCRUMB,
		CHECKOUT_FORM, //section
		DELIVERY_INFORMATION_BREADCRUMB,
		FLEET_LABELLING_BREADCRUMB,
		SHOPPING_CART_BREADCRUMB,
		ORDER_SUMMARY_BREADCRUMB,
		BILLING_INFORMATION_SUMMARY,
		EDIT_BILLING_INFORMATION_BUTTON,
		ACCOUNT_INFO_COLUMN,
		BILLING_INFO_COLUMN,
		DELIVERY_INFORMATION_SUMMARY,
		EDIT_DELIVERY_INFORMATION_BUTTON,
		DELIVERY_INFO_COLUMN,
		SHIPPING_INFO_COLUMN,
		FLEET_PRODUCTS_TABLE,
		STANDARD_PRODUCTS_TABLE,
		PRODUCT_DESCRIPTION_COLUMN,
		QUANTITY_COLUMN,
		USAGE_PERIOD_COLUMN,
		INVOICE_COLUMN,
		PRICE_COLUMN,
		TOTAL_PRICE_COLUMN,
		PACKAGING_UNIT_COLUMN,
		EXPECTED_DELIVERY_DATE,
		FLEET_SUBTOTAL_TABLE,
		STANDARD_SUBTOTAL_TABLE,
		EDIT_FLEET_PRODUCTS_BUTTON,
		EDIT_STANDARD_PRODUCTS_BUTTON,
		SUMMARY_PRINT_BUTTON,
		SUBMIT_ORDER_BUTTON,
		PICKUP_LOCATION_BREADCRUMB,
		PICKUP_DETAILS_BREADCRUMB,
		PICKUP_LOCATION_SUMMARY,
		EXPECTED_PICKUP_CONTACT_COLUMN,
		OPENING_HOURS_COLUMN,
		EDIT_PICKUP_LOCATION_BUTTON,
		SOFTWARE_PRODUCTS_TABLE,
		YEARLY_BILLING_PRODUCTS_TABLE,
		SOFTWARE_SUBTOTAL_TABLE,
		YEARLY_BILLING_SUBTOTAL_TABLE,
		EDIT_SOFTWARE_PRODUCTS_BUTTON,
		EDIT_YEARLY_BILLING_PRODUCTS_BUTTON,
		EDIT_PICKUP_STANDARD_PRODUCTS_BUTTON,
		SUCCESS_MESSAGE_BOX,
		ALERT_MESSAGE_BOX,
		HILTI_CENTER_COLUMN,
		LOCATION_MAP,
		GET_DIRECTIONS_BUTTON,
		PROGRESS_BAR,
		ERROR_MESSAGE_BOX,
		
	}
	
	public CheckoutOrderSummaryPage(){
		
		addField(FieldName.BILLING_INFORMATION_BREADCRUMB, new Field(FieldType.LINK, By.xpath(".//a[@href='/checkout/billing-info']")));
		addField(FieldName.CHECKOUT_FORM, new Field(FieldType.SECTION, By.id("checkout-submit-order")));
		addField(FieldName.DELIVERY_INFORMATION_BREADCRUMB, new Field(FieldType.LINK, By.xpath(".//a[@href='/checkout/delivery-info']")));
		addField(FieldName.FLEET_LABELLING_BREADCRUMB, new Field(FieldType.LINK, By.xpath(".//a[@href='/checkout/fleet-labeling']")));
		addField(FieldName.SHOPPING_CART_BREADCRUMB, new Field(FieldType.LINK, By.xpath(".//a[@href='/cart']")));
		addField(FieldName.ORDER_SUMMARY_BREADCRUMB, new Field(FieldType.TEXT, By.xpath(".//span[@class='m-progress-step-text' and contains(., 'summary')]")));
		addField(FieldName.PICKUP_LOCATION_BREADCRUMB, new Field(FieldType.TEXT, By.xpath(".//span[@class='m-progress-step-text' and contains(., 'location')]")));
		addField(FieldName.PICKUP_DETAILS_BREADCRUMB, new Field(FieldType.TEXT, By.xpath(".//span[@class='m-progress-step-text' and contains(., 'details')]")));
		addField(FieldName.BILLING_INFORMATION_SUMMARY, new Field(FieldType.SECTION, By.xpath("//div[@class='o-order-summary-info-billing']")));
		addField(FieldName.EDIT_BILLING_INFORMATION_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//a[@class='a-link-action a-icon-edit a-color-hilti-red-before no-print']")));
		addField(FieldName.ACCOUNT_INFO_COLUMN, new Field(FieldType.TEXT, By.xpath(".//div[@class='m-billing-accountinfo' and contains(., 'Account Number')]")));
		addField(FieldName.BILLING_INFO_COLUMN, new Field(FieldType.TEXT, By.xpath(".//div[@class='m-billing-accountinfo' and contains(., 'Billing')]")));
		addField(FieldName.DELIVERY_INFORMATION_SUMMARY, new Field(FieldType.SECTION, By.xpath("//div[@class='o-order-summary-info-delivery']")));
		addField(FieldName.EDIT_DELIVERY_INFORMATION_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//a[@href='/checkout/delivery-info' and contains(., 'Edit')]")));
		addField(FieldName.DELIVERY_INFO_COLUMN, new Field(FieldType.TEXT, By.xpath(".//div[@class='m-billing-accountinfo' and contains(., 'Delivery')]")));
		addField(FieldName.SHIPPING_INFO_COLUMN, new Field(FieldType.TEXT, By.xpath(".//div[@class='m-billing-accountinfo' and contains(., 'Shipping')]")));
		addField(FieldName.FLEET_PRODUCTS_TABLE, new Field(FieldType.SECTION, By.xpath("//table[@class='m-table m-table--responsive-grid m-table--has-summary m-table--decrease-rowspacing' and contains(., 'Usage')]")));
		addField(FieldName.STANDARD_PRODUCTS_TABLE, new Field(FieldType.SECTION, By.xpath("//table[@class='m-table m-table--responsive-grid m-table--has-summary m-table--decrease-rowspacing' and not(contains(., 'Usage'))]")));
		addField(FieldName.PRODUCT_DESCRIPTION_COLUMN, new Field(FieldType.SECTION, By.xpath(".//th[@class='no-sort' and contains(., 'Description')]")));
		addField(FieldName.QUANTITY_COLUMN, new Field(FieldType.SECTION, By.xpath(".//th[@class='no-sort' and contains(., 'Quantity')]")));
		addField(FieldName.USAGE_PERIOD_COLUMN, new Field(FieldType.SECTION, By.xpath(".//th[@class='no-sort' and contains(., 'Usage')]")));
		addField(FieldName.INVOICE_COLUMN, new Field(FieldType.SECTION, By.xpath(".//th[@class='no-sort' and contains(., 'Invoice')]")));
		addField(FieldName.PRICE_COLUMN, new Field(FieldType.SECTION, By.xpath(".//th[@class='no-sort' and contains(., 'Price') and not(contains(., 'Total'))]")));
		addField(FieldName.TOTAL_PRICE_COLUMN, new Field(FieldType.SECTION, By.xpath(".//th[@class='no-sort' and contains(., 'Total')]")));
		addField(FieldName.PACKAGING_UNIT_COLUMN, new Field(FieldType.SECTION, By.xpath(".//th[@class='no-sort' and contains(., 'Packaging')]")));
		addField(FieldName.EXPECTED_DELIVERY_DATE, new Field(FieldType.SECTION, By.xpath(".//div[@id='msg_']")));
		addField(FieldName.FLEET_SUBTOTAL_TABLE, new Field(FieldType.SECTION, By.xpath("//table[@class='m-table m-table--summary m-table--decrease-rowspacing' and contains(., 'fleet')]")));
		addField(FieldName.STANDARD_SUBTOTAL_TABLE, new Field(FieldType.SECTION, By.xpath("//table[@class='m-table m-table--summary m-table--decrease-rowspacing' and contains(., 'purchase')]")));
		addField(FieldName.EDIT_FLEET_PRODUCTS_BUTTON, new Field(FieldType.BUTTON, By.xpath("(//a[@href='/cart' and contains(., 'Edit')])[1]")));
		addField(FieldName.EDIT_STANDARD_PRODUCTS_BUTTON, new Field(FieldType.BUTTON, By.xpath("(//a[@href='/cart' and contains(., 'Edit')])[2]")));
		addField(FieldName.SUBMIT_ORDER_BUTTON, new Field(FieldType.BUTTON, By.xpath("//button[contains(@class, 'a-button-primary js-submit-order-btn')]")));
		addField(FieldName.SUMMARY_PRINT_BUTTON, new Field(FieldType.BUTTON, By.xpath("//a[@href='/checkout/order-summary?printEnabled=true']")));
		addField(FieldName.PICKUP_LOCATION_SUMMARY, new Field(FieldType.SECTION, By.xpath("//div[@class='o-order-summary-info-pickup']")));
		addField(FieldName.EXPECTED_PICKUP_CONTACT_COLUMN, new Field(FieldType.SECTION, By.xpath("//dl[@class='column' and contains(., 'contact')]")));
		addField(FieldName.OPENING_HOURS_COLUMN, new Field(FieldType.SECTION, By.xpath("//dl[contains(@class, 'column--openinghours')]")));
		addField(FieldName.EDIT_PICKUP_LOCATION_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//a[@href='/checkout/pickup-location' and contains(., 'Edit')]")));
		addField(FieldName.SOFTWARE_PRODUCTS_TABLE, new Field(FieldType.SECTION, By.xpath("//table[@class='m-table m-table--responsive-grid m-table--has-summary m-table--decrease-rowspacing' and not(contains(., 'Billing'))]")));
		addField(FieldName.YEARLY_BILLING_PRODUCTS_TABLE, new Field(FieldType.SECTION, By.xpath("//table[@class='m-table m-table--responsive-grid m-table--has-summary m-table--decrease-rowspacing' and contains(., 'Billing')]")));
		addField(FieldName.SOFTWARE_SUBTOTAL_TABLE, new Field(FieldType.SECTION, By.xpath("//table[@class='m-table m-table--summary m-table--decrease-rowspacing' and contains(., 'purchase')]")));
		addField(FieldName.YEARLY_BILLING_SUBTOTAL_TABLE, new Field(FieldType.SECTION, By.xpath("//table[@class='m-table m-table--summary m-table--decrease-rowspacing' and contains(., 'billing')]")));
		addField(FieldName.EDIT_SOFTWARE_PRODUCTS_BUTTON, new Field(FieldType.BUTTON, By.xpath("(//a[@href='/cart' and contains(., 'Edit')])[1]")));
		addField(FieldName.EDIT_YEARLY_BILLING_PRODUCTS_BUTTON, new Field(FieldType.BUTTON, By.xpath("//a[@href='/cart' and contains(., 'Edit')]")));
		addField(FieldName.EDIT_PICKUP_STANDARD_PRODUCTS_BUTTON, new Field(FieldType.BUTTON, By.xpath("(//a[@href='/cart' and contains(., 'Edit')])[1]")));
		addField(FieldName.SUCCESS_MESSAGE_BOX, new Field(FieldType.TEXT, By.xpath("//div[@class='m-message m-message--centered m-message--success']")));
		addField(FieldName.ALERT_MESSAGE_BOX, new Field(FieldType.TEXT, By.xpath("//div[@class='m-message m-message--centered m-message--alert']")));
		addField(FieldName.HILTI_CENTER_COLUMN, new Field(FieldType.SECTION, By.xpath(".//dl[@class='column' and contains(., 'Center')]")));
		addField(FieldName.LOCATION_MAP, new Field(FieldType.DIV, By.xpath(".//div[@class='m-staticmap-map']")));
		addField(FieldName.GET_DIRECTIONS_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//a[@class='a-button-secondary']")));
		addField(FieldName.PROGRESS_BAR, new Field(FieldType.DIV, By.xpath("//div[contains(@class, 'm-progress a-spacing')]")));
		addField(FieldName.ERROR_MESSAGE_BOX, new Field(FieldType.TEXT, By.id("msg_order_summary_error")));
		
	}
}