package com.hilti.tahilti.pages.WebshopPages;

import org.openqa.selenium.By;

import com.hilti.utils.*;

public class ItemPage extends Page{

	public enum FieldName implements Storable {
		
		PRODUCT_HEADER,
		RATINGS_LINK,
		SOCIAL_MEDIA_WIDGET,
		FLEET_RANGE_PAGE_BREAD_CRUMB_LINK,
		FLEET_GRID_PAGE_BREAD_CRUMB_LINK,
		PRODUCT_CATEGORY_1ST_LEVEL_BREAD_CRUMB_LINK,
		HOME_PAGE_BREAD_CRUMB_LINK,
		ITEM_IMAGE,
		PRODUCT_VARIANTS_AND_CART_WIDGET,
		BUY_RADIOBUTTON,
		FLEET_RADIOBUTTON,
		FLEET_CONTRACT_WARNING,
		FLEET_CONTRACT_LINK,
		ITEM_PIECES_TEXTFIELD,
		ADD_TO_CART_BUTTON,
		CART_ADDITION_POPUP,
		CHECK_AVAILABILITY_LINK,
		CHECK_AVAILABILITY_POPUP,
		CLOSE_POPUP_BUTTON,
		ADD_TO_FAVORITES_POPUP,
		ADD_TO_FAVORITES_LINK,
		ZOOM_IN_BUTTON,
		KEY_TECHNICAL_DATA,
		MORE_TECHNICAL_DATA_LINK,
		PACKAGE_CONTENTS,
		FEATURES_AND_APPLICATIONS,
		FEATURES_COLUMN,
		APPLICATIONS_COLUMN,
		RELATED_PRODUCTS,
		ALL_PRODUCTS_RADIOBUTTON,
		TOOLS_PRODUCTS_RADIOBUTTON,
		CONSUMABLES_PRODUCTS_RADIOBUTTON,
		SHOW_ALL_PRODUCTS_BUTTON,
		RELATED_PRODUCTS_LIST,
		TECHNICAL_DATA_TABLE,
		DOCUMENTS,
		APPROVAL_DOCUMENT_BUTTON,
		APPROVAL_DOCUMENT_PDF_LINK,
		CONSULTING_AND_SUPPORT,
		CONSULTING_AND_SUPPORT_PLACEHOLDER,
		REQUEST_LIVE_DEMO_BUTTON,
		START_LIVE_CHAT_BUTTON,
		REQUEST_CALLBACK_BUTTON,
		RATINGS_AND_REVIEWS,
		ALERT_MESSAGE_BOX,
		LOG_OUT_LINK,
		PRODUCT_REVIEWS_DISCLAIMER,
		ITEM_PAGE_FOOTER,
		UP_ARROW_BAR_MENU_BUTTON,
		TECHNICAL_DATA_LINK,
		CONSULTING_AND_SUPPORT_LINK,
		RATINGS_AND_REVIEWS_LINK,
		CLOSE_SIDE_BAR_BUTTON,
		CART_BAR_WRAPPER,
		CART_BAR_PRODUCT_NAME,
		WIDGET_FLEET_RADIOBUTTON,
		WIDGET_BUY_RADIOBUTTON,
		CART_BAR_PRODUCT_PRICE,
		CART_BAR_CART_WIDGET,
		SIDE_BAR_CONTROLLER,
		EXPAND_BAR_MENU_BUTTON,
		DOWN_ARROW_BAR_MENU_BUTTON,
		SIDE_BAR_MENU,
		BASIC_INFORMATION_LINK,
		FEATURES_AND_APPLICATIONS_LINK,
		RELATED_PRODUCTS_LINK,
		DOCUMENTS_AND_VIDEOS_LINK,
		BASIC_INFORMATION,
		YEARLY_RADIOBUTTON,
		MONTHLY_RADIOBUTTON,
		STANDARD_RANGE_PAGE_BREAD_CRUMB_LINK,
		SEE_ALL_PRODUCTS_AND_PACKAGES_LINK,
		INSERTS_PRODUCTS_RADIOBUTTON,
		REQUEST_LIVE_DEMO_OVERLAY,
		CONTACT_OVERLAY,
		FLEET_CART_BAR_PRODUCT_PRICE,
		FAVORITE_LIST_FIRST_POSITION,
		FAVORITE_LIST_ADDITION,
		CLOSE_FAVORITE_LIST_POPUP_BUTTON,
		CREATE_NEW_LIST_TEXTFIELD,
		SUBMIT_CREATE_NEW_LIST_BUTTON,
		CREATE_NEW_LIST_BUTTON,
		YOUR_EMAIL_ADDRESS_TEXTFIELD,
		YOUR_PHONE_NUMBER_TEXTFIELD,
		REQUEST_DEMO_BUTTON,
		SUCCESS_MESSAGE_BOX,
		CANCEL_BUTTON,
		RANGE_AND_ITEM_PAGE_LOADING_INDICATOR,
		BREADCRUMB_LIST,
		BREADCRUMB_LIST_POSITION,
	}
	
