@Sprint4 
Feature: HOL-19580 and HOL-19589 and HOL-19597 Click & Collect Check out - Order summary, Confirmation Page & Order Summary Print

  Scenario Outline: Full finalization of Click & Collect checkout, including confirmation page and summary print
		
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

	    And Webshop Main Page: Section HEADER contains text <user_name>
	    And Webshop Main Page: Section HEADER contains text <account_number> 
		
		When Webshop Main Page: Section ACCOUNT_DASHBOARD is visible
		And Webshop Main Page: Section ACCOUNT_DASHBOARD contains text <user_name>
		And Webshop Main Page: In section ACCOUNT_DASHBOARD click VIEW_YOUR_PROFILE_LINK
		Then Profile Page: Section YOUR_ACCOUNT is visible
		
		#Check if the user name is visible and if User can see company data and account number in the header section
		When Profile Page: Section YOUR_ACCOUNT contains text <user_name>
		Then Profile Page: Section YOUR_ACCOUNT contains text <account_number>
		
		#Adding items to the cart
	 	When Webshop Main Page: In section HEADER click SHOPPING_CART_BUTTON
	 	Then Cart Page: Section QUICK_ITEM_ENTRY is visible
	 	And Cart Page: In section QUICK_ITEM_ENTRY click QUICK_ITEM_ENTRY_TEXTFIELD
	 	And General: Wait 1 second
	 	And Cart Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <item_number_valid>
	 	And Cart Page: Press ENTER on a keyboard
	 	And Cart Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <item_number_valid2>
	 	And Cart Page: Click ADD_TO_CART_BUTTON
	 	And Cart Page: Click CLICK_AND_COLLECT_CHECKBOX
	 	And Webshop Main Page: The SHOPPING_CART contains <summed_up_quantity> items
	 	
	 	#Proceeding to the Checkout Order Summary
	 	And Cart Page: In section SHOPPING_CART_HEADER click CHECK_OUT_BUTTON
	 	And General: Wait 3 second
	 	And Checkout Pickup Location Page: In section CLICK_AND_COLLECT element ALERT_MESSAGE_BOX contains text checkout.pickupLocation.message.warn.notAllItemsAvailableHeadline
	 	And Checkout Pickup Location Page: Click CONTINUE_BUTTON
	 	And General: Wait 1 second
	 	And Checkout Pickup Details Page: Click CONTINUE_BUTTON
		And General: Wait 5 second
	 	And Checkout Billing Page: Click CONTINUE_BUTTON
	 	And General: Wait 1 second
		And Checkout Order Summary Page: Section CHECKOUT_FORM is visible
		
		#Bread crumbs checking
		When Checkout Order Summary Page: In section PROGRESS_BAR element SHOPPING_CART_BREADCRUMB is visible
		Then Checkout Order Summary Page: In section PROGRESS_BAR element PICKUP_LOCATION_BREADCRUMB is visible
		And Checkout Order Summary Page: In section PROGRESS_BAR element PICKUP_DETAILS_BREADCRUMB is visible
		And Checkout Order Summary Page: In section PROGRESS_BAR element BILLING_INFORMATION_BREADCRUMB is visible
		And Checkout Order Summary Page: In section PROGRESS_BAR element ORDER_SUMMARY_BREADCRUMB is visible
		
		#Required sections checking
		When Checkout Order Summary Page: Section BILLING_INFORMATION_SUMMARY is visible
		Then Checkout Order Summary Page: In section BILLING_INFORMATION_SUMMARY element EDIT_BILLING_INFORMATION_BUTTON is visible
		And Checkout Order Summary Page: In section BILLING_INFORMATION_SUMMARY element ACCOUNT_INFO_COLUMN is visible
		And Checkout Order Summary Page: In section BILLING_INFORMATION_SUMMARY element BILLING_INFO_COLUMN is visible
		
		When Checkout Order Summary Page: Section PICKUP_LOCATION_SUMMARY is visible
		And General: Wait 3 second
		Then Checkout Order Summary Page: In section PICKUP_LOCATION_SUMMARY element EDIT_PICKUP_LOCATION_BUTTON is visible
		And Checkout Order Summary Page: In section PICKUP_LOCATION_SUMMARY element EXPECTED_PICKUP_CONTACT_COLUMN is visible
		And Checkout Order Summary Page: In section PICKUP_LOCATION_SUMMARY element OPENING_HOURS_COLUMN is visible
		
		When Checkout Order Summary Page: Section STANDARD_PRODUCTS_TABLE is visible
		And Checkout Order Summary Page: In section STANDARD_PRODUCTS_TABLE element PRODUCT_DESCRIPTION_COLUMN is visible
		And Checkout Order Summary Page: In section STANDARD_PRODUCTS_TABLE element QUANTITY_COLUMN is visible
		And Checkout Order Summary Page: In section STANDARD_PRODUCTS_TABLE element PACKAGING_UNIT_COLUMN is visible
		And Checkout Order Summary Page: In section STANDARD_PRODUCTS_TABLE element PRICE_COLUMN is visible
		And Checkout Order Summary Page: In section STANDARD_PRODUCTS_TABLE element TOTAL_PRICE_COLUMN is visible
		And Checkout Order Summary Page: Section STANDARD_SUBTOTAL_TABLE is visible
		
		#Going back to previous sections
		When Checkout Order Summary Page: In section BILLING_INFORMATION_SUMMARY click EDIT_BILLING_INFORMATION_BUTTON
		And General: Wait 5 seconds
		Then Checkout Billing Page: Section BILLING_INFORMATION_FORM is visible
		And Checkout Billing Page: Click CONTINUE_BUTTON
	 	And General: Wait 3 seconds
		
		When Checkout Order Summary Page: In section PICKUP_LOCATION_SUMMARY click EDIT_PICKUP_LOCATION_BUTTON
		And General: Wait 2 seconds
		And Checkout Pickup Location Page: Click CONTINUE_BUTTON
		And General: Wait 1 second
		And Checkout Pickup Details Page: Click CONTINUE_BUTTON
		And General: Wait 5 second
		And Checkout Billing Page: Click CONTINUE_BUTTON
	 	And General: Wait 1 second
	 	
		When Checkout Order Summary Page: Click EDIT_PICKUP_STANDARD_PRODUCTS_BUTTON
		And General: Wait 1 second
		Then Cart Page: Section QUICK_ITEM_ENTRY is visible
		And Cart Page: In section SHOPPING_CART_HEADER click CHECK_OUT_BUTTON
		And General: Wait 2 second
		And Checkout Pickup Location Page: Click CONTINUE_BUTTON
		And General: Wait 1 second
		And Checkout Pickup Details Page: Click CONTINUE_BUTTON
		And General: Wait 5 second
		And Checkout Billing Page: Click CONTINUE_BUTTON
	 	And General: Wait 3 seconds
	 	
	 	#Remove items scenario
	 	When Checkout Order Summary Page: Click SUBMIT_ORDER_BUTTON
		Then Checkout Order Confirmation Page: SUCCESS_MESSAGE_BOX is visible
		And Checkout Order Confirmation Page: Element SUCCESS_MESSAGE_BOX contains text checkout.orderConfirmation.message.success.HeadlineTitle
		Then Checkout Order Confirmation Page: ALERT_MESSAGE_BOX is visible
		And Checkout Order Confirmation Page: Element ALERT_MESSAGE_BOX contains text checkout.orderConfirmation.message.warn.clickAndCollectHeadlineTitle
		And Checkout Order Confirmation Page: HILTI_CENTER_COLUMN is visible
		And Checkout Order Confirmation Page: OPENING_HOURS_COLUMN is visible
		And Checkout Order Confirmation Page: EXPECTED_PICKUP_CONTACT_COLUMN is visible
		And Checkout Order Confirmation Page: GET_DIRECTIONS_BUTTON is visible
		And Checkout Order Confirmation Page: LOCATION_MAP is visible
		And Checkout Order Confirmation Page: Click REMOVE_ITEMS_FROM_CART_BUTTON
		And General: Wait 1 second
		And Webshop Main Page: QUICK_ITEM_ENTRY is visible
		And Webshop Main Page: The SHOPPING_CART contains 0 item
		
		#View cart page scenario
	 	When Webshop Main Page: In section HEADER click SHOPPING_CART_BUTTON
	 	Then Cart Page: Section QUICK_ITEM_ENTRY is visible
	 	And Cart Page: In section QUICK_ITEM_ENTRY click QUICK_ITEM_ENTRY_TEXTFIELD
	 	And General: Wait 1 second
	 	And Cart Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <item_number_valid>
	 	And Cart Page: Press ENTER on a keyboard
	 	And Cart Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <item_number_valid2>
	 	And Cart Page: Click ADD_TO_CART_BUTTON
	 	And Cart Page: Click CLICK_AND_COLLECT_CHECKBOX
	 	And Webshop Main Page: The SHOPPING_CART contains <summed_up_quantity> items
	 	And Cart Page: In section SHOPPING_CART_HEADER click CHECK_OUT_BUTTON
	 	And General: Wait 3 seconds
	 	And Checkout Pickup Location Page: In section CLICK_AND_COLLECT element ALERT_MESSAGE_BOX contains text checkout.pickupLocation.message.warn.notAllItemsAvailableHeadline
	 	And Checkout Pickup Location Page: Click CONTINUE_BUTTON
	 	And General: Wait 1 second
	 	And Checkout Pickup Details Page: Click CONTINUE_BUTTON
		And General: Wait 5 second
	 	And Checkout Billing Page: Click CONTINUE_BUTTON
	 	And General: Wait 3 second
		And Checkout Order Summary Page: Click SUBMIT_ORDER_BUTTON
		And General: Wait 1 second
	 	
	 	When Checkout Order Confirmation Page: SUCCESS_MESSAGE_BOX is visible
		Then Checkout Order Confirmation Page: Element SUCCESS_MESSAGE_BOX contains text checkout.orderConfirmation.message.success.HeadlineTitle
		And Checkout Order Confirmation Page: ALERT_MESSAGE_BOX is visible
		And Checkout Order Confirmation Page: Element ALERT_MESSAGE_BOX contains text checkout.orderConfirmation.message.warn.clickAndCollectHeadlineTitle
		And Checkout Order Confirmation Page: HILTI_CENTER_COLUMN is visible
		And Checkout Order Confirmation Page: OPENING_HOURS_COLUMN is visible
		And Checkout Order Confirmation Page: EXPECTED_PICKUP_CONTACT_COLUMN is visible
		And Checkout Order Confirmation Page: GET_DIRECTIONS_BUTTON is visible
		And Checkout Order Confirmation Page: LOCATION_MAP is visible
		And Checkout Order Confirmation Page: Click VIEW_SHOPPING_CART_PAGE_BUTTON
		And General: Wait 1 second
		And Webshop Main Page: The SHOPPING_CART contains <qunatity_of_item2> item
		And Cart Page: Click CLICK_AND_COLLECT_CHECKBOX
		And Cart Page: In section SHOPPING_CART_HEADER click CHECK_OUT_BUTTON
		And General: Wait 2 second
		And Checkout Pickup Location Page: In section CLICK_AND_COLLECT element ERROR_MESSAGE_BOX contains text checkout.pickupLocation.message.error.noProductsReadyHeadline
		And General: Wait 2 second
	 	And Checkout Pickup Location Page: Click CHANGE_HILTI_CENTER_BUTTON
	 	And Checkout Pickup Location Page: In section CHANGE_HILTI_CENTER_POPUP in field ENTER_ZIP_CODE_OR_CITY_TEXTFIELD type in Kansas City
	 	And Checkout Pickup Location Page: Click SEARCH_LOCATION_BUTTON
	 	And General: Wait 5 seconds
	 	And Checkout Pickup Location Page: Click HILTI_CENTER_SELECT_BUTTON
	 	And General: Wait 3 seconds
	 	And Checkout Pickup Location Page: Click CONTINUE_BUTTON
	 	And General: Wait 1 second
	 	And Checkout Pickup Details Page: Click CONTINUE_BUTTON
		And General: Wait 5 second
	 	And Checkout Billing Page: Click CONTINUE_BUTTON
	 	And General: Wait 5 second
		And Checkout Order Summary Page: Section CHECKOUT_FORM is visible
		And General: Wait 1 second
		
		#Testing printing functionality
		When Checkout Order Summary Page: Click SUMMARY_PRINT_BUTTON
		And General: Wait 1 second
		And General: Switch to tab number 2
		Then Checkout Summary Print Page: Section PRINT_HEADER is visible
		And Checkout Summary Print Page: Section PRINT_FOOTER is visible
		And Checkout Summary Print Page: Section PRINT_BILLING_INFORMATION is visible
		And Checkout Summary Print Page: In section PRINT_BILLING_INFORMATION element BILLING_YOUR_ACCOUNT_COLUMN is visible
		And Checkout Summary Print Page: In section PRINT_BILLING_INFORMATION element BILLING_DETAILS_COLUMN is visible
		And Checkout Summary Print Page: Section PRINT_PICKUP_LOCATION is visible
		And Checkout Summary Print Page: In section PRINT_PICKUP_LOCATION element PRINT_EXPTECTED_PICKUP_CONTACT_COLUMN is visible
		And Checkout Summary Print Page: In section PRINT_PICKUP_LOCATION element PRINT_OPENING_HOURS_COLUMN is visible
		And Checkout Summary Print Page: Section PRINT_STANDARD_SUMMARY is visible
		And General: Discard tab number 2
		And General: Wait 1 second
		And General: Switch to tab number 1
		
		When Checkout Order Summary Page: Click SUBMIT_ORDER_BUTTON
		And General: Wait 2 second		
		Then Checkout Order Confirmation Page: Open GO_TO_ORDER_HISTORY_LINK in new tab
		And General: Wait 1 second
		And General: Switch to tab number 1
		And General: Wait 1 second
		And Checkout Order Confirmation Page: Click GO_TO_HOMEPAGE_LINK
		Then General: Wait 1 second
		And Webshop Main Page: Section QUICK_ITEM_ENTRY is visible
		And General: Discard tab number 1
		Then General: Wait 1 second
		And General: Switch to tab number 1		
		Then General: Wait 1 second
		Then Order History Page: ORDER_HISTORY_TABLE is visible		
		
	Examples:
      |	email_address			|	password			|	user_name		|	account_number	|	item_number_valid		|	item_number_valid2		|	qunatity_of_item2	|	summed_up_quantity	|
      |	US_user3_email			|	US_user3_password	|	US_user3_name	|	US_user3_id		|	US_standard_product2    |	US_standard_product1	|	5					|	6					|		
	 	
  Scenario Outline: Full finalization of Click & Collect checkout, including confirmation page and summary print - returning to default settings
		
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

	    And Webshop Main Page: Section HEADER contains text <user_name>
	    And Webshop Main Page: Section HEADER contains text <account_number>
	    
		#Returning to default settings
		When Webshop Main Page: In section HEADER click SHOPPING_CART_BUTTON
	 	Then Cart Page: Section QUICK_ITEM_ENTRY is visible
	 	And Cart Page: In section QUICK_ITEM_ENTRY click QUICK_ITEM_ENTRY_TEXTFIELD
	 	And Cart Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <item_number_valid>
	 	And General: Wait 1 second
	 	And Cart Page: Click ADD_TO_CART_BUTTON
	 	And General: Wait 1 second
	 	And Cart Page: Click CLICK_AND_COLLECT_CHECKBOX
	 	And Cart Page: In section SHOPPING_CART_HEADER click CHECK_OUT_BUTTON
		And General: Wait 3 seconds
	 	And Checkout Pickup Location Page: Click CHANGE_HILTI_CENTER_BUTTON
	 	And Checkout Pickup Location Page: In section CHANGE_HILTI_CENTER_POPUP in field ENTER_ZIP_CODE_OR_CITY_TEXTFIELD type in Anchorage
	 	And Checkout Pickup Location Page: Click SEARCH_LOCATION_BUTTON
	 	And Checkout Pickup Location Page: Click HILTI_CENTER_SELECT_BUTTON
	 	And General: Wait 3 seconds
	 	And Checkout Pickup Location Page: Click CONTINUE_BUTTON
	 	And General: Wait 1 second
	 	And Checkout Pickup Details Page: Click CONTINUE_BUTTON
		And General: Wait 5 second
	 	And Checkout Billing Page: Click CONTINUE_BUTTON
	 	And General: Wait 1 second
		And Checkout Order Summary Page: Section CHECKOUT_FORM is visible
		And General: Wait 3 second
		
		#Testing order confirmation page
		When Checkout Order Summary Page: Click SUBMIT_ORDER_BUTTON
		Then Checkout Order Confirmation Page: SUCCESS_MESSAGE_BOX is visible
		And Checkout Order Confirmation Page: Element SUCCESS_MESSAGE_BOX contains text checkout.orderConfirmation.message.success.HeadlineTitle
		And Checkout Order Confirmation Page: ALERT_MESSAGE_BOX is not visible
		
		When Checkout Order Confirmation Page: GO_TO_ORDER_HISTORY_LINK is visible
		Then Checkout Order Confirmation Page: GO_TO_HOMEPAGE_LINK is visible
		And Checkout Order Confirmation Page: INNOVATION_MAGAZIN_MARKETING_CONTAINER is visible
		And Checkout Order Confirmation Page: NEW_PRODUCTS_CONTAINER is visible
		And Checkout Order Confirmation Page: HILTI_CENTER_COLUMN is visible
		And Checkout Order Confirmation Page: OPENING_HOURS_COLUMN is visible
		And Checkout Order Confirmation Page: EXPECTED_PICKUP_CONTACT_COLUMN is visible
		And Checkout Order Confirmation Page: GET_DIRECTIONS_BUTTON is visible
		And Checkout Order Confirmation Page: LOCATION_MAP is visible
	 
	Examples:
      |	email_address			|	password			|	user_name		|	account_number	|	item_number_valid		|
      |	US_user3_email			|	US_user3_password	|	US_user3_name	|	US_user3_id		|	US_standard_product2    |