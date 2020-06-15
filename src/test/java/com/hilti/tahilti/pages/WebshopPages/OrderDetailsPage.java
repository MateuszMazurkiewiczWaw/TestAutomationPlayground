package com.hilti.tahilti.pages.WebshopPages;

import org.openqa.selenium.By;

import com.hilti.utils.*;

public class OrderDetailsPage extends Page{

	public enum FieldName implements Storable {
		BACK_TO_ORDER_HISTORY_LINK,
		ERROR_MESSAGE_BOX,
		SUCCESS_MESSAGE_BOX,
		HILTI_ORDER_NUMBER, //section
		REQUEST_INVOICE_BUTTON,
		TRACK_SHIPMENT_BUTTON,
		MESSAGE_BOX, // any message
		ITEM_PURCHASED_CHECKBOX, // in ORDER_DETAILS_TABLE row
		ORDER_DETAILS_DELIVERY_ADDRESS_LINK,
		ORDER_DETAILS_ADDRESS_POPUP, //section
		ORDER_DETAILS_ADDRESS_CLOSE_BUTTON, //in ORDER_DETAILS_ADDRESS_POPUP section
		
		PRODUCT_DESCRIPTION_COLUMN, // in ORDER_DETAILS_TABLE_CONTENT
		ORDER_DETAILS_BILLING_INFORMATION_LINK,
		ORDER_DETAILS_BILLING_INFORMATION_POPUP, //section
		ORDER_DETAILS_BILLING_CLOSE_BUTTON, //in ORDER_DETAILS_BILLING_INFORMATION_POPUP section
		ORDER_HISTORY_EDIT_COLUMNS_BUTTON, // in section ORDER_DETAILS_TABLE
		ORDER_HISTORY_EDIT_COLUMNS_MENU,
		ITEM_STATUS_CHECKBOX,
		ITEM_QUANTITY_CHECKBOX,
		ITEM_QUANTITY_COLUMN, // in ORDER_DETAILS_TABLE
		ITEM_STATUS_COLUMN, // in ORDER_DETAILS_TABLE
		ORDER_TOTAL_COLUMN, // in ORDER_DETAILS_TABLE
		PRODUCT_DESCRIPTION_WHOLE_COLUMN, // in ORDER_DETAILS_TABLE
		CANCELLATION_REASON_COLUMN, // in ORDER_DETAILS_TABLE
		ORDER_FULFILLMENT_STATUS_COLUMN, // in ORDER_DETAILS_TABLE
		EDIT_COLUMNS_CLOSE_BUTTON,
		SHOW_ALL_COLUMNS_BUTTON,
		
		YOUR_PURCHASED_ITEMS, //section
		ORDER_DETAILS_TABLE,
		ORDER_DETAILS_TABLE_CONTENT,
		ORDER_DETAILS_REORDER_BUTTON, // in ORDER_DETAILS_TABLE
		SELECT_ALL_NONE_CHECKBOX, // in ORDER_DETAILS_TABLE
		
		TRACK_YOUR_SHIPMENTS_SEPERATELY, //section
		TOTAL_ORDER_SUM // in ORDER_DETAILS_TABLE

	}
	
	public OrderDetailsPage(){
		addField(FieldName.BACK_TO_ORDER_HISTORY_LINK, new Field(FieldType.LINK, By.xpath("//div/a[contains(@href, 'myaccount-history/orders')]")));
		addField(FieldName.ERROR_MESSAGE_BOX, new Field(FieldType.DIV, By.id("requestInvoiceError")));
		addField(FieldName.SUCCESS_MESSAGE_BOX, new Field(FieldType.DIV, By.id("reorderSuccess")));
		addField(FieldName.MESSAGE_BOX, new Field(FieldType.DIV, By.xpath("//div[contains(@id, 'requestInvoice') and not(contains(@style, 'none')) and not(contains(@class, 'is-hidden'))]")));

		addField(FieldName.HILTI_ORDER_NUMBER, new Field(FieldType.DIV, By.id("orderDetailsMoleculeMain")));
		addField(FieldName.TRACK_SHIPMENT_BUTTON, new Field(FieldType.BUTTON, By.xpath("//a[@href='#shipments']")));
		addField(FieldName.ITEM_PURCHASED_CHECKBOX, new Field(FieldType.CHECKBOX, By.xpath(".//label[contains(@for, 'checkbox')]")));
		addField(FieldName.REQUEST_INVOICE_BUTTON, new Field(FieldType.BUTTON, By.id("requestinvoicecopy")));
		addField(FieldName.ORDER_DETAILS_DELIVERY_ADDRESS_LINK, new Field(FieldType.LINK, By.xpath("//a[contains(@class, 'tooltipstered') and contains(., 'Delivery')]")));
		addField(FieldName.ORDER_DETAILS_ADDRESS_POPUP, new Field(FieldType.DIV, By.xpath("//div[contains(@class, 'tooltipster-content')]")));
		addField(FieldName.ORDER_DETAILS_ADDRESS_CLOSE_BUTTON, new Field(FieldType.DIV, By.xpath(".//span[contains(@class, 'tooltip-closer')]")));
		
		addField(FieldName.PRODUCT_DESCRIPTION_COLUMN, new Field(FieldType.LINK, By.xpath(".//td[3]")));
		addField(FieldName.ORDER_DETAILS_BILLING_INFORMATION_LINK, new Field(FieldType.LINK, By.xpath("//a[contains(@class, 'tooltipstered') and contains(., 'Billing')]")));
		addField(FieldName.ORDER_DETAILS_BILLING_INFORMATION_POPUP, new Field(FieldType.DIV, By.xpath("//div[contains(@class, 'tooltipster-content')]")));
		addField(FieldName.ORDER_DETAILS_BILLING_CLOSE_BUTTON, new Field(FieldType.DIV, By.xpath(".//span[contains(@class, 'tooltip-closer')]")));
		addField(FieldName.ORDER_HISTORY_EDIT_COLUMNS_BUTTON, new Field(FieldType.DIV, By.xpath("//table[not(contains(@class, 'clone'))]//button[contains(@class, 'dropdown-toggle')]")));
		addField(FieldName.ORDER_HISTORY_EDIT_COLUMNS_MENU, new Field(FieldType.DIV, By.xpath("//table[not(contains(@class, 'clone'))]//ul[@class='dropdown-menu is-shown']")));
		addField(FieldName.ITEM_STATUS_CHECKBOX, new Field(FieldType.CHECKBOX, By.xpath(".//label[contains(., '" + Tools.getEnvironmentTestData("account.orderHistoryDetails.label.itemStatus") + "')]/ancestor::li")));
		addField(FieldName.ITEM_QUANTITY_CHECKBOX, new Field(FieldType.CHECKBOX, By.xpath(".//label[contains(., '" + Tools.getEnvironmentTestData("account.orderHistoryDetails.label.quantity") + "')]/ancestor::li")));
		addField(FieldName.ITEM_QUANTITY_COLUMN, new Field(FieldType.TEXT, By.xpath(".//th[not(contains(@style, 'none'))]/span[contains(., '" + Tools.getEnvironmentTestData("account.orderHistoryDetails.label.quantity") + "')]")));
		addField(FieldName.ITEM_STATUS_COLUMN, new Field(FieldType.TEXT, By.xpath(".//th[not(contains(@style, 'none'))]/span[contains(., '" + Tools.getEnvironmentTestData("account.orderHistoryDetails.label.itemStatus") + "')]")));
		addField(FieldName.ORDER_TOTAL_COLUMN, new Field(FieldType.TEXT, By.xpath(".//th[not(contains(@style, 'none'))]/span[contains(., '" + Tools.getEnvironmentTestData("account.orderHistoryDetails.label.total") + "')]")));
		addField(FieldName.ORDER_FULFILLMENT_STATUS_COLUMN, new Field(FieldType.TEXT, By.xpath(".//th[not(contains(@style, 'none'))]/span[contains(., 'Order')]")));
		addField(FieldName.CANCELLATION_REASON_COLUMN, new Field(FieldType.TEXT, By.xpath(".//th[not(contains(@style, 'none'))]/span[contains(., 'Cancellation')]")));
		addField(FieldName.PRODUCT_DESCRIPTION_WHOLE_COLUMN, new Field(FieldType.TEXT, By.xpath(".//th[not(contains(@style, 'none'))]/span[contains(., 'Product')]")));
		
		addField(FieldName.EDIT_COLUMNS_CLOSE_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//span[contains(@class, 'dropdown-closer')]")));
		addField(FieldName.SHOW_ALL_COLUMNS_BUTTON, new Field(FieldType.BUTTON, By.xpath("//table[not(contains(@class, 'clone'))]//button[contains(@class, 'btn a-button-tertiary')]")));
		
		addField(FieldName.YOUR_PURCHASED_ITEMS, new Field(FieldType.DIV, By.id("response")));
		addField(FieldName.ORDER_DETAILS_TABLE, new Field(FieldType.DIV, By.xpath("//table[contains(@class, 'productdetaillinks') and not(contains(@class, 'clone'))]")));
		addField(FieldName.ORDER_DETAILS_TABLE_CONTENT, new Field(FieldType.DIV, By.xpath("//table[contains(@class, 'productdetaillinks') and not(contains(@class, 'clone'))]/tbody")));	
		addField(FieldName.ORDER_DETAILS_REORDER_BUTTON, new Field(FieldType.BUTTON, By.id("orderHistoryDetailsReorderButton")));
		addField(FieldName.SELECT_ALL_NONE_CHECKBOX, new Field(FieldType.CHECKBOX, By.xpath(".//label[contains(@for, 'checkbox-toggler')]")));
	
		addField(FieldName.TRACK_YOUR_SHIPMENTS_SEPERATELY, new Field(FieldType.DIV, By.xpath("//div[contains(@class, 'shipmenttracking')]")));

		addField(FieldName.TOTAL_ORDER_SUM, new Field(FieldType.TEXT, By.xpath(".//tr[contains(@class, 'last tfoot')]")));


	}

}