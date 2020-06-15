@Sprint4
Feature: HOL-20489 and HOL-20497 and HOL-22392 Software Check out - Order summary, Confirmation Page & Order Summary Print

  Scenario Outline: Full finalization of Software checkout, including confirmation page and summary print
		
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
	 	And Webshop Main Page: The SHOPPING_CART contains 1 item
	 	
	 	#Proceeding to the Checkout Order Summary
	 	And Cart Page: In section SHOPPING_CART_HEADER click CHECK_OUT_BUTTON
		And General: Wait 3 seconds
	 	And Checkout Billing Page: Click CONTINUE_BUTTON
	 	And General: Wait 1 second
		And Checkout Order Summary Page: Section CHECKOUT_FORM is visible
		
		#Bread crumbs checking
		When Checkout Order Summary Page: In section PROGRESS_BAR element SHOPPING_CART_BREADCRUMB is visible
		Then Checkout Order Summary Page: In section PROGRESS_BAR element BILLING_INFORMATION_BREADCRUMB is visible
		And Checkout Order Summary Page: In section PROGRESS_BAR element ORDER_SUMMARY_BREADCRUMB is visible
		
		#Required sections checking
		When Checkout Order Summary Page: Section BILLING_INFORMATION_SUMMARY is visible
		Then Checkout Order Summary Page: In section BILLING_INFORMATION_SUMMARY element EDIT_BILLING_INFORMATION_BUTTON is visible
		And Checkout Order Summary Page: In section BILLING_INFORMATION_SUMMARY element ACCOUNT_INFO_COLUMN is visible
		And Checkout Order Summary Page: In section BILLING_INFORMATION_SUMMARY element BILLING_INFO_COLUMN is visible
		
		When Checkout Order Summary Page: Section YEARLY_BILLING_PRODUCTS_TABLE is visible
		And Checkout Order Summary Page: In section YEARLY_BILLING_PRODUCTS_TABLE element PRODUCT_DESCRIPTION_COLUMN is visible
		And Checkout Order Summary Page: In section YEARLY_BILLING_PRODUCTS_TABLE element QUANTITY_COLUMN is visible
		And Checkout Order Summary Page: In section YEARLY_BILLING_PRODUCTS_TABLE element PACKAGING_UNIT_COLUMN is visible
		And Checkout Order Summary Page: In section YEARLY_BILLING_PRODUCTS_TABLE element PRICE_COLUMN is visible
		And Checkout Order Summary Page: In section YEARLY_BILLING_PRODUCTS_TABLE element TOTAL_PRICE_COLUMN is visible
		And Checkout Order Summary Page: In section YEARLY_BILLING_PRODUCTS_TABLE element EXPECTED_DELIVERY_DATE is visible
		And Checkout Order Summary Page: Section YEARLY_BILLING_SUBTOTAL_TABLE is visible
		
		#Going back to previous sections
		When Checkout Order Summary Page: In section BILLING_INFORMATION_SUMMARY click EDIT_BILLING_INFORMATION_BUTTON
		And General: Wait 1 second
		Then Checkout Billing Page: Section BILLING_INFORMATION_FORM is visible
		And Checkout Billing Page: Click CONTINUE_BUTTON
	 	And General: Wait 1 second
	 	
		When Checkout Order Summary Page: Click EDIT_SOFTWARE_PRODUCTS_BUTTON
		And General: Wait 1 second
		Then Cart Page: Section QUICK_ITEM_ENTRY is visible
		And Cart Page: In section SHOPPING_CART_HEADER click CHECK_OUT_BUTTON
		And General: Wait 1 second
		And Checkout Billing Page: Click CONTINUE_BUTTON
	 	And General: Wait 1 second
	 	
	 	When Checkout Order Summary Page: Click EDIT_YEARLY_BILLING_PRODUCTS_BUTTON
		And General: Wait 1 second
		Then Cart Page: Section QUICK_ITEM_ENTRY is visible
		And Cart Page: In section SHOPPING_CART_HEADER click CHECK_OUT_BUTTON
		And General: Wait 1 second
		And Checkout Billing Page: Click CONTINUE_BUTTON
	 	And General: Wait 1 second
	 	
		#Testing printing functionality
		When Checkout Order Summary Page: Click SUMMARY_PRINT_BUTTON
		Then General: Switch to tab number 2
		And Checkout Summary Print Page: Section PRINT_HEADER is visible
		And Checkout Summary Print Page: Section PRINT_FOOTER is visible
		And Checkout Summary Print Page: Section PRINT_BILLING_INFORMATION is visible
		And Checkout Summary Print Page: In section PRINT_BILLING_INFORMATION element BILLING_YOUR_ACCOUNT_COLUMN is visible
		And Checkout Summary Print Page: In section PRINT_BILLING_INFORMATION element BILLING_DETAILS_COLUMN is visible
		And Checkout Summary Print Page: Section PRINT_YEARLY_BILLING_SUMMARY is visible
		And General: Discard tab number 2
		And General: Wait 1 second
		And General: Switch to tab number 1
		
		#Testing order confirmation page
		When Checkout Order Summary Page: Click SUBMIT_ORDER_BUTTON
		Then Checkout Order Confirmation Page: SUCCESS_MESSAGE_BOX is visible
		And Checkout Order Confirmation Page: Element SUCCESS_MESSAGE_BOX contains text checkout.orderConfirmation.message.success.softwareHeadlineTitle
		
		When Checkout Order Confirmation Page: GO_TO_HOMEPAGE_LINK is visible
		And Checkout Order Confirmation Page: INNOVATION_MAGAZIN_MARKETING_CONTAINER is visible
		And Checkout Order Confirmation Page: NEW_PRODUCTS_CONTAINER is visible
		
		When Checkout Order Confirmation Page: Click GO_TO_HOMEPAGE_LINK
		Then General: Wait 1 second
		And Webshop Main Page: QUICK_ITEM_ENTRY is visible
	 
	Examples:
      |	email_address			|	password			|	user_name		|	account_number	|	item_number_valid		|
      |	US_user_email			|	US_user_password	|	US_user_name	|	US_user_id		|	US_software_product1    |