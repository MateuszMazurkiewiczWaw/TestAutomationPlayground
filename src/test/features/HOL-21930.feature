@Sprint3
Feature: HOL-21930 Cart - Not logged in

  Scenario Outline: HOL-21930 Cart - Not logged in
		
#My Account profile + error messages: My Account header
#Enter the page
		Given General: open webshop for United States
		And Webshop Main Page: If section I_UNDERSTAND_COOKIES is visible click I_UNDERSTAND_BUTTON
		And Webshop Main Page: If section ONE_MORE_THING_BANNER is visible click DO_NOT_ASK_AGAIN_BUTTON
		And Webshop Main Page: If section DO_YOU_NEED_HELP is visible click DONT_ASK_ME_AGAIN_BUTTON
		When Webshop Main Page: In section HEADER element SHOPPING_CART_BUTTON is visible
	    Then Webshop Main Page: In section HEADER click SHOPPING_CART_BUTTON
	    And Cart Page: Section SHOPPING_CART_HEADER is visible
		When Cart Page: Section SHOPPING_CART_HEADER contains text common.label.cart
		And Cart Page: In section SHOPPING_CART_HEADER element CONTINUE_SHOPPING_LINK is visible
		#Check out CHECK OUT button is inactive
		And Cart Page: In section SHOPPING_CART_HEADER element CHECK_OUT_BUTTON is disabled
		#Check if Learn more button indicates propper message
		Then Cart Page: In section QUICK_ITEM_ENTRY click LEARN_MORE_BUTTON
		And General: Wait 1 second
		And Cart Page: Element LEARN_MORE_SHOPPING_CART_POPUP contains text quickorder.label.descriptionMoreInfo
		Then Cart Page: In section QUICK_ITEM_ENTRY click LEARN_MORE_BUTTON
		And General: Wait 1 second
		Then Cart Page: LEARN_MORE_SHOPPING_CART_POPUP is not visible
		#Checking out message boxes
		When Cart Page: Section QUICK_ITEM_ENTRY contains element QUICK_ITEM_ENTRY_TEXTFIELD
		And Cart Page: Section QUICK_ITEM_ENTRY contains element ADD_TO_CART_BUTTON
		Then Cart Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <MISSING_PRODUCT>
		And Cart Page: In section QUICK_ITEM_ENTRY click ADD_TO_CART_BUTTON
		And Cart Page: Element ERROR_MESSAGE_BOX contains text quickorder.message.error.productNotFound
		And Cart Page: In section QUICK_ITEM_ENTRY clear value of QUICK_ITEM_ENTRY_TEXTFIELD
		When Cart Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <STANDARD_PRODUCT>
		Then Cart Page: In section QUICK_ITEM_ENTRY click ADD_TO_CART_BUTTON
		And Cart Page: Element SUCCESS_MESSAGE_BOX contains text quickorder.message.success.productAdded
		Then Cart Page: Section STANDARD_PRODUCTS_HEADER contains text cart.normal.label.normalItemsDescription
		Then Cart Page: REMOVE_ALL_ITEMS_BUTTON is visible
		#Adding multiple products
		When Cart Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <STANDARD_PRODUCT>
		And Cart Page: Press ENTER on a keyboard
		When Cart Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <FLEET_PRODUCT>
		And Cart Page: Press ENTER on a keyboard
		When Cart Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <SOFTWARE_PRODUCT>
		Then Cart Page: In section QUICK_ITEM_ENTRY click ADD_TO_CART_BUTTON
		And Cart Page: Element SUCCESS_MESSAGE_BOX contains text <total_quantity>
		And Cart Page: Element SUCCESS_MESSAGE_BOX contains text quickorder.message.success.productAdded
		And Cart Page: Section STANDARD_PRODUCTS_TABLE is visible
		And Cart Page: Section SOFTWARE_PRODUCTS_TABLE is visible
		And Cart Page: Section FLEET_PRODUCTS_TABLE is not visible

		And Cart Page: In section SHOPPING_CART_HEADER element CHECK_OUT_NOT_LOGGED_IN_BUTTON is enabled
		And Cart Page: In section SHOPPING_CART_HEADER element VISIT_FAVORITES_LISTS_LINK is not visible
		
		When Cart Page: In section STANDARD_PRODUCTS_HEADER element LOG_IN_OR_REGISTER_BUTTON is visible
		Then Cart Page: In section SOFTWARE_PRODUCTS_HEADER element LOG_IN_OR_REGISTER_BUTTON is visible
		And Cart Page: In section STANDARD_PRODUCTS_HEADER click LOG_IN_OR_REGISTER_BUTTON
		And General: Wait 1 second
		Then Webshop Main Page: Section LOG_IN_OR_REGISTER is visible
		
		And Webshop Main Page: Close LOG_IN_OR_REGISTER section
		And General: Wait 1 second
		When Cart Page: In section SHOPPING_CART_HEADER click CHECK_OUT_NOT_LOGGED_IN_BUTTON
		And General: Wait 1 second
		Then Webshop Main Page: Section LOG_IN_OR_REGISTER is visible
		
	Examples:
      |	STANDARD_PRODUCT		|	SOFTWARE_PRODUCT		|	MISSING_PRODUCT	|	FLEET_PRODUCT		|	total_quantity	|
      |	US_standard_product1	|	US_software_product1	|	379379			|	US_fleet_product1	|	7				|