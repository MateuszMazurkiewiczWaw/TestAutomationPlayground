package com.hilti.tahilti.pages.WebshopPages;

import org.openqa.selenium.By;

import com.hilti.utils.*;

public class SearchResultsPage extends Page{

	public enum FieldName implements Storable {
		
		SEARCH_RESULTS_LIST,
		FOUND_PRODUCTS,
		SHOW_ALL_BUTTON,
		SEARCH_RESULTS_HEADER,
		SEARCH_RESULTS_MAIN_BAR,
		SEARCH_RESULTS_DEFINE_YOUR_REQUIREMENTS,
		PRODUCTS_CATEGORY_LINK,
		VIDEOS_CATEGORY_LINK,
		FIRESTOP_SYSTEM_DETAILS_CATEGORY_LINK,
		EDITORIALS_CATEGORY_LINK,
		TECHNICAL_DOCUMENTS_CATEGORY_LINK,
		DEFINE_YOUR_REQUIREMENTS_TEXTFIELD,
		SEARCH_BUTTON,
		CHAPTER_DROPDOWN_BUTTON,
		SUBCHAPTER_DROPDOWN_BUTTON,
		CHAPTER_ANCHOR_SYSTEMS_RADIOBUTTON,
		SUBCHAPTER_INJECTABLE_ADHESIVE_ANCHORS_RADIOBUTTON,
		BASE_MATERIALS_DROPDOWN_BUTTON,
		CONCRETE_CRACKED_CHECKBOX,
		CLEANING_PROCEDURES_DROPDOWN_BUTTON,
		COMPRESSED_AIR_CLEANING_CHECKBOX,
		APPROVALS_DROPDOWN_BUTTON,
		ICC_REPORT_CHECKBOX,
		FIRST_PRODUCT_TILE_LINK,
		DOCUMENTS_LIST,
		DOCUMENTS_POSITION,
		DOCUMENTS_DOWNLOAD_LINK,
		SHOW_ALL_LINK,
		JOINT_RADIOBUTTON,
		FIRESTOPS_LIST,
		CREATE_SUBMITTAL_BUTTON,
		PENETRATION_RADIOBUTTON,
		FILTER_DROPDOWNS,
		EDITORIALS_LIST,
		EDITORIAL_POSITION,
		EDITORIAL_READ_MORE_LINK,
		RELATED_PRODUCTS_OVERLAY,
		CLOSE_OVERLAY_BUTTON,
		VIDEOS_LIST,
		LANGUAGE_DROPDOWN_LIST_BUTTON,
		ENGLISH_LANGUAGE_CHECKBOX,
		PRODUCT_TYPE_DROPDOWN_BUTTON,
		PRODUCT_GROUP_DROPDOWN_BUTTON,
		EXPANSION_ANCHORS_CHECKBOX,
		DESCRIPTION_FIELD,
		ALERT_MESSAGE_BOX,
		SEARCH_LIST_HEADER,
		FIRESTOP_AND_DOCUMENTS_SEARCH_LIST_HEADER,
		FIRESTOP_AND_DOCUMENTS_SEARCH_RESULTS_LIST,
		COMPARISION_REMOVE_ALL,
		COMPARISION_REMOVE_PRODUCT,
		COMPARISON_ITEM,
		HIGHLIGHT_DIFFRENCIES_LABEL_CHECKBOX,
		HIGHLIGHT_DIFFRENCIES_CHECKBOX,
		COMPARE_LAYER,
		COMPARE_BUTTON_BOTTOM,
		COMPARE_BUTTON_TOP,
		COMPARED_PRODUCT_COUNT,
		PRODUCT_LIST,
		COMPARE_CHECKBOX,
		HIGHLIGHTED_DIFFRENCIES,
		CLOSE_BUTTON,
		FILTER_LIST,
		FILTER_LIST_POSITION,
		FILTER_LIST_POSITION_DELETE_BUTTON,
		FILTER_SELECTION_FIRST_LIST,
		FILTER_SELECTION_SECOND_LIST,
		FILTER_SELECTION_THIRD_LIST,
		FILTER_SELECTION_FOURTH_LIST,
		FILTER_SELECTION_FIFTH_LIST,
		FILTER_SELECTION_LIST_CHECKBOX,
		FILTER_SELECTION_LIST_RADIOBUTTON,
		FILTER_DROPDOWN_SELECTION_LIST,
		FILTER_DROPDOWN_SELECTION_BUTTON,
		MAIN_CHAPTER_PRODUCTS_SELECTION_RADIOBUTTON,
		MAIN_CHAPTER_DOCUMENTS_SELECTION_RADIOBUTTON,
		FILTER_SYSTEM_TYPE_SELECTION_LIST,
		RESET_ALL_FILTERS_BUTTON,
		PRODUCT_GROUP_FILTER,
		PRODUCT_TYPE_FILTER,
		LANGUAGE_FILTER,
		DELETE_LANGUAGE_FILTER_BUTTON
	}
	
