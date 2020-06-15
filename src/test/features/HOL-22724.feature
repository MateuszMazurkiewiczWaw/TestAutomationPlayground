@Sprint4
Feature: HOL-22724 Click&Collect - Billing information

  Scenario Outline: Click&Collect - Content of the page and all functionalities of the billing page
		
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
	 	And Cart Page: Click ADD_TO_CART_BUTTON
	 	And Cart Page: Click CLICK_AND_COLLECT_CHECKBOX
	 	And Webshop Main Page: The SHOPPING_CART contains 1 items
	 	
	 	#Proceeding to the Checkout Order Summary
	 	And General: Wait 1 second
	 	And Cart Page: In section SHOPPING_CART_HEADER click CHECK_OUT_BUTTON
		And General: Wait 2 second
		And Checkout Pickup Location Page: Click CONTINUE_BUTTON
		And General: Wait 1 second
		And Checkout Pickup Details Page: Click CONTINUE_BUTTON
		And General: Wait 1 second
		
		#Bread crumbs checking
		When Checkout Billing Page: Section BILLING_INFORMATION_FORM is visible
		Then Checkout Billing Page: In section BILLING_INFORMATION_FORM element SHOPPING_CART_BREADCRUMB is visible
		And Checkout Billing Page: In section BILLING_INFORMATION_FORM element PICKUP_LOCATION_BREADCRUMB is visible
		And Checkout Billing Page: In section BILLING_INFORMATION_FORM element PICKUP_DETAILS_BREADCRUMB is visible
		And Checkout Billing Page: In section BILLING_INFORMATION_FORM element BILLING_INFORMATION_BREADCRUMB is visible
		And Checkout Billing Page: In section BILLING_INFORMATION_FORM element ORDER_SUMMARY_BREADCRUMB is visible
		
		#Required sections checking
		When Checkout Billing Page: In section BILLING_INFORMATION_FORM element CHECKOUT_HEADLINE is visible
		Then Checkout Billing Page: In section BILLING_INFORMATION_FORM element YOUR_ACCOUNT_NUMBER_COLUMN is visible
		And Checkout Billing Page: In section BILLING_INFORMATION_FORM element BILLING_ADDRESS_COLUMN is visible
		And Checkout Billing Page: In section BILLING_INFORMATION_FORM element PAYMENT_METHOD_COLUMN is visible
		And Checkout Billing Page: In section BILLING_INFORMATION_FORM element PAYMENT_METHOD_ADDITIONAL_INFO is visible
		And Checkout Billing Page: In section BILLING_INFORMATION_FORM element PURCHASE_ORDER_NUMBER_COLUMN is visible
		And Checkout Billing Page: In section BILLING_INFORMATION_FORM element PURCHASE_ORDER_NUMBER_TEXTFIELD is visible
		And Checkout Billing Page: In section BILLING_INFORMATION_FORM element PURCHASE_ORDER_NUMBER_LEARNMORE_BUTTON is visible
		And Checkout Billing Page: In section BILLING_INFORMATION_FORM element PURCHASE_ORDER_DOCUMENT_COLUMN is visible
		And Checkout Billing Page: In section BILLING_INFORMATION_FORM element PURCHASE_ORDER_DOCUMENT_LEARNMORE_BUTTON is visible
		And Checkout Billing Page: In section BILLING_INFORMATION_FORM element PURCHASE_ORDER_DOCUMENT_SELECT_FILE_LINK is visible
		
		#Required functionalities checking
		When Checkout Billing Page: In section BILLING_INFORMATION_FORM click PURCHASE_ORDER_DOCUMENT_LEARNMORE_BUTTON
		Then Checkout Billing Page: Section PURCHASE_ORDER_DOCUMENT_LEARNMORE_POPUP is visible
		And General: Refresh current page
		And General: Wait 1 second
		And Checkout Billing Page: In section BILLING_INFORMATION_FORM element CREDIT_CARD_METHOD_RADIOBUTTON is visible
		And Checkout Billing Page: In section BILLING_INFORMATION_FORM element INVOICE_METHOD_CLICKANDCOLLECT_RADIOBUTTON is visible
		And Checkout Billing Page: In section BILLING_INFORMATION_FORM click PURCHASE_ORDER_NUMBER_LEARNMORE_BUTTON
		And Checkout Billing Page: Section PURCHASE_ORDER_NUMBER_LEARNMORE_POPUP is visible
		And General: Refresh current page
		And General: Wait 1 second
		And Checkout Billing Page: In section BILLING_INFORMATION_FORM in field PURCHASE_ORDER_NUMBER_TEXTFIELD type in 1234
	 
	Examples:
      |	email_address			|	password			|	user_name		|	account_number	|	item_number_valid		|
      |	US_user4_email			|	US_user4_password	|	US_user4_name	|	US_user4_id		|	US_standard_product2	|