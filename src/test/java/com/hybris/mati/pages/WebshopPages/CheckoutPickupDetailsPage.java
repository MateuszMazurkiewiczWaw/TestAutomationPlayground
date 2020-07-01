package com.hybris.mati.pages.WebshopPages;

import org.openqa.selenium.By;

import com.hybris.utils.*;

public class CheckoutPickupDetailsPage extends Page{

	public enum FieldName implements Storable {
		
		
		PICKUP_DETAILS_FORM,
		EXPECTED_PICKUP_CONTACT_COLUMN,
		hybris_CENTER_COLUMN,
		OPENING_HOURS_COLUMN,
		LOCATION_MAP,
		GET_DIRECTIONS_BUTTON,
		CONTINUE_BUTTON,
		EXPECTED_DELIVERY_CHANGE_BUTTON,
		MANAGE_CONTACTS_POPUP,
		SECOND_CONTACT_POSITION,
		MANAGE_CONTACTS_TABLE,
		SELECT_CONTACT_BUTTON,
		BACK_TO_PREVIOUS_STEP_BUTTON,
	}
	
	public CheckoutPickupDetailsPage(){
		

		addField(FieldName.PICKUP_DETAILS_FORM, new Field(FieldType.SECTION, By.xpath("//form[@id='command' and contains(@action, 'pickup-details')]")));
		addField(FieldName.EXPECTED_PICKUP_CONTACT_COLUMN, new Field(FieldType.SECTION, By.xpath(".//dl[@class='column' and contains(., 'Expected')]")));
		addField(FieldName.hybris_CENTER_COLUMN, new Field(FieldType.SECTION, By.xpath(".//dl[@class='column' and contains(., 'Center')]")));
		addField(FieldName.OPENING_HOURS_COLUMN, new Field(FieldType.SECTION, By.xpath(".//dl[contains (@class, 'column') and contains(., 'Opening')]")));
		addField(FieldName.LOCATION_MAP, new Field(FieldType.DIV, By.xpath(".//div[@class='m-staticmap-map']")));
		addField(FieldName.GET_DIRECTIONS_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//a[@class='a-button-secondary']")));
		addField(FieldName.CONTINUE_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//button[@class='a-button js-submit-btn']")));
		addField(FieldName.EXPECTED_DELIVERY_CHANGE_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//a[@class='a-button-tertiary']")));
		addField(FieldName.MANAGE_CONTACTS_POPUP, new Field(FieldType.SECTION, By.xpath("//div[@id='managecontact']")));
		addField(FieldName.SECOND_CONTACT_POSITION, new Field(FieldType.BUTTON, By.xpath(".//tr[2]")));
		addField(FieldName.MANAGE_CONTACTS_TABLE, new Field(FieldType.SECTION, By.xpath("//table[@id='selectcontact']/tbody")));
		addField(FieldName.SELECT_CONTACT_BUTTON, new Field(FieldType.BUTTON, By.xpath("(//a[contains(@class, 'a-address-selector')])[2]")));
		addField(FieldName.BACK_TO_PREVIOUS_STEP_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//a[@href='/checkout/pickup-location' and contains(@class, 'a-link--back')]")));
	}
}