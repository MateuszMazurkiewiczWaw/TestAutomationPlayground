package com.hilti.tahilti.pages.WebshopPages;

import org.openqa.selenium.By;

import com.hilti.utils.*;

public class MyFavoriteListsPage extends Page{

	public enum FieldName implements Storable {
		CANCEL_DELETE_BUTTON,
		DELETE_LIST_CONFIRM_BUTTON,
		DELETE_FAVORITE_LIST_POPUP,
		
		RENAME_LINK, // in FAVORITE_LIST_TABLE row
		CHANGE_NAME_CANCEL_BUTTON, // in FAVORITE_LIST_TABLE row. Visible after clicking CHANGE_NAME_BUTTON
		CHANGE_NAME_CONFIRM_BUTTON, // in FAVORITE_LIST_TABLE row. Visible after clicking CHANGE_NAME_BUTTON
		CHANGE_LIST_NAME_TEXTFIELD, // in FAVORITE_LIST_TABLE row. Visible after clicking CHANGE_NAME_BUTTON
		
		LIST_NAME_TEXTFIELD, // in FAVORITE_LIST_TABLE row
		COPY_LIST_TO_COMPANY_LIST_BUTTON, // in FAVORITE_LIST_TABLE row
		CREATE_NEW_FAVORITE_LIST_BUTTON,
		DATE_CREATED_COLUMN, // in FAVORITE_LIST_TABLE
		DATE_CREATED_SORT_BUTTON,
		DELETE_LIST_BUTTON, // in FAVORITE_LIST_TABLE row
		FAVORITE_LIST, //section
		FAVORITE_LISTS_AND_SUBMITIALS_DROPDOWN,
		FAVORITE_LIST_TABLE,
		FAVORITE_LIST_TABLE_HEADER,
		LIST_NAME_COLUMN, // in FAVORITE_LIST_TABLE
		LIST_NAME_SORT_BUTTON,
		MENU_BAR,
		MESSAGE_BOX,
		MESSAGE_BOX_CLOSE_BUTTON,
		MY_FAVORITE_LISTS_BUTTON,
		NEW_LIST_NAME_TEXTFIELD,
		
		GO_TO_LIST_LINK // in FAVORITE_LIST_TABLE row
		
	}
	
	public MyFavoriteListsPage(){
		addField(FieldName.CANCEL_DELETE_BUTTON, new Field(FieldType.BUTTON, By.xpath("//div[@class='featherlight']//button[@id='cancel_deletelist']")));
		addField(FieldName.DELETE_LIST_CONFIRM_BUTTON, new Field(FieldType.BUTTON, By.xpath("//div[@class='featherlight']//button[@id='deletelist']")));
		addField(FieldName.DELETE_FAVORITE_LIST_POPUP, new Field(FieldType.BUTTON, By.xpath("//div[@class='featherlight']//div[contains(@class, 'delete')]")));
		
		addField(FieldName.RENAME_LINK, new Field(FieldType.BUTTON, By.xpath(".//td[@data-mapping='rename']/a")));
		addField(FieldName.CHANGE_NAME_CANCEL_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//td[contains(@class, 'is-visible')]//button[contains(@class, 'cancel')]")));
		addField(FieldName.CHANGE_NAME_CONFIRM_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//td[contains(@class, 'is-visible')]//button[contains(@class, 'save')]")));
		addField(FieldName.CHANGE_LIST_NAME_TEXTFIELD, new Field(FieldType.BUTTON, By.xpath(".//td[contains(@class, 'is-visible')]//input[@name='listname']")));
		
		addField(FieldName.LIST_NAME_TEXTFIELD, new Field(FieldType.BUTTON, By.xpath(".//td[@data-mapping='listname']")));
		addField(FieldName.COPY_LIST_TO_COMPANY_LIST_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//td[@data-mapping='copy']/a")));
		addField(FieldName.CREATE_NEW_FAVORITE_LIST_BUTTON, new Field(FieldType.BUTTON, By.xpath("//th[not (contains(@id, 'clone'))]//button")));
		addField(FieldName.DATE_CREATED_COLUMN, new Field(FieldType.LIST, By.xpath(".//td[3]")));
		addField(FieldName.DATE_CREATED_SORT_BUTTON, new Field(FieldType.BUTTON, By.xpath("//table[not(contains(@id, 'clone')) and contains(@class, 'm-table')]/thead//th/span[contains(.,'Date')]")));
		addField(FieldName.DELETE_LIST_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//td[@data-mapping='delete']/a")));
		addField(FieldName.FAVORITE_LIST, new Field(FieldType.SECTION, By.id("response")));
		addField(FieldName.FAVORITE_LISTS_AND_SUBMITIALS_DROPDOWN, new Field(FieldType.LIST, By.xpath("//li[contains(@class, 'm-account-nav-col')][3]")));
		addField(FieldName.FAVORITE_LIST_TABLE, new Field(FieldType.GROUP, By.xpath("//table[not(contains(@id, 'clone')) and contains(@class, 'm-table')]/tbody")));
		addField(FieldName.FAVORITE_LIST_TABLE_HEADER, new Field(FieldType.DIV, By.xpath("//table[not(contains(@id, 'clone')) and contains(@class, 'm-table')]/thead//tr[1]")));
		addField(FieldName.LIST_NAME_COLUMN, new Field(FieldType.LIST, By.xpath(".//td[1]")));
		addField(FieldName.LIST_NAME_SORT_BUTTON, new Field(FieldType.BUTTON, By.xpath("//table[not(contains(@id, 'clone')) and contains(@class, 'm-table')]/thead//th/span[contains(.,'Name')]")));
		addField(FieldName.MENU_BAR, new Field(FieldType.LINK, By.id("account-navigation")));
		addField(FieldName.MESSAGE_BOX, new Field(FieldType.DIV, By.xpath("//div[contains(@class, 'js-message-close')]/following-sibling::div//p")));
		addField(FieldName.MESSAGE_BOX_CLOSE_BUTTON, new Field(FieldType.BUTTON, By.xpath("//div[contains(@class, 'js-message-close')]")));
		addField(FieldName.MY_FAVORITE_LISTS_BUTTON, new Field(FieldType.LIST, By.xpath("//span/a[contains(@href, '/myaccount-favlists')]")));
		addField(FieldName.NEW_LIST_NAME_TEXTFIELD, new Field(FieldType.TEXT, By.xpath("//th[not (contains(@id, 'clone'))]//input[@name='listname']")));

		addField(FieldName.GO_TO_LIST_LINK, new Field(FieldType.LINK, By.xpath(".//a[@data-hoverlink='listdetail']")));
		
		

	}
}