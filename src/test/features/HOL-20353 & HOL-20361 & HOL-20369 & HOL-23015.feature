@Sprint4 
Feature: HOL-20353 and HOL-20361 and HOL-20369 and HOL-23015 Category pages navigation

   Scenario Outline: Category pages - want to know links
		Given General: open webshop for United States
		And Webshop Main Page: If section I_UNDERSTAND_COOKIES is visible click I_UNDERSTAND_BUTTON
		And Webshop Main Page: If section ONE_MORE_THING_BANNER is visible click DO_NOT_ASK_AGAIN_BUTTON
		And Webshop Main Page: If section DO_YOU_NEED_HELP is visible click DONT_ASK_ME_AGAIN_BUTTON
		
		#Enter Products page
		When Webshop Main Page: In section MENU_BAR click PRODUCTS_BUTTON
		And General: Wait 2 seconds
		Then Webshop Main Page: Section PRODUCT_OR_CATEGORY_LIST is visible
		And Webshop Main Page: Section PRODUCT_OR_CATEGORY_LIST_NAVIGATION_BAR contains text headerstaticcomponent.label.products
		And Webshop Main Page: PRODUCT_OR_CATEGORY_LIST contains more than 1 PRODUCT_OR_CATEGORY_NAMES
		And Webshop Main Page: In section PRODUCT_OR_CATEGORY_LIST element WANT_TO_KNOW_MORE_1ST_LEVEL_BUTTON is visible
		
		#Go to Want to know - 1st level category
		When Webshop Main Page: In section PRODUCT_OR_CATEGORY_LIST click WANT_TO_KNOW_MORE_1ST_LEVEL_BUTTON
		Then Webshop Main Page: Element CATEGORY_PAGE_TITLE contains text <CATEGORY_PAGE_1ST_LEVEL_TITLE>
		And Webshop Main Page: Page title contains text common.pages.CategoryOverview1stLevelPage.title
		Then Webshop Main Page: Element BREADCRUMB_LEVEL1 contains text <CATEGORY_PAGE_1ST_LEVEL_TITLE>
		When Webshop Main Page: Click BREADCRUMB_HOME
		Then Webshop Main Page: TRADE_SELECTOR is visible
		Then General: Go back
		
		#Go back to Products page
		When Webshop Main Page: In section MENU_BAR click PRODUCTS_BUTTON
		And General: Wait 2 seconds
		
		#Go to 2nd level category page
		And Webshop Main Page: On PRODUCT_OR_CATEGORY_LIST click category <CATEGORY_PAGE_2ND_LEVEL>
		And General: Wait 2 second
		And Webshop Main Page: In section PRODUCT_OR_CATEGORY_LIST element WANT_TO_KNOW_MORE_2ND_LEVEL_BUTTON is visible
		
		#Go to Want to know - 2nd level category
		When Webshop Main Page: In section PRODUCT_OR_CATEGORY_LIST click WANT_TO_KNOW_MORE_2ND_LEVEL_BUTTON
		And General: Wait 2 second
		Then Webshop Main Page: Element CATEGORY_PAGE_TITLE contains text <CATEGORY_PAGE_2ND_LEVEL>
		And Webshop Main Page: Page title contains text <CATEGORY_PAGE_2ND_LEVEL>
		Then Webshop Main Page: Element BREADCRUMB_LEVEL1 contains text <CATEGORY_PAGE_1ST_LEVEL_TITLE>
		Then Webshop Main Page: Element BREADCRUMB_LEVEL2 contains text <CATEGORY_PAGE_2ND_LEVEL>
		
		#Breadcrumb navigation 2nd level
		When Webshop Main Page: Click BREADCRUMB_HOME
		Then Webshop Main Page: TRADE_SELECTOR is visible
		Then General: Go back
		When Webshop Main Page: Click BREADCRUMB_LEVEL1
		Then Webshop Main Page: Element CATEGORY_PAGE_TITLE contains text <CATEGORY_PAGE_1ST_LEVEL_TITLE>
		And Webshop Main Page: Page title contains text common.pages.CategoryOverview1stLevelPage.title
		Then General: Go back
		
		#Go back to Products page
		When Webshop Main Page: In section MENU_BAR click PRODUCTS_BUTTON
		And General: Wait 2 second
		
		#Go to 3rd level category page
		And Webshop Main Page: On PRODUCT_OR_CATEGORY_LIST click category <CATEGORY_PAGE_2ND_LEVEL>
		And General: Wait 5 second
		And Webshop Main Page: On PRODUCT_OR_CATEGORY_LIST click category <CATEGORY_PAGE_3RD_LEVEL>
		And General: Wait 2 second
		
		#Go to Want to know - 3rd level category
		When Webshop Main Page: In section PRODUCT_OR_CATEGORY_LIST click WANT_TO_KNOW_MORE_3RD_LEVEL_BUTTON
		And General: Wait 2 second
		Then Webshop Main Page: Element CATEGORY_PAGE_TITLE contains text <CATEGORY_PAGE_3RD_LEVEL>
		And Webshop Main Page: Page title contains text <CATEGORY_PAGE_3RD_LEVEL>
		
		#Breadcrumb navigation 3rd level
		When Webshop Main Page: Click BREADCRUMB_HOME
		Then Webshop Main Page: TRADE_SELECTOR is visible
		Then General: Go back
		When Webshop Main Page: Click BREADCRUMB_LEVEL1
		Then Webshop Main Page: Element CATEGORY_PAGE_TITLE contains text <CATEGORY_PAGE_1ST_LEVEL_TITLE>
		And Webshop Main Page: Page title contains text common.pages.CategoryOverview1stLevelPage.title
		Then General: Go back
		When Webshop Main Page: Click BREADCRUMB_LEVEL2
		Then Webshop Main Page: Element CATEGORY_PAGE_TITLE contains text <CATEGORY_PAGE_2ND_LEVEL>
		And Webshop Main Page: Page title contains text <CATEGORY_PAGE_2ND_LEVEL>
	
Examples:
      |	CATEGORY_PAGE_1ST_LEVEL_TITLE	|	CATEGORY_PAGE_2ND_LEVEL	|	CATEGORY_PAGE_3RD_LEVEL				|
      |	Products						|	AnchorsNew				|	Adhesive and Mechanical Anchoring	|
      