	public SearchResultsPage(){
		
		addField(FieldName.SEARCH_RESULTS_LIST, new Field(FieldType.SECTION, By.xpath("//div[@class='o-prod-grid-outer']")));
		addField(FieldName.FOUND_PRODUCTS, new Field(FieldType.DIV, By.xpath("//article[not(contains(@class, 'is-hidden'))]")));
		addField(FieldName.SHOW_ALL_BUTTON, new Field(FieldType.BUTTON, By.xpath("//a[contains(@class, 'showmore')]")));
		addField(FieldName.SEARCH_RESULTS_HEADER, new Field(FieldType.DIV, By.xpath("//div[@class='a-heading-h1']")));
		addField(FieldName.SEARCH_RESULTS_MAIN_BAR, new Field(FieldType.SECTION, By.xpath("//div[@id='search-results-navigation']")));
		addField(FieldName.SEARCH_RESULTS_DEFINE_YOUR_REQUIREMENTS, new Field(FieldType.SECTION, By.xpath("//div[@class='m-filterbar2-inner']")));
		addField(FieldName.PRODUCTS_CATEGORY_LINK, new Field(FieldType.LINK, By.xpath(".//a[contains(@class, 'is-first')]")));
		addField(FieldName.VIDEOS_CATEGORY_LINK, new Field(FieldType.LINK, By.xpath(".//a[@data-tabs-trigger-filterbar-url='/videos/videos-tab']")));
		addField(FieldName.TECHNICAL_DOCUMENTS_CATEGORY_LINK, new Field(FieldType.LINK, By.xpath(".//a[@data-track-action='technical-documents']")));
		addField(FieldName.EDITORIALS_CATEGORY_LINK, new Field(FieldType.LINK, By.xpath(".//a[@data-tabs-trigger-filterbar-url='/editorial-search']")));
		addField(FieldName.FIRESTOP_SYSTEM_DETAILS_CATEGORY_LINK, new Field(FieldType.LINK, By.xpath("//a[@data-tabs-trigger-filterbar-url='/firestops/firestops-tab']")));
		addField(FieldName.DEFINE_YOUR_REQUIREMENTS_TEXTFIELD, new Field(FieldType.TEXT, By.xpath(".//input[@id='filterbar_search_input']")));
		addField(FieldName.SEARCH_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//button[@id='filterbar_search_submit']")));
		addField(FieldName.MAIN_CHAPTER_PRODUCTS_SELECTION_RADIOBUTTON, new Field(FieldType.RADIO, By.xpath("//input[@type='radio']/ancestor::div[@id='search_results_filterbar_0_0-div']")));
		addField(FieldName.MAIN_CHAPTER_DOCUMENTS_SELECTION_RADIOBUTTON, new Field(FieldType.RADIO, By.xpath("//input[@type='radio']/ancestor::div[@id='search_results_filterbar_documentChapter_0-div']")));
		addField(FieldName.CHAPTER_ANCHOR_SYSTEMS_RADIOBUTTON, new Field(FieldType.RADIO, By.xpath("//div[@id='search_results_filterbar_0_0-div']")));
		addField(FieldName.FILTER_LIST, new Field(FieldType.LIST, By.xpath("//div[contains(@class, 'm-filtertags js-filtertags')]")));
		addField(FieldName.FILTER_LIST_POSITION, new Field(FieldType.DIV, By.xpath(".//section[contains(@class, 'm-filtertags-group')]")));
		addField(FieldName.FILTER_LIST_POSITION_DELETE_BUTTON, new Field(FieldType.DIV, By.xpath(".//span[contains(@class, 'm-filtertags-delete')]")));
		addField(FieldName.SUBCHAPTER_DROPDOWN_BUTTON, new Field(FieldType.BUTTON, By.xpath("//div[contains(@data-content, 'Subchapter')]")));
		addField(FieldName.SUBCHAPTER_INJECTABLE_ADHESIVE_ANCHORS_RADIOBUTTON, new Field(FieldType.RADIO, By.xpath("//label[@for='search_results_filterbar_1_0']")));
		addField(FieldName.BASE_MATERIALS_DROPDOWN_BUTTON, new Field(FieldType.BUTTON, By.xpath("//div[contains(@data-content, 'Base materials')]")));
		addField(FieldName.CONCRETE_CRACKED_CHECKBOX, new Field(FieldType.CHECKBOX, By.xpath("//div[@class='a-checkbox']//label[@data-track-label='Concrete (cracked)']")));
		addField(FieldName.CLEANING_PROCEDURES_DROPDOWN_BUTTON, new Field(FieldType.BUTTON, By.xpath("//div[contains(@data-content, 'Cleaning procedures')]")));
		addField(FieldName.COMPRESSED_AIR_CLEANING_CHECKBOX, new Field(FieldType.CHECKBOX, By.xpath("//div[@class='a-checkbox']//label[@data-track-label='Compressed-air cleaning']")));
		addField(FieldName.APPROVALS_DROPDOWN_BUTTON, new Field(FieldType.BUTTON, By.xpath("//div[contains(@data-content, 'Approvals')]")));
		addField(FieldName.ICC_REPORT_CHECKBOX, new Field(FieldType.CHECKBOX, By.xpath("//div[@class='a-checkbox']//label[@data-track-label='ICC-ES report (concrete)']")));
		addField(FieldName.FIRST_PRODUCT_TILE_LINK, new Field(FieldType.LINK, By.xpath("//a[@class='m-grid-item--link']")));
		addField(FieldName.DOCUMENTS_LIST, new Field(FieldType.LIST, By.xpath("//ul[@class='m-library-items js-showmore-items-wrapper']")));
		addField(FieldName.DOCUMENTS_POSITION, new Field(FieldType.LIST, By.xpath(".//li[@class='m-library-item js-showmore-library-item']")));
		addField(FieldName.DOCUMENTS_DOWNLOAD_LINK, new Field(FieldType.LINK, By.xpath(".//a[@class='a-link a-link--large a-link-download']")));
		addField(FieldName.SHOW_ALL_LINK, new Field(FieldType.LINK, By.xpath(".//div[contains(@class, 'm-library-item-text')]//a[@class='a-link--arrow-after']")));
		addField(FieldName.RELATED_PRODUCTS_OVERLAY, new Field(FieldType.SECTION, By.xpath("//div[@class='featherlight-content']")));
		addField(FieldName.CLOSE_OVERLAY_BUTTON, new Field(FieldType.BUTTON, By.xpath("//span[contains(@class, 'featherlight-close')]")));
		addField(FieldName.VIDEOS_LIST, new Field(FieldType.SECTION, By.xpath("//div[contains(@class, 'o-prod-grid--list-wrap')]")));
		addField(FieldName.LANGUAGE_DROPDOWN_LIST_BUTTON, new Field(FieldType.BUTTON, By.xpath("//div[contains(@data-content, 'Language')]//div[@class='a-button-select-inner']")));
		addField(FieldName.PRODUCT_GROUP_DROPDOWN_BUTTON, new Field(FieldType.BUTTON, By.xpath("//div[contains(@data-content, 'Product group')]//div[@class='a-button-select-inner']")));
		addField(FieldName.PRODUCT_TYPE_DROPDOWN_BUTTON, new Field(FieldType.BUTTON, By.xpath("//div[contains(@data-content, 'Product type')]//div[@class='a-button-select-inner']")));
		addField(FieldName.DESCRIPTION_FIELD, new Field(FieldType.DIV, By.xpath(".//div[contains(@class, 'm-library-item-text')]")));
		addField(FieldName.JOINT_RADIOBUTTON, new Field(FieldType.RADIO, By.xpath("//div[@id='search_results_filterbar_systemType_0-div']")));
		addField(FieldName.FIRESTOPS_LIST, new Field(FieldType.SECTION, By.xpath("//ul[@class='m-library-items js-showmore-items-wrapper']")));
		addField(FieldName.CREATE_SUBMITTAL_BUTTON, new Field(FieldType.BUTTON, By.xpath("//a[@href='/firestops/builder']")));
		addField(FieldName.PENETRATION_RADIOBUTTON, new Field(FieldType.RADIO, By.xpath("//div[@id='search_results_filterbar_systemType_1-div']")));
		addField(FieldName.FILTER_DROPDOWNS, new Field(FieldType.SECTION, By.xpath("//div[contains(@class, 'm-filterbar2-main')]")));
		addField(FieldName.EDITORIALS_LIST, new Field(FieldType.LIST, By.xpath("//ul[contains(@class, 'm-library-items')]")));
		addField(FieldName.EDITORIAL_POSITION, new Field(FieldType.LIST, By.xpath(".//li[contains(@class, 'm-library-item')]")));
		addField(FieldName.EDITORIAL_READ_MORE_LINK, new Field(FieldType.LINK, By.xpath(".//a[contains(@class, 'm-library-item-blocklink')]")));
		addField(FieldName.ENGLISH_LANGUAGE_CHECKBOX, new Field(FieldType.CHECKBOX, By.xpath("//input[contains(@value, 'English')]/ancestor::div[@class='a-checkbox']")));
		addField(FieldName.EXPANSION_ANCHORS_CHECKBOX, new Field(FieldType.CHECKBOX, By.xpath("//input[contains(@value, 'Expansion')]/ancestor::div[@class='a-checkbox']")));
		addField(FieldName.ALERT_MESSAGE_BOX, new Field(FieldType.TEXT, By.xpath("//div[@id='noProductsAlertMessage']")));
		addField(FieldName.SEARCH_LIST_HEADER, new Field(FieldType.TEXT, By.xpath(".//div[@class='o-prod-grid--header-title']")));
		addField(FieldName.FIRESTOP_AND_DOCUMENTS_SEARCH_LIST_HEADER, new Field(FieldType.TEXT, By.xpath(".//span[@class='js-prod-total']/ancestor::div[contains(@class, 'heading')]")));
		addField(FieldName.FIRESTOP_AND_DOCUMENTS_SEARCH_RESULTS_LIST, new Field(FieldType.SECTION, By.xpath("//div[contains(@class, 'js-filtered-content')]")));
		addField(FieldName.COMPARE_CHECKBOX, new Field(FieldType.CHECKBOX, By.xpath(".//div[contains(@class, 'a-checkbox')]")));
		addField(FieldName.PRODUCT_LIST, new Field(FieldType.DIV, By.xpath("//div[contains(@class, 'prod-grid-list')]")));
		addField(FieldName.COMPARED_PRODUCT_COUNT, new Field(FieldType.TEXT, By.xpath("//header//span[@class='js-compare-counter']")));
		addField(FieldName.COMPARE_BUTTON_TOP, new Field(FieldType.BUTTON, By.xpath("(//button[contains(@class, 'js-compare-btn')])[1]")));
		addField(FieldName.COMPARE_BUTTON_BOTTOM, new Field(FieldType.BUTTON, By.xpath("(//button[contains(@class, 'js-compare-btn')])[2]")));
		addField(FieldName.COMPARE_LAYER, new Field(FieldType.SECTION, By.xpath("//div[contains(@class,'m-compare js-compare')]")));
		addField(FieldName.HIGHLIGHT_DIFFRENCIES_CHECKBOX, new Field(FieldType.CHECKBOX, By.xpath(".//div[@id='highlights-field']/input")));
		addField(FieldName.HIGHLIGHT_DIFFRENCIES_LABEL_CHECKBOX, new Field(FieldType.CHECKBOX, By.xpath("//div[@id='highlights-field']//label")));
		addField(FieldName.COMPARISON_ITEM, new Field(FieldType.SECTION, By.xpath(".//article[@class='m-grid-item  js-compare-product']")));
		addField(FieldName.COMPARISION_REMOVE_PRODUCT, new Field(FieldType.BUTTON, By.xpath(".//span[contains(@class,'js-remove-item')]")));
		addField(FieldName.COMPARISION_REMOVE_ALL, new Field(FieldType.BUTTON, By.xpath(".//span[contains(@class,'a-link--reset')]")));
		addField(FieldName.HIGHLIGHTED_DIFFRENCIES, new Field(FieldType.SECTION, By.xpath("//div[contains(@class,'highlight-differences')]")));
		addField(FieldName.CLOSE_BUTTON, new Field(FieldType.BUTTON, By.xpath("//span[contains(@class,'featherlight-close')]")));
		addField(FieldName.FILTER_SELECTION_LIST_RADIOBUTTON, new Field(FieldType.RADIO, By.xpath(".//div[contains(@id, 'search_results_filterbar')]")));
		addField(FieldName.FILTER_SELECTION_LIST_CHECKBOX, new Field(FieldType.CHECKBOX, By.xpath(".//div[contains(@id, 'search_results_filterbar')]")));
		addField(FieldName.FILTER_SELECTION_FIRST_LIST, new Field(FieldType.LIST, By.xpath("(//div[contains(@id, 'search_results_filterbar')]/ancestor::div[contains(@class, 'm-filterbar-fields m-filterbar-dropdown-list')])[1]")));
		addField(FieldName.FILTER_SELECTION_SECOND_LIST, new Field(FieldType.LIST, By.xpath("(//div[contains(@id, 'search_results_filterbar')]/ancestor::div[contains(@class, 'm-filterbar-fields m-filterbar-dropdown-list')])[2]")));
		addField(FieldName.FILTER_SELECTION_THIRD_LIST, new Field(FieldType.LIST, By.xpath("(//div[contains(@id, 'search_results_filterbar')]/ancestor::div[contains(@class, 'm-filterbar-fields m-filterbar-dropdown-list')])[3]")));
		addField(FieldName.FILTER_SELECTION_FOURTH_LIST, new Field(FieldType.LIST, By.xpath("(//div[contains(@id, 'search_results_filterbar')]/ancestor::div[contains(@class, 'm-filterbar-fields m-filterbar-dropdown-list')])[4]")));
		addField(FieldName.FILTER_SELECTION_FIFTH_LIST, new Field(FieldType.LIST, By.xpath("(//div[contains(@id, 'search_results_filterbar')]/ancestor::div[contains(@class, 'm-filterbar-fields m-filterbar-dropdown-list')])[5]")));
		addField(FieldName.FILTER_DROPDOWN_SELECTION_LIST, new Field(FieldType.LIST, By.xpath("//div[contains(@class, 'js-filterbar-group--select')]")));
		addField(FieldName.FILTER_DROPDOWN_SELECTION_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//div[@class='m-filterbar-dropdown js-dropdown']")));
		addField(FieldName.FILTER_SYSTEM_TYPE_SELECTION_LIST, new Field(FieldType.LIST, By.xpath("//div[contains(@class, 'js-filterbar-main')]")));
		addField(FieldName.RESET_ALL_FILTERS_BUTTON, new Field(FieldType.BUTTON, By.xpath("//div[@class='m-filterbar2-inner']//span[contains(@class, 'a-link--reset')]")));
        addField(FieldName.PRODUCT_GROUP_FILTER, new Field(FieldType.DIV, By.xpath("//span[contains(@data-target-name, 'documentChapter')]/ancestor::section[contains(@class, 'm-filtertags-group')]")));
        addField(FieldName.PRODUCT_TYPE_FILTER, new Field(FieldType.DIV, By.xpath("//span[contains(@data-target-name, 'documentSubChapter')]/ancestor::section[contains(@class, 'm-filtertags-group')]")));
        addField(FieldName.LANGUAGE_FILTER, new Field(FieldType.DIV, By.xpath("//span[contains(@data-target-name, 'language')]/ancestor::section[contains(@class, 'm-filtertags-group')]")));
        addField(FieldName.DELETE_LANGUAGE_FILTER_BUTTON, new Field(FieldType.BUTTON, By.xpath("//span[contains(@data-target-name, 'languages')]")));
	}
}
