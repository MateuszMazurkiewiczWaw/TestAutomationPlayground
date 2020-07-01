@Sprint5
Feature: HOL-20601 Standard Check out: Ship to hybris Center

  Scenario Outline: Testing the overlays, and delivery page elements regarding shipping to HC process
		
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
	 	And Webshop Main Page: The SHOPPING_CART contains <summed_up_quantity> items
	 	
	 	#Proceeding to the Checkout Delivery Page and testing the shipping to HC process
	 	When Cart Page: In section SHOPPING_CART_HEADER click CHECK_OUT_BUTTON
	 	Then General: Wait 2 second
	 	And Checkout Delivery Page: Click SHIP_TO_A_hybris_CENTER_RADIOBUTTON
	 	And Checkout Delivery Page: Section STORELOCATOR_POPUP is visible
	 	And Checkout Delivery Page: In section STORELOCATOR_POPUP in field FIND_hybris_CENTER_TEXTFIELD type in <hybris_center_location1>
	 	And Checkout Delivery Page: In section STORELOCATOR_POPUP click SEARCH_hybris_CENTER_BUTTON
	 	And Checkout Delivery Page: Element hybris_CENTER_NAME contains text <hybris_center_location1>
	 	And Checkout Delivery Page: In section STORELOCATOR_POPUP click SELECT_hybris_CENTER_BUTTON
	 	Then General: Wait 1 second
	 	And Checkout Delivery Page: Section STORELOCATOR_POPUP is not visible
		And Checkout Delivery Page: Section REQUEST_SINGLE_SHIPMENT_CHECKBOX is visible
		And Checkout Delivery Page: In section DELIVERY_ADDRESS_FORM element SELECTED_hybris_STORE_ADDRESS is visible
		And Checkout Delivery Page: In section DELIVERY_ADDRESS_FORM element SELECTED_hybris_STORE_ADDRESS contains text <hybris_center_location1>
		And Checkout Delivery Page: In section DELIVERY_ADDRESS_FORM element SHIPPING_METHOD contains text <shipping_method_notification>
		
		#Changing the HC
		And Checkout Delivery Page: In section DELIVERY_ADDRESS_FORM click CHANGE_hybris_CENTER_BUTTON
		And Checkout Delivery Page: Section CHANGE_hybris_CENTER_POPUP is visible
		And Checkout Delivery Page: Section CHANGE_hybris_CENTER_POPUP contains text <hybris_center_location1>
		And Checkout Delivery Page: In section CHANGE_hybris_CENTER_POPUP in field FIND_hybris_CENTER_TEXTFIELD type in <hybris_center_city>
	 	And Checkout Delivery Page: In section CHANGE_hybris_CENTER_POPUP click SEARCH_hybris_CENTER_BUTTON
	 	And Checkout Delivery Page: Element hybris_CENTER_NAME contains text <hybris_center_location1>
	 	And Checkout Delivery Page: In section CHANGE_hybris_CENTER_POPUP element CURRENTLY_SELECTED_hybris_STORE_NOTIFICATION is visible
	 	And Checkout Delivery Page: Element SECOND_hybris_CENTER_NAME contains text <hybris_center_location2>
	 	And Checkout Delivery Page: Click SECOND_hybris_CENTER_NAME
	 	And Checkout Delivery Page: In section CHANGE_hybris_CENTER_POPUP click SELECT_hybris_CENTER_BUTTON
	 	Then General: Wait 1 second
	 	And Checkout Delivery Page: Section CHANGE_hybris_CENTER_POPUP is not visible
	 	And Checkout Delivery Page: In section DELIVERY_ADDRESS_FORM element SELECTED_hybris_STORE_ADDRESS is visible
		And Checkout Delivery Page: In section DELIVERY_ADDRESS_FORM element SELECTED_hybris_STORE_ADDRESS contains text <hybris_center_location2>
	 	And Checkout Delivery Page: In section DELIVERY_ADDRESS_FORM element SHIPPING_METHOD contains text <shipping_method_notification>
	 	
	Examples:
      |	email_address			|	password			|	user_name		|	account_number	|	item_number_valid		|	hybris_center_location1		|	hybris_center_location2			|	hybris_center_city	|	shipping_method_notification	|	summed_up_quantity	|
      |	US_user_email			|	US_user_password	|	US_user_name	|	US_user_id		|	US_standard_product1	|	hybris Center Chicago Loop	|	hybris Center Chicago Oak Lawn	|	Chicago				|	Ship to hybris Center			|	5					|