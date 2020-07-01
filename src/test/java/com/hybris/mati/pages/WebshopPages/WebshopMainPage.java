package com.hybris.mati.pages.WebshopPages;

import org.openqa.selenium.By;

import com.hybris.utils.*;

public class WebshopMainPage extends Page{

	public enum FieldName implements Storable {	
		ACCOUNT_DASHBOARD, //section
		CLOSE_BUTTON,
		ACCOUNT_SELECTION, //section
		ANCHOR_SELECTOR_BUTTON, // in PRODUCT_OR_CATEGORY_LIST section
		BACK_BUTTON, // in section NAVIGATION_MENU
		CHOOSE_ACCOUNT_DROPDOWN,
		CHOOSE_ACCOUNT_DROPDOWN_CONTENT,
		CHOOSE_ACCOUNT_FROM_DASHBOARD_DROPDOWN,
		CONTINUE_LOGIN_BUTTON,
		CONTACT_US_BUTTON, //in LOGIN_OR_REGISTER section
		DASHBOARD_QUICK_LINK,
		CALL_US,
		PLEASE_CONTACT_US_IF_YOU_NEED_ASSISTANCE_LINK,
		
		EMAIL_ADDRESS_TEXTFIELD,
		EMAIL_ADDRESS_AUTOLOGOUT_TEXTFIELD,
		EMAIL_ERROR_MESSAGE,
		FORGOTTEN_PASSWORD, //section
		FORGOTTEN_PASSWORD_BUTTON,
		FORGOTTEN_PASSWORD_CANCEL_BUTTON,
		FORGOTTEN_PASSWORD_CLOSE_BUTTON,
		FORGOTTEN_PASSWORD_CONTINUE_BUTTON,
		FORGOTTEN_PASSWORD_EMAIL_ADDRESS_TEXTFIELD,
		FORGOTTEN_PASSWORD_SUCCESS, //section
		FORGOTTEN_PASSWORD_ERROR, //section
		FOOTER_BOTTOM,
		FOOTER_MIDDLE,
		GO_TO_COMPANY_LISTS_LINK, // in ACCOUNT_DASHBOARD section
		GO_TO_FAVORITE_LISTS_LINK, // in ACCOUNT_DASHBOARD section
		GO_TO_REGISTRATION_LINK,
		HAMBURGER_BUTTON,
		HEADER, //section
		SHOPPING_CART_BUTTON, // in HEADER section
		hybris_LOGO_BUTTON,
		HOME_BUTTON, // in NAVIGATION_MENU
		I_UNDERSTAND_BUTTON,
		I_UNDERSTAND_COOKIES, //section
		KEEP_ME_LOGGED_IN_LABEL_CHECKBOX,
		KEEP_ME_LOGGED_IN_LABEL_AUTOLOGOUT_CHECKBOX,
		KEEP_ME_LOGGED_IN_CHECKBOX,
		LANGUAGE_BUTTON,
		LOG_IN_OR_REGISTER, //section
		LOG_IN_BUTTON,
		LOG_IN_OR_REGISTER_BUTTON,
		CONTACT_US_OFF_CANVAS_BUTTON,
		NEW_PRODUCTS_AND_INNOVATIONS, //section
		MAKE_IT_FIT_BUTTON, // in PRODUCT_OR_CATEGORY_LIST section
		
		MANAGE_YOUR_ACCOUNT, //section
		YOUR_ORDERS, //section
		YOUR_FAVORITE_LISTS, //section
		MANAGE_YOUR_TOOLS, //section
		
		MENU_BAR, //section
		MARKETING_BANNER,
		NAVIGATION_MENU, //section
		PRODUCTS_BUTTON, //in MENU_BAR section
		
		PRODUCT_OR_CATEGORY_LIST_NAVIGATION_BAR,
		PRODUCT_OR_CATEGORY_LIST, //section
		PRODUCT_OR_CATEGORY_LIST_CLOSE_BUTTON,
		PRODUCT_OR_CATEGORY_NAMES, // in PRODUCT_OR_CATEGORY_LIST section
		PRODUCT_OR_CATEGORY_LOADING_INDICATOR,
		
		PASSWORD_ERROR_MESSAGE,
		PASSWORD_AUTOLOGOUT_TEXTFIELD,
		PASSWORD_TEXTFIELD,
		RECOMMENDED_PRODUCTS, //section
		REGISTER_HERE_BUTTON,
		RESET_PASSWORD_BUTTON,
		USER_ACCOUNT_BUTTON, // in HEADER section
		WRONG_PASSWORD_ERRORBOX,
		SHOW_PASSWORD_CHECKBOX,
		SLICK_BOX, //in RECOMMENDED_PRODUCTS section
		SLIDER_DOTS, //in RECOMMENDED_PRODUCTS section
		VIEW_YOUR_ORDER_LIST_LINK,
		WANT_TO_KNOW_MORE_1ST_LEVEL_BUTTON, // in PRODUCT_OR_CATEGORY_LIST section
		WANT_TO_KNOW_MORE_2ND_LEVEL_BUTTON, // in PRODUCT_OR_CATEGORY_LIST section
		WANT_TO_KNOW_MORE_3RD_LEVEL_BUTTON, // in PRODUCT_OR_CATEGORY_LIST section
		
