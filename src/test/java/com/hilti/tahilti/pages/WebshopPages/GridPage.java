package com.hilti.tahilti.pages.WebshopPages;

import org.openqa.selenium.By;

import com.hilti.utils.*;

public class GridPage extends Page{

	public enum FieldName implements Storable {
		
		BREADCRUMBS,
		COMPARE_CHECKBOX, // in PRODUCT_LIST section
		COMPARE_BUTTON_TOP,
		COMPARE_BUTTON_BOTTOM,
		DISPLAYED_PRODUCTS_COUNTER,
		DEFINE_YOUR_REQUIREMENTS,
		FILTERBAR_RADIOBUTTON, // in xxx_FILTERBAR section
		FILTERBAR_RADIOBUTTON_LABEL, // in xxx_FILTERBAR section
		FILTERBAR_CHECKBOX, // in xxx_FILTERBAR section
		FILTERBAR_CHECKBOX_LABEL, // in xxx_FILTERBAR section
		FILTERBAR_CHECKBOX_COUNTER_LABEL, // in xxx_FILTERBAR section
		FILTERBAR_RADIOBUTTON_COUNTER_LABEL, // in xxx_FILTERBAR section
		RESULTS_COUNTER, // in xxx_FILTERBAR section
		
		PACKAGE_QUANTITY_FILTERBAR, // FILTERBAR section
		CLASS_FILTERBAR, // FILTERBAR section
		PRODUCT_TYPE_FILTERBAR, // FILTERBAR section
		FILTERBAR_HEADER, // in xxx_FILTERBAR section
		
		RESET_FILTER, // in xxx_FILTERBAR section
		
		PAGE_TITLE,
		
		PRODUCT, // in PRODUCT_LIST section
		PRODUCT_LIST, //section
		PRODUCT_LIST_LOADING_INDICATOR,
		PRODUCT_DESCRIPTION_BOLD, // in PRODUCT_LIST section
		PRODUCT_DESCRIPTION, // in PRODUCT_LIST section
		RESET_ALL_FILTERS_BUTTON,
		SHOW_ALL_BUTTON,
		COMPARED_PRODUCT_COUNT,
		COMPARE_LAYER,
		HIGHLIGHT_DIFFRENCIES_CHECKBOX,
		HIGHLIGHT_DIFFRENCIES_LABEL_CHECKBOX,
		COMPARISION_STICKY_ROW,
		COMPARISION_REMOVE_ALL,
		COMPARISION_COUNT,
		COMPARISION_REMOVE_PRODUCT,
		COMPARISON_ITEM,
		HIGHLIGHTED_DIFFRENCIES,
		CLOSE_BUTTON


	}
	
	public GridPage(){
		
		addField(FieldName.BREADCRUMBS, new Field(FieldType.DIV, By.xpath("//div[@class='m-breadcrumbs-col']")));
		addField(FieldName.COMPARE_CHECKBOX, new Field(FieldType.CHECKBOX, By.xpath(".//div[contains(@class, 'a-checkbox')]")));
		addField(FieldName.COMPARE_BUTTON_TOP, new Field(FieldType.BUTTON, By.xpath("(//button[contains(@class, 'js-compare-btn')])[1]")));
		addField(FieldName.COMPARE_BUTTON_BOTTOM, new Field(FieldType.BUTTON, By.xpath("(//button[contains(@class, 'js-compare-btn')])[2]")));
		addField(FieldName.DEFINE_YOUR_REQUIREMENTS, new Field(FieldType.DIV, By.xpath("//div[@class='m-filterbar-wrap']")));
		addField(FieldName.DISPLAYED_PRODUCTS_COUNTER, new Field(FieldType.TEXT, By.xpath("//span[contains(@class, 'prod-total')]")));
		addField(FieldName.FILTERBAR_RADIOBUTTON, new Field(FieldType.RADIO, By.xpath(".//div/input[@type='radio']")));
		addField(FieldName.FILTERBAR_RADIOBUTTON_LABEL, new Field(FieldType.TEXT, By.xpath(".//div/label")));
		addField(FieldName.FILTERBAR_CHECKBOX, new Field(FieldType.TEXT, By.xpath(".//input")));
		addField(FieldName.FILTERBAR_CHECKBOX_LABEL, new Field(FieldType.TEXT, By.xpath(".//div/label")));
		addField(FieldName.FILTERBAR_CHECKBOX_COUNTER_LABEL, new Field(FieldType.TEXT, By.xpath(".//div/label/span")));
		addField(FieldName.FILTERBAR_RADIOBUTTON_COUNTER_LABEL, new Field(FieldType.TEXT, By.xpath(".//div/label/span")));
		addField(FieldName.RESULTS_COUNTER, new Field(FieldType.TEXT, By.xpath(".//header")));
		addField(FieldName.PACKAGE_QUANTITY_FILTERBAR, new Field(FieldType.DIV, By.xpath("//div[@data-content='Package Quantity']/ancestor::div[2]")));
		addField(FieldName.CLASS_FILTERBAR, new Field(FieldType.DIV, By.xpath("//div[@data-content='Class']/ancestor::div[2]")));
		addField(FieldName.PRODUCT_TYPE_FILTERBAR, new Field(FieldType.DIV, By.xpath("//div[@data-content='Product type']/ancestor::div[2]")));
		addField(FieldName.FILTERBAR_HEADER, new Field(FieldType.DIV, By.xpath("./div")));
		addField(FieldName.RESET_FILTER, new Field(FieldType.DIV, By.xpath(".//span[contains(@class, 'js-filtertags-delete')]")));
		addField(FieldName.PAGE_TITLE, new Field(FieldType.DIV, By.xpath("//div/h1")));	
		addField(FieldName.PRODUCT, new Field(FieldType.DIV, By.xpath("./article")));		
		addField(FieldName.PRODUCT_LIST, new Field(FieldType.DIV, By.xpath("//div[contains(@class, 'prod-grid-list')]")));
		addField(FieldName.PRODUCT_LIST_LOADING_INDICATOR, new Field(FieldType.DIV, By.xpath("//div[contains(@class, 'preloader-fullpage') and not(contains(@class, 'is-hidden'))]")));
		addField(FieldName.PRODUCT_DESCRIPTION_BOLD, new Field(FieldType.DIV, By.xpath(".//div[contains(@class, 'description')]//div[@class='a-heading-h4']")));
		addField(FieldName.PRODUCT_DESCRIPTION, new Field(FieldType.DIV, By.xpath(".//div[contains(@class, 'description')]//div[2]")));
		addField(FieldName.RESET_ALL_FILTERS_BUTTON, new Field(FieldType.BUTTON, By.xpath("//span[contains(@class, 'filterbar-reset')]")));
		addField(FieldName.SHOW_ALL_BUTTON, new Field(FieldType.BUTTON, By.xpath("//a[contains(@class, 'js-showmore')]")));
		
		
		addField(FieldName.COMPARED_PRODUCT_COUNT, new Field(FieldType.TEXT, By.xpath("//header//span[@class='js-compare-counter']")));
		addField(FieldName.COMPARE_LAYER, new Field(FieldType.SECTION, By.xpath("//div[contains(@class,'m-compare js-compare')]")));

		addField(FieldName.HIGHLIGHT_DIFFRENCIES_CHECKBOX, new Field(FieldType.CHECKBOX, By.xpath(".//div[@id='highlights-field']/input")));
		addField(FieldName.HIGHLIGHT_DIFFRENCIES_LABEL_CHECKBOX, new Field(FieldType.CHECKBOX, By.xpath("//div[@id='highlights-field']//label")));
		addField(FieldName.COMPARISION_STICKY_ROW, new Field(FieldType.SECTION, By.xpath("//div[@class='m-compare-head js-compare-sticky-head sticky-state']")));
		addField(FieldName.COMPARISION_REMOVE_ALL, new Field(FieldType.BUTTON, By.xpath(".//span[contains(@class,'a-link--reset')]")));
		addField(FieldName.COMPARISION_COUNT, new Field(FieldType.TEXT, By.xpath(".//span[@class='js-count--compare-products']")));
		addField(FieldName.COMPARISION_REMOVE_PRODUCT, new Field(FieldType.BUTTON, By.xpath(".//span[contains(@class,'js-remove-item')]")));
		addField(FieldName.COMPARISON_ITEM, new Field(FieldType.SECTION, By.xpath(".//article[@class='m-grid-item  js-compare-product']")));
		addField(FieldName.HIGHLIGHTED_DIFFRENCIES, new Field(FieldType.SECTION, By.xpath("//div[contains(@class,'highlight-differences')]")));
		addField(FieldName.CLOSE_BUTTON, new Field(FieldType.BUTTON, By.xpath("//span[contains(@class,'featherlight-close')]")));

		
	}
}