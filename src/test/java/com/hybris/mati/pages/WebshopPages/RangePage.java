package com.hybris.mati.pages.WebshopPages;

import org.openqa.selenium.By;

import com.hybris.utils.*;

public class RangePage extends Page{

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
		SEE_ALL_PRODUCTS_AND_PACKAGES_LINK,
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
		PRODUCT_VARIANTS_AND_SETS,
		PRODUCT_VARIANTS_FILTER_DROPDOWN_BUTTON,
		EXPANDED_PRODUCT_VARIANTS_FILTER_LIST,
		LIST_OBJECT,
		MORE_DETAILS_PRODUCT_LINK,
		PRODUCT_VARIANTS_FILTER_DROPDOWN_TEXTFIELD,
		PRODUCT_VARIANTS_TABLE,
		QUANTITY_COLUMN,
		PRICE_UNIT_COLUMN,
		PACKAGING_UNIT_COLUMN,
		ITEM_NUMBER_COLUMN,
		PRODUCT_VARIANTS_AND_SETS_LINK,
		MATERIAL_DOCUMENT_PDF_LINK,
		PRODUCT_VARIANTS_LINK,
		RANGE_AND_ITEM_PAGE_LOADING_INDICATOR,
		CONSULTING_AND_SUPPORT_PLACEHOLDER,
		RATINGS_AND_REVIEWS_PLACEHOLDER,
		READ_MORE_LINK,
		STARS_RATING_TABLE,
		SINGLE_REVIEW_BACK_LINK,
		SHOW_ALL_REVIEWS_BUTTON,
		TWO_STARS_REVIEWS_LINK,
		REVIEW_LIST,
		REVIEW,
		TWO_STARS_REVIEWS_DISPLAYED_COUNT, 
		PLEASE_LOGIN_OR_REGISTER,
		LOGIN_BUTTON,
		REGISTER_BUTTON,
		ADD_REVIEW_SELECTABLE_STARS,
		ADD_REVIEW_TITLE,
		ADD_REVIEW_MESSAGE,
		ADD_REVIEW_ALIAS, 
		ADD_REVIEW_BUTTON,
		BE_THE_FIRST_TO_WRITE_REVIEW, 
		WRITE_REVIEW,
		BREADCRUMB_LIST_POSITION,
		BREADCRUMB_LIST,
		ITEM_PIECES_STANDARD_NOT_LOGGED_IN_TEXTFIELD,
		ADD_TO_CART_STANDARD_NOT_LOGGED_IN_BUTTON,
		
	}
	
	public RangePage(){
		
		addField(FieldName.PRODUCT_HEADER, new Field(FieldType.DIV, By.xpath("(//div[@class='container-fluid'])[2]")));
		addField(FieldName.RATINGS_LINK, new Field(FieldType.LINK, By.xpath(".//a[@href='#ratings-reviews']")));
		addField(FieldName.SOCIAL_MEDIA_WIDGET, new Field(FieldType.LINK, By.xpath(".//a[@class='a-link--share a-link-action tooltipstered']")));
		addField(FieldName.BASIC_INFORMATION, new Field(FieldType.IMAGE, By.xpath("//div[@id='basic-information']")));
		addField(FieldName.ITEM_IMAGE, new Field(FieldType.IMAGE, By.xpath("//div[@class='a-image-zoom']")));
		addField(FieldName.PRODUCT_VARIANTS_AND_CART_WIDGET, new Field(FieldType.SECTION, By.xpath("//div[@id='product-variants']")));
		addField(FieldName.BUY_RADIOBUTTON, new Field(FieldType.RADIO, By.xpath(".//div[contains(@id, 'radio-product-buy')]")));
		addField(FieldName.FLEET_RADIOBUTTON, new Field(FieldType.RADIO, By.xpath(".//div[contains(@id, 'radio-product-fleet')]")));
		addField(FieldName.YEARLY_RADIOBUTTON, new Field(FieldType.RADIO, By.xpath(".//input[@id='radio-software-yearly-1']/ancestor::div[contains(@class, 'js-radio-control')]")));
		addField(FieldName.MONTHLY_RADIOBUTTON, new Field(FieldType.RADIO, By.xpath(".//input[@id='radio-software-monthly-1']/ancestor::div[contains(@class, 'js-radio-control')]")));
		addField(FieldName.FLEET_CONTRACT_WARNING, new Field(FieldType.TEXT, By.xpath(".//div[contains(@class, 'm-message--tiny m-message--notify')]")));
		addField(FieldName.FAVORITE_LIST_ADDITION, new Field(FieldType.TEXT, By.xpath("//div[contains(@class, 'm-add-favorite-create-notify')]")));
		addField(FieldName.FLEET_CONTRACT_LINK, new Field(FieldType.LINK, By.xpath("//div[contains(@class, 'js-radio-control')]//a")));
		addField(FieldName.CLOSE_FAVORITE_LIST_POPUP_BUTTON, new Field(FieldType.BUTTON, By.xpath("//button[contains(@class, 'js-close-message')]")));
		addField(FieldName.CREATE_NEW_LIST_TEXTFIELD, new Field(FieldType.TEXT, By.xpath("//input[@id='createNewList']")));
		addField(FieldName.SUBMIT_CREATE_NEW_LIST_BUTTON, new Field(FieldType.BUTTON, By.xpath("//button[contains(@class, 'js-send-new-list')]")));
		addField(FieldName.CREATE_NEW_LIST_BUTTON, new Field(FieldType.BUTTON, By.xpath("//button[contains(@class, 'js-create-new-list')]")));
		addField(FieldName.ITEM_PIECES_TEXTFIELD, new Field(FieldType.TEXT, By.xpath("(//div[@id='product-variants']//input[@name='quantity'])[1]")));
		addField(FieldName.ITEM_PIECES_STANDARD_NOT_LOGGED_IN_TEXTFIELD, new Field(FieldType.TEXT, By.xpath("(//div[@id='product-variants']//input[@name='quantity'])[3]")));
		addField(FieldName.ADD_TO_CART_BUTTON, new Field(FieldType.BUTTON, By.xpath(".(//button[@class='a-button-primary js-add-to-cart'])[3]")));
		addField(FieldName.ADD_TO_CART_STANDARD_NOT_LOGGED_IN_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//button[@class='a-button-primary js-add-to-cart' and @data-track-id='74']")));
		addField(FieldName.CART_ADDITION_POPUP, new Field(FieldType.SECTION, By.xpath("//div[@id='m-add-to-cart-layer']")));
		addField(FieldName.CONTACT_OVERLAY, new Field(FieldType.SECTION, By.xpath("//div[contains(@class, 'js-contact-modal')]")));
		addField(FieldName.REQUEST_LIVE_DEMO_OVERLAY, new Field(FieldType.SECTION, By.xpath("//div[contains(@class, 'js-product-requestdemo')]")));
		addField(FieldName.CHECK_AVAILABILITY_LINK, new Field(FieldType.LINK, By.xpath("//a[contains(@class, 'a-icon-avaiability')]")));
		addField(FieldName.CHECK_AVAILABILITY_POPUP, new Field(FieldType.SECTION, By.xpath("//div[contains(@id, 'overlay-storelocator-availability')]")));
		addField(FieldName.CLOSE_POPUP_BUTTON, new Field(FieldType.BUTTON, By.xpath("//span[contains(@class, 'featherlight-close')]")));
		addField(FieldName.ADD_TO_FAVORITES_POPUP, new Field(FieldType.SECTION, By.xpath("//div[contains(@class, 'js-favorite-wrap open')]")));
		addField(FieldName.FAVORITE_LIST_FIRST_POSITION, new Field(FieldType.LINK, By.xpath(".//a[@class='js-move-to-list']")));
		addField(FieldName.ADD_TO_FAVORITES_LINK, new Field(FieldType.LINK, By.xpath("//a[contains(@class, 'js-show-add-favorite')]")));
		addField(FieldName.SEE_ALL_PRODUCTS_AND_PACKAGES_LINK, new Field(FieldType.LINK, By.xpath("//a[contains(., '" + Tools.getEnvironmentTestData("item.label.rangeUrlDescription") + "')]")));
		addField(FieldName.ZOOM_IN_BUTTON, new Field(FieldType.BUTTON, By.xpath("//button[contains(@id, 'galleryZoom')]")));
		addField(FieldName.KEY_TECHNICAL_DATA, new Field(FieldType.SECTION, By.xpath("//ul[@class='a-list a-list-unordered']")));
		addField(FieldName.MORE_TECHNICAL_DATA_LINK, new Field(FieldType.LINK, By.xpath("(//a[@href='#technical-data'])[1]")));
		addField(FieldName.PACKAGE_CONTENTS, new Field(FieldType.SECTION, By.xpath("//ul[@class='a-list a-list-unordered']")));
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
		addField(FieldName.TECHNICAL_DATA_TABLE, new Field(FieldType.SECTION, By.xpath("(//div[@id='technical-data'])[2]")));
		addField(FieldName.DOCUMENTS, new Field(FieldType.SECTION, By.xpath("//div[contains(@id, 'js-tabs')]//section[contains(@class, 'documents')]")));
		addField(FieldName.APPROVAL_DOCUMENT_BUTTON, new Field(FieldType.BUTTON, By.xpath("//li[@class='m-accordion-item']")));
		addField(FieldName.APPROVAL_DOCUMENT_PDF_LINK, new Field(FieldType.LINK, By.xpath("(//ul[contains(@class, 'm-product-documents-items')]//a)[1]")));
		addField(FieldName.CONSULTING_AND_SUPPORT, new Field(FieldType.SECTION, By.xpath("//div[contains(@id, 'js-tabs')]//section[contains(@class, 'consulting-support')]")));
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
		addField(FieldName.SIDE_BAR_MENU, new Field(FieldType.SECTION, By.xpath("(//ul[@class='m-sidebar-nav--menu js-sidebar-nav-menu'])[2]")));
		addField(FieldName.BASIC_INFORMATION_LINK, new Field(FieldType.LINK, By.xpath("(//a[@href='#basic-information'])[2]")));
		addField(FieldName.FEATURES_AND_APPLICATIONS_LINK, new Field(FieldType.LINK, By.xpath("(//a[@href='#features-applications'])[2]")));
		addField(FieldName.RELATED_PRODUCTS_LINK, new Field(FieldType.LINK, By.xpath("(//a[@href='#related-products'])[2]")));
		addField(FieldName.DOCUMENTS_AND_VIDEOS_LINK, new Field(FieldType.LINK, By.xpath("(//a[@href='#documents-videos'])[1]")));
		addField(FieldName.TECHNICAL_DATA_LINK, new Field(FieldType.LINK, By.xpath("(//a[@href='#technical-data'])[3]")));
		addField(FieldName.PRODUCT_VARIANTS_AND_SETS_LINK, new Field(FieldType.LINK, By.xpath("(//a[@href='#product-variants'])[4]")));
		addField(FieldName.CONSULTING_AND_SUPPORT_LINK, new Field(FieldType.LINK, By.xpath("(//a[@href='#consulting-support'])[2]")));
		addField(FieldName.RATINGS_AND_REVIEWS_LINK, new Field(FieldType.LINK, By.xpath("(//a[@href='#ratings-reviews'])[2]")));
		addField(FieldName.CLOSE_SIDE_BAR_BUTTON, new Field(FieldType.BUTTON, By.xpath("//a[@class='a-sidebar-controls-controller']")));
		addField(FieldName.CART_BAR_WRAPPER, new Field(FieldType.SECTION, By.xpath("//div[@class='m-product-cartbar-sticky is-sticky scroll-to-fixed-fixed']")));
		addField(FieldName.CART_BAR_PRODUCT_NAME, new Field(FieldType.TEXT, By.xpath("(//div[@class='a-product-name'])[2]")));
		addField(FieldName.WIDGET_FLEET_RADIOBUTTON, new Field(FieldType.RADIO, By.xpath("//div[@id='radio-sticky-product-fleet-1-div']")));
		addField(FieldName.WIDGET_BUY_RADIOBUTTON, new Field(FieldType.RADIO, By.xpath("//div[@id='radio-sticky-product-buy-1-div']")));
		addField(FieldName.FLEET_CART_BAR_PRODUCT_PRICE, new Field(FieldType.TEXT, By.xpath("(//div[@class='m-choose-price-item-content js-radio-control-item'])[4]")));
		addField(FieldName.CART_BAR_PRODUCT_PRICE, new Field(FieldType.TEXT, By.xpath("(//div[@class='a-product-cartbar-data-wrapper'])[2]")));
		addField(FieldName.CART_BAR_CART_WIDGET, new Field(FieldType.DIV, By.xpath("(//input[@id='item-pieces'])[2]")));
		addField(FieldName.PRODUCT_VARIANTS_AND_SETS, new Field(FieldType.DIV, By.xpath("//div[contains(@class, 'm-filterbar-main m-filterbar-main--selectboxes')]")));
		addField(FieldName.PRODUCT_VARIANTS_FILTER_DROPDOWN_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//a[contains(@class, 'chosen-single chosen-default')]")));
		addField(FieldName.EXPANDED_PRODUCT_VARIANTS_FILTER_LIST, new Field(FieldType.SECTION, By.xpath("//ul[contains(@class, 'chosen-results')]")));
		addField(FieldName.LIST_OBJECT, new Field(FieldType.TEXT, By.xpath(".//li[contains(@class, 'active-result')]")));
		addField(FieldName.MORE_DETAILS_PRODUCT_LINK, new Field(FieldType.LINK, By.xpath("//a[contains(., '" + Tools.getEnvironmentTestData("range.label.moreDetails") + "')]")));
		addField(FieldName.PRODUCT_VARIANTS_FILTER_DROPDOWN_TEXTFIELD, new Field(FieldType.TEXT, By.xpath(".//div[contains(@class, 'chosen-search')]//input[contains(@type, 'text')]")));
		addField(FieldName.PRODUCT_VARIANTS_TABLE, new Field(FieldType.SECTION, By.xpath("//div[contains(@class, 'm-showmore-container')]/table/tbody")));
		addField(FieldName.MATERIAL_DOCUMENT_PDF_LINK, new Field(FieldType.LINK, By.xpath("//a[contains(@href, 'Spray_66')]")));
		addField(FieldName.PRODUCT_VARIANTS_LINK, new Field(FieldType.LINK, By.xpath("(//a[@href='#product-variants'])[4]")));
		addField(FieldName.RANGE_AND_ITEM_PAGE_LOADING_INDICATOR, new Field(FieldType.DIV, By.xpath("//div[contains(@class, 'a-preloader-animation') and not(contains(@class, 'is-hidden'))]")));
		addField(FieldName.CONSULTING_AND_SUPPORT_PLACEHOLDER, new Field(FieldType.SECTION, By.xpath("//div[contains(@data-ajax-lazy-url, 'ConsultingSupport')]")));
		addField(FieldName.RATINGS_AND_REVIEWS_PLACEHOLDER, new Field(FieldType.SECTION, By.xpath("//div[contains(@data-ajax-lazy-url, 'RatingsReviews')]")));
		addField(FieldName.READ_MORE_LINK, new Field(FieldType.LINK, By.xpath("//a[@class='m-product-review--readmore']")));
		addField(FieldName.STARS_RATING_TABLE, new Field(FieldType.SECTION, By.xpath("//div[@class='m-product-ratings']")));
		addField(FieldName.SINGLE_REVIEW_BACK_LINK, new Field(FieldType.LINK, By.xpath("//div[@class='js-ratings-review-container']//a[contains(@class,'a-link--back')]")));
		addField(FieldName.SHOW_ALL_REVIEWS_BUTTON, new Field(FieldType.BUTTON, By.xpath("//div[@class='m-product-reviews--show-all']//a")));
		addField(FieldName.TWO_STARS_REVIEWS_DISPLAYED_COUNT, new Field(FieldType.BUTTON, By.xpath("//li[@class='m-product-ratings--row is-charted'][4]")));
		addField(FieldName.TWO_STARS_REVIEWS_LINK, new Field(FieldType.BUTTON, By.xpath("//li[@class='m-product-ratings--row is-charted'][4]//a")));
		addField(FieldName.REVIEW_LIST, new Field(FieldType.SECTION, By.xpath("//div[@class='m-product-reviews js-product-reviews']")));
		addField(FieldName.REVIEW, new Field(FieldType.SECTION, By.xpath("//section[@class='m-product-review ']")));
		addField(FieldName.PLEASE_LOGIN_OR_REGISTER, new Field(FieldType.SECTION, By.xpath("//div[@id='notLoggedIn_notify']")));
		addField(FieldName.LOGIN_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//a[@data-set-hash='login']")));
		addField(FieldName.REGISTER_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//a[2]")));
		addField(FieldName.ADD_REVIEW_SELECTABLE_STARS, new Field(FieldType.RADIO, By.xpath("//span[@class='a-stars-radio-list']")));
		addField(FieldName.ADD_REVIEW_TITLE, new Field(FieldType.TEXT, By.xpath("//input[@id='addreview-title']")));
		addField(FieldName.ADD_REVIEW_ALIAS, new Field(FieldType.TEXT, By.xpath("//input[@id='addreview-alias']")));
		addField(FieldName.ADD_REVIEW_MESSAGE, new Field(FieldType.TEXT, By.xpath("//textarea[@id='addreview-message']")));
		addField(FieldName.ADD_REVIEW_BUTTON, new Field(FieldType.BUTTON, By.xpath("//button[@id='addreview-submit']")));
		addField(FieldName.BE_THE_FIRST_TO_WRITE_REVIEW, new Field(FieldType.LINK, By.xpath("//div[contains(@class, 'm-product-ratings-widget')]//a")));
		addField(FieldName.WRITE_REVIEW, new Field(FieldType.LINK, By.xpath("(//a[@data-track-action='WriteReview'])[1]")));
		addField(FieldName.BREADCRUMB_LIST, new Field(FieldType.LIST, By.xpath("//div[contains(@class, 'm-breadcrumbs')]//div[contains(@class, 'breadcrumbs')]")));
		addField(FieldName.BREADCRUMB_LIST_POSITION, new Field(FieldType.LINK, By.xpath("//li[@itemprop='itemListElement']//a[@itemprop='item']")));		
	}
}