		WHOLE_SITE_CONTENT, //section

		VIEW_YOUR_PROFILE_LINK,
		YOUR_ACCOUNT,
		CHANGE_EMAIL_FORM,
		EDIT_EMAIL_BUTTON,
		EMAIL_CHANGE_TEXTFIELD,
		EMAIL_CHANGE_SHOW_PASSWORD_CHECKBOX,
		CONFIRM_PASSWORD_TEXFIELD,
		EMAIL_CHANGE_BUTTON,
		EMAIL_CHANGE_CANCEL_BUTTON,
		YOUR_LOGIN_DATA,
		SUCCESS_MESSAGE_BOX,
		ALERT_MESSAGE_BOX,
		ERROR_MESSAGE_BOX,
		EDIT_PASSWORD_BUTTON,
		PASSWORD_CHANGE_BUTTON,
		NEW_PASSWORD_TEXTFIELD,
		REPEAT_NEW_PASSWORD_TEXTFIELD,
		CHANGE_PASSWORD_FORM,
		CURRENT_PASSWORD_TEXTFIELD,

		QUICK_ITEM_ENTRY_TEXTFIELD, //text field on cart page
		DO_YOU_NEED_HELP,
		DONT_ASK_ME_AGAIN_BUTTON,
		CHAT_NOW_BUTTON, // in DO_YOU_NEED_HELP section
		DUMMY_EMAIL_ADDRESS,
		
		CONTACT_US, // section 
		YOUR_NAME_CHAT_TEXTFIELD, // in CONTACT_US section
		YOUR_EMAIL_CHAT_TEXTFIELD, // in CONTACT_US section
		YOUR_QUESTION_CHAT_TEXTFIELD, // in CONTACT_US section
		SUBMIT_CHAT_BUTTON, // in CONTACT_US section
		
		FOOTER_TOP,
		FIND_hybris_STORE_BUTTON,
		CALL_ME_BACK_LINK,
		LET_US_CALL_YOU_BACK_OFF_OFF_CANVAS_BUTTON,
		LIVE_CHAT_WITH_US_OFF_CANVAS_BUTTON,
		SEND_US_A_MESSAGE_OFF_CANVAS_BUTTON,
		LET_US_CALL_YOU_BACK,
		LET_US_CALL_YOU_BACK_OFF_CANVAS,
		SEND_US_A_MESSAGE_OFF_CANVAS,
		LIVE_CHAT_WITH_US_OFF_CANVAS,
		YOUR_NAME_CALLBACK_TEXTFIELD,
		YOUR_PHONE_NUMBER_TEXTFIELD,
		SUBMIT_CALLBACK_BUTTON,
		SERVICE_HOTLINE_LINK,
		LIVE_CHAT_LINK,
		LIVE_CHAT_WITH_US,
		FEEDBACK_EMAIL_FORM_LINK,
		SEND_US_MESSAGE,
		FIND_A_hybris_CENTER_LINK,
		
		QUICK_ITEM_ENTRY,
		ADD_TO_CART_BUTTON,
		MAINSTAGE_CONTAINER,
		MAIN_IMAGE, //in section MAINSTAGE_CONTAINER
		TITLE, //in section MAINSTAGE_CONTAINER
		SUBTITLE, //in section MAINSTAGE_CONTAINER
		QUICK_ACCESS_CONTAINER,
		DOWNLOADS, //in section QUICK_ACCESS_CONTAINER
		TRADE_SELECTOR,
		TRADE_PLEASE_CHOOSE_BUTTON, //in section TRADE_SELECTOR
		TRADE_DROPDOWN_LIST, 
		TRADE_OPTION,
		CLOSE_AUTO_LOGOUT_BUTTON, // in AUTO_LOGOUT section
		CLOSE_CHAT_BUTTON, // in CONTACT_US section
		CLOSE_NEED_HELP_WINDOW_BUTTON, // in CONTACT_US section
		SEARCH_BUTTON, // in CONTACT_US section
		CONTACT_US_OFF_CANVAS,
		CATEGORY_PAGE_TITLE,
		CATEGORY_ELEMENTS,

		BREADCRUMB_HOME,
		BREADCRUMB_LEVEL1,
		BREADCRUMB_LEVEL2,
		BREADCRUMB_LEVEL3,

