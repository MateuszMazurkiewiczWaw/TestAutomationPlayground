package com.hilti.tahilti.pages.WebshopPages;

import org.openqa.selenium.By;

import com.hilti.utils.*;

public class CheckoutFleetLabellingPage extends Page{

	public enum FieldName implements Storable {
	
		FLEET_LABELLING_FORM, //section
		CONTINUE_BUTTON, // in FLEET_LABELLING_FORM section
		FLEET_LABELING_TABLE,
		FLEET_LABELING_TABLE_HEADER,
		ORG_REFERENCE_INFO_BUTTON, //in FLEET_LABELING_TABLE_HEADER section
		INVENTORY_KEY_INFO_BUTTON, //in FLEET_LABELING_TABLE_HEADER section
		ORG_REFERENCE_INFO_POPUP,
		INVENTORY_KEY_INFO_POPUP,
		ORG_REFERENCE_TEXTFIELD,
		INVENTORY_KEY_TEXTFIELD,
		BACK_TO_PREVIOUS_STEP_LINK
		
		
	}
	
	public CheckoutFleetLabellingPage(){
		
		addField(FieldName.FLEET_LABELLING_FORM, new Field(FieldType.SECTION, By.id("fleetForm")));
		addField(FieldName.CONTINUE_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//button[@class='a-button js-submit-btn']")));
		addField(FieldName.FLEET_LABELING_TABLE, new Field(FieldType.DIV, By.xpath("//table/tbody")));
		addField(FieldName.FLEET_LABELING_TABLE_HEADER, new Field(FieldType.DIV, By.xpath("//table/thead")));
		addField(FieldName.ORG_REFERENCE_INFO_BUTTON, new Field(FieldType.DIV, By.xpath("(.//a[contains(@class, 'a-icon-info')])[1]")));
		addField(FieldName.INVENTORY_KEY_INFO_BUTTON, new Field(FieldType.DIV, By.xpath("(.//a[contains(@class, 'a-icon-info')])[2]")));
		addField(FieldName.ORG_REFERENCE_INFO_POPUP, new Field(FieldType.DIV, By.xpath("//div[@class='tooltipster-content']")));
		addField(FieldName.INVENTORY_KEY_INFO_POPUP, new Field(FieldType.DIV, By.xpath("//div[@class='tooltipster-content']")));
		addField(FieldName.ORG_REFERENCE_TEXTFIELD, new Field(FieldType.TEXT, By.xpath("//input[contains(@id, 'orgRef')]")));
		addField(FieldName.INVENTORY_KEY_TEXTFIELD, new Field(FieldType.TEXT, By.xpath("//input[contains(@id, 'invNum')]")));
		addField(FieldName.BACK_TO_PREVIOUS_STEP_LINK, new Field(FieldType.LINK, By.xpath("//a[contains(@href, 'billing-info') and (contains(@class, 'link'))]")));
		
	}
}