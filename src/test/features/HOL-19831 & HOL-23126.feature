@Sprint5
Feature: HOL-19831 & HOL-23126 Framework - Header & Footer and Marketing Bubble

  Scenario: Framework - Header & Footer and Marketing Bubble
		Given General: open webshop for Canada
		When Webshop Main Page: MARKETING_BUBBLE is visible
		And Webshop Main Page: Element MARKETING_BUBBLE contains text common.label.marketingbanner
		And General: Scroll to the bottom
		And General: Scroll to the top
		Then Webshop Main Page: MARKETING_BUBBLE is visible
		And Webshop Main Page: Click outside of element MARKETING_BUBBLE
		And General: Wait 1 second
		Then Webshop Main Page: MARKETING_BUBBLE is not visible
		
		When General: open new tab
		And General: open webshop for Canada
		Then Webshop Main Page: MARKETING_BUBBLE is not visible
		When General: Discard last tab
		And General: Switch to tab number 1
		
		And Webshop Main Page: If section DO_YOU_NEED_HELP is visible click DONT_ASK_ME_AGAIN_BUTTON
		And Webshop Main Page: Section I_UNDERSTAND_COOKIES is visible
		When Webshop Main Page: In section HEADER element LOG_IN_OR_REGISTER_BUTTON is visible
		Then General: Scroll to the bottom
		And Webshop Main Page: Section I_UNDERSTAND_COOKIES is visible
		When Webshop Main Page: In section HEADER element LOG_IN_OR_REGISTER_BUTTON is visible
		Then General: Scroll to the top
		When Webshop Main Page: In section HEADER element LOG_IN_OR_REGISTER_BUTTON is visible
		And Webshop Main Page: If section I_UNDERSTAND_COOKIES is visible click I_UNDERSTAND_BUTTON
		And Webshop Main Page: If section ONE_MORE_THING_BANNER is visible click DO_NOT_ASK_AGAIN_BUTTON
		#Different countries buttons needed (to be automated as soon as the feature will be avaliable)
		When Webshop Main Page: Element LANGUAGE_BUTTON contains text EN
		
		#Click on HILTI logo
		When Webshop Main Page: In section HEADER click LOG_IN_OR_REGISTER_BUTTON
	    Then Webshop Main Page: Section LOG_IN_OR_REGISTER is visible
	    And Webshop Main Page: HILTI_LOGO_BUTTON is visible
		And Webshop Main Page: Click HILTI_LOGO_BUTTON
		Then Webshop Main Page: Section LOG_IN_OR_REGISTER is not visible
		
		#Click on Hamburger icon
		Given General: Set browser window dimension to 550x850
		When Webshop Main Page: Click HAMBURGER_BUTTON
		Then Webshop Main Page: Section NAVIGATION_MENU contains element HOME_BUTTON
		And Webshop Main Page: Click HAMBURGER_BUTTON
		And Webshop Main Page: Section NAVIGATION_MENU is not visible
		Then Webshop Main Page: Click HAMBURGER_BUTTON
		And Webshop Main Page: In section NAVIGATION_MENU click HOME_BUTTON
		And Webshop Main Page: Section NAVIGATION_MENU is not visible
		Then Webshop Main Page: Click HAMBURGER_BUTTON
		And Webshop Main Page: In section NAVIGATION_MENU click PRODUCTS_BUTTON
		And Webshop Main Page: Section PRODUCT_OR_CATEGORY_LIST is visible
		And Webshop Main Page: PRODUCT_OR_CATEGORY_LIST contains more than 1 PRODUCT_OR_CATEGORY_NAMES
		And Webshop Main Page: In section NAVIGATION_MENU click BACK_BUTTON
		Then Webshop Main Page: In section NAVIGATION_MENU click HOME_BUTTON
		And Webshop Main Page: Section NAVIGATION_MENU is not visible

		And Webshop Main Page: Section FOOTER_BOTTOM is visible
		And Webshop Main Page: Section FOOTER_BOTTOM contains text common.label.follow.hilti
		
	Scenario: Checking Marketing Bubble's reaction on cookie accept
		#HOL-27075 - verification
		Given General: open webshop for United States
		And General: Wait 2 seconds
		When Webshop Main Page: MARKETING_BUBBLE is visible
		And Webshop Main Page: Element MARKETING_BUBBLE contains text common.label.marketingbanner
		And Webshop Main Page: In section I_UNDERSTAND_COOKIES click I_UNDERSTAND_BUTTON
		And General: Wait 3 seconds
		Then Webshop Main Page: MARKETING_BUBBLE is visible
		And Webshop Main Page: Element MARKETING_BUBBLE contains text common.label.marketingbanner
		
	Scenario: Clicking Marketing Bubble
		#Enter the page - Check if header and Cookies policy are sticky
		Given General: open webshop for United States
		When Webshop Main Page: MARKETING_BUBBLE is visible
		And Webshop Main Page: Element MARKETING_BUBBLE contains text common.label.marketingbanner
		And Webshop Main Page: Click MARKETING_BUBBLE
		And General: Wait 1 second
		
		
		#HMC editable - following text won't be available in translations.
		Then Editorial Page: Element PAGE_HEADER contains text WANT FREE SHIPPING? ORDER ONLINE
		And Webshop Main Page: MARKETING_BUBBLE is not visible