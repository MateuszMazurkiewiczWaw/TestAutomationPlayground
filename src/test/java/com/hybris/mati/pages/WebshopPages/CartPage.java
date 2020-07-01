package com.hybris.mati.pages.WebshopPages;

import org.openqa.selenium.By;

import com.hybris.utils.*;

public class CartPage extends Page{

	public enum FieldName implements Storable {
		
		PLEASE_CONTACT_US_IF_YOU_NEED_ASSISTANCE_LINK,
		CHECK_OUT_NOT_LOGGED_IN_BUTTON,
		CHECK_OUT_BUTTON,
		CONTINUE_SHOPPING_LINK,
		QUICK_ITEM_ENTRY, // section on the cart page
		QUICK_ITEM_ENTRY_TEXTFIELD, //text field on cart page
		ADD_TO_CART_BUTTON, // add to cart action
		SUCCESS_MESSAGE_BOX,
		ERROR_MESSAGE_BOX,
		VISIT_FAVORITES_LISTS_LINK,
		SHOPPING_CART_HEADER,
		BOTTOM_LOG_IN_REGISTER,
		LOG_IN_OR_REGISTER_BUTTON, // in product header e.g. STANDARD_PRODUCTS_HEADER
		SEARCH_FOR_PRODUCT_TEXTFIELD,
		LOG_IN_HERE_LINK,
		SAVE_MONEY_SHIPPING_LINK,
		CHECK_STOCK_LINK,
		VIEW_YOUR_ACCOUNT_HISTORY_LINK,
		MANAGE_hybris_TOOLS_LINK,
		QUICK_REORDER_LINK,
		LEARN_MORE_BUTTON, // in section QUICK_ITEM_ENTRY
		LEARN_MORE, //section
		NEW_PRODUCTS_INNOVATIONS_LINK,
		INNOVATION_MAGAZINE_MARKETING_BANNER,
		REGISTER_HERE_LINK,
		NEW_PRODUCTS_MARKETING_BANNER,
		YOUR_SHOPPING_CART_EMPTY,
		SEARCHING_ITEM_BAR,
		BANNER_CONTAINERS_SHOPPING_CART,
		LEARN_MORE_SHOPPING_CART_POPUP,
		FLEET_PRODUCTS_TABLE,
		STANDARD_PRODUCTS_HEADER,
		STANDARD_PRODUCTS_TABLE,
		SOFTWARE_PRODUCTS_HEADER,
		SOFTWARE_PRODUCTS_TABLE,
		FLEET_CONTRACT_INFORMATION_BUTTON,
		FLEET_CONTRACT_INFORMATION_POPUP,
		TABLE_DESCRIPTION_COLUMN,// in table FLEET_PRODUCTS_TABLE
		TABLE_USAGE_PERIOD_COLUMN,
		TABLE_INVOICE_COLUMN,
		TABLE_PRICE_COLUMN,
		TABLE_TOTAL_PRICE_COLUMN,
		TABLE_AMOUNT_COLUMN,
		TABLE_AMOUNT_LABEL,
		TABLE_SEE_PRODUCT_DETAILS_LINK,
		TABLE_ADD_TO_FAVORITES_BUTTON,
		TABLE_ADD_TO_FAVORITES_DROPDOWN,
		TABLE_ADD_TO_FAVORITES_TEXTFIELD,
		TABLE_ADD_TO_FAVORITES_CREATE_LIST_BUTTON,
		TABLE_ADD_TO_FAVORITES_CREATE_NEW_LIST_BUTTON,
		FLEET_SUBTOTAL_MANAGEMENT_ITEMS,
		MONTHLY_FEE_LEARN_MORE_BUTTON, // in FLEET_SUBTOTAL_MANAGEMENT_ITEMS section
		MONTHLY_FEE_LEARN_MORE_POPUP,
		MONTHLY_FEE_LEARN_MORE_POPUP_CLOSE_BUTTON,
		UPFRONT_PRICE_LEARN_MORE_BUTTON,
		UPFRONT_PRICE_LEARN_MORE_POPUP,
		TABLE_REMOVE_ITEM_BUTTON,
		SOFTWARE_SUBTOTAL_MANAGEMENT_ITEMS,
		ONE_TIME_LEARN_MORE_BUTTON,
		ONE_TIME_LEARN_MORE_POPUP,
		ONE_TIME_LEARN_MORE_POPUP_CLOSE_BUTTON,
		YEARLY_FEE_LEARN_MORE_BUTTON,
		YEARLY_FEE_LEARN_MORE_POPUP,
		YEARLY_FEE_LEARN_MORE_POPUP_CLOSE_BUTTON,
		REMOVE_ALL_ITEMS_BUTTON,
		LEARN_MORE_SHOPPING_CART,
		REPLACE_BUTTON,
		FLEET_PRODUCTS_TABLE_CONTENT,
		TABLE_ADD_TO_FAVORITES_CLOSE_BUTTON,
		STANDARD_PRODUCTS_TABLE_CONTENT,
		SOFTWARE_PRODUCTS_TABLE_CONTENT,
		STANDARD_SUBTOTAL_MANAGEMENT_ITEMS,
		TABLE_PACKAGING_UNIT_COLUMN,
		TABLE_BILLING_CYCLE_COLUMN,
		REMOVE_ALL_ITEMS_POPUP,
		CONFIRM_REMOVING_ALL_ITEMS,
		TABLE_AMOUNT_TEXTFIELD,
		TABLE_UPDATE_QUANTITY_BUTTON,
		STANDARD_PRODUCTS_REPLACEMENT_TABLE,
		OUT_OF_STOCK_MESSAGE,
		REPLACEMENT_ROW,
		TABLE_REPLACE_BUTTON,
		REMOVE_FROM_CART_REPLACEMENT_BUTTON,
		REPLACEMENT_ERROR_MESSAGE_BOX,
		MOVE_TO_PURCHASE_ITEMS_BUTTON, //In FLEET_PRODUCTS_TABLE section
		CLICK_AND_COLLECT_CHECKBOX,
		hybris_CENTER_SELECT_BUTTON,
		SEARCH_LOCATION_BUTTON,
		CHANGE_hybris_CENTER_BUTTON,
		CHANGE_hybris_CENTER_POPUP,
		ENTER_ZIP_CODE_OR_CITY_TEXTFIELD,
		SELECT_hybris_CENTER_BUTTON,
		LOCATION_MAP,
		USE_MY_LOCATION_BUTTON,
		CLOSE_OVERLAY_BUTTON,
		SELECTED_hybris_CENTER,
		hybris_CENTER_ADDRESS_COLUMN,
		hybris_CENTER_OPENING_HOURS_COLUMN,
		STORE_LOCATOR_TEXTFIELD,
		SECOND_hybris_CENTER_NAME,
		SELECT_hybris_CENTER_OVERLAY_BUTTON, //used to open the overlay on cart page
		CURRENTLY_OPENED_hybris_CENTER,
		CHECK_AVAILABILITY_LINK,
		CHECK_AVAILABILITY_OVERLAY,
		CHECK_AVAILABILITY_OVERLAY_TABLE,
		ADD_TO_CART_OVERLAY_WIDGET,
		PICK_UP_FROM_HC_OVERLAY_WIDGET,
		OVERLAY_TABLE_DESCRIPTION_FIELD,
		OVERLAY_TABLE_PRICE_FIELD,
		OVERLAY_TABLE_MINATURE_IMAGE,
		OVERLAY_TABLE_QUANTITY_TEXTIELD,
		OVERLAY_TABLE_CHECK_AVAILABILITY_BUTTON,
		OVERLAY_TABLE_INSTRUCTION_NOTE,
		AVAILABILITY_NOTIFICATION,
		ADD_TO_CART_OVERLAY_QUANTITY_TEXTFIELD,
		ADD_TO_CART_OVERLAY_BUTTON,
		CHECK_AVAILABILITY_OVERLAY_CITY_TEXTFIELD,
		CHECK_AVAILABILITY_OVERLAY_SEARCH_BUTTON,
		OVERLAY_USE_MY_LOCATION_BUTTON,
		OVERLAY_HC_CITY_LIST,
		OVERLAY_CITY_LIST_POSITION,
		OVERLAY_GET_DIRECTIONS_LINK,
		OVERLAY_OPENING_HOURS_BUTTON,
		OVERLAY_OPENING_HOURS_POPUP,
		OVERLAY_OPENING_HOURS_POPUP_CLOSE_BUTTON,
		OVERLAY_hybris_CENTER_MAP,
		CHECK_AVAILABILITY_OVERLAY_CLOSE_BUTTON,
		OVERLAY_TABLE_PACKAGING_UNIT_FIELD,
		NOT_LOGGED_IN_TABLE_PRICE_COLUMN,
	}
	
	public CartPage(){
		
		addField(FieldName.PLEASE_CONTACT_US_IF_YOU_NEED_ASSISTANCE_LINK, new Field(FieldType.DIV, By.xpath("//a[@data-trigger='#contact_overlay']")));
		addField(FieldName.CHECK_OUT_BUTTON, new Field(FieldType.BUTTON, By.xpath("//button[contains(@class, 'js-checkout')]")));
		addField(FieldName.CHECK_OUT_NOT_LOGGED_IN_BUTTON, new Field(FieldType.BUTTON, By.xpath("(//a[contains(@class, 'js-scroll-after-login')])[1]")));
		addField(FieldName.CONTINUE_SHOPPING_LINK, new Field(FieldType.LINK, By.xpath("//a[@href='#nav/products' and contains(@title, 'Continue')]")));
		addField(FieldName.QUICK_ITEM_ENTRY, new Field(FieldType.SECTION, By.xpath("//div[contains(@class, 'container-fluid m-addproduct')]")));
		addField(FieldName.QUICK_ITEM_ENTRY_TEXTFIELD, new Field(FieldType.TEXT, By.xpath("//textarea[@id='quickOrderText']")));
		addField(FieldName.ADD_TO_CART_BUTTON, new Field(FieldType.BUTTON, By.xpath("//a[contains(@data-action-url, '/quick-item-entry/add')]")));
		addField(FieldName.SUCCESS_MESSAGE_BOX, new Field(FieldType.SECTION, By.id("addProductSuccessMessage")));
		addField(FieldName.ERROR_MESSAGE_BOX, new Field(FieldType.SECTION, By.id("addProductErrorMessage")));
		addField(FieldName.VISIT_FAVORITES_LISTS_LINK, new Field(FieldType.LINK, By.xpath("//a[@title='Visit favorites lists']")));
		addField(FieldName.SHOPPING_CART_HEADER, new Field(FieldType.SECTION, By.xpath("//div[contains(@class, 'o-shopping-cart-title container-fluid')]")));
		addField(FieldName.BOTTOM_LOG_IN_REGISTER, new Field(FieldType.SECTION, By.xpath("//div[contains(@class, 'o-cart-empty-login-register')]")));
		addField(FieldName.LOG_IN_OR_REGISTER_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//a[contains(@class, 'a-button-nologin')]")));
		addField(FieldName.SEARCH_FOR_PRODUCT_TEXTFIELD, new Field(FieldType.TEXT, By.xpath("//form[contains(@novalidate, 'novalidate')]//input[contains(@type, 'search')]")));
		addField(FieldName.LOG_IN_HERE_LINK, new Field(FieldType.LINK, By.xpath("//a[@data-set-hash='login' and contains(@class, 'a-button-tertiary')]")));
		addField(FieldName.SAVE_MONEY_SHIPPING_LINK, new Field(FieldType.LINK, By.id("LearnRegisterLink1")));
		addField(FieldName.CHECK_STOCK_LINK, new Field(FieldType.LINK, By.id("LearnRegisterLink2")));
		addField(FieldName.VIEW_YOUR_ACCOUNT_HISTORY_LINK, new Field(FieldType.LINK, By.id("LearnRegisterLink3")));
		addField(FieldName.MANAGE_hybris_TOOLS_LINK, new Field(FieldType.LINK, By.id("LearnRegisterLink4")));
		addField(FieldName.QUICK_REORDER_LINK, new Field(FieldType.LINK, By.id("LearnRegisterLink5")));
		addField(FieldName.REGISTER_HERE_LINK, new Field(FieldType.LINK, By.xpath("//a[@href='/register/email' and contains(@class, 'a-button-tertiary')]")));
		addField(FieldName.YOUR_SHOPPING_CART_EMPTY, new Field(FieldType.SECTION, By.xpath("//div[contains(@class, 'col-xs-12')]//h2[contains(., 'Your shopping cart is empty')]")));
		addField(FieldName.SEARCHING_ITEM_BAR, new Field(FieldType.SECTION, By.xpath("//div[contains(@class, 'o-cart-empty-search-products row')]")));
		addField(FieldName.LEARN_MORE_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//div[@class='o-wrapper-info']")));
		addField(FieldName.LEARN_MORE, new Field(FieldType.LINK, By.xpath("//a[contains(@href, 'hybris.com') and contains(@class, 'a-display-block')]")));
		addField(FieldName.NEW_PRODUCTS_INNOVATIONS_LINK, new Field(FieldType.LINK, By.xpath(".//span[@class='a-link a-link--arrow-after']")));
		addField(FieldName.INNOVATION_MAGAZINE_MARKETING_BANNER, new Field(FieldType.BUTTON, By.xpath("//span[contains(@class, 'a-heading-editorial-h2') and contains(., 'Innovation Magazin')]")));
		addField(FieldName.BANNER_CONTAINERS_SHOPPING_CART, new Field(FieldType.SECTION, By.xpath("//ul[contains(@class, 'o-cart-empty-teasers')]")));
		addField(FieldName.NEW_PRODUCTS_MARKETING_BANNER, new Field(FieldType.BUTTON, By.xpath("//span[contains(@class, 'a-heading-editorial-h2') and contains(., 'New Products & Innovations')]")));
		addField(FieldName.LEARN_MORE_SHOPPING_CART_POPUP, new Field(FieldType.SECTION, By.xpath("//div[contains(@class, 'tooltipster-content')]")));
		addField(FieldName.FLEET_PRODUCTS_TABLE, new Field(FieldType.SECTION, By.xpath("//table[@class='m-cart--table']/ancestor::div[@id='m-cart-fleet-items']")));
		addField(FieldName.FLEET_PRODUCTS_TABLE_CONTENT, new Field(FieldType.SECTION, By.xpath("//div[@id='m-cart-fleet-items']/table/tbody")));
		addField(FieldName.STANDARD_PRODUCTS_HEADER, new Field(FieldType.SECTION, By.xpath("//div[@id='m-cart-purchase-items']")));
		addField(FieldName.STANDARD_PRODUCTS_TABLE, new Field(FieldType.SECTION, By.xpath("//div[@id='m-cart-purchase-items']/table")));
		addField(FieldName.STANDARD_PRODUCTS_TABLE_CONTENT, new Field(FieldType.SECTION, By.xpath("//div[@id='m-cart-purchase-items']/table/tbody")));
		addField(FieldName.SOFTWARE_PRODUCTS_HEADER, new Field(FieldType.SECTION, By.xpath("//div[@id='m-cart-software-items']")));
		addField(FieldName.SOFTWARE_PRODUCTS_TABLE, new Field(FieldType.SECTION, By.xpath("//div[@id='m-cart-software-items']/table")));
		addField(FieldName.SOFTWARE_PRODUCTS_TABLE_CONTENT, new Field(FieldType.SECTION, By.xpath("//div[@id='m-cart-software-items']/table/tbody")));
		addField(FieldName.FLEET_CONTRACT_INFORMATION_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//a[contains(@class, 'fleet-contr-link')]")));
		addField(FieldName.FLEET_CONTRACT_INFORMATION_POPUP, new Field(FieldType.SECTION, By.xpath("//table[contains(@class, 'favorite-list--fleet-tooltip')]")));
		addField(FieldName.TABLE_USAGE_PERIOD_COLUMN, new Field(FieldType.SECTION, By.xpath(".//td[contains(@class, 'm-cart--td-single m-cart--LG-td')]")));
		addField(FieldName.TABLE_INVOICE_COLUMN, new Field(FieldType.SECTION, By.xpath(".//td[contains(@class, 'm-cart--td-single m-cart--XL-td')]")));
		addField(FieldName.TABLE_PRICE_COLUMN, new Field(FieldType.SECTION, By.xpath(".//td[contains(@class, 'm-cart--td-price') and contains(., 'Piece') or contains(., 'Box')]")));
		addField(FieldName.NOT_LOGGED_IN_TABLE_PRICE_COLUMN, new Field(FieldType.SECTION, By.xpath("(//td[@class='m-cart--td-price'])[1]")));
		addField(FieldName.TABLE_TOTAL_PRICE_COLUMN, new Field(FieldType.SECTION, By.xpath(".//td[@class='m-cart--td-price' and not(contains(., 'Piece')) and not(contains(., 'Box'))]")));
		addField(FieldName.TABLE_AMOUNT_COLUMN, new Field(FieldType.SECTION, By.xpath(".//td[contains(@class, 'm-cart--td-input')]")));
		addField(FieldName.TABLE_AMOUNT_LABEL, new Field(FieldType.SECTION, By.xpath(".//label[contains(@class, 'a-align-right') and contains(., 'Piece')]")));
		addField(FieldName.TABLE_SEE_PRODUCT_DETAILS_LINK, new Field(FieldType.LINK, By.xpath("//a[contains(@class, 'a-link a-link--arrow-after js-see-details')]")));
		addField(FieldName.TABLE_ADD_TO_FAVORITES_BUTTON, new Field(FieldType.LINK, By.xpath(".//td[contains(@class, 'm-cart--btn-add m-cart--row-action-add')]/a[@class='a-link a-icon-create js--btn-add js-show-add-favorite']")));
		addField(FieldName.TABLE_ADD_TO_FAVORITES_DROPDOWN, new Field(FieldType.SECTION, By.xpath(".//div[contains(@class, 'js-favorite-wrap')]")));
		addField(FieldName.TABLE_ADD_TO_FAVORITES_TEXTFIELD, new Field(FieldType.TEXT, By.xpath(".//input[@id='createNewList']")));
		addField(FieldName.TABLE_ADD_TO_FAVORITES_CREATE_LIST_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//button[contains(@class, 'a-button-secondary a-icon-createnew-after js-send-new-list')]")));
		addField(FieldName.TABLE_ADD_TO_FAVORITES_CREATE_NEW_LIST_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//button[contains(@class, 'a-button-secondary a-icon-createnew-after js-create-new-list')]")));
		addField(FieldName.FLEET_SUBTOTAL_MANAGEMENT_ITEMS, new Field(FieldType.SECTION, By.xpath("//div[@id='m-cart-fleet-items']/div[contains(@class, 'm-cart--footer')]")));
		addField(FieldName.MONTHLY_FEE_LEARN_MORE_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//span[@class='a-tooltip a-icon-info a-tooltip-icon tooltipstered']/ancestor::td")));
		addField(FieldName.MONTHLY_FEE_LEARN_MORE_POPUP, new Field(FieldType.SECTION, By.xpath("//div[@class='tooltipster-box']")));
		addField(FieldName.MONTHLY_FEE_LEARN_MORE_POPUP_CLOSE_BUTTON, new Field(FieldType.DIV, By.xpath(".//span[contains(@class, 'tooltip-closer')]")));
		addField(FieldName.UPFRONT_PRICE_LEARN_MORE_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//a[contains(@data-content, '<strong>Upfront Price</strong>')]")));
		addField(FieldName.UPFRONT_PRICE_LEARN_MORE_POPUP, new Field(FieldType.SECTION, By.xpath(".//div[contains(@class, 'tooltipster-base a-tooltiplayer')")));
		addField(FieldName.TABLE_REMOVE_ITEM_BUTTON, new Field(FieldType.BUTTON, By.xpath("(//button[@class='a-button-link'])[2]")));
		addField(FieldName.ONE_TIME_LEARN_MORE_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//span[@class='a-tooltip a-icon-info a-tooltip-icon tooltipstered']/ancestor::td")));
		addField(FieldName.ONE_TIME_LEARN_MORE_POPUP, new Field(FieldType.SECTION, By.xpath("//div[@class='tooltipster-box']")));
		addField(FieldName.ONE_TIME_LEARN_MORE_POPUP_CLOSE_BUTTON, new Field(FieldType.DIV, By.xpath(".//span[contains(@class, 'tooltip-closer')]")));
		addField(FieldName.YEARLY_FEE_LEARN_MORE_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//span[@class='a-tooltip a-icon-info a-tooltip-icon tooltipstered']/ancestor::td")));
		addField(FieldName.YEARLY_FEE_LEARN_MORE_POPUP, new Field(FieldType.SECTION, By.xpath("//div[@class='tooltipster-box']")));
		addField(FieldName.YEARLY_FEE_LEARN_MORE_POPUP_CLOSE_BUTTON, new Field(FieldType.DIV, By.xpath(".//span[contains(@class, 'tooltip-closer')]")));
		addField(FieldName.REMOVE_ALL_ITEMS_BUTTON, new Field(FieldType.BUTTON, By.xpath("(//a[contains(@class, 'remove-all-items')])[1]")));
		addField(FieldName.REPLACE_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//td[contains(@class, 'replaceBtn')]//button")));
		addField(FieldName.LEARN_MORE_SHOPPING_CART, new Field(FieldType.SECTION, By.xpath(".//a[@class='a-link a-display-block']")));
		addField(FieldName.TABLE_DESCRIPTION_COLUMN, new Field(FieldType.SECTION, By.xpath(".//div[contains(@class, 'm-cart--td-info-description')]")));
		addField(FieldName.TABLE_ADD_TO_FAVORITES_CLOSE_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//a[@class='a-link--close js-close-favlist']")));
		addField(FieldName.STANDARD_SUBTOTAL_MANAGEMENT_ITEMS, new Field(FieldType.SECTION, By.xpath("//div[@id='m-cart-purchase-items']/div[contains(@class, 'm-cart--footer')]")));
		addField(FieldName.SOFTWARE_SUBTOTAL_MANAGEMENT_ITEMS, new Field(FieldType.SECTION, By.xpath("//div[@id='m-cart-software-items']/div[contains(@class, 'm-cart--footer')]")));
		addField(FieldName.TABLE_PACKAGING_UNIT_COLUMN, new Field(FieldType.SECTION, By.xpath(".//td[contains(@class, 'm-cart--td-packagingunit m-cart--LG-td')]")));
		addField(FieldName.TABLE_BILLING_CYCLE_COLUMN, new Field(FieldType.SECTION, By.xpath(".//td[@class='m-cart--td-single m-cart--LG-td']")));
		addField(FieldName.REMOVE_ALL_ITEMS_POPUP, new Field(FieldType.SECTION, By.xpath("//div[contains(@class, 'js-remove-all-items')]")));
		addField(FieldName.CONFIRM_REMOVING_ALL_ITEMS, new Field(FieldType.BUTTON, By.xpath("//a[@href='/cart/remove-all']")));
		addField(FieldName.TABLE_AMOUNT_TEXTFIELD, new Field(FieldType.TEXT, By.xpath(".//input[@id='shopping-cart-input_1']")));
		addField(FieldName.TABLE_UPDATE_QUANTITY_BUTTON, new Field(FieldType.BUTTON, By.xpath("//div[@class='a-button-wrapper js-update-save-btn btn-is-hidden']")));
		addField(FieldName.STANDARD_PRODUCTS_REPLACEMENT_TABLE, new Field(FieldType.SECTION, By.xpath("//tbody[contains(@class, 'outStockReplace')]")));
		addField(FieldName.OUT_OF_STOCK_MESSAGE, new Field(FieldType.SECTION, By.xpath(".//div[contains(@id, 'message_out_stock')]")));
		addField(FieldName.REPLACEMENT_ROW, new Field(FieldType.SECTION, By.xpath(".//tr[contains(@class, 'm-cart--row--replacement')]")));
		addField(FieldName.TABLE_REPLACE_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//button[@class='a-button-primary']")));
		addField(FieldName.REMOVE_FROM_CART_REPLACEMENT_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//button[@class='a-button-secondary']")));
		addField(FieldName.REPLACEMENT_ERROR_MESSAGE_BOX, new Field(FieldType.SECTION, By.id("invalidCartErrorMessage")));
		addField(FieldName.MOVE_TO_PURCHASE_ITEMS_BUTTON, new Field(FieldType.BUTTON, By.xpath("(//button[@id='moveToPurchaseButton'])[2]")));
		addField(FieldName.CLICK_AND_COLLECT_CHECKBOX, new Field(FieldType.CHECKBOX	, By.xpath(".//label[@for='clickAndCollectCheckbox']")));
		addField(FieldName.CHANGE_hybris_CENTER_POPUP, new Field(FieldType.SECTION, By.xpath(".//div[contains(@class, 'featherlight-inner')]")));
		addField(FieldName.ENTER_ZIP_CODE_OR_CITY_TEXTFIELD, new Field(FieldType.TEXT, By.id("storelocator_input")));
		addField(FieldName.CHANGE_hybris_CENTER_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//a[@class='a-button-tertiary js-triggerlink-storelocator']")));
		addField(FieldName.SEARCH_LOCATION_BUTTON, new Field(FieldType.BUTTON, By.id("storelocator-cart_submit")));
		addField(FieldName.SELECT_hybris_CENTER_OVERLAY_BUTTON, new Field(FieldType.BUTTON, By.xpath("//a[@class='a-button-tertiary js-selected-store-link']")));
		addField(FieldName.LOCATION_MAP, new Field(FieldType.DIV, By.xpath(".//div[@id='storelocator-cart']")));
		addField(FieldName.USE_MY_LOCATION_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//button[@id='storelocator-cart_map-current']")));
		addField(FieldName.CLOSE_OVERLAY_BUTTON, new Field(FieldType.BUTTON, By.xpath("//span[contains(@class, 'featherlight-close')]")));
		addField(FieldName.SELECTED_hybris_CENTER, new Field(FieldType.SECTION, By.xpath("//span[@class='selected-store-text']")));
		addField(FieldName.hybris_CENTER_ADDRESS_COLUMN, new Field(FieldType.SECTION, By.xpath("(//dl[contains (@class, 'column') and contains(., 'Address')])[2]")));
		addField(FieldName.hybris_CENTER_OPENING_HOURS_COLUMN, new Field(FieldType.SECTION, By.xpath("(//dl[contains (@class, 'column') and contains(., 'Opening')])[2]")));
		addField(FieldName.STORE_LOCATOR_TEXTFIELD, new Field(FieldType.TEXT, By.id("storelocator-cart_input")));
        addField(FieldName.SECOND_hybris_CENTER_NAME, new Field(FieldType.TEXT, By.xpath("(//span[@class='hybris-center-name'])[2]")));
        addField(FieldName.CURRENTLY_OPENED_hybris_CENTER, new Field(FieldType.DIV, By.xpath("//li[contains(@class, 'is-open')]")));
		addField(FieldName.hybris_CENTER_SELECT_BUTTON, new Field(FieldType.BUTTON, By.xpath("//li[contains(@class, 'is-open')]//button[@type='submit' and @class='js-accordion-preventor js-map-storeselector']")));
		
		addField(FieldName.CHECK_AVAILABILITY_LINK, new Field(FieldType.LINK, By.xpath("//td[contains(@class, 'm-cart--btn-check')]//a[contains(@class, 'a-icon-avaiability')]")));
		addField(FieldName.CHECK_AVAILABILITY_OVERLAY, new Field(FieldType.SECTION, By.xpath("//div[contains(@id, 'overlay-storelocator-availability')]")));
		addField(FieldName.CHECK_AVAILABILITY_OVERLAY_TABLE, new Field(FieldType.SECTION, By.xpath("//table[contains(@class, 'm-table m-table--productinfo')]/tbody")));
		addField(FieldName.ADD_TO_CART_OVERLAY_WIDGET, new Field(FieldType.SECTION, By.xpath("(//div[contains(@class, 'm-wrapper')])[1]")));
		addField(FieldName.PICK_UP_FROM_HC_OVERLAY_WIDGET, new Field(FieldType.SECTION, By.xpath("(//div[contains(@class, 'm-wrapper')])[3]")));
		addField(FieldName.OVERLAY_TABLE_DESCRIPTION_FIELD, new Field(FieldType.DIV, By.xpath(".//td[2]")));
		addField(FieldName.OVERLAY_TABLE_PACKAGING_UNIT_FIELD, new Field(FieldType.DIV, By.xpath(".//td[2]")));
		addField(FieldName.OVERLAY_TABLE_PRICE_FIELD, new Field(FieldType.DIV, By.xpath(".//td[4]")));
		addField(FieldName.OVERLAY_TABLE_MINATURE_IMAGE, new Field(FieldType.IMAGE, By.xpath(".//td[contains(@class, 'm-table-td--image')]")));
		addField(FieldName.OVERLAY_TABLE_QUANTITY_TEXTIELD, new Field(FieldType.TEXT, By.xpath("(//input[contains(@id, 'shopping-cart-input')])[2]")));
		addField(FieldName.OVERLAY_TABLE_CHECK_AVAILABILITY_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//button[@type='submit' and contains(@class, 'js-availability-submit')]")));
		addField(FieldName.OVERLAY_TABLE_INSTRUCTION_NOTE, new Field(FieldType.TEXT, By.xpath(".//div[contains(@class, 'm-form-pieces-information')]")));
		addField(FieldName.AVAILABILITY_NOTIFICATION, new Field(FieldType.TEXT, By.xpath(".//div[contains(@class, 'm-message')]")));
		addField(FieldName.ADD_TO_CART_OVERLAY_QUANTITY_TEXTFIELD, new Field(FieldType.TEXT, By.xpath(".//input[contains(@id, 'quantity')]")));
		addField(FieldName.ADD_TO_CART_OVERLAY_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//button[contains(@type, 'submit') and contains(@class, 'js-add-to-cart')]")));
		addField(FieldName.CHECK_AVAILABILITY_OVERLAY_CITY_TEXTFIELD, new Field(FieldType.TEXT, By.xpath(".//input[contains(@type, 'search') and contains(@id, 'storelocator-availability')]")));
		addField(FieldName.CHECK_AVAILABILITY_OVERLAY_SEARCH_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//button[contains(@id, 'storelocator-availability') and contains(@id, 'submit')]")));
		addField(FieldName.OVERLAY_USE_MY_LOCATION_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//button[contains(@class, 'a-map-locator') and contains(@id, 'storelocator-availability')]")));
		addField(FieldName.OVERLAY_HC_CITY_LIST, new Field(FieldType.SECTION, By.xpath("//ul[contains(@id, 'storelocator-availability')]")));
		addField(FieldName.OVERLAY_CITY_LIST_POSITION, new Field(FieldType.DIV, By.xpath(".//li[contains(@class, 'a-map-details')]")));
		addField(FieldName.OVERLAY_GET_DIRECTIONS_LINK, new Field(FieldType.LINK, By.xpath(".//div[contains(@class, 'column ')]//a[contains(@class, 'a-link--arrow-after')]")));
		addField(FieldName.OVERLAY_OPENING_HOURS_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//a[contains(@class, 'a-tooltip') and contains(@data-content, 'openinghours-wrap')]")));
		addField(FieldName.OVERLAY_OPENING_HOURS_POPUP, new Field(FieldType.SECTION, By.xpath("//div[contains(@class, 'tooltipster-content')]")));
		addField(FieldName.OVERLAY_OPENING_HOURS_POPUP_CLOSE_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//span[contains(@class, 'a-tooltip-closer')]")));
		addField(FieldName.OVERLAY_hybris_CENTER_MAP, new Field(FieldType.DIV, By.xpath(".//div[contains(@class, 'm-wrapper')]//div[contains(@class, 'a-map-wrapper')]")));
		addField(FieldName.CHECK_AVAILABILITY_OVERLAY_CLOSE_BUTTON, new Field(FieldType.BUTTON, By.xpath("//div[contains(@class, 'featherlight')]//span[contains(@class, 'featherlight-close')]")));
	}
}