	public ItemPage(){
		
		addField(FieldName.PRODUCT_HEADER, new Field(FieldType.DIV, By.xpath("(//div[@class='container-fluid'])[2]")));
		addField(FieldName.RATINGS_LINK, new Field(FieldType.LINK, By.xpath(".//a[@href='#ratings-reviews']")));
		addField(FieldName.SOCIAL_MEDIA_WIDGET, new Field(FieldType.LINK, By.xpath(".//a[@class='a-link--share a-link-action tooltipstered']")));
		addField(FieldName.BASIC_INFORMATION, new Field(FieldType.IMAGE, By.xpath("//div[@id='basic-information']")));
		addField(FieldName.ITEM_IMAGE, new Field(FieldType.IMAGE, By.xpath("//div[@class='a-image-zoom']")));
		addField(FieldName.PRODUCT_VARIANTS_AND_CART_WIDGET, new Field(FieldType.SECTION, By.xpath("(//div[@id='product-variants'])[2]")));
		addField(FieldName.BUY_RADIOBUTTON, new Field(FieldType.RADIO, By.xpath(".//input[@id='radio-product-buy-1']/ancestor::div[contains(@class, 'js-radio-control')]")));
		addField(FieldName.FLEET_RADIOBUTTON, new Field(FieldType.RADIO, By.xpath(".//input[@id='radio-product-fleet-1']/ancestor::div[contains(@class, 'js-radio-control')]")));
		addField(FieldName.YEARLY_RADIOBUTTON, new Field(FieldType.RADIO, By.xpath(".//input[@id='radio-software-yearly-1']/ancestor::div[contains(@class, 'js-radio-control')]")));
		addField(FieldName.MONTHLY_RADIOBUTTON, new Field(FieldType.RADIO, By.xpath(".//input[@id='radio-software-monthly-1']/ancestor::div[contains(@class, 'js-radio-control')]")));
		addField(FieldName.FLEET_CONTRACT_WARNING, new Field(FieldType.TEXT, By.xpath(".//div[@class='m-message  m-message--tiny m-message--notify']")));
		addField(FieldName.FAVORITE_LIST_ADDITION, new Field(FieldType.TEXT, By.xpath("//div[contains(@class, 'm-add-favorite-create-notify')]")));
		addField(FieldName.FLEET_CONTRACT_LINK, new Field(FieldType.LINK, By.xpath("(//div[contains(@class, 'js-radio-control')]//a)[2]")));
		addField(FieldName.CLOSE_FAVORITE_LIST_POPUP_BUTTON, new Field(FieldType.BUTTON, By.xpath("//button[contains(@class, 'js-close-message')]")));
		addField(FieldName.CREATE_NEW_LIST_TEXTFIELD, new Field(FieldType.TEXT, By.xpath("//input[@id='createNewList']")));
		addField(FieldName.SUBMIT_CREATE_NEW_LIST_BUTTON, new Field(FieldType.BUTTON, By.xpath("//button[contains(@class, 'js-send-new-list')]")));
		addField(FieldName.CREATE_NEW_LIST_BUTTON, new Field(FieldType.BUTTON, By.xpath("//button[contains(@class, 'js-create-new-list')]")));
		addField(FieldName.ITEM_PIECES_TEXTFIELD, new Field(FieldType.TEXT, By.xpath("(//div[@id='basic-information']//input[@id='item-pieces'])[2]")));
		addField(FieldName.ADD_TO_CART_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//button[@class='a-button-primary js-add-to-cart']")));
		addField(FieldName.CART_ADDITION_POPUP, new Field(FieldType.SECTION, By.xpath("//div[@id='m-add-to-cart-layer']")));
		addField(FieldName.CONTACT_OVERLAY, new Field(FieldType.SECTION, By.xpath("//div[contains(@class, 'js-contact-modal')]")));
		addField(FieldName.REQUEST_LIVE_DEMO_OVERLAY, new Field(FieldType.SECTION, By.xpath("//div[contains(@class, 'js-product-requestdemo')]")));
		addField(FieldName.CHECK_AVAILABILITY_LINK, new Field(FieldType.LINK, By.xpath("(//a[contains(@class, 'a-icon-avaiability')])[2]")));
		addField(FieldName.CHECK_AVAILABILITY_POPUP, new Field(FieldType.SECTION, By.xpath("//div[contains(@id, 'overlay-storelocator-availability')]")));
		addField(FieldName.CLOSE_POPUP_BUTTON, new Field(FieldType.BUTTON, By.xpath("//span[contains(@class, 'featherlight-close')]")));
		addField(FieldName.ADD_TO_FAVORITES_POPUP, new Field(FieldType.SECTION, By.xpath("//div[contains(@class, 'js-favorite-wrap open')]")));
		addField(FieldName.FAVORITE_LIST_FIRST_POSITION, new Field(FieldType.LINK, By.xpath(".//a[@class='js-move-to-list']")));
		addField(FieldName.ADD_TO_FAVORITES_LINK, new Field(FieldType.LINK, By.xpath("(//a[contains(@class, 'js-show-add-favorite')])[2]")));
		addField(FieldName.SEE_ALL_PRODUCTS_AND_PACKAGES_LINK, new Field(FieldType.LINK, By.xpath("//a[contains(., '" + Tools.getEnvironmentTestData("item.label.rangeUrlDescription") + "')]")));
		addField(FieldName.ZOOM_IN_BUTTON, new Field(FieldType.BUTTON, By.xpath("//button[contains(@id, 'itemGalleryZoom')]")));
		addField(FieldName.KEY_TECHNICAL_DATA, new Field(FieldType.SECTION, By.xpath("(//ul[@class='a-list a-list-unordered'])[2]")));
		addField(FieldName.MORE_TECHNICAL_DATA_LINK, new Field(FieldType.LINK, By.xpath("(//a[@href='#technical-data'])[1]")));
		addField(FieldName.PACKAGE_CONTENTS, new Field(FieldType.SECTION, By.xpath("(//ul[@class='a-list a-list-unordered'])[1]")));
		addField(FieldName.FEATURES_AND_APPLICATIONS, new Field(FieldType.SECTION, By.xpath("//div[contains(@id, 'js-tabs')]//section[contains(@class, 'features-applications')]")));
		addField(FieldName.FEATURES_COLUMN, new Field(FieldType.TEXT, By.xpath("(//div[@class='column'])[1]")));
		addField(FieldName.APPLICATIONS_COLUMN, new Field(FieldType.TEXT, By.xpath("(//div[@class='column'])[2]")));
		addField(FieldName.RELATED_PRODUCTS, new Field(FieldType.SECTION, By.xpath("//div[contains(@id, 'js-tabs')]//section[contains(@class, 'related-products')]")));
		addField(FieldName.ALL_PRODUCTS_RADIOBUTTON, new Field(FieldType.RADIO, By.xpath(".//div[@id='onpagefilter_all-div']")));
		addField(FieldName.TOOLS_PRODUCTS_RADIOBUTTON, new Field(FieldType.RADIO, By.xpath(".//div[@id='onpagefilter_tool-div']")));
		addField(FieldName.CONSUMABLES_PRODUCTS_RADIOBUTTON, new Field(FieldType.RADIO, By.xpath(".//div[@id='onpagefilter_consumable-div']")));
		addField(FieldName.INSERTS_PRODUCTS_RADIOBUTTON, new Field(FieldType.RADIO, By.xpath(".//div[@id='onpagefilter_plugtool-div']")));
		addField(FieldName.SHOW_ALL_PRODUCTS_BUTTON, new Field(FieldType.BUTTON, By.xpath("//a[@class='button js-showmore-trigger js-showmore-showall']")));
		addField(FieldName.RELATED_PRODUCTS_LIST, new Field(FieldType.TEXT, By.xpath("//div[@class='m-onpagefilter-items js-onpagefilter-items']")));
		addField(FieldName.TECHNICAL_DATA_TABLE, new Field(FieldType.SECTION, By.xpath("//div[contains(@class, 'o-product-tab-content')]/ancestor::div[contains(@id, 'technical-data')]")));
		addField(FieldName.DOCUMENTS, new Field(FieldType.SECTION, By.xpath("//div[contains(@id, 'js-tabs')]//section[contains(@class, 'documents')]")));
		addField(FieldName.APPROVAL_DOCUMENT_BUTTON, new Field(FieldType.BUTTON, By.xpath("//li[@class='m-accordion-item']")));
		addField(FieldName.APPROVAL_DOCUMENT_PDF_LINK, new Field(FieldType.LINK, By.xpath("(//ul[contains(@class, 'm-product-documents-items')]//a)[1]")));
		addField(FieldName.CONSULTING_AND_SUPPORT, new Field(FieldType.SECTION, By.xpath("//div[contains(@id, 'js-tabs')]//section[contains(@class, 'consulting-support')]")));
		addField(FieldName.CONSULTING_AND_SUPPORT_PLACEHOLDER, new Field(FieldType.SECTION, By.xpath("//div[contains(@data-ajax-lazy-url, 'ConsultingSupport')]")));
		addField(FieldName.REQUEST_LIVE_DEMO_BUTTON, new Field(FieldType.BUTTON, By.xpath("//a[@data-track-action='RequestDemo']")));
		addField(FieldName.START_LIVE_CHAT_BUTTON, new Field(FieldType.BUTTON, By.xpath("//a[@data-track-action='Chat']")));
		addField(FieldName.REQUEST_CALLBACK_BUTTON, new Field(FieldType.BUTTON, By.xpath("//a[@data-track-action='CallBack']")));
		addField(FieldName.RATINGS_AND_REVIEWS, new Field(FieldType.SECTION, By.xpath("//div[contains(@id, 'js-tabs')]//section[contains(@class, 'ratings')]")));
		addField(FieldName.ALERT_MESSAGE_BOX, new Field(FieldType.SECTION, By.xpath("//div[@id='loggedIn_alert']")));
		addField(FieldName.LOG_OUT_LINK, new Field(FieldType.LINK, By.xpath("(//a[@href='/logout/dologout?'])[2]")));
		addField(FieldName.PRODUCT_REVIEWS_DISCLAIMER, new Field(FieldType.SECTION, By.xpath("//div[@class='m-product-disclaimer']")));
		addField(FieldName.ITEM_PAGE_FOOTER, new Field(FieldType.SECTION, By.xpath("//footer[@class='o-footer']")));
		addField(FieldName.SIDE_BAR_CONTROLLER, new Field(FieldType.SECTION, By.xpath("(//div[@class='a-sidebar-controls'])[2]")));
		addField(FieldName.EXPAND_BAR_MENU_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//a[@class='a-sidebar-controls-controller']")));
		addField(FieldName.UP_ARROW_BAR_MENU_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//a[@class='a-sidebar-controls-previous']")));
		addField(FieldName.DOWN_ARROW_BAR_MENU_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//a[@class='a-sidebar-controls-next']")));
		addField(FieldName.SIDE_BAR_MENU, new Field(FieldType.SECTION, By.xpath("(//ul[@class='m-sidebar-nav--menu js-sidebar-nav-menu'])[1]")));
		addField(FieldName.BASIC_INFORMATION_LINK, new Field(FieldType.LINK, By.xpath("(//a[@href='#basic-information'])[2]")));
		addField(FieldName.FEATURES_AND_APPLICATIONS_LINK, new Field(FieldType.LINK, By.xpath("(//a[@href='#features-applications'])[2]")));
		addField(FieldName.RELATED_PRODUCTS_LINK, new Field(FieldType.LINK, By.xpath("(//a[@href='#related-products'])[2]")));
		addField(FieldName.DOCUMENTS_AND_VIDEOS_LINK, new Field(FieldType.LINK, By.xpath("(//a[@href='#documents-videos'])[2]")));
		addField(FieldName.TECHNICAL_DATA_LINK, new Field(FieldType.LINK, By.xpath("(//a[@href='#technical-data'])[3]")));
		addField(FieldName.CONSULTING_AND_SUPPORT_LINK, new Field(FieldType.LINK, By.xpath("//nav[contains(@class, 'm-sidebar-nav m-sidebar-nav--advanced m-sidebar-nav--expand-xxl  has-card m-sidebar-nav--sticky has-button is-sticky is-expanded')]//a[@href='#consulting-support']")));
		addField(FieldName.RATINGS_AND_REVIEWS_LINK, new Field(FieldType.LINK, By.xpath("//nav[contains(@class, 'm-sidebar-nav m-sidebar-nav--advanced m-sidebar-nav--expand-xxl  has-card m-sidebar-nav--sticky has-button is-sticky is-expanded')]//a[@href='#ratings-reviews']")));
		addField(FieldName.CLOSE_SIDE_BAR_BUTTON, new Field(FieldType.BUTTON, By.xpath("//a[@class='a-sidebar-controls-controller']")));
		addField(FieldName.CART_BAR_WRAPPER, new Field(FieldType.SECTION, By.xpath("//div[@class='m-product-cartbar-sticky is-sticky scroll-to-fixed-fixed']")));
		addField(FieldName.CART_BAR_PRODUCT_NAME, new Field(FieldType.TEXT, By.xpath("(//div[@class='a-product-name'])[2]")));
		addField(FieldName.WIDGET_FLEET_RADIOBUTTON, new Field(FieldType.RADIO, By.xpath("//div[@id='radio-sticky-product-fleet-1-div']")));
		addField(FieldName.WIDGET_BUY_RADIOBUTTON, new Field(FieldType.RADIO, By.xpath("//div[@id='radio-sticky-product-buy-1-div']")));
		addField(FieldName.FLEET_CART_BAR_PRODUCT_PRICE, new Field(FieldType.TEXT, By.xpath("(//div[@class='m-choose-price-item-content js-radio-control-item'])[4]")));
		addField(FieldName.CART_BAR_PRODUCT_PRICE, new Field(FieldType.TEXT, By.xpath("(//div[@class='a-product-cartbar-data-wrapper'])[2]")));
		addField(FieldName.CART_BAR_CART_WIDGET, new Field(FieldType.DIV, By.xpath("(//input[@id='item-pieces'])[2]")));
		addField(FieldName.YOUR_EMAIL_ADDRESS_TEXTFIELD, new Field(FieldType.TEXT, By.id("demorequest_email")));
		addField(FieldName.YOUR_PHONE_NUMBER_TEXTFIELD, new Field(FieldType.TEXT, By.id("demorequest_phone")));
		addField(FieldName.REQUEST_DEMO_BUTTON, new Field(FieldType.BUTTON, By.id("demorequest_send")));
		addField(FieldName.SUCCESS_MESSAGE_BOX, new Field(FieldType.DIV, By.xpath(".//div[contains(@class, 'm-message m-message--success')]")));
		addField(FieldName.CANCEL_BUTTON, new Field(FieldType.BUTTON, By.id("demorequest_cancel")));
		addField(FieldName.RANGE_AND_ITEM_PAGE_LOADING_INDICATOR, new Field(FieldType.DIV, By.xpath("//div[contains(@class, 'a-preloader-animation') and not(contains(@class, 'is-hidden'))]")));
		addField(FieldName.BREADCRUMB_LIST, new Field(FieldType.LIST, By.xpath("//div[contains(@class, 'm-breadcrumbs')]//div[contains(@class, 'breadcrumbs')]")));
		addField(FieldName.BREADCRUMB_LIST_POSITION, new Field(FieldType.LINK, By.xpath("//li[@itemprop='itemListElement']//a[@itemprop='item']")));
	}
}