		PRODUCT_SEARCH_TEXTFIELD,
		SUGGESTED_PRODUCTS_LIST,
		SHOW_ALL_RESULTS_BUTTON,
		PRODUCT_LIST_SUGGESTION,
		NO_PRODUCT_FOUND_NOTIFICATION,
		OPEN_DASHBOARD_BUTTON,
		LOG_OUT_BUTTON,
		MARKETING_BUBBLE,
		AUTO_LOGOUT, //section
		ERROR_MESSAGE_AUTO_LOGOUT, // in AUTO_LOGOUT section
		FORGOT_YOUR_PASSWORD_AUTO_LOGOUT_BUTTON, // in AUTO_LOGOUT section
		CONTACT_US_AUTO_LOGOUT_BUTTON, // in AUTO_LOGOUT section
		ONE_MORE_THING_BANNER,
		DO_NOT_ASK_AGAIN_BUTTON,
		SHOPPING_CART_ANIMATION_POPUP,
		GO_TO_SHOPPING_CART_BUTTON, // in SHOPPING_CART_ANIMATION_POPUP section
		CLOSE_SHOPPING_CART_ANIMATION_POPUP_BUTTON, // in SHOPPING_CART_ANIMATION_POPUP section
		FLYOUT, //section
		NAVIGATION_BREADCRUMB, //in section FLYOUT
		FLYOUT_CATEGORY,
		FIRST_FLYOUT_LINK,
		FLYOUT_LINK,
		CLOSE_FLYOUT_BUTTON,
		CURRENT_LANGUAGE,
		LOGIN_AS_EMAIL_ADDRESS_TEXTFIELD,
		REPAIR_TOOLS,    
        REORDER_LABELS,
        REPORT_LOST_STOLEN,
        REORDER_TOOLS,
        QUICK_ACCESS, // section
        QUICK_ACCESS_SHORT, // section
        QUICK_ACCESS_ITEM, // in QUICK_ACCESS section

		
	}
	
	public WebshopMainPage(){
		addField(FieldName.ACCOUNT_DASHBOARD, new Field(FieldType.DIV, By.xpath("//div[contains(@class, 'm-account-dashboard visible')]")));
		addField(FieldName.CLOSE_BUTTON, new Field(FieldType.BUTTON, By.xpath("//div[contains(@class, 'close-btn')]")));
		addField(FieldName.ACCOUNT_SELECTION, new Field(FieldType.DIV, By.xpath("//div[contains(@class, 'm-account-choose') and contains(@class, 'visible')]")));
		addField(FieldName.ANCHOR_SELECTOR_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//li//span[contains(., 'anchors selector')]")));
		addField(FieldName.BACK_BUTTON, new Field(FieldType.BUTTON, By.xpath("//li[contains(@class, 'back')]")));
		addField(FieldName.CHOOSE_ACCOUNT_DROPDOWN, new Field(FieldType.LIST, By.id("selectAccount_chosen")));
		addField(FieldName.CHOOSE_ACCOUNT_DROPDOWN_CONTENT, new Field(FieldType.LIST, By.xpath("//ul[@class='chosen-results']")));
		addField(FieldName.CHOOSE_ACCOUNT_FROM_DASHBOARD_DROPDOWN, new Field(FieldType.LIST, By.id("dashboardSelectAccountOverlayForm")));
		addField(FieldName.CONTINUE_LOGIN_BUTTON, new Field(FieldType.BUTTON, By.id("selectaccount")));
		addField(FieldName.CONTACT_US_BUTTON, new Field(FieldType.LINK, By.xpath(".//a[contains(@href, '#contact')]")));
		addField(FieldName.DASHBOARD_QUICK_LINK, new Field(FieldType.TEXT, By.xpath(".//ul/li")));
		
		addField(FieldName.LOGIN_AS_EMAIL_ADDRESS_TEXTFIELD, new Field(FieldType.TEXT, By.xpath("//input[contains(@id, 'login_as')]")));
		addField(FieldName.EMAIL_ADDRESS_TEXTFIELD, new Field(FieldType.TEXT, By.xpath("//input[contains(@id, 'login_email')]")));
		addField(FieldName.EMAIL_ADDRESS_AUTOLOGOUT_TEXTFIELD, new Field(FieldType.TEXT, By.xpath("(//input[contains(@id, 'login_email')])[2]")));
		addField(FieldName.FORGOTTEN_PASSWORD, new Field(FieldType.DIV, By.id("js-forgot-passw")));
		addField(FieldName.EMAIL_ERROR_MESSAGE, new Field(FieldType.TEXT, By.xpath("//span[contains(@id, 'error') and contains(@id, 'email')]")));
		addField(FieldName.FORGOTTEN_PASSWORD_BUTTON, new Field(FieldType.LINK, By.xpath("//span[contains(@class, 'forgot-passw-link')]")));
		addField(FieldName.FORGOTTEN_PASSWORD_CANCEL_BUTTON, new Field(FieldType.LINK, By.xpath("//div[contains(@class, 'm-forgot-pass-form-cancel-btn')]")));
		addField(FieldName.FORGOTTEN_PASSWORD_CLOSE_BUTTON, new Field(FieldType.BUTTON, By.xpath("//div[contains(@class, 'close-btn')]")));
		addField(FieldName.FORGOTTEN_PASSWORD_CONTINUE_BUTTON, new Field(FieldType.BUTTON, By.xpath("//button[contains(@class, 'forgot-pass-btn')]")));
		addField(FieldName.FORGOTTEN_PASSWORD_EMAIL_ADDRESS_TEXTFIELD, new Field(FieldType.TEXT, By.id("forgot_passord_email")));
		addField(FieldName.FORGOTTEN_PASSWORD_SUCCESS, new Field(FieldType.DIV, By.xpath("//div[contains(@class, 'forgotPassword')]//div[contains(@class, 'm-message--success')]")));
		addField(FieldName.FORGOTTEN_PASSWORD_ERROR, new Field(FieldType.DIV, By.xpath("//div[contains(@class, 'forgotPassword')]//div[contains(@class, 'm-message--error')]")));
		addField(FieldName.FOOTER_BOTTOM, new Field(FieldType.DIV, By.xpath("//div[contains(@class, 'footer-bottom')]")));
		addField(FieldName.FOOTER_MIDDLE, new Field(FieldType.DIV, By.xpath("//div[contains(@class, 'footer-middle')]")));
		addField(FieldName.GO_TO_COMPANY_LISTS_LINK, new Field(FieldType.LINK, By.xpath(".//a[@href='/myaccount-companylists#account-navigation']")));
		addField(FieldName.GO_TO_FAVORITE_LISTS_LINK, new Field(FieldType.LINK, By.xpath(".//a[@href='/myaccount-favlists#account-navigation']")));
		addField(FieldName.GO_TO_REGISTRATION_LINK, new Field(FieldType.LINK, By.xpath(".//a[@href='/register/email']")));
		addField(FieldName.HAMBURGER_BUTTON, new Field(FieldType.BUTTON, By.xpath("//button[contains(@class, 'js-navigation-menu')]")));
		addField(FieldName.HEADER, new Field(FieldType.SECTION, By.xpath("//ul[contains(@class, 'm-nav-meta')]")));
		addField(FieldName.SHOPPING_CART_BUTTON, new Field(FieldType.BUTTON, By.id("shoppingCartCount")));
		addField(FieldName.hybris_LOGO_BUTTON, new Field(FieldType.BUTTON, By.xpath("//a//img[contains(@src, 'logo')]")));
		addField(FieldName.HOME_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//li/a[contains(., 'Home')]")));
		addField(FieldName.I_UNDERSTAND_BUTTON, new Field(FieldType.BUTTON, By.xpath("//button[contains(@class, 'cookielayer-confirm')]")));
		addField(FieldName.I_UNDERSTAND_COOKIES, new Field(FieldType.DIV, By.xpath("//div[contains(@class, 'cookielayer')]")));
		addField(FieldName.KEEP_ME_LOGGED_IN_LABEL_CHECKBOX, new Field(FieldType.CHECKBOX, By.xpath(".//label[contains(@for, 'checkbox_1')]")));
		addField(FieldName.KEEP_ME_LOGGED_IN_LABEL_AUTOLOGOUT_CHECKBOX, new Field(FieldType.CHECKBOX, By.xpath("(//label[contains(@for, 'checkbox_1')])[2]")));
		addField(FieldName.KEEP_ME_LOGGED_IN_CHECKBOX, new Field(FieldType.CHECKBOX, By.xpath("//input[contains(@id, 'checkbox_1')]")));
		addField(FieldName.LANGUAGE_BUTTON, new Field(FieldType.BUTTON, By.xpath("//a[contains(@class, 'langbutton')]")));
		addField(FieldName.LOG_IN_OR_REGISTER, new Field(FieldType.DIV, By.xpath("//form[contains(@data-form-validator, 'loginForm')]")));
		addField(FieldName.LOG_IN_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//button[contains(@class, 'submit')]")));
		addField(FieldName.LOG_IN_OR_REGISTER_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//a[@data-set-hash='login']")));
		addField(FieldName.CONTACT_US_OFF_CANVAS_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//a[@data-set-hash='contact']")));
		addField(FieldName.NEW_PRODUCTS_AND_INNOVATIONS, new Field(FieldType.DIV, By.xpath("//ul[@class='js-navigation-stage']//a[contains(@class, 'secondary-news')]/span[contains(., 'New Products')]")));
		addField(FieldName.MAKE_IT_FIT_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//li//span[contains(., 'Make it fit')]")));
		
		addField(FieldName.MANAGE_YOUR_ACCOUNT, new Field(FieldType.DIV, By.xpath("//h3[contains(., 'Manage your account')]/ancestor::div[contains(@class, 'account-dashboard-panel')]")));
		addField(FieldName.YOUR_ORDERS, new Field(FieldType.DIV, By.xpath("//h3[contains(., 'Your orders')]/ancestor::div[contains(@class, 'account-dashboard-panel')]")));
		addField(FieldName.YOUR_FAVORITE_LISTS, new Field(FieldType.DIV, By.xpath("//h3[contains(., 'Your favorite lists')]/ancestor::div[contains(@class, 'account-dashboard-panel')]")));
		addField(FieldName.MANAGE_YOUR_TOOLS, new Field(FieldType.DIV, By.xpath("//h3[contains(., 'Tool')]/ancestor::div[contains(@class, 'account-dashboard-panel')]")));

		addField(FieldName.QUICK_ACCESS, new Field(FieldType.DIV, By.xpath("//div[@class='m-quick-access ']")));
		addField(FieldName.QUICK_ACCESS_SHORT, new Field(FieldType.DIV, By.xpath("//div[@class='m-quick-access m-quick-access--short']")));
		addField(FieldName.QUICK_ACCESS_ITEM, new Field(FieldType.DIV, By.xpath(".//li")));
		
		addField(FieldName.MENU_BAR, new Field(FieldType.BUTTON, By.xpath("//ul[contains(@class, 'js-nav-menu')]")));
		addField(FieldName.MARKETING_BANNER, new Field(FieldType.DIV, By.xpath("//div[contains(@class, 'o-header-bottom')]")));
		addField(FieldName.NAVIGATION_MENU, new Field(FieldType.LIST, By.xpath("//ul[contains(@class, 'secondary-stage-item-menu')]")));
		addField(FieldName.PRODUCTS_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//li/a[contains(@href, 'product')]")));
		
		addField(FieldName.PRODUCT_OR_CATEGORY_LIST_NAVIGATION_BAR, new Field(FieldType.DIV, By.xpath("//nav[contains(@class, 'breadcrumb')]/ul")));
		addField(FieldName.PRODUCT_OR_CATEGORY_LIST, new Field(FieldType.DIV, By.xpath("//div[contains(@class, 'js-navigation-layer')]")));
		addField(FieldName.PRODUCT_OR_CATEGORY_LIST_CLOSE_BUTTON, new Field(FieldType.BUTTON, By.xpath("//nav/a[contains(@class, 'close')]")));
		addField(FieldName.PRODUCT_OR_CATEGORY_NAMES, new Field(FieldType.BUTTON, By.xpath(".//li")));
		addField(FieldName.PRODUCT_OR_CATEGORY_LOADING_INDICATOR, new Field(FieldType.DIV, By.xpath("//li/a[contains(@class, 'is-loading')]")));
		addField(FieldName.PASSWORD_ERROR_MESSAGE, new Field(FieldType.TEXT, By.xpath("//span[contains(@id, 'error') and contains(@id, 'password')]")));
		addField(FieldName.PASSWORD_AUTOLOGOUT_TEXTFIELD, new Field(FieldType.TEXT, By.xpath("(//input[@id='login_password'])[2]")));
	    addField(FieldName.PASSWORD_TEXTFIELD, new Field(FieldType.TEXT, By.id("login_password")));
	    addField(FieldName.RECOMMENDED_PRODUCTS, new Field(FieldType.DIV, By.xpath("//div[@data-slider-type='product']")));
	    addField(FieldName.REGISTER_HERE_BUTTON, new Field(FieldType.BUTTON, By.xpath("//a[contains(@href, 'register')]")));
		addField(FieldName.SHOW_PASSWORD_CHECKBOX, new Field(FieldType.CHECKBOX, By.xpath("//label[contains(@for, 'show-passwords-login')]")));
		addField(FieldName.SLICK_BOX, new Field(FieldType.BUTTON, By.xpath("//li[contains(@class, 'm-slider-item') and @aria-hidden='false']//picture")));
		addField(FieldName.SLIDER_DOTS, new Field(FieldType.BUTTON, By.xpath("//ul[@class='m-slider-dots']")));
		addField(FieldName.RESET_PASSWORD_BUTTON, new Field(FieldType.TEXT, By.xpath("//a[@href='#forgotPassword']")));
		addField(FieldName.USER_ACCOUNT_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//a[contains(@class, 'is-loggedin')]")));
		addField(FieldName.VIEW_YOUR_ORDER_LIST_LINK, new Field(FieldType.LINK, By.xpath(".//a[@href='/myaccount-history/orders#account-navigation' and(contains(., 'order list'))]")));
		addField(FieldName.WRONG_PASSWORD_ERRORBOX, new Field(FieldType.DIV, By.xpath("//div[contains(@class, 'message--error')]")));
		
		addField(FieldName.WANT_TO_KNOW_MORE_1ST_LEVEL_BUTTON, new Field(FieldType.BUTTON, By.xpath("(//li//span[contains(., 'Want to know')])[1]")));
		addField(FieldName.WANT_TO_KNOW_MORE_2ND_LEVEL_BUTTON, new Field(FieldType.BUTTON, By.xpath("(//li//span[contains(., 'Want to know')])[2]")));
		addField(FieldName.WANT_TO_KNOW_MORE_3RD_LEVEL_BUTTON, new Field(FieldType.BUTTON, By.xpath("(//li//span[contains(., 'Want to know')])[3]")));
		
		addField(FieldName.WHOLE_SITE_CONTENT, new Field(FieldType.DIV, By.tagName("body")));

		addField(FieldName.VIEW_YOUR_PROFILE_LINK, new Field(FieldType.LINK, By.id("AccountPanelLink1")));
		
		addField(FieldName.DO_YOU_NEED_HELP, new Field(FieldType.DIV, By.xpath("//div[contains(@class, 'chat-popup is-active')]")));
		addField(FieldName.DONT_ASK_ME_AGAIN_BUTTON, new Field(FieldType.DIV, By.xpath("//span[contains(@class, 'js-dont-ask')]")));
		addField(FieldName.CHAT_NOW_BUTTON, new Field(FieldType.BUTTON, By.xpath("//button[contains(@class, 'js-open-chat')]")));
		
		addField(FieldName.PLEASE_CONTACT_US_IF_YOU_NEED_ASSISTANCE_LINK, new Field(FieldType.DIV, By.xpath("//a[@data-trigger='#contact_overlay']")));

		addField(FieldName.CALL_US, new Field(FieldType.DIV, By.id("contact_callus")));
		addField(FieldName.CONTACT_US, new Field(FieldType.DIV, By.xpath("//div[contains(@class, 'js-contact-modal')]/ancestor::div[1]")));
		addField(FieldName.YOUR_NAME_CHAT_TEXTFIELD, new Field(FieldType.TEXT, By.id("contoverlay-chat-name")));
		addField(FieldName.YOUR_EMAIL_CHAT_TEXTFIELD, new Field(FieldType.TEXT, By.id("contoverlay-chat-email")));
		addField(FieldName.YOUR_QUESTION_CHAT_TEXTFIELD, new Field(FieldType.TEXT, By.id("contoverlay-chat-question")));
		addField(FieldName.SUBMIT_CHAT_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//button[@data-track-action='Chat']")));

		addField(FieldName.FOOTER_TOP, new Field(FieldType.DIV, By.xpath("//div[contains(@class, 'footer-top')]")));
		addField(FieldName.FIND_hybris_STORE_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//a[contains(@class,'a-button-secondary')]")));
		addField(FieldName.CALL_ME_BACK_LINK, new Field(FieldType.LINK, By.xpath("//a[contains(., 'Call')]")));
		addField(FieldName.LET_US_CALL_YOU_BACK_OFF_OFF_CANVAS_BUTTON, new Field(FieldType.DIV, By.xpath(".//li[contains(., 'Let')]")));
		addField(FieldName.LIVE_CHAT_WITH_US_OFF_CANVAS_BUTTON, new Field(FieldType.DIV, By.xpath(".//li[contains(., 'Live')]")));
		addField(FieldName.SEND_US_A_MESSAGE_OFF_CANVAS_BUTTON, new Field(FieldType.DIV, By.xpath(".//li[contains(., 'Send')]")));
		addField(FieldName.LET_US_CALL_YOU_BACK, new Field(FieldType.DIV, By.xpath("(//div[@id='contact_callback'])[2]")));
		addField(FieldName.LET_US_CALL_YOU_BACK_OFF_CANVAS, new Field(FieldType.DIV, By.xpath("(//div[@id='contact_callback'])[1]")));
		addField(FieldName.LIVE_CHAT_WITH_US_OFF_CANVAS, new Field(FieldType.DIV, By.xpath("(//div[@id='contact_livechat'])[1]")));
		addField(FieldName.SEND_US_A_MESSAGE_OFF_CANVAS, new Field(FieldType.DIV, By.xpath("//form[@id='cont-send-message-form']")));
		addField(FieldName.YOUR_NAME_CALLBACK_TEXTFIELD, new Field(FieldType.TEXT, By.id("contoverlay-call-back-1")));
		addField(FieldName.YOUR_PHONE_NUMBER_TEXTFIELD, new Field(FieldType.TEXT, By.id("contoverlay-call-back-2")));
		addField(FieldName.SUBMIT_CALLBACK_BUTTON, new Field(FieldType.BUTTON, By.id("contoverlaysubmit-call-back")));
		addField(FieldName.SERVICE_HOTLINE_LINK, new Field(FieldType.BUTTON, By.xpath(".//a[contains(@href, 'tel:')]")));
        addField(FieldName.LIVE_CHAT_LINK, new Field(FieldType.BUTTON, By.xpath("//a[@href='#overlay/contact/livechat']")));
        addField(FieldName.LIVE_CHAT_WITH_US, new Field(FieldType.BUTTON, By.xpath("//div[contains(@id, 'contact_livechat') and contains(@class, 'is-open')]")));
        addField(FieldName.FEEDBACK_EMAIL_FORM_LINK, new Field(FieldType.BUTTON, By.xpath("//a[@href='#overlay/contact/sendmessage']")));
        addField(FieldName.SEND_US_MESSAGE, new Field(FieldType.BUTTON, By.xpath("//div[contains(@id, 'contact_sendmessage') and contains(@class, 'is-open')]")));
		addField(FieldName.FIND_A_hybris_CENTER_LINK, new Field(FieldType.BUTTON, By.xpath(".//a[@href='/stores']")));
		
		addField(FieldName.QUICK_ITEM_ENTRY_TEXTFIELD, new Field(FieldType.TEXT, By.xpath(".//textarea[@id='quickOrderText']")));
		addField(FieldName.ADD_TO_CART_BUTTON, new Field(FieldType.BUTTON, By.xpath("//div[@class='m-quickitem-button']")));
		addField(FieldName.QUICK_ITEM_ENTRY, new Field(FieldType.DIV, By.xpath("//div[contains(@class, 'quickitem-content')]")));
		addField(FieldName.SUCCESS_MESSAGE_BOX, new Field(FieldType.SECTION, By.id("quickItemSuccessMessage")));
		addField(FieldName.ERROR_MESSAGE_BOX, new Field(FieldType.SECTION, By.id("quickItemErrorMessage")));
		addField(FieldName.MAINSTAGE_CONTAINER, new Field(FieldType.DIV, By.xpath("//div[contains(@class,'homepage-header ')]")));
		addField(FieldName.MAIN_IMAGE, new Field(FieldType.IMAGE, By.xpath(".//a[contains(@class, 'm-hero-teaser')]//picture")));
		addField(FieldName.TITLE, new Field(FieldType.TEXT, By.xpath(".//div[@class='m-hero-teaser-content']/h3")));
		addField(FieldName.SUBTITLE, new Field(FieldType.TEXT, By.xpath(".//div[@class='m-hero-teaser-content']/p")));
		addField(FieldName.QUICK_ACCESS_CONTAINER, new Field(FieldType.DIV, By.xpath("//div[contains(@class,'m-quick-access ')]")));
		addField(FieldName.DOWNLOADS, new Field(FieldType.LINK, By.xpath(".//a[contains(text(),'Downloads')]")));
		addField(FieldName.TRADE_SELECTOR, new Field(FieldType.DIV, By.xpath("//div[@class='m-industry-selector ']")));
		addField(FieldName.TRADE_PLEASE_CHOOSE_BUTTON, new Field(FieldType.TEXT, By.xpath(".//a[contains(@class,'chosen-single')]")));
		addField(FieldName.TRADE_DROPDOWN_LIST, new Field(FieldType.DIV, By.xpath("//div[@class='chosen-drop']")));
		addField(FieldName.TRADE_OPTION, new Field(FieldType.LINK, By.xpath(".//ul/li[@class='active-result']")));
		addField(FieldName.CLOSE_CHAT_BUTTON, new Field(FieldType.BUTTON, By.xpath("//span[contains(@class, 'featherlight-close')]")));
		addField(FieldName.CLOSE_AUTO_LOGOUT_BUTTON, new Field(FieldType.BUTTON, By.xpath("//span[contains(@class, 'featherlight-close')]")));
		addField(FieldName.CLOSE_NEED_HELP_WINDOW_BUTTON, new Field(FieldType.BUTTON, By.xpath("//span[contains(@class, 'js-close-chat')]")));
		addField(FieldName.SEARCH_BUTTON, new Field(FieldType.BUTTON, By.xpath("//button[contains(@id, 'storelocator_submit')]")));
		addField(FieldName.CONTACT_US_OFF_CANVAS, new Field(FieldType.DIV, By.xpath("//div[contains(@class, 'o-offcanvas-content--contacts')]")));
		addField(FieldName.CATEGORY_PAGE_TITLE, new Field(FieldType.BUTTON, By.xpath("//h1[contains(@class, 'm-page-title-headline')]")));
		addField(FieldName.CATEGORY_ELEMENTS, new Field(FieldType.DIV, By.xpath("//ul[@class='list']//li")));
		
		addField(FieldName.BREADCRUMB_HOME, new Field(FieldType.LINK, By.xpath("//div[@class='m-breadcrumbs-col']//li[1]")));
		addField(FieldName.BREADCRUMB_LEVEL1, new Field(FieldType.LINK, By.xpath("//div[@class='m-breadcrumbs-col']//li[2]")));
		addField(FieldName.BREADCRUMB_LEVEL2, new Field(FieldType.LINK, By.xpath("//div[@class='m-breadcrumbs-col']//li[3]")));
		addField(FieldName.BREADCRUMB_LEVEL3, new Field(FieldType.LINK, By.xpath("//div[@class='m-breadcrumbs-col']//li[4]")));

		addField(FieldName.PRODUCT_SEARCH_TEXTFIELD, new Field(FieldType.TEXT, By.xpath(".//input[@id='search_input']")));
		addField(FieldName.SUGGESTED_PRODUCTS_LIST, new Field(FieldType.SECTION, By.id("ui-id-1")));
		addField(FieldName.SHOW_ALL_RESULTS_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//a[@class='search-result-link a-link--arrow-after']")));
		addField(FieldName.PRODUCT_LIST_SUGGESTION, new Field(FieldType.LINK, By.xpath("//a[@class='search-result-link']")));
		addField(FieldName.NO_PRODUCT_FOUND_NOTIFICATION, new Field(FieldType.DIV, By.xpath("//div[@class='m-nav-meta-search-results-wrap is-opened']")));

		addField(FieldName.OPEN_DASHBOARD_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//a[contains(@class, 'm-nav-meta-loginlink')]")));
		addField(FieldName.LOG_OUT_BUTTON, new Field(FieldType.BUTTON, By.xpath("//button[@value='Log out']")));

		addField(FieldName.MARKETING_BUBBLE, new Field(FieldType.DIV, By.xpath("//div[contains(@class, 'tooltipster-base')]")));
		addField(FieldName.AUTO_LOGOUT, new Field(FieldType.DIV, By.xpath("//div[contains(@class, 'm-logout js-logout')]")));
		addField(FieldName.ERROR_MESSAGE_AUTO_LOGOUT, new Field(FieldType.DIV, By.id("login_error_message")));
		addField(FieldName.FORGOT_YOUR_PASSWORD_AUTO_LOGOUT_BUTTON, new Field(FieldType.DIV, By.xpath("//span[@data-set-hash='forgotPassword']")));
		addField(FieldName.CONTACT_US_AUTO_LOGOUT_BUTTON, new Field(FieldType.DIV, By.xpath(".//span[@class='a-icon-contact-after']")));
		addField(FieldName.ONE_MORE_THING_BANNER, new Field(FieldType.DIV, By.xpath("//div[@class='o-cookielayer o-cookielayer--nomargin is-active']")));
		addField(FieldName.DO_NOT_ASK_AGAIN_BUTTON, new Field(FieldType.BUTTON, By.xpath("//a[@data-track-label='DoNotAskAgain']")));
		addField(FieldName.SHOPPING_CART_ANIMATION_POPUP, new Field(FieldType.DIV, By.xpath("//div[@id='m-add-to-cart-layer' and contains(@class, 'is-visible')]")));
		addField(FieldName.GO_TO_SHOPPING_CART_BUTTON, new Field(FieldType.BUTTON, By.xpath("//a[@href='/cart']")));
		addField(FieldName.CLOSE_SHOPPING_CART_ANIMATION_POPUP_BUTTON, new Field(FieldType.BUTTON, By.xpath("//div[@class='a-link a-link--close']")));
		addField(FieldName.FLYOUT, new Field(FieldType.DIV, By.xpath("//div[contains(@class, 'js-navigation-layer') and contains(@class, 'is-active')]")));
		addField(FieldName.NAVIGATION_BREADCRUMB, new Field(FieldType.DIV, By.xpath("//nav[contains(@class, 'breadcrumb')]")));
		addField(FieldName.FLYOUT_CATEGORY, new Field(FieldType.DIV, By.xpath("//li[@class='m-nav-secondary-stage-item is-active']/div/ul/li[not(contains(@class, 'is-empty'))]")));
		addField(FieldName.FIRST_FLYOUT_LINK, new Field(FieldType.TEXT, By.xpath("//li[@class='m-nav-secondary-stage-item is-active']/div[@class='colgroup']/ul/li[1]//li[1]")));
		addField(FieldName.FLYOUT_LINK, new Field(FieldType.TEXT, By.xpath("./ul/li")));
		addField(FieldName.CLOSE_FLYOUT_BUTTON, new Field(FieldType.BUTTON, By.xpath("//a[contains(@class, 'navigation-close')]")));
		addField(FieldName.CURRENT_LANGUAGE, new Field(FieldType.TEXT, By.xpath("//li[contains(@class, 'm-nav-meta-lang')]//a[contains(@class, 'is-active')]")));
		
		addField(FieldName.REPAIR_TOOLS, new Field(FieldType.LINK, By.id("ToolsPanelLink1")));
        addField(FieldName.REORDER_LABELS, new Field(FieldType.LINK, By.id("ToolsPanelLink2")));
        addField(FieldName.REPORT_LOST_STOLEN, new Field(FieldType.LINK, By.id("ToolsPanelLink3")));
        addField(FieldName.REORDER_TOOLS, new Field(FieldType.LINK, By.id("ToolsPanelLink4")));
        
        

	}
	
	public static By getProductOrCategoryOnListLocator(String productOrCategoryName){
		return By.xpath("//ul[@class='js-navigation-stage']//ul//span[text()='" + productOrCategoryName + "']");
	}
	
	public static By getProductOrCategoryVisibilityLocator(String productOrCategoryName){
		return By.xpath("//ul[@class='js-navigation-stage']/li/div[contains(@data-navigation-parent-name, '" + productOrCategoryName + "')]");
	}
}