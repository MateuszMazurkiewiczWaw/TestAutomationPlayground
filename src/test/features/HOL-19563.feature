@Sprint5
Feature: HOL-19563 Find or Change hybris Center overlays

  Scenario Outline: Find or Change hybris Center overlays functionality
		
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
	 	And Webshop Main Page: The SHOPPING_CART contains <qunatity_of_item> items
	 	
	 	#Testing selecting overlay and closing options
	 	Then Cart Page: Click SELECT_hybris_CENTER_OVERLAY_BUTTON
	 	And Cart Page: Section CHANGE_hybris_CENTER_POPUP is visible
	 	And Cart Page: In section CHANGE_hybris_CENTER_POPUP element LOCATION_MAP is visible
	 	And Cart Page: In section CHANGE_hybris_CENTER_POPUP element STORE_LOCATOR_TEXTFIELD is visible
	 	And Cart Page: In section CHANGE_hybris_CENTER_POPUP element USE_MY_LOCATION_BUTTON is visible
	 	And Cart Page: In section CHANGE_hybris_CENTER_POPUP in field STORE_LOCATOR_TEXTFIELD type in <hybris_center_city1>
	 	And Cart Page: In section CHANGE_hybris_CENTER_POPUP click SEARCH_LOCATION_BUTTON
	 	
	 	When Cart Page: Click SECOND_hybris_CENTER_NAME
	 	And Cart Page: hybris_CENTER_ADDRESS_COLUMN is visible
	 	And Cart Page: hybris_CENTER_OPENING_HOURS_COLUMN is visible
	 	
	 	Then Cart Page: If section CURRENTLY_OPENED_hybris_CENTER contains text checkout.deliveryInfo.label.currentlySelected click CLOSE_OVERLAY_BUTTON else click hybris_CENTER_SELECT_BUTTON
	 	
	 	And General: Wait 3 seconds
	 	And Cart Page: Section CHANGE_hybris_CENTER_POPUP is not visible
	 	
	 	When Cart Page: Click SELECT_hybris_CENTER_OVERLAY_BUTTON
	 	Then Cart Page: Section CHANGE_hybris_CENTER_POPUP is visible
	 	And Cart Page: Click CLOSE_OVERLAY_BUTTON
	 	And General: Wait 1 second
	 	And Cart Page: Section CHANGE_hybris_CENTER_POPUP is not visible
	 	And Cart Page: Click SELECT_hybris_CENTER_OVERLAY_BUTTON
	 	And Cart Page: Section CHANGE_hybris_CENTER_POPUP is visible
	 	And Cart Page: Click outside of element USE_MY_LOCATION_BUTTON
	 	And General: Wait 1 second
	 	And Cart Page: Section CHANGE_hybris_CENTER_POPUP is not visible
	 	And Cart Page: Element SELECTED_hybris_CENTER contains text <selected_hybris_center_text>
	 	
	 	#Testing changing overlay
	 	When Cart Page: In section SHOPPING_CART_HEADER click CHECK_OUT_BUTTON
	 	And General: Wait 5 seconds
	 	Then Checkout Pickup Location Page: Click CHANGE_hybris_CENTER_BUTTON
	 	Then Checkout Pickup Location Page: Section CHANGE_hybris_CENTER_POPUP is visible
	 	And Checkout Pickup Location Page: Section CHANGE_hybris_CENTER_POPUP contains text <overlay_header2>
	 	And Checkout Pickup Location Page: In section CHANGE_hybris_CENTER_POPUP in field ENTER_ZIP_CODE_OR_CITY_TEXTFIELD type in <hybris_center_city1>
	 	And Checkout Pickup Location Page: In section CHANGE_hybris_CENTER_POPUP click SEARCH_LOCATION_BUTTON
	 	And General: Wait 1 second
	 	
	 	When Checkout Pickup Location Page: Click SECOND_hybris_CENTER_NAME
	 	And General: Wait 1 second
	 	Then Checkout Pickup Location Page: In section CHANGE_hybris_CENTER_POPUP element CURRENTLY_SELECTED_hybris_STORE_NOTIFICATION is visible
	 	And Checkout Pickup Location Page: Click hybris_CENTER_NAME
	 	And Checkout Pickup Location Page: In section CHANGE_hybris_CENTER_POPUP click hybris_CENTER_SELECT_BUTTON
	 	And General: Wait 1 second
	 	And Checkout Pickup Location Page: Section CHANGE_hybris_CENTER_POPUP is not visible
	 	
	 	When Checkout Pickup Location Page: Click CHANGE_hybris_CENTER_BUTTON
	 	And Checkout Pickup Location Page: Section CHANGE_hybris_CENTER_POPUP contains text <overlay_header5>
	 	And Checkout Pickup Location Page: In section CHANGE_hybris_CENTER_POPUP element LOCATION_MAP is visible
	 	And Checkout Pickup Location Page: In section CHANGE_hybris_CENTER_POPUP element ENTER_ZIP_CODE_OR_CITY_TEXTFIELD is visible
	 	And Checkout Pickup Location Page: In section CHANGE_hybris_CENTER_POPUP element USE_MY_LOCATION_BUTTON is visible
	 	And Checkout Pickup Location Page: In section CHANGE_hybris_CENTER_POPUP in field ENTER_ZIP_CODE_OR_CITY_TEXTFIELD type in <hybris_center_city2>
	 	And Checkout Pickup Location Page: In section CHANGE_hybris_CENTER_POPUP click SEARCH_LOCATION_BUTTON
	 	And Checkout Pickup Location Page: Click SECOND_hybris_CENTER_NAME
	 	And Checkout Pickup Location Page: hybris_CENTER_ADDRESS_COLUMN is visible
	 	And Checkout Pickup Location Page: hybris_CENTER_OPENING_HOURS_COLUMN is visible
	 	And Checkout Pickup Location Page: In section CHANGE_hybris_CENTER_POPUP click hybris_CENTER_SELECT_BUTTON
	 	And General: Wait 1 second
	 	And Checkout Pickup Location Page: Section CHANGE_hybris_CENTER_POPUP is not visible
	 	And Checkout Pickup Location Page: Click CHANGE_hybris_CENTER_BUTTON
	 	And Checkout Pickup Location Page: Section CHANGE_hybris_CENTER_POPUP is visible
	 	And Checkout Pickup Location Page: Section CHANGE_hybris_CENTER_POPUP contains text <overlay_header4>
	 	
	 	#Testing use my location scenario
	 	When Checkout Pickup Location Page: In section CHANGE_hybris_CENTER_POPUP click USE_MY_LOCATION_BUTTON
	 	And General: Wait 1 second	 		 	
	 	Then Checkout Pickup Location Page: Remember value of hybris_CENTER_NAME as GEOLOCATION_hybrisCENTER
	 	And Checkout Pickup Location Page: In section CHANGE_hybris_CENTER_POPUP click hybris_CENTER_SELECT_BUTTON
	 	And General: Wait 1 second
	 	And Checkout Pickup Location Page: Section CHANGE_hybris_CENTER_POPUP is not visible
	 	And Checkout Pickup Location Page: Click CHANGE_hybris_CENTER_BUTTON
	 	And Checkout Pickup Location Page: Section CHANGE_hybris_CENTER_POPUP contains remembered value GEOLOCATION_hybrisCENTER
	 
	Examples:
      |	email_address			|	password			|	user_name		|	account_number	|	item_number_valid		|	qunatity_of_item	|	hybris_center_city1	|	hybris_center_city2	|	hybris_center_city3			|	overlay_header2		|	selected_hybris_center_text	|	overlay_header3				|	overlay_header4					|	overlay_header5				|
      |	US_user_email			|	US_user_password	|	US_user_name	|	US_user_id		|	US_standard_product1    |	5				|	Kansas City			|	Chicago				|	hybris Center Boston Woburn	|	hybris CENTER JOPLIN	|	hybris Center Joplin			|	hybris CENTER BOSTON WOBURN	|	hybris CENTER CHICAGO OAK LAWN	|	hybris CENTER KANSAS CITY	|