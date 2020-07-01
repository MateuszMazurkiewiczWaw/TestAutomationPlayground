package com.hybris.mati.pages.WebshopPages;

import org.openqa.selenium.By;
import com.hybris.utils.*;

public class MyCompanyListsDetailsPage extends Page{

	public enum FieldName implements Storable {
		LIST_NAME,
		QUICK_ITEM_ENTRY, // section
		QUICK_ITEM_ENTRY_TEXTFIELD,
		ADD_TO_CART_BUTTON,
		REMOVE_FROM_LIST_BUTTON,
		UPDATE_AND_SAVE_BUTTON,
		COMPANY_LIST_PRODUCTS_TABLE, //section
		ADD_TO_LIST_BUTTON,
		MESSAGE_SUCCESS, // in QUICK_ITEM_ENTRY section
		QIE_FIELD_TIP,
		LIST_STICKY_ROW,
		PRODUCT_QUANTITY,
		SAVE_BUTTON,
		SAVE_BUTTON_INACTIVE,
		PRODUCT_ID_IN_ROW,
		PRODUCT_IMAGE_IN_ROW,
		SEE_PRODUCT_DETAILS_IN_ROW,
		SELECT_ALL_NONE_CHECKBOX,
		PACKAGE_QUANTITY_COLUMN,
		PRICE_COLUMN,
		REMOVE_FROM_LIST,
		PRODUCT_CHECKBOX,
		SEE_FLEET_MANAGEMENT_PRICE,
		SEE_FLEET_MANAGEMENT_PRICE_TIP,
		CLOSE_TIP,
		REPLACEMENT_ROW,
		REPLACING_PRODUCT_ID,
		FLEET_RADIOBUTTON,
		ADD_TO_CART_ROW_BUTTON
		
	}
	
	public MyCompanyListsDetailsPage(){
		addField(FieldName.LIST_NAME, new Field(FieldType.DIV, By.xpath("//div[contains(@class, 'o-favorite-list--name')]")));
		addField(FieldName.QUICK_ITEM_ENTRY, new Field(FieldType.SECTION, By.xpath("//div[contains(@class, 'container-fluid m-addproduct')]")));
		addField(FieldName.QUICK_ITEM_ENTRY_TEXTFIELD, new Field(FieldType.TEXT, By.xpath("//textarea[@id='quickOrderText']")));
		addField(FieldName.ADD_TO_CART_BUTTON, new Field(FieldType.BUTTON, By.xpath("//button[contains(@class, 'js-selected-add-to-cart')]")));
		addField(FieldName.REMOVE_FROM_LIST_BUTTON, new Field(FieldType.BUTTON, By.xpath("//button[contains(@class, 'js-remove-selected')]")));
		addField(FieldName.UPDATE_AND_SAVE_BUTTON, new Field(FieldType.BUTTON, By.xpath("//button[contains(@class, 'js-update-list')]")));
		addField(FieldName.COMPANY_LIST_PRODUCTS_TABLE, new Field(FieldType.DIV, By.xpath("//div[contains(@class,'o-favorite-list favoritelist_')]")));
		addField(FieldName.ADD_TO_LIST_BUTTON, new Field(FieldType.BUTTON, By.xpath("//a[contains(@class, 'js-send-new-product')]")));
		addField(FieldName.MESSAGE_SUCCESS, new Field(FieldType.DIV, By.xpath(".//div[contains(@class, 'm-message--success')]")));
		addField(FieldName.QIE_FIELD_TIP, new Field(FieldType.DIV, By.xpath("//div[@class='m-addproduct-tip']")));
		addField(FieldName.LIST_STICKY_ROW, new Field(FieldType.DIV, By.xpath("//div[contains(@class,'o-favorite-list-table-head is-stuck')]")));
		addField(FieldName.PRODUCT_QUANTITY, new Field(FieldType.DIV, By.xpath("//input[@name='quantity']")));
		addField(FieldName.SAVE_BUTTON, new Field(FieldType.BUTTON, By.xpath("//button[@class='a-button-primary js-update-list']")));
		addField(FieldName.SAVE_BUTTON_INACTIVE, new Field(FieldType.BUTTON, By.xpath("//button[@class='a-button-primary js-update-list is-disabled']")));
		addField(FieldName.PRODUCT_ID_IN_ROW, new Field(FieldType.TEXT, By.xpath(".//span[@class='m-cart--td-item-number']")));
		addField(FieldName.PRODUCT_IMAGE_IN_ROW, new Field(FieldType.IMAGE, By.xpath(".//td[@class='m-cart--td-image js-row-image']//picture/img")));
		addField(FieldName.SEE_PRODUCT_DETAILS_IN_ROW, new Field(FieldType.LINK, By.xpath(".//a[@class='a-link a-link--arrow-after js-see-details']")));
		addField(FieldName.SELECT_ALL_NONE_CHECKBOX, new Field(FieldType.CHECKBOX, By.xpath(".//label[@for='checkbox-toggler']")));
		addField(FieldName.PACKAGE_QUANTITY_COLUMN, new Field(FieldType.DIV, By.xpath(".//th[@class='m-cart--th-single']")));
		addField(FieldName.PRICE_COLUMN, new Field(FieldType.DIV, By.xpath(".//th[@class='m-cart--th-price--fl']")));
		addField(FieldName.REMOVE_FROM_LIST, new Field(FieldType.LINK, By.xpath(".//td/a[contains(@class,'js--btn-remove')]")));
		addField(FieldName.PRODUCT_CHECKBOX, new Field(FieldType.LINK, By.xpath(".//input[contains(@id,'favCheck')]")));
		addField(FieldName.SEE_FLEET_MANAGEMENT_PRICE, new Field(FieldType.LINK, By.xpath(".//div[@class='m-cart--priceFavorite-price js-non-fleet']/a")));
		addField(FieldName.SEE_FLEET_MANAGEMENT_PRICE_TIP, new Field(FieldType.LINK, By.xpath("//div[@class='tooltipster-box']")));
		addField(FieldName.CLOSE_TIP, new Field(FieldType.LINK, By.xpath(".//span[@class='a-tooltip-closer']")));
		addField(FieldName.REPLACEMENT_ROW, new Field(FieldType.SECTION, By.xpath("//tr[contains(@class, 'm-cart--row--replacement')]")));
		addField(FieldName.REPLACING_PRODUCT_ID, new Field(FieldType.SECTION, By.xpath("//tr[contains(@class, 'm-cart--row--replacement')]//span[@class='m-cart--td-item-number']")));
		addField(FieldName.FLEET_RADIOBUTTON, new Field(FieldType.RADIO, By.xpath(".//label[contains(@for,'radio-product') and contains(@for,'fleet')]")));
		addField(FieldName.ADD_TO_CART_ROW_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//button[@class='a-button-primary js-add-to-cart']")));
		

	}
}