package com.hilti.tahilti.pages.WebshopPages;

import org.openqa.selenium.By;

import com.hilti.utils.*;

public class OrderHistoryPage extends Page{

	public enum FieldName implements Storable {
		DATE_SORT_BUTTON,
		DATE_COLUMN, // in ORDER_HISTORY_TABLE row
		DETAILS_BUTTON, // in ORDER_HISTORY_TABLE row, visible after hover on row
		DELIVERY_STATUS_SORT_BUTTON,
		MESSAGE_BOX, // any message
		ERROR_MESSAGE_BOX,
		ORDER_HISTORY, //section
		ORDER_HISTORY_CHECKBOX, // in ORDER_HISTORY_TABLE row
		ORDER_HISTORY_TABLE,
		ORDER_NUMBER_COLUMN, // in ORDER_HISTORY_TABLE row
		ORDER_NUMBER_SORT_BUTTON,
		OVERALL_STATUS_SORT_BUTTON,
		REORDER_BUTTON,
		SUCCESS_MESSAGE_BOX,
		REQUEST_COPY_OF_INVOICE_BUTTON,
		SHIPMENT_TRACKING, //section
		TOTAL_PRICE_COLUMN,
		NO_ORDERS_MESSAGE_BOX

		
	}
	
	public OrderHistoryPage(){
		
		addField(FieldName.DATE_SORT_BUTTON, new Field(FieldType.BUTTON, By.xpath("//th[@id='orderHistoryMoleculeMain-col-4']/span[contains(., 'Date')]")));
		addField(FieldName.DATE_COLUMN, new Field(FieldType.BUTTON, By.xpath(".//td[5]")));
		addField(FieldName.DETAILS_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//td[contains(@class, 'is-hover')]/a[@data-hoverlink='detailslink']")));
		addField(FieldName.DELIVERY_STATUS_SORT_BUTTON, new Field(FieldType.BUTTON, By.xpath("//th[@id='orderHistoryMoleculeMain-col-6']/span[contains(., 'Delivery')]")));
		addField(FieldName.MESSAGE_BOX, new Field(FieldType.DIV, By.xpath("//div[contains(@id, 'requestInvoice') and not(contains(@style, 'none')) and not(contains(@class, 'is-hidden'))]")));
		addField(FieldName.ERROR_MESSAGE_BOX, new Field(FieldType.DIV, By.id("requestInvoiceError")));
		addField(FieldName.ORDER_HISTORY, new Field(FieldType.DIV, By.xpath("//h3[@id='content-start']/ancestor::div[@class='row']")));
		addField(FieldName.ORDER_HISTORY_CHECKBOX, new Field(FieldType.CHECKBOX, By.xpath(".//td/div[@class='a-checkbox']")));
		addField(FieldName.ORDER_HISTORY_TABLE, new Field(FieldType.GROUP, By.xpath("//table[not(contains(@class, 'm-table-clone')) and (contains(@class, 'm-table'))]/tbody")));
		addField(FieldName.ORDER_NUMBER_COLUMN, new Field(FieldType.BUTTON, By.xpath(".//td[2]")));
		addField(FieldName.OVERALL_STATUS_SORT_BUTTON, new Field(FieldType.BUTTON, By.xpath("//th[@id='orderHistoryMoleculeMain-col-5']/span[contains(., 'Overall')]")));
		addField(FieldName.ORDER_NUMBER_SORT_BUTTON, new Field(FieldType.BUTTON, By.xpath("//th[@id='orderHistoryMoleculeMain-col-1']/span[contains(., 'Order #')]")));
		addField(FieldName.SHIPMENT_TRACKING, new Field(FieldType.DIV, By.id("orderHistoryHintsId")));
		addField(FieldName.SUCCESS_MESSAGE_BOX, new Field(FieldType.DIV, By.id("reorderSuccess")));
		addField(FieldName.REORDER_BUTTON, new Field(FieldType.BUTTON, By.xpath("//div[@id='m-table-buttons']//button[@id='ordersubmit']")));
		addField(FieldName.REQUEST_COPY_OF_INVOICE_BUTTON, new Field(FieldType.BUTTON, By.xpath("//div[@id='m-table-buttons']//button[@id='requestsubmit']")));
		addField(FieldName.TOTAL_PRICE_COLUMN, new Field(FieldType.BUTTON, By.xpath(".//td[9]")));
		addField(FieldName.NO_ORDERS_MESSAGE_BOX, new Field(FieldType.DIV, By.xpath("//div[contains(@class, 'js-order-history-empty')]")));

	}
}