@Sprint6
Feature: HOL-20337 Availability check

  Scenario Outline: Availability check overlay functionalities and content
		
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
	 	And Cart Page: Click ADD_TO_CART_BUTTON
	 	And General: Wait 3 seconds
	 	
	 	#Off to check availability overlay
	 	When Cart Page: Click CHECK_AVAILABILITY_LINK
	 	And General: Wait 2 seconds
	 	Then Cart Page: Section CHECK_AVAILABILITY_OVERLAY is visible
	 	
	 	#Check availability overlay main sections testing
	 	When Cart Page: Section CHECK_AVAILABILITY_OVERLAY_TABLE is visible
	 	Then Cart Page: Section ADD_TO_CART_OVERLAY_WIDGET is visible
	 	And Cart Page: Section PICK_UP_FROM_HC_OVERLAY_WIDGET is visible
	 	
	 	#Check availability overlay - table testing
	 	When Cart Page: In section CHECK_AVAILABILITY_OVERLAY_TABLE element OVERLAY_TABLE_DESCRIPTION_FIELD is visible
	 	Then Cart Page: In section CHECK_AVAILABILITY_OVERLAY_TABLE element OVERLAY_TABLE_PACKAGING_UNIT_FIELD is visible
	 	And Cart Page: In section CHECK_AVAILABILITY_OVERLAY_TABLE element OVERLAY_TABLE_PRICE_FIELD is visible
	 	And Cart Page: In section CHECK_AVAILABILITY_OVERLAY_TABLE element OVERLAY_TABLE_MINATURE_IMAGE is visible
	 	And Cart Page: In section CHECK_AVAILABILITY_OVERLAY_TABLE element OVERLAY_TABLE_QUANTITY_TEXTIELD is visible
	 	And Cart Page: In section CHECK_AVAILABILITY_OVERLAY_TABLE element OVERLAY_TABLE_CHECK_AVAILABILITY_BUTTON is visible
	 	And Cart Page: In section CHECK_AVAILABILITY_OVERLAY_TABLE element OVERLAY_TABLE_INSTRUCTION_NOTE is visible
	 	
	 	When Cart Page: In element OVERLAY_TABLE_QUANTITY_TEXTIELD type in value <item_quantity>
	 	Then Cart Page: In section CHECK_AVAILABILITY_OVERLAY_TABLE click OVERLAY_TABLE_CHECK_AVAILABILITY_BUTTON
	 	And General: Wait 2 seconds
	 	
	 	#Check availability overlay - shopping cart widget testing
	 	When Cart Page: In section ADD_TO_CART_OVERLAY_WIDGET element AVAILABILITY_NOTIFICATION contains text availabilityCheck.message.success.availabilityCheck
	 	Then Cart Page: In section ADD_TO_CART_OVERLAY_WIDGET element ADD_TO_CART_OVERLAY_QUANTITY_TEXTFIELD has value <item_quantity>
	 	And Cart Page: In section ADD_TO_CART_OVERLAY_WIDGET click ADD_TO_CART_OVERLAY_BUTTON
	 	And General: Wait 2 seconds
	 	And Cart Page: The SHOPPING_CART contains <summed_up_quantity> items
	 	And Cart Page: In section STANDARD_PRODUCTS_TABLE_CONTENT click CHECK_AVAILABILITY_LINK
	 	And General: Wait 2 seconds
	 	
	 	When Cart Page: In section CHECK_AVAILABILITY_OVERLAY_TABLE in field OVERLAY_TABLE_QUANTITY_TEXTIELD type in <item_quantity2>
	 	Then Cart Page: In section CHECK_AVAILABILITY_OVERLAY_TABLE click OVERLAY_TABLE_CHECK_AVAILABILITY_BUTTON
		And General: Wait 2 seconds
	 	And Cart Page: In section ADD_TO_CART_OVERLAY_WIDGET element AVAILABILITY_NOTIFICATION contains text availabilityCheck.message.partial.availabilityCheck
	 	
	 	#Check availability overlay - pick up from hybris center widget testing
	 	When Cart Page: In section PICK_UP_FROM_HC_OVERLAY_WIDGET in field CHECK_AVAILABILITY_OVERLAY_CITY_TEXTFIELD type in <hc_city>
	 	And General: Wait 2 seconds
	 	When Cart Page: Remember value of CHECK_AVAILABILITY_OVERLAY_CITY_TEXTFIELD as CITY_NAME
	 	Then Cart Page: In section PICK_UP_FROM_HC_OVERLAY_WIDGET click CHECK_AVAILABILITY_OVERLAY_SEARCH_BUTTON
	 	And General: Wait 2 seconds
	 	And Cart Page: OVERLAY_USE_MY_LOCATION_BUTTON is visible
	 	And Cart Page: In section OVERLAY_HC_CITY_LIST element ADD_TO_CART_OVERLAY_QUANTITY_TEXTFIELD in position 1 is visible
	 	And Cart Page: In section OVERLAY_HC_CITY_LIST element ADD_TO_CART_OVERLAY_BUTTON in position 1 is visible
	 	And Cart Page: In section OVERLAY_HC_CITY_LIST element OVERLAY_GET_DIRECTIONS_LINK in position 1 is visible
	 	And Cart Page: In section OVERLAY_HC_CITY_LIST element OVERLAY_OPENING_HOURS_BUTTON in position 1 is visible
	 	And Cart Page: Scroll to OVERLAY_hybris_CENTER_MAP
	 	And Cart Page: In section OVERLAY_HC_CITY_LIST click element OVERLAY_OPENING_HOURS_BUTTON in position 1
	 	And General: Wait 2 seconds
	 	And Cart Page: Section OVERLAY_OPENING_HOURS_POPUP is visible
	 	And Cart Page: In section OVERLAY_OPENING_HOURS_POPUP click OVERLAY_OPENING_HOURS_POPUP_CLOSE_BUTTON
	 	And General: Wait 2 seconds
	 	And Cart Page: Click CHECK_AVAILABILITY_OVERLAY_CLOSE_BUTTON
	 	And General: Wait 2 seconds
	 	And Cart Page: Section CHECK_AVAILABILITY_OVERLAY is not visible
	 	
	 	
	Examples:
      |	email_address			|	password			|	user_name		|	account_number	|	item_number_valid		|	item_quantity	|	summed_up_quantity	|	item_quantity2	|	hc_city		|
      |	US_user2_email			|	US_user2_password	|	US_user2_name	|	US_user2_id		|	US_standard_product1	|	10				|	15					|	999999			|	Kansas City	|