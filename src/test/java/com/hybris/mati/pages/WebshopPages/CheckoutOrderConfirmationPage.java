package com.hybris.mati.pages.WebshopPages;

import org.openqa.selenium.By;

import com.hybris.utils.*;

public class CheckoutOrderConfirmationPage extends Page{

	public enum FieldName implements Storable {
	
		SUCCESS_MESSAGE_BOX,
		GO_TO_ORDER_HISTORY_LINK,
		GO_TO_HOMEPAGE_LINK,
		INNOVATION_MAGAZIN_MARKETING_CONTAINER,
		NEW_PRODUCTS_CONTAINER,
		ALERT_MESSAGE_BOX,
		hybris_CENTER_COLUMN,
		LOCATION_MAP,
		GET_DIRECTIONS_BUTTON,
		REMOVE_ITEMS_FROM_CART_BUTTON,
		VIEW_SHOPPING_CART_PAGE_BUTTON,
		OPENING_HOURS_COLUMN,
		EXPECTED_PICKUP_CONTACT_COLUMN,
	}
	
	public CheckoutOrderConfirmationPage(){
		
		addField(FieldName.GO_TO_ORDER_HISTORY_LINK, new Field(FieldType.LINK, By.xpath("//a[@href='/myaccount-history/orders#account-navigation' and contains(., 'Order history')]")));
		addField(FieldName.GO_TO_HOMEPAGE_LINK, new Field(FieldType.LINK, By.xpath("//a[@href='/' and contains(., 'homepage')]")));
		addField(FieldName.INNOVATION_MAGAZIN_MARKETING_CONTAINER, new Field(FieldType.SECTION, By.xpath("(//div[@class='m-editorial-teaser-content'])[1]")));
		addField(FieldName.NEW_PRODUCTS_CONTAINER, new Field(FieldType.SECTION, By.xpath("(//div[@class='m-editorial-teaser-content'])[1]")));
		addField(FieldName.SUCCESS_MESSAGE_BOX, new Field(FieldType.TEXT, By.xpath("//div[contains(@class, 'm-message m-message--centered m-message--success')]")));
		addField(FieldName.ALERT_MESSAGE_BOX, new Field(FieldType.TEXT, By.xpath("//div[contains(@class, 'm-message m-message--centered m-message--alert')]")));
		addField(FieldName.hybris_CENTER_COLUMN, new Field(FieldType.SECTION, By.xpath(".//dl[@class='column' and contains(., 'Center')]")));
		addField(FieldName.LOCATION_MAP, new Field(FieldType.DIV, By.xpath(".//div[@class='m-staticmap-map']")));
		addField(FieldName.GET_DIRECTIONS_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//a[@class='a-button-secondary']")));
		addField(FieldName.REMOVE_ITEMS_FROM_CART_BUTTON, new Field(FieldType.BUTTON, By.xpath("//a[@href='/checkout/order-confirmation/remove-cart-items']")));
		addField(FieldName.VIEW_SHOPPING_CART_PAGE_BUTTON, new Field(FieldType.BUTTON, By.xpath("//a[@href='/cart' and contains(., 'View')]")));
		addField(FieldName.OPENING_HOURS_COLUMN, new Field(FieldType.SECTION, By.xpath("//dl[contains(@class, 'column--openinghours')]")));
		addField(FieldName.EXPECTED_PICKUP_CONTACT_COLUMN, new Field(FieldType.SECTION, By.xpath("//dl[@class='column' and contains(., 'contact')]")));
	}
}