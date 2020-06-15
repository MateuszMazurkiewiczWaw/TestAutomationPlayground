@Sprint4
Feature: HOL-20569 & HOL-20577 & HOL-20561 Standard Check out - Order summary, Confirmation Page & Order Summary Print

  Scenario Outline: Full finalization of standard products checkout, including confirmation page and summary print
		
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
	 	And Cart Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <item_number_valid>
	 	And Cart Page: Press ENTER on a keyboard
	 	And Cart Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <item_number_valid2>
	 	And Cart Page: Click ADD_TO_CART_BUTTON
	 	And Webshop Main Page: The SHOPPING_CART contains 2 items
	 	
	 	#Proceeding to the Checkout Order Summary
	 	And Cart Page: In section SHOPPING_CART_HEADER click CHECK_OUT_BUTTON
	 	And General: Wait 1 second
	 	And Checkout Delivery Page: Click CONTINUE_BUTTON
		And General: Wait 1 second
		And Checkout Billing Page: In section BILLING_INFORMATION_FORM in field PURCHASE_ORDER_NUMBER_TEXTFIELD type in Project_X
	 	And Checkout Billing Page: Click CONTINUE_BUTTON
	 	And General: Wait 1 second
	 	And Checkout Fleet Labelling Page: Click CONTINUE_BUTTON
	 	And General: Wait 1 second
		And Checkout Order Summary Page: Section CHECKOUT_FORM is visible
		
		#Bread crumbs checking
		When Checkout Order Summary Page: In section PROGRESS_BAR element SHOPPING_CART_BREADCRUMB is visible
		Then Checkout Order Summary Page: In section PROGRESS_BAR element DELIVERY_INFORMATION_BREADCRUMB is visible
		And Checkout Order Summary Page: In section PROGRESS_BAR element BILLING_INFORMATION_BREADCRUMB is visible
		And Checkout Order Summary Page: In section PROGRESS_BAR element FLEET_LABELLING_BREADCRUMB is visible
		And Checkout Order Summary Page: In section PROGRESS_BAR element ORDER_SUMMARY_BREADCRUMB is visible
		
		#Required sections checking
		When Checkout Order Summary Page: Section BILLING_INFORMATION_SUMMARY is visible
		Then Checkout Order Summary Page: In section BILLING_INFORMATION_SUMMARY element EDIT_BILLING_INFORMATION_BUTTON is visible
		And Checkout Order Summary Page: In section BILLING_INFORMATION_SUMMARY element ACCOUNT_INFO_COLUMN is visible
		And Checkout Order Summary Page: In section BILLING_INFORMATION_SUMMARY element BILLING_INFO_COLUMN is visible
		
		When Checkout Order Summary Page: In section CHECKOUT_FORM element DELIVERY_INFORMATION_SUMMARY is visible
		Then Checkout Order Summary Page: In section DELIVERY_INFORMATION_SUMMARY element EDIT_DELIVERY_INFORMATION_BUTTON is visible
		And Checkout Order Summary Page: In section DELIVERY_INFORMATION_SUMMARY element DELIVERY_INFO_COLUMN is visible
		And Checkout Order Summary Page: In section DELIVERY_INFORMATION_SUMMARY element SHIPPING_INFO_COLUMN is visible
		
		When Checkout Order Summary Page: Section FLEET_PRODUCTS_TABLE is visible
		And Checkout Order Summary Page: In section FLEET_PRODUCTS_TABLE element PRODUCT_DESCRIPTION_COLUMN is visible
		And Checkout Order Summary Page: In section FLEET_PRODUCTS_TABLE element QUANTITY_COLUMN is visible
		And Checkout Order Summary Page: In section FLEET_PRODUCTS_TABLE element USAGE_PERIOD_COLUMN is visible
		And Checkout Order Summary Page: In section FLEET_PRODUCTS_TABLE element INVOICE_COLUMN is visible
		And Checkout Order Summary Page: In section FLEET_PRODUCTS_TABLE element PRICE_COLUMN is visible
		And Checkout Order Summary Page: In section FLEET_PRODUCTS_TABLE element TOTAL_PRICE_COLUMN is visible
		And Checkout Order Summary Page: In section FLEET_PRODUCTS_TABLE element EXPECTED_DELIVERY_DATE is visible
		And Checkout Order Summary Page: Section FLEET_SUBTOTAL_TABLE is visible
		
		When Checkout Order Summary Page: Section STANDARD_PRODUCTS_TABLE is visible
		And Checkout Order Summary Page: In section STANDARD_PRODUCTS_TABLE element PRODUCT_DESCRIPTION_COLUMN is visible
		And Checkout Order Summary Page: In section STANDARD_PRODUCTS_TABLE element QUANTITY_COLUMN is visible
		And Checkout Order Summary Page: In section STANDARD_PRODUCTS_TABLE element PACKAGING_UNIT_COLUMN is visible
		And Checkout Order Summary Page: In section STANDARD_PRODUCTS_TABLE element PRICE_COLUMN is visible
		And Checkout Order Summary Page: In section STANDARD_PRODUCTS_TABLE element TOTAL_PRICE_COLUMN is visible
		And Checkout Order Summary Page: In section STANDARD_PRODUCTS_TABLE element EXPECTED_DELIVERY_DATE is visible
		And Checkout Order Summary Page: Section STANDARD_SUBTOTAL_TABLE is visible
		
		#Going back to previous sections
		When Checkout Order Summary Page: In section BILLING_INFORMATION_SUMMARY click EDIT_BILLING_INFORMATION_BUTTON
		And General: Wait 1 second
		Then Checkout Billing Page: Section BILLING_INFORMATION_FORM is visible
		And Checkout Billing Page: Click CONTINUE_BUTTON
		And General: Wait 1 second
		And Checkout Fleet Labelling Page: Click CONTINUE_BUTTON
	 	And General: Wait 5 second
		
		When Checkout Order Summary Page: In section DELIVERY_INFORMATION_SUMMARY click EDIT_DELIVERY_INFORMATION_BUTTON
		And General: Wait 1 second
		And Checkout Delivery Page: Section DELIVERY_ADDRESS_FORM is visible
		And Checkout Delivery Page: Click CONTINUE_BUTTON
		And General: Wait 1 second
		And Checkout Billing Page: Click CONTINUE_BUTTON
		And General: Wait 1 second
		And Checkout Fleet Labelling Page: Click CONTINUE_BUTTON
	 	And General: Wait 1 second
	 	
	 	When Checkout Order Summary Page: Click EDIT_FLEET_PRODUCTS_BUTTON
		And General: Wait 1 second
		Then Cart Page: Section QUICK_ITEM_ENTRY is visible
		And Cart Page: In section SHOPPING_CART_HEADER click CHECK_OUT_BUTTON
		And General: Wait 2 seconds
		And Checkout Delivery Page: Click CONTINUE_BUTTON
		And General: Wait 1 second
		And Checkout Billing Page: Click CONTINUE_BUTTON
		And General: Wait 1 second
		And Checkout Fleet Labelling Page: Click CONTINUE_BUTTON
	 	And General: Wait 1 second 
		
		When Checkout Order Summary Page: Click EDIT_STANDARD_PRODUCTS_BUTTON
		And General: Wait 1 second
		Then Cart Page: Section QUICK_ITEM_ENTRY is visible
		And Cart Page: In section SHOPPING_CART_HEADER click CHECK_OUT_BUTTON
		And General: Wait 2 seconds
		And Checkout Delivery Page: Click CONTINUE_BUTTON
		And General: Wait 1 second
		
		And Checkout Billing Page: Click CONTINUE_BUTTON
		And General: Wait 1 second
		And Checkout Fleet Labelling Page: Click CONTINUE_BUTTON
	 	And General: Wait 3 second
	 	
		#Testing printing functionality
		When Checkout Order Summary Page: Click SUMMARY_PRINT_BUTTON
		And General: Wait 1 second
		And General: Switch to tab number 2
		Then Checkout Summary Print Page: Section PRINT_HEADER is visible
		And Checkout Summary Print Page: Section PRINT_FOOTER is visible
		And Checkout Summary Print Page: Section PRINT_BILLING_INFORMATION is visible
		And Checkout Summary Print Page: In section PRINT_BILLING_INFORMATION element BILLING_YOUR_ACCOUNT_COLUMN is visible
		And Checkout Summary Print Page: In section PRINT_BILLING_INFORMATION element BILLING_DETAILS_COLUMN is visible
		And Checkout Summary Print Page: Section PRINT_DELIVERY_INFORMATION is visible
		And Checkout Summary Print Page: In section PRINT_DELIVERY_INFORMATION element DELIVERY_ADDRESS_DETAILS_COLUMN is visible
		And Checkout Summary Print Page: In section PRINT_DELIVERY_INFORMATION element DELIVERY_SHIPPING_DETAILS_COLUMN is visible
		And Checkout Summary Print Page: Section PRINT_FLEET_SUMMARY is visible
		And Checkout Summary Print Page: Section PRINT_STANDARD_SUMMARY is visible
		And General: Discard last tab
		And General: Wait 1 second
		And General: Switch to tab number 1
		
		#Testing order confirmation page
		When Checkout Order Summary Page: Click SUBMIT_ORDER_BUTTON
		Then Checkout Order Confirmation Page: SUCCESS_MESSAGE_BOX is visible
		And Checkout Order Confirmation Page: Element SUCCESS_MESSAGE_BOX contains text checkout.orderConfirmation.message.success.HeadlineTitle
		
		When Checkout Order Confirmation Page: GO_TO_ORDER_HISTORY_LINK is visible
		Then Checkout Order Confirmation Page: GO_TO_HOMEPAGE_LINK is visible
		And Checkout Order Confirmation Page: INNOVATION_MAGAZIN_MARKETING_CONTAINER is visible
		And Checkout Order Confirmation Page: NEW_PRODUCTS_CONTAINER is visible
		
		And General: Wait 3 seconds
		When Checkout Order Confirmation Page: Open GO_TO_ORDER_HISTORY_LINK in new tab
		And General: Wait 1 second
		And General: Switch to tab number 1
		And General: Wait 1 second
		And Checkout Order Confirmation Page: Click GO_TO_HOMEPAGE_LINK
		And General: Wait 1 second
		And Webshop Main Page: QUICK_ITEM_ENTRY is visible
		And General: Discard tab number 1
		Then General: Wait 1 second
		And General: Switch to tab number 1
		And General: Wait 1 second
		Then Order History Page: ORDER_HISTORY_TABLE is visible
		
		
	Examples:
      |	email_address			|	password			|	user_name		|	account_number	|	item_number_valid		|	item_number_valid2	|
      |	US_fleet_email			|	US_fleet_password	|	US_fleet_name	|	US_fleet_id		|	US_standard_product2	|	US_fleet_product1	|