@Sprint3
Feature: HOL-22714 Check out - Pickup details

  Scenario Outline: Pick up functionalities during checkout process
		
		#Enter the page
		Given General: open webshop for United States
		And Webshop Main Page: If section I_UNDERSTAND_COOKIES is visible click I_UNDERSTAND_BUTTON
		And Webshop Main Page: If section ONE_MORE_THING_BANNER is visible click DO_NOT_ASK_AGAIN_BUTTON
		And Webshop Main Page: If section DO_YOU_NEED_HELP is visible click DONT_ASK_ME_AGAIN_BUTTON
		When Webshop Main Page: In section HEADER element LOG_IN_OR_REGISTER_BUTTON is visible
	    Then Webshop Main Page: In section HEADER click LOG_IN_OR_REGISTER_BUTTON
	    And Webshop Main Page: Section LOG_IN_OR_REGISTER is visible
	    
	    #1-Fill out login
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
	 	And Cart Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <product_id>
	 	And Cart Page: Click ADD_TO_CART_BUTTON
	 	And Webshop Main Page: The SHOPPING_CART contains <product_quantity> item
	 	
	 	#Proceeding to the Checkout Pickup Details Page
	 	When Cart Page: Check CLICK_AND_COLLECT_CHECKBOX
	 	And Cart Page: In section SHOPPING_CART_HEADER click CHECK_OUT_BUTTON
	 	And General: Wait 1 second
	 	And Checkout Pickup Location Page: CONTINUE_BUTTON is visible
	 	And General: Wait 1 second
	 	And Checkout Pickup Location Page: Click CONTINUE_BUTTON
	 	Then Checkout Pickup Details Page: Section PICKUP_DETAILS_FORM is visible
	 	And Checkout Pickup Details Page: In section PICKUP_DETAILS_FORM element EXPECTED_PICKUP_CONTACT_COLUMN is visible
	 	And Checkout Pickup Details Page: In section PICKUP_DETAILS_FORM element HILTI_CENTER_COLUMN is visible
	 	And Checkout Pickup Details Page: In section PICKUP_DETAILS_FORM element OPENING_HOURS_COLUMN is visible
	 	And Checkout Pickup Details Page: In section PICKUP_DETAILS_FORM element LOCATION_MAP is visible
	 	And Checkout Pickup Details Page: In section PICKUP_DETAILS_FORM element GET_DIRECTIONS_BUTTON is visible
	 	And Checkout Pickup Details Page: In section PICKUP_DETAILS_FORM element CONTINUE_BUTTON is visible
	 	And Checkout Pickup Details Page: In section PICKUP_DETAILS_FORM click EXPECTED_DELIVERY_CHANGE_BUTTON
	 	And Checkout Pickup Details Page: Section MANAGE_CONTACTS_POPUP is visible
	 	And Checkout Pickup Details Page: In section PICKUP_DETAILS_FORM element MANAGE_CONTACTS_TABLE is visible
	 	And Checkout Pickup Details Page: In section MANAGE_CONTACTS_TABLE move cursor to element SECOND_CONTACT_POSITION
	 	And General: Wait 1 second
	 	And Checkout Pickup Details Page: In section MANAGE_CONTACTS_TABLE click SELECT_CONTACT_BUTTON
	 	And General: Wait 1 second
	 	And Checkout Pickup Details Page: Section MANAGE_CONTACTS_POPUP is not visible
	 	
	 	#Continuing and testing possibility to go back
	 	When Checkout Pickup Details Page: In section PICKUP_DETAILS_FORM click CONTINUE_BUTTON
	 	And General: Wait 1 second
	 	Then Checkout Billing Page: Click BACK_TO_PREVIOUS_STEP_BUTTON
	 	And General: Wait 1 second
	 	And Checkout Pickup Details Page: In section PICKUP_DETAILS_FORM click BACK_TO_PREVIOUS_STEP_BUTTON
	 	And Checkout Pickup Location Page: CONTINUE_BUTTON is visible
	 	
	 
	Examples:
      |	email_address			|	password			|	user_name		|	account_number	|	product_id				|	product_quantity	|
      |	US_user5_email			|	US_user5_password	|	US_user5_name	|	US_user5_id		|	US_standard_product2	|	1					|