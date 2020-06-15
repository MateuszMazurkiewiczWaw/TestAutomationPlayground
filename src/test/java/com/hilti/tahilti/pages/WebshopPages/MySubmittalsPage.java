package com.hilti.tahilti.pages.WebshopPages;

import org.openqa.selenium.By;

import com.hilti.utils.*;

public class MySubmittalsPage extends Page{

	public enum FieldName implements Storable {	

		MY_SUBMITTALS_HEADER,
		CREATE_NEW_SUBMITTAL_BUTTON,
		SUBMITTALS_FAVORITES_TABLE,
		LIST_NAME_COLUMN,
		DATE_CREATED_COLUMN,
		RENAME_LIST_BUTTON,
		RENAME_LIST_TEXTFIELD,
		CHANGE_NAME_BUTTON,
		ERROR_MESSAGE_BOX,
		SUCCESS_MESSAGE_BOX,
		RENAME_CANCEL_BUTTON,
		CREATE_SUBMITTAL_TABLE_BUTTON,
		DELETE_LIST_BUTTON,
		DELETE_OVERLAY,
		OVERLAY_CANCEL_BUTTON,
		OVERLAY_DELETE_BUTTON,
		LIST_NAME_COLUMN_CONTENT,
		MY_SUBMITTALS_TABLE,
		SUBMITTAL_NAME_COLUMN
		
		
	}
	
	public MySubmittalsPage(){
	
		addField(FieldName.MY_SUBMITTALS_HEADER, new Field(FieldType.TEXT, By.xpath("//h3[@id='content-start']")));
		addField(FieldName.CREATE_NEW_SUBMITTAL_BUTTON, new Field(FieldType.BUTTON, By.xpath("//a[@href='/firestops']")));
		addField(FieldName.SUBMITTALS_FAVORITES_TABLE, new Field(FieldType.SECTION, By.xpath("//table[@class='m-table table m-table--decrease-rowspacing m-table--my-submittal']")));
		addField(FieldName.LIST_NAME_COLUMN, new Field(FieldType.DIV, By.xpath(".//th[contains(@class, 'sorting sorter-text')]")));
		addField(FieldName.DATE_CREATED_COLUMN, new Field(FieldType.DIV, By.xpath(".//th[contains(@class, 'sorting sorter-date')]")));
		addField(FieldName.RENAME_LIST_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//a[contains(@class, 'js-table-rename')]")));
		addField(FieldName.RENAME_LIST_TEXTFIELD, new Field(FieldType.TEXT, By.xpath(".//input[contains(@name, 'listname')]")));
		addField(FieldName.CHANGE_NAME_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//form[@id='command']//button[@class='a-button js-table-save']")));
		addField(FieldName.ERROR_MESSAGE_BOX, new Field(FieldType.DIV, By.xpath("//div[@id='response']//div[contains(@class, 'm-message m-message--error')]")));
		addField(FieldName.SUCCESS_MESSAGE_BOX, new Field(FieldType.DIV, By.xpath("//div[@id='response']//div[contains(@class, 'm-message m-message--success')]")));
		addField(FieldName.RENAME_CANCEL_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//form[@id='command']//button[@class='a-button-tertiary js-table-cancel']")));
		addField(FieldName.CREATE_SUBMITTAL_TABLE_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//a[@class='a-link a-link--arrow-after' and contains(@href, '/firestops/builder/details/')]")));
		addField(FieldName.DELETE_LIST_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//td[@data-mapping='delete']//a[@class='a-link-action a-icon-delete a-color-hilti-red-before js-table-delete']")));
		addField(FieldName.DELETE_OVERLAY, new Field(FieldType.SECTION, By.xpath("//div[@class='featherlight-content']")));
		addField(FieldName.OVERLAY_CANCEL_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//button[contains(@id, 'cancel_deletelist')]")));
		addField(FieldName.OVERLAY_DELETE_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//button[contains(@id, 'deletelist') and contains(@class, 'js-table-overlay-delete-confirm')]")));
		addField(FieldName.LIST_NAME_COLUMN_CONTENT, new Field(FieldType.SECTION, By.xpath(".//td[contains(@data-mapping, 'listname')]")));
		addField(FieldName.MY_SUBMITTALS_TABLE, new Field(FieldType.SECTION, By.xpath("//table[contains(@class, 'submittal') and not(contains(@class, 'clone'))]/tbody")));
		addField(FieldName.SUBMITTAL_NAME_COLUMN, new Field(FieldType.TEXT, By.xpath("./td[1]")));
	}
	
}