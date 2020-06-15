@Sprint3
Feature: HOL-23030 Shopping cart - Move Fleet tool to Purchase section
  
  Scenario Outline: Move Fleet tool to Purchase section
  
		#Enter the page
		Given General: open webshop for United States
		And Webshop Main Page: If section I_UNDERSTAND_COOKIES is visible click I_UNDERSTAND_BUTTON
		And Webshop Main Page: If section ONE_MORE_THING_BANNER is visible click DO_NOT_ASK_AGAIN_BUTTON
	    And Webshop Main Page: If section DO_YOU_NEED_HELP is visible click DONT_ASK_ME_AGAIN_BUTTON
	    When Webshop Main Page: In section HEADER element LOG_IN_OR_REGISTER_BUTTON is visible
	    Then Webshop Main Page: In section HEADER click LOG_IN_OR_REGISTER_BUTTON
	    And Webshop Main Page: Section LOG_IN_OR_REGISTER is visible
	    
	    #Fill out login
	    When Webshop Main Page: Section LOG_IN_OR_REGISTER contains text common.login.label.header
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER element LOG_IN_BUTTON is enabled
	    Then Webshop Main Page: In section LOG_IN_OR_REGISTER in field EMAIL_ADDRESS_TEXTFIELD type in <email_address>
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER in field PASSWORD_TEXTFIELD type in <password>
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER element LOG_IN_BUTTON is enabled
	    Then Webshop Main Page: In section LOG_IN_OR_REGISTER click LOG_IN_BUTTON
	    And General: Wait 2 seconds
	    
	    #Adding items to the cart
	 	When Webshop Main Page: In section HEADER click SHOPPING_CART_BUTTON
	 	Then Cart Page: Section QUICK_ITEM_ENTRY is visible
	 	#And Cart Page: Section QUICK_ITEM_ENTRY contains text cart.fleet.label.fleetItemsDescription
	 	Then Cart Page: In section SHOPPING_CART_HEADER element VISIT_FAVORITES_LISTS_LINK is enabled
	 	And Cart Page: In section QUICK_ITEM_ENTRY element QUICK_ITEM_ENTRY_TEXTFIELD is visible
	 	And Cart Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <item_number_valid>
	 	And Cart Page: Click ADD_TO_CART_BUTTON
	 	And Cart Page: SUCCESS_MESSAGE_BOX is visible
	 	And Cart Page: Section FLEET_PRODUCTS_TABLE is visible
	 	
	 	#Fleet products management
	 	When Cart Page: In section FLEET_PRODUCTS_TABLE_CONTENT element MOVE_TO_PURCHASE_ITEMS_BUTTON is visible
	 	And Cart Page: In section FLEET_PRODUCTS_TABLE_CONTENT click MOVE_TO_PURCHASE_ITEMS_BUTTON
	 	Then Cart Page: Section FLEET_PRODUCTS_TABLE_CONTENT is not visible
	 	
	 	#Standard products management
	 	When Cart Page: Section STANDARD_PRODUCTS_TABLE is visible
	 	Then Cart Page: Element TABLE_DESCRIPTION_COLUMN contains text cart.label.itemNumber
	 	And Cart Page: Element TABLE_DESCRIPTION_COLUMN contains text <item_number_valid>
	 	And General: Scroll to the top
	 	And Cart Page: In section SHOPPING_CART_HEADER element CHECK_OUT_BUTTON is enabled
	 	And Cart Page: In section SHOPPING_CART_HEADER click CHECK_OUT_BUTTON
	 	And General: Wait 1 second
	 	Then Checkout Delivery Page: Section DELIVERY_ADDRESS_FORM is visible
	 	
	 	
	Examples:
|	item_number_valid	|	email_address		|	password				|
|	US_fleet_product1	|	US_fleet_email		|	US_fleet_password		|