@Sprint2
Feature: HOL-20225 Category Page Fold out - Subchapter 2nd level

  Scenario Outline: Category Page Fold out - Subchapter 2nd level
		Given General: open webshop for United States
		And Webshop Main Page: If section I_UNDERSTAND_COOKIES is visible click I_UNDERSTAND_BUTTON
		And Webshop Main Page: If section ONE_MORE_THING_BANNER is visible click DO_NOT_ASK_AGAIN_BUTTON
		And Webshop Main Page: If section DO_YOU_NEED_HELP is visible click DONT_ASK_ME_AGAIN_BUTTON
		When Webshop Main Page: In section MENU_BAR click PRODUCTS_BUTTON
		And General: Wait 2 seconds
		Then Webshop Main Page: Section PRODUCT_OR_CATEGORY_LIST is visible
		And Webshop Main Page: Section PRODUCT_OR_CATEGORY_LIST_NAVIGATION_BAR contains text headerstaticcomponent.label.products
		And Webshop Main Page: PRODUCT_OR_CATEGORY_LIST contains more than 1 PRODUCT_OR_CATEGORY_NAMES
		
		When Webshop Main Page: On PRODUCT_OR_CATEGORY_LIST click category <PRODUCT_CATEGORY_1ST_LEVEL>
		And General: Wait 2 seconds
		Then Webshop Main Page: On PRODUCT_OR_CATEGORY_LIST category <PRODUCT_CATEGORY_1ST_LEVEL> is visible
		And Webshop Main Page: Section PRODUCT_OR_CATEGORY_LIST_NAVIGATION_BAR not contains text headerstaticcomponent.label.products
		And Webshop Main Page: Section PRODUCT_OR_CATEGORY_LIST_NAVIGATION_BAR contains text <PRODUCT_CATEGORY_1ST_LEVEL>
		And Webshop Main Page: PRODUCT_OR_CATEGORY_LIST contains more than 1 PRODUCT_OR_CATEGORY_NAMES
		
		And Webshop Main Page: In section PRODUCT_OR_CATEGORY_LIST element WANT_TO_KNOW_MORE_2ND_LEVEL_BUTTON is visible
		#TO-DO
		#And Webshop Main Page: Click WANT_TO_KNOW_MORE_BUTTON
		#Then Check: User is redirected to the first level category overview/landing page
		#And navigation back
		
		And Webshop Main Page: MAKE_IT_FIT_BUTTON might be visible
		#TO-DO
		#And Webshop Main Page: Click MAKE_IT_FIT_BUTTON
		#Then A click on these teasers leads the user to the respective page.
		#And navigation back
		
		And Webshop Main Page: ANCHOR_SELECTOR_BUTTON might be visible
		#TO-DO
		#And Webshop Main Page: Click ANCHOR_SELECTOR_BUTTON
		#Then A click on these teasers leads the user to the respective page.
		#And navigation back
		
		And Webshop Main Page: Section NEW_PRODUCTS_AND_INNOVATIONS might be visible
		#TO-DO
		#And Webshop Main Page: Click NEW_PRODUCTS_AND_INNOVATIONS
		#Then A click on this container is leading the user to the respective editorial page.
		#And navigation back
		
		When Webshop Main Page: In section MENU_BAR click PRODUCTS_BUTTON
		And General: Wait 2 seconds
		
		Then Webshop Main Page: PRODUCT_OR_CATEGORY_LIST is not visible
		
		When Webshop Main Page: In section MENU_BAR click PRODUCTS_BUTTON
		And General: Wait 2 seconds
		Then Webshop Main Page: PRODUCT_OR_CATEGORY_LIST is visible
		And Webshop Main Page: Section PRODUCT_OR_CATEGORY_LIST_NAVIGATION_BAR contains text headerstaticcomponent.label.products
		And Webshop Main Page: Section PRODUCT_OR_CATEGORY_LIST_NAVIGATION_BAR not contains text <PRODUCT_CATEGORY_1ST_LEVEL>
		And Webshop Main Page: PRODUCT_OR_CATEGORY_LIST contains more than 1 PRODUCT_OR_CATEGORY_NAMES
		
		When Webshop Main Page: On PRODUCT_OR_CATEGORY_LIST click category <PRODUCT_CATEGORY_1ST_LEVEL>
		And General: Wait 2 seconds
		Then Webshop Main Page: On PRODUCT_OR_CATEGORY_LIST category <PRODUCT_CATEGORY_1ST_LEVEL> is visible
		And Webshop Main Page: Section PRODUCT_OR_CATEGORY_LIST_NAVIGATION_BAR not contains text headerstaticcomponent.label.products
		And Webshop Main Page: Section PRODUCT_OR_CATEGORY_LIST_NAVIGATION_BAR contains text <PRODUCT_CATEGORY_1ST_LEVEL>
		And Webshop Main Page: PRODUCT_OR_CATEGORY_LIST contains more than 1 PRODUCT_OR_CATEGORY_NAMES
		
		When Webshop Main Page: In section PRODUCT_OR_CATEGORY_LIST click BACK_BUTTON
		And General: Wait 2 seconds
		Then Webshop Main Page: Section PRODUCT_OR_CATEGORY_LIST is visible
		And Webshop Main Page: Section PRODUCT_OR_CATEGORY_LIST_NAVIGATION_BAR contains text headerstaticcomponent.label.products
		And Webshop Main Page: Section PRODUCT_OR_CATEGORY_LIST_NAVIGATION_BAR not contains text <PRODUCT_CATEGORY_1ST_LEVEL>
		And Webshop Main Page: PRODUCT_OR_CATEGORY_LIST contains more than 1 PRODUCT_OR_CATEGORY_NAMES
		
		When Webshop Main Page: On PRODUCT_OR_CATEGORY_LIST click category <PRODUCT_CATEGORY_1ST_LEVEL>
		And General: Wait 2 seconds
		Then Webshop Main Page: On PRODUCT_OR_CATEGORY_LIST category <PRODUCT_CATEGORY_1ST_LEVEL> is visible
		And Webshop Main Page: Section PRODUCT_OR_CATEGORY_LIST_NAVIGATION_BAR not contains text headerstaticcomponent.label.products
		And Webshop Main Page: Section PRODUCT_OR_CATEGORY_LIST_NAVIGATION_BAR contains text <PRODUCT_CATEGORY_1ST_LEVEL>
		And Webshop Main Page: PRODUCT_OR_CATEGORY_LIST contains more than 1 PRODUCT_OR_CATEGORY_NAMES
			
		When Webshop Main Page: Click PRODUCT_OR_CATEGORY_LIST_CLOSE_BUTTON
		And General: Wait 2 second
		Then Webshop Main Page: Section PRODUCT_OR_CATEGORY_LIST is not visible	
		
	Examples:
      |	PRODUCT_CATEGORY_1ST_LEVEL		|
      |	US_Product_Category_1st_Level1	|