@Sprint4
Feature: HOL-19605 Check out: Pickup location & HOL-23036 Click & Collect locator page - replace item number with item description

	Scenario Outline: HOL-19605 Check out: Pickup location & HOL-23036 Click & Collect locator page
 		#Enter the page
		Given General: open webshop for United States
		When Webshop Main Page: If section I_UNDERSTAND_COOKIES is visible click I_UNDERSTAND_BUTTON
		And Webshop Main Page: If section ONE_MORE_THING_BANNER is visible click DO_NOT_ASK_AGAIN_BUTTON
		
	    Then Webshop Main Page: In section HEADER click LOG_IN_OR_REGISTER_BUTTON	    
	    #1-Fill out login
	    When Webshop Main Page: In section LOG_IN_OR_REGISTER in field EMAIL_ADDRESS_TEXTFIELD type in <email_address>
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER in field PASSWORD_TEXTFIELD type in <password>
	    Then Webshop Main Page: In section LOG_IN_OR_REGISTER click LOG_IN_BUTTON

	    And Webshop Main Page: Section HEADER contains text <user_name>
	    And Webshop Main Page: Section HEADER contains text <account_number> 
	    
	    #Adding items to the cart
	    And General: Scroll to the bottom
	 	When Webshop Main Page: In section HEADER click SHOPPING_CART_BUTTON
	 	Then Cart Page: Section QUICK_ITEM_ENTRY is visible
	 	And General: Wait 1 second
	 	And Cart Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <AVAILABLE_PRODUCT_AT_KANSAS>
	 	And Cart Page: Click ADD_TO_CART_BUTTON
	 	And Webshop Main Page: The SHOPPING_CART contains <qunatity_of_item> item
	 	
	 	#Proceeding to the Checkout Pickup Details Page (Checking the messages)
	 	When Cart Page: Check CLICK_AND_COLLECT_CHECKBOX
	 	And Cart Page: In section SHOPPING_CART_HEADER click CHECK_OUT_BUTTON
	 	And General: Wait 1 second
	 	When Checkout Pickup Location Page: Section CLICK_AND_COLLECT is visible
	 	
	 	#Checking the hybris Center picker and Standard delivery table
	 	#!!THIS IS PART OF HOL-19563 Find or Change hybris Center overlays!! (Excluded: zooming, and clicking on the map)
	 	
	 	When Checkout Pickup Location Page: Section CLICK_AND_COLLECT contains text checkout.pickupLocation.label.hybrisCenterNotListed
	 	Then Checkout Pickup Location Page: In section CLICK_AND_COLLECT click CHANGE_hybris_CENTER_BUTTON
	 	And Checkout Pickup Location Page: CHANGE_hybris_CENTER_POPUP is visible
	 	Then Checkout Pickup Location Page: In section CHANGE_hybris_CENTER_POPUP in field ENTER_ZIP_CODE_OR_CITY_TEXTFIELD type in Kansas City
	 	And Checkout Pickup Location Page: In section CHANGE_hybris_CENTER_POPUP click SEARCH_LOCATION_BUTTON
	 	And General: Wait 1 second
	 	And Checkout Delivery Page: Section CHANGE_hybris_CENTER_POPUP contains text storelocator.label.selected.title
	 	And Checkout Delivery Page: Section CHANGE_hybris_CENTER_POPUP contains text Kansas
	 	And Checkout Delivery Page: Section CHANGE_hybris_CENTER_POPUP contains text checkout.deliveryInfo.label.currentlySelected

	 	
	 	And Checkout Delivery Page: In section CHANGE_hybris_CENTER_POPUP click POPUP_CLOSE_BUTTON
	 	And General: Wait 1 second
	 	
	 	Then Checkout Pickup Location Page: Section CHANGE_hybris_CENTER_POPUP is not visible
	 	And Checkout Pickup Location Page: Section CLICK_AND_COLLECT contains text hybris Center Kansas City
	 	
	 	#Checking out message boxes, and other elements on the site
	 	Then Checkout Pickup Location Page: In section CLICK_AND_COLLECT element SUCCESS_MESSAGE_BOX contains text checkout.pickupLocation.message.success.allItemsAvailableHeadline
	 	And Checkout Pickup Location Page: Element hybris_CENTER_1_RADIOBUTTON is enabled
	 	Then Checkout Pickup Location Page: Section CLICK_AND_COLLECT contains text checkout.pickupLocation.label.headlineCheckProductsAndLocation
	 	And Checkout Delivery Page: Click BACK_TO_PREVIOUS_STEP_BUTTON
	 	Then Cart Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <UNAVAILABLE_PRODUCT_AT_KANSAS>
	 	And Cart Page: Click ADD_TO_CART_BUTTON
	 	And Cart Page: In section SHOPPING_CART_HEADER click CHECK_OUT_BUTTON
	 	And General: Wait 1 second
	 	Then Checkout Pickup Location Page: In section CLICK_AND_COLLECT element ALERT_MESSAGE_BOX contains text checkout.pickupLocation.message.warn.notAllItemsAvailableHeadline
	 	And Checkout Pickup Location Page: Element hybris_CENTER_1_RADIOBUTTON is enabled
	 	And Checkout Delivery Page: Click BACK_TO_PREVIOUS_STEP_BUTTON
	 	When Cart Page: Click REMOVE_ALL_ITEMS_BUTTON
	 	Then Cart Page: Section REMOVE_ALL_ITEMS_POPUP is visible
	 	And Cart Page: In section REMOVE_ALL_ITEMS_POPUP click CONFIRM_REMOVING_ALL_ITEMS
	 	And General: Wait 1 second
	 	Then Webshop Main Page: The SHOPPING_CART contains 0 item
	 	And Cart Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <UNAVAILABLE_PRODUCT_AT_KANSAS>
	 	And Cart Page: Click ADD_TO_CART_BUTTON
	 	Then Cart Page: Click CLICK_AND_COLLECT_CHECKBOX
	 	And Webshop Main Page: The SHOPPING_CART contains 1 item
	 	And Cart Page: In section SHOPPING_CART_HEADER click CHECK_OUT_BUTTON
	 	And General: Wait 1 second
	 	Then Checkout Pickup Location Page: In section CLICK_AND_COLLECT element ERROR_MESSAGE_BOX contains text checkout.pickupLocation.message.error.noProductsReadyHeadline
	    And Checkout Pickup Location Page: Element STANDARD_DELIVERY_RADIOBUTTON is enabled
	    And Checkout Pickup Location Page: Element CONTINUE_BUTTON is enabled

	Examples:
		|	email_address		|	password			|	account_number	|	user_name		|	AVAILABLE_PRODUCT_AT_KANSAS	|	qunatity_of_item	|	UNAVAILABLE_PRODUCT_AT_KANSAS	|
		|	US_user4_email		|	US_user4_password	|	US_user4_id		|	US_user4_name	|	US_standard_product1		|	5				|	US_fleet_product1				|