package com.hybris.mati.pages.WebshopPages;

import org.openqa.selenium.By;

import com.hybris.utils.*;

public class CheckoutSummaryPrintPage extends Page{

	public enum FieldName implements Storable {
	
		PRINT_BILLING_INFORMATION,
		PRINT_DELIVERY_INFORMATION,
		PRINT_HEADER,
		PRINT_FOOTER,
		BILLING_YOUR_ACCOUNT_COLUMN,
		BILLING_DETAILS_COLUMN,
		DELIVERY_ADDRESS_DETAILS_COLUMN,
		DELIVERY_SHIPPING_DETAILS_COLUMN,
		PRINT_FLEET_SUMMARY,
		PRINT_STANDARD_SUMMARY,
		PRINT_EXPTECTED_PICKUP_CONTACT_COLUMN,
		PRINT_OPENING_HOURS_COLUMN,
		PRINT_PICKUP_LOCATION,
		PRINT_SOFTWARE_SUMMARY,
		PRINT_YEARLY_BILLING_SUMMARY
	}
	
	public CheckoutSummaryPrintPage(){
		
		addField(FieldName.PRINT_BILLING_INFORMATION, new Field(FieldType.SECTION, By.xpath("//div[@class='o-order-summary-info-billing']")));
		addField(FieldName.PRINT_DELIVERY_INFORMATION, new Field(FieldType.SECTION, By.xpath("//div[@class='o-order-summary-info-delivery']")));
		addField(FieldName.PRINT_HEADER, new Field(FieldType.SECTION, By.xpath("//div[@class='o-printheader']")));
		addField(FieldName.PRINT_FOOTER, new Field(FieldType.SECTION, By.xpath("//div[@class='o-printfooter row']")));
		addField(FieldName.BILLING_YOUR_ACCOUNT_COLUMN, new Field(FieldType.SECTION, By.xpath(".//div[@class='column' and contains(., 'Your account')]")));
		addField(FieldName.BILLING_DETAILS_COLUMN, new Field(FieldType.SECTION, By.xpath(".//div[@class='column' and contains(., 'Billing address')]")));
		addField(FieldName.DELIVERY_ADDRESS_DETAILS_COLUMN, new Field(FieldType.SECTION, By.xpath(".//div[@class='column' and contains(., 'Delivery address')]")));
		addField(FieldName.DELIVERY_SHIPPING_DETAILS_COLUMN, new Field(FieldType.SECTION, By.xpath(".//div[@class='column' and contains(., 'Shipping method')]")));
		addField(FieldName.PRINT_FLEET_SUMMARY, new Field(FieldType.SECTION, By.xpath("//div[@class='o-order-summary-cart is-open js-accordion-selector' and contains(., 'Fleet')]")));
		addField(FieldName.PRINT_STANDARD_SUMMARY, new Field(FieldType.SECTION, By.xpath("//div[@class='o-order-summary-cart is-open js-accordion-selector' and contains(., 'Purchase')]")));
		addField(FieldName.PRINT_EXPTECTED_PICKUP_CONTACT_COLUMN, new Field(FieldType.SECTION, By.xpath(".//dl[@class='column']")));
		addField(FieldName.PRINT_OPENING_HOURS_COLUMN, new Field(FieldType.SECTION, By.xpath(".//dl[contains(@class, 'column--openinghours')]")));
		addField(FieldName.PRINT_PICKUP_LOCATION, new Field(FieldType.SECTION, By.xpath("//div[@class='o-order-summary-info-pickup']")));
		addField(FieldName.PRINT_SOFTWARE_SUMMARY, new Field(FieldType.SECTION, By.xpath("//div[@class='o-order-summary-cart is-open js-accordion-selector' and contains(., 'Software')]")));
		addField(FieldName.PRINT_YEARLY_BILLING_SUMMARY, new Field(FieldType.SECTION, By.xpath("//div[@class='o-order-summary-cart is-open js-accordion-selector' and contains(., 'Billing')]")));
	}
}