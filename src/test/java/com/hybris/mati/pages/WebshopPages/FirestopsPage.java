package com.hybris.mati.pages.WebshopPages;

import org.openqa.selenium.By;

import com.hybris.utils.*;

public class FirestopsPage extends Page{

	public enum FieldName implements Storable {	

		CREATE_SUBMITTAL_1ST_STEP_HEADER,
		JOINT_RADIOBUTTON,
		CREATE_SUBMITTAL_BUTTON,
		DEFINE_YOUR_REQUIREMENTS,
		GENERATE_SUBMITTAL_NOTE,
		PENETRATION_RADIOBUTTON,
		DEFINE_YOUR_REQUIREMENTS_TEXTFIELD,
		DEFINE_YOUR_REQUIREMENTS_SEARCH_BUTTON,
		SEARCH_FILTERS_AND_RADIOBUTTONS,
		RESET_ALL_FILTERS_BUTTON,
		PENETRATING_ITEM_FILTER_BUTTON,
		PENETRATING_ITEM_LIST,
		LIST_POSITION,
		F_RATING_FILTER_BUTTON,
		APPLICATION_METHOD_FILTER_BUTTON,
		APPLICATION_METHOD_LIST,
		SEISMIC_PERFORMANCE_FILTER_BUTTON,
		SEISMIC_PERFORMANCE_LIST,
		T_RATING_FILTER_BUTTON,
		T_RATING_FILTER_LIST,
		TRADE_FILTER_BUTTON,
		TRADE_LIST,
		SYSTEM_TYPE_FILTER,
		PENETRATING_ITEM_FILTER,
		F_RATING_FILTER,
		SEISMIC_PERFORMANCE_FILTER,
		T_RATING_FILTER,
		TRADE_FILTER,
		APPLICATION_METHOD_FILTER,
		DELETE_TRADE_FILTER_BUTTON,
		DELETE_T_RATING_FILTER_BUTTON,
		DELETE_SEISMIC_PERFORMANCE_FILTER_BUTTON,
		DELETE_APPLICATION_METHOD_FILTER_BUTTON,
		DELETE_F_RATING_FILTER_BUTTON,
		DELETE_PENETRATING_ITEM_FILTER_BUTTON,
		DELETE_SYSTEM_TYPE_FILTER_BUTTON,
		MINATURE_IMAGES,
		DOWNLOAD_LINK,
		SHOW_ALL_LINK,
		DESCRIPTION_FIELD,
		FIRESTOPS_TABLE_POSITION_CHECKBOX,
		CLOSE_OVERLAY_BUTTON,
		RELATED_PRODUCTS_OVERLAY,
		FIRESTOPS_LIST_POSITION,
		ITEM_CHECKBOX,
		FIRESTOPS_MAIN_LIST,
		F_RATING_LIST,
		FIRESTOPS_LIST
	}
	
	public FirestopsPage(){
	
		addField(FieldName.CREATE_SUBMITTAL_1ST_STEP_HEADER, new Field(FieldType.TEXT, By.xpath("//div[contains(@class, 'a-heading-h2 a-spacing-pb--s')]")));
		addField(FieldName.JOINT_RADIOBUTTON, new Field(FieldType.RADIO, By.xpath("//div[contains(@id, 'search_results_filterbar_systemType_0-div')]")));
		addField(FieldName.CREATE_SUBMITTAL_BUTTON, new Field(FieldType.BUTTON, By.xpath("//a[contains(@href, '/firestops/builder')]")));
		addField(FieldName.DEFINE_YOUR_REQUIREMENTS, new Field(FieldType.SECTION, By.xpath("//div[@class='m-filterbar2-inner']")));
		addField(FieldName.GENERATE_SUBMITTAL_NOTE, new Field(FieldType.DIV, By.xpath("//div[contains(@class, 'm-message--centered')]")));
		addField(FieldName.PENETRATION_RADIOBUTTON, new Field(FieldType.RADIO, By.xpath("//div[contains(@id, 'search_results_filterbar_systemType_1')]")));
		addField(FieldName.DEFINE_YOUR_REQUIREMENTS_TEXTFIELD, new Field(FieldType.TEXT, By.xpath(".//input[contains(@id, 'filterbar_search_input')]")));
		addField(FieldName.DEFINE_YOUR_REQUIREMENTS_SEARCH_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//button[contains(@id, 'filterbar_search_submit')]")));
		addField(FieldName.SEARCH_FILTERS_AND_RADIOBUTTONS, new Field(FieldType.SECTION, By.xpath("//div[contains(@class, 'm-filterbar2-group')]/ancestor::div[contains(@class, 'm-filterbar2-main js-filterbar-main')]")));
		addField(FieldName.RESET_ALL_FILTERS_BUTTON, new Field(FieldType.BUTTON, By.xpath("//span[contains(@class, 'a-link--reset')]")));
		addField(FieldName.PENETRATING_ITEM_FILTER_BUTTON, new Field(FieldType.BUTTON, By.xpath("//div[contains(@id, 'PENETRATING')]/child::a[contains(@class, 'chosen-single')]")));
		addField(FieldName.PENETRATING_ITEM_LIST, new Field(FieldType.LIST, By.xpath("//div[contains(@id, 'PENETRATING')]/descendant::ul[contains(@class, 'chosen-results')]")));
		addField(FieldName.LIST_POSITION, new Field(FieldType.LIST, By.xpath(".//li[contains(@class, 'active-result')]")));
		addField(FieldName.F_RATING_FILTER_BUTTON, new Field(FieldType.BUTTON, By.xpath("//div[contains(@id, 'F_RATING')]/child::a[contains(@class, 'chosen-single')]")));
		addField(FieldName.APPLICATION_METHOD_FILTER_BUTTON, new Field(FieldType.BUTTON, By.xpath("//div[contains(@id, 'APPLICATION')]/child::a[contains(@class, 'chosen-single')]")));
		addField(FieldName.F_RATING_LIST, new Field(FieldType.LIST, By.xpath("//div[contains(@id, 'F_RATING')]/descendant::ul[contains(@class, 'chosen-results')]")));
		addField(FieldName.APPLICATION_METHOD_LIST, new Field(FieldType.LIST, By.xpath("//div[contains(@id, 'APPLICATION')]/descendant::ul[contains(@class, 'chosen-results')]")));
		addField(FieldName.SEISMIC_PERFORMANCE_FILTER_BUTTON, new Field(FieldType.BUTTON, By.xpath("//div[contains(@id, 'SEISMIC')]/child::a[contains(@class, 'chosen-single')]")));
		addField(FieldName.SEISMIC_PERFORMANCE_LIST, new Field(FieldType.LIST, By.xpath("//div[contains(@id, 'SEISMIC')]/descendant::ul[contains(@class, 'chosen-results')]")));
		addField(FieldName.T_RATING_FILTER_BUTTON, new Field(FieldType.BUTTON, By.xpath("//a[contains(@class, 'chosen-single')]/ancestor::div[contains(@id, 'T_RATING')]")));
		addField(FieldName.T_RATING_FILTER_LIST, new Field(FieldType.LIST, By.xpath("//div[contains(@id, 'T_RATING')]/descendant::ul[contains(@class, 'chosen-results')]")));
		addField(FieldName.TRADE_FILTER_BUTTON, new Field(FieldType.BUTTON, By.xpath("//a[contains(@class, 'chosen-single')]/ancestor::div[contains(@id, 'TRADE')]")));
		addField(FieldName.TRADE_LIST, new Field(FieldType.LIST, By.xpath("//div[contains(@id, 'TRADE')]/descendant::ul[contains(@class, 'chosen-results')]")));
		addField(FieldName.SYSTEM_TYPE_FILTER, new Field(FieldType.DIV, By.xpath("//span[contains(@data-target-name, 'systemType')]/ancestor::section[contains(@class, 'm-filtertags-group')]")));
		addField(FieldName.PENETRATING_ITEM_FILTER, new Field(FieldType.DIV, By.xpath("//span[contains(@data-target-name, 'PENETRATING')]/ancestor::section[contains(@class, 'm-filtertags-group')]")));
		addField(FieldName.F_RATING_FILTER, new Field(FieldType.DIV, By.xpath("//span[contains(@data-target-name, 'F_RATING')]/ancestor::section[contains(@class, 'm-filtertags-group')]")));
		addField(FieldName.SEISMIC_PERFORMANCE_FILTER, new Field(FieldType.DIV, By.xpath("//span[contains(@data-target-name, 'SEISMIC')]/ancestor::section[contains(@class, 'm-filtertags-group')]")));
		addField(FieldName.T_RATING_FILTER, new Field(FieldType.DIV, By.xpath("//span[contains(@data-target-name, 'T_RATING')]/ancestor::section[contains(@class, 'm-filtertags-group')]")));
		addField(FieldName.TRADE_FILTER, new Field(FieldType.DIV, By.xpath("//span[contains(@data-target-name, 'TRADE')]/ancestor::section[contains(@class, 'm-filtertags-group')]")));
		addField(FieldName.APPLICATION_METHOD_FILTER, new Field(FieldType.DIV, By.xpath("//span[contains(@data-target-name, 'APPLICATION')]/ancestor::section[contains(@class, 'm-filtertags-group')]")));
		addField(FieldName.DELETE_TRADE_FILTER_BUTTON, new Field(FieldType.BUTTON, By.xpath("//span[contains(@data-target-name, 'TRADE')]")));
		addField(FieldName.DELETE_T_RATING_FILTER_BUTTON, new Field(FieldType.BUTTON, By.xpath("//span[contains(@data-target-name, 'T_RATING')]")));
		addField(FieldName.DELETE_SEISMIC_PERFORMANCE_FILTER_BUTTON, new Field(FieldType.BUTTON, By.xpath("//span[contains(@data-target-name, 'SEISMIC')]")));
		addField(FieldName.DELETE_APPLICATION_METHOD_FILTER_BUTTON, new Field(FieldType.BUTTON, By.xpath("//span[contains(@data-target-name, 'APPLICATION')]")));
		addField(FieldName.DELETE_F_RATING_FILTER_BUTTON, new Field(FieldType.BUTTON, By.xpath("//span[contains(@data-target-name, 'F_RATING')]")));
		addField(FieldName.DELETE_PENETRATING_ITEM_FILTER_BUTTON, new Field(FieldType.BUTTON, By.xpath("//span[contains(@data-target-name, 'PENETRATING')]")));
		addField(FieldName.DELETE_SYSTEM_TYPE_FILTER_BUTTON, new Field(FieldType.BUTTON, By.xpath("//span[contains(@data-target-name, 'systemType')]")));
		addField(FieldName.MINATURE_IMAGES, new Field(FieldType.IMAGE, By.xpath("//ul[contains(@class, 'm-library-icons')]")));
		addField(FieldName.DOWNLOAD_LINK, new Field(FieldType.LINK, By.xpath(".//a[contains(@class, 'a-link-download')]")));
		addField(FieldName.SHOW_ALL_LINK, new Field(FieldType.LINK, By.xpath(".//div[contains(@class, 'm-library-item-text')]/descendant::a[contains(@class, 'a-link--arrow-after')]")));
		addField(FieldName.DESCRIPTION_FIELD, new Field(FieldType.DIV, By.xpath(".//div[contains(@class, 'm-library-item-text')]")));
		addField(FieldName.FIRESTOPS_TABLE_POSITION_CHECKBOX, new Field(FieldType.CHECKBOX, By.xpath("//div[contains(@class, 'a-checkbox')]")));
		addField(FieldName.CLOSE_OVERLAY_BUTTON, new Field(FieldType.BUTTON, By.xpath("//span[contains(@class, 'featherlight-close')]")));
		addField(FieldName.RELATED_PRODUCTS_OVERLAY, new Field(FieldType.SECTION, By.xpath("//div[contains(@class, 'featherlight-content')]")));
		addField(FieldName.FIRESTOPS_LIST_POSITION, new Field(FieldType.SECTION, By.xpath(".//li[contains(@class, 'm-library-item')]")));
		addField(FieldName.FIRESTOPS_MAIN_LIST, new Field(FieldType.SECTION, By.xpath("//ul[contains(@class, 'm-library-items js-showmore-items-wrapper')]")));
		addField(FieldName.ITEM_CHECKBOX, new Field(FieldType.DIV, By.xpath(".//li//div[@class='a-checkbox']")));
		addField(FieldName.FIRESTOPS_LIST, new Field(FieldType.DIV, By.xpath("//div[contains(@class, 'm-library-list--firestop')]")));
	}
	
}