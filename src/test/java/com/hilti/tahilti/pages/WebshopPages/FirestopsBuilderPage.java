package com.hilti.tahilti.pages.WebshopPages;

import org.openqa.selenium.By;

import com.hilti.utils.*;

public class FirestopsBuilderPage extends Page{

	public enum FieldName implements Storable {	

		CREATE_SUBMITTAL_2ND_STEP_HEADER,
		SAVE_AS_FAVORITE_BUTTON,
		SAVE_AS_FAVORITE_OVERLAY,
		SAVE_AS_FAVORITE_TEXTFIELD,
		SAVE_AS_FAVORITE_OVERLAY_BUTTON,
		SUCCESS_MESSAGE_BOX,
		SELECTED_FIRESTOP_PRODUCTS,
		SELECTED_SUBMITTAL_OPTIONS,
		BACK_TO_SYSTEM_SELECTION_LINK,
		SAVE_AS_FAVORITE_LINK,
		SELECTED_FIRESTOP_SYSTEMS_TABLE,
		ADD_MORE_SYSTEMS_BUTTON,
		ALL_SUBMITTAL_FAVORITES_LINK,
		GENERATE_SUBMITTAL_BUTTON,
		SELECTED_PRODUCT_CHECKBOX,
		HILTI_COVER_PAGE_RADIOBUTTON,
		CUSTOM_COVER_PAGE_RADIOBUTTON,
		UPLOAD_CUSTOM_COVER,
		SELECT_FILE_LINK,
		DRAG_AND_DROP_BOX,
		NO_COVER_PAGE_RADIOBUTTON,
		INCLUDE_PAGE_NUMBER_YES_RADIOBUTTON,
		INCLUDE_PAGE_NUMBER_NO_RADIOBUTTON,
		SYSTEM_COLUMN_HEADER,
		DESCRIPTION_COLUMN_HEADER,
		ATTRIBUTES_COLUMN_HEADER,
		F_RATING_COLUMN_HEADER,
		DOWNLOAD_SUBMITTAL_BUTTON,
		GENERATE_SUCCESS_MESSAGE_BOX,
	}
	
	public FirestopsBuilderPage(){
	
		addField(FieldName.CREATE_SUBMITTAL_2ND_STEP_HEADER, new Field(FieldType.TEXT, By.xpath("//div[@class='a-heading-h2']")));
		addField(FieldName.SAVE_AS_FAVORITE_BUTTON, new Field(FieldType.BUTTON, By.xpath("//a[@href='/' and @class='a-button-tertiary ']")));
		addField(FieldName.SAVE_AS_FAVORITE_OVERLAY, new Field(FieldType.SECTION, By.xpath("//div[@class='featherlight-content']//div[@id='newlistoverlay']")));
		addField(FieldName.SAVE_AS_FAVORITE_TEXTFIELD, new Field(FieldType.TEXT, By.xpath(".//div[@class='featherlight-content']//input[@id='favoriteListName']")));
		addField(FieldName.SAVE_AS_FAVORITE_OVERLAY_BUTTON, new Field(FieldType.BUTTON, By.xpath("//div[@class='featherlight-content']//button[@id='newlist-submit']")));
		addField(FieldName.SUCCESS_MESSAGE_BOX, new Field(FieldType.TEXT, By.xpath("//div[@id='save-success-message']")));
		addField(FieldName.GENERATE_SUCCESS_MESSAGE_BOX, new Field(FieldType.TEXT, By.xpath("//div[@id='sbm-success-message']")));
		addField(FieldName.ALL_SUBMITTAL_FAVORITES_LINK, new Field(FieldType.LINK, By.xpath("//a[@href='/myaccount-submittals']")));
		addField(FieldName.SELECTED_FIRESTOP_SYSTEMS_TABLE, new Field(FieldType.SECTION, By.xpath("//table[@id='firestopSystems']")));
		addField(FieldName.ADD_MORE_SYSTEMS_BUTTON, new Field(FieldType.BUTTON, By.xpath("//a[contains(@class, 'a-button-secondary') and @href='/firestops']")));
		addField(FieldName.SELECTED_FIRESTOP_PRODUCTS, new Field(FieldType.SECTION, By.xpath("//div[contains(@id, 'firestopRelatedProducts')]")));
		addField(FieldName.SELECTED_SUBMITTAL_OPTIONS, new Field(FieldType.SECTION, By.xpath("//form[contains(@id, 'submittalForm')]/child::div[contains(@class,'a-spacing') and not(contains(@id, 'firestopRelatedProducts'))]")));
		addField(FieldName.BACK_TO_SYSTEM_SELECTION_LINK, new Field(FieldType.LINK, By.xpath("(//a[contains(@class, 'a-link--back') and @href='/firestops'])[1]")));
		addField(FieldName.SAVE_AS_FAVORITE_LINK, new Field(FieldType.LINK, By.xpath("//a[contains(@class, 'a-button-tertiary') and @href='/']")));
		addField(FieldName.GENERATE_SUBMITTAL_BUTTON, new Field(FieldType.BUTTON, By.xpath("//button[contains(@id, 'create-submittal')]")));
		addField(FieldName.SELECTED_PRODUCT_CHECKBOX, new Field(FieldType.CHECKBOX, By.xpath(".//input[@type='checkbox']")));
		addField(FieldName.HILTI_COVER_PAGE_RADIOBUTTON, new Field(FieldType.RADIO, By.xpath(".//div[@class='a-radio ' and contains(@id, 'HiltiCover')]")));
		addField(FieldName.CUSTOM_COVER_PAGE_RADIOBUTTON, new Field(FieldType.RADIO, By.xpath(".//div[@class='a-radio ' and contains(@id, 'Custom')]")));
		addField(FieldName.UPLOAD_CUSTOM_COVER, new Field(FieldType.SECTION, By.xpath("//div[contains(@class, 'js-firestop-upload')]")));
		addField(FieldName.SELECT_FILE_LINK, new Field(FieldType.LINK, By.xpath("//div[@class='a-dropzone-inside']//span[contains(@class, 'a-link a-link--arrow a-link--medium')]")));
		addField(FieldName.DRAG_AND_DROP_BOX, new Field(FieldType.DIV, By.xpath("//div[@class='a-dropzone-inside']")));
		addField(FieldName.NO_COVER_PAGE_RADIOBUTTON, new Field(FieldType.RADIO, By.xpath(".//div[@class='a-radio ' and contains(@id, 'noCover')]")));
		addField(FieldName.INCLUDE_PAGE_NUMBER_YES_RADIOBUTTON, new Field(FieldType.RADIO, By.xpath(".//div[@class='a-radio ' and contains(@id, 'page-numbers-yes')]")));
		addField(FieldName.INCLUDE_PAGE_NUMBER_NO_RADIOBUTTON, new Field(FieldType.RADIO, By.xpath(".//div[@class='a-radio ' and contains(@id, 'page-numbers-no')]")));
		addField(FieldName.SYSTEM_COLUMN_HEADER, new Field(FieldType.DIV, By.xpath(".//th[2]")));
		addField(FieldName.DESCRIPTION_COLUMN_HEADER, new Field(FieldType.DIV, By.xpath(".//th[3]")));
		addField(FieldName.ATTRIBUTES_COLUMN_HEADER, new Field(FieldType.DIV, By.xpath(".//th[4]")));
		addField(FieldName.F_RATING_COLUMN_HEADER, new Field(FieldType.DIV, By.xpath(".//th[5]")));
		addField(FieldName.DOWNLOAD_SUBMITTAL_BUTTON, new Field(FieldType.BUTTON, By.xpath("//a[@id='download-link']")));
	}
	
}