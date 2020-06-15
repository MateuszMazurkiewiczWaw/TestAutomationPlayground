package com.hilti.tahilti.pages.WebshopPages;

import org.openqa.selenium.By;
import com.hilti.utils.*;

public class MyCompanyListsPage extends Page{

	public enum FieldName implements Storable {
		CANCEL_DELETE_BUTTON,
		DELETE_LIST_CONFIRM_BUTTON,
		DELETE_COMPANY_LIST_POPUP,
		
		RENAME_LINK, // in COMPANY_LIST_TABLE row
		CHANGE_NAME_CANCEL_BUTTON, // in COMPANY_LIST_TABLE row. Visible after clicking CHANGE_NAME_BUTTON
		CHANGE_NAME_CONFIRM_BUTTON, // in COMPANY_LIST_TABLE row. Visible after clicking CHANGE_NAME_BUTTON
		CHANGE_LIST_NAME_TEXTFIELD, // in COMPANY_LIST_TABLE row. Visible after clicking CHANGE_NAME_BUTTON
		
		CREATED_BUTTON, //in EDIT_COLUMNS_DROPDOWN_MENU
		CREATED_BY_BUTTON, //in EDIT_COLUMNS_DROPDOWN_MENU
		CREATED_SORT_BUTTON,
		CREATED_BY_SORT_BUTTON,
		LIST_NAME_TEXTFIELD, // in COMPANY_LIST_TABLE row
		COPY_LIST_TO_FAVORITE_LIST_BUTTON, // in COMPANY_LIST_TABLE row
		CREATE_NEW_COMPANY_LIST_BUTTON,
		DATE_CREATED_COLUMN, // in COMPANY_LIST_TABLE
		DATE_CREATED_SORT_BUTTON,
		DELETE_LIST_BUTTON, // in COMPANY_LIST_TABLE row
		EDIT_COLUMNS_BUTTON,
		EDIT_COLUMNS_DROPDOWN_MENU,
		EDIT_COLUMNS_DROPDOWN_MENU_CLOSE_BUTTON,
		
		COMPANY_LIST, //section
		COMPANY_LISTS_AND_SUBMITIALS_DROPDOWN,
		COMPANY_LIST_TABLE,
		COMPANY_LIST_TABLE_HEADER,
		LIST_NAME_COLUMN, // in COMPANY_LIST_TABLE
		LIST_NAME_SORT_BUTTON,
		LOG_OUT_BUTTON, //in YOUR_ACCOUNT section
		MENU_BAR,
		MESSAGE_BOX,
		MESSAGE_BOX_CLOSE_BUTTON,
		MY_COMPANY_LISTS_BUTTON,
		NEW_LIST_NAME_TEXTFIELD,
		SHOW_ALL_COLUMNS_BUTTON,
		YOUR_ACCOUNT, //section
		GO_TO_LIST_LINK
	}
	
	public MyCompanyListsPage(){
		addField(FieldName.CANCEL_DELETE_BUTTON, new Field(FieldType.BUTTON, By.xpath("//div[@class='featherlight']//button[@id='cancel_deletelist']")));
		addField(FieldName.DELETE_LIST_CONFIRM_BUTTON, new Field(FieldType.BUTTON, By.xpath("//div[@class='featherlight']//button[@id='deletelist']")));
		addField(FieldName.DELETE_COMPANY_LIST_POPUP, new Field(FieldType.BUTTON, By.xpath("//div[@class='featherlight']//div[contains(@class, 'delete')]")));
		
		addField(FieldName.RENAME_LINK, new Field(FieldType.BUTTON, By.xpath(".//td[@data-mapping='rename']/a")));
		addField(FieldName.CHANGE_NAME_CANCEL_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//td[contains(@class, 'is-visible')]//button[contains(@class, 'cancel')]")));
		addField(FieldName.CHANGE_NAME_CONFIRM_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//td[contains(@class, 'is-visible')]//button[contains(@class, 'save')]")));
		addField(FieldName.CHANGE_LIST_NAME_TEXTFIELD, new Field(FieldType.BUTTON, By.xpath(".//td[contains(@class, 'is-visible')]//input[@name='listname']")));
		
		addField(FieldName.CREATED_BUTTON, new Field(FieldType.BUTTON, By.xpath("(//li/label[contains(., 'Created')])[1]")));
		addField(FieldName.CREATED_BY_BUTTON, new Field(FieldType.BUTTON, By.xpath("//li/label[contains(., 'Created by')]")));
		addField(FieldName.CREATED_SORT_BUTTON, new Field(FieldType.BUTTON, By.xpath("(.//th[not(contains(@style, 'none'))]/span[contains(.,'Created')])[1]")));
		addField(FieldName.CREATED_BY_SORT_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//th[not(contains(@style, 'none'))]/span[contains(.,'Created by')]")));
		addField(FieldName.LIST_NAME_TEXTFIELD, new Field(FieldType.BUTTON, By.xpath(".//td[@data-mapping='listname']")));
		addField(FieldName.COPY_LIST_TO_FAVORITE_LIST_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//td[@data-mapping='copy']/a")));
		addField(FieldName.CREATE_NEW_COMPANY_LIST_BUTTON, new Field(FieldType.BUTTON, By.xpath("//th[not (contains(@id, 'clone'))]//button")));
		addField(FieldName.DATE_CREATED_COLUMN, new Field(FieldType.LIST, By.xpath(".//td[3]")));
		addField(FieldName.DATE_CREATED_SORT_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//th[not(contains(@style, 'none'))]/span[contains(.,'changed')]")));
		addField(FieldName.DELETE_LIST_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//td[@data-mapping='delete']/a")));
		addField(FieldName.EDIT_COLUMNS_BUTTON, new Field(FieldType.BUTTON, By.xpath("//button[contains(@class, 'dropdown-toggle')]")));
		addField(FieldName.EDIT_COLUMNS_DROPDOWN_MENU, new Field(FieldType.LIST, By.xpath("//ul[@class='dropdown-menu is-shown']")));
		addField(FieldName.EDIT_COLUMNS_DROPDOWN_MENU_CLOSE_BUTTON, new Field(FieldType.BUTTON, By.xpath("//span[contains(@class, 'dropdown-closer')]")));
		
		addField(FieldName.COMPANY_LIST, new Field(FieldType.SECTION, By.id("response")));
		addField(FieldName.COMPANY_LISTS_AND_SUBMITIALS_DROPDOWN, new Field(FieldType.LIST, By.xpath("//li[contains(@class, 'm-account-nav-col')][3]")));
		addField(FieldName.COMPANY_LIST_TABLE, new Field(FieldType.GROUP, By.xpath("//table[not(contains(@id, 'clone')) and contains(@class, 'm-table')]/tbody")));
		addField(FieldName.COMPANY_LIST_TABLE_HEADER, new Field(FieldType.DIV, By.xpath("//table[not(contains(@id, 'clone')) and contains(@class, 'm-table')]/thead//tr[1]")));
		addField(FieldName.LIST_NAME_COLUMN, new Field(FieldType.LIST, By.xpath(".//td[1]")));
		addField(FieldName.LIST_NAME_SORT_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//th[not(contains(@style, 'none'))]/span[contains(.,'List name')]")));
		addField(FieldName.LOG_OUT_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//a[contains(@href, 'logout')]")));
		addField(FieldName.MENU_BAR, new Field(FieldType.LINK, By.id("account-navigation")));
		addField(FieldName.MESSAGE_BOX, new Field(FieldType.DIV, By.xpath("//div[contains(@class, 'js-message-close')]/following-sibling::div//p")));
		addField(FieldName.MESSAGE_BOX_CLOSE_BUTTON, new Field(FieldType.BUTTON, By.xpath("//div[contains(@class, 'js-message-close')]")));
		addField(FieldName.MY_COMPANY_LISTS_BUTTON, new Field(FieldType.LIST, By.xpath("//a/span[contains(., 'Company lists')]")));
		addField(FieldName.NEW_LIST_NAME_TEXTFIELD, new Field(FieldType.TEXT, By.xpath("//th[not (contains(@id, 'clone'))]//input[@name='listname']")));
		addField(FieldName.SHOW_ALL_COLUMNS_BUTTON, new Field(FieldType.BUTTON, By.xpath("//button[contains(@class, 'btn a-button-tertiary')]")));
		addField(FieldName.YOUR_ACCOUNT, new Field(FieldType.DIV, By.xpath("//div[contains(@class, 'm-account-introduction a-page')]")));
		addField(FieldName.GO_TO_LIST_LINK, new Field(FieldType.LINK, By.xpath(".//a[@data-hoverlink='listdetail']")));
		
	}
}