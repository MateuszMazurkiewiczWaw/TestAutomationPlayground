@Sprint4
Feature: HOL-23032 Fleet item can be ordered with the Internal Ship-to process

  Scenario Outline: Fleet item can be ordered with the Internal Ship-to process
		
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
		
		#Adding items to the cart
	 	When Webshop Main Page: In section HEADER click SHOPPING_CART_BUTTON
	 	Then Cart Page: Section QUICK_ITEM_ENTRY is visible
	 	And Cart Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <product_id>
	 	And Cart Page: Click ADD_TO_CART_BUTTON
	 	And Webshop Main Page: The SHOPPING_CART contains <product_quantity> item
	 	And Cart Page: Section FLEET_PRODUCTS_TABLE is visible
	 	
	 	When Cart Page: In section SHOPPING_CART_HEADER click CHECK_OUT_BUTTON
	 	And General: Wait 3 second
	 	Then Checkout Delivery Page: Section DELIVERY_ADDRESS_FORM is visible
	 	
	 	And Checkout Delivery Page: In section DELIVERY_ADDRESS_FORM click SHIP_TO_A_HILTI_CENTER_RADIOBUTTON
		And Checkout Delivery Page: STORELOCATOR_POPUP is visible
		And Checkout Delivery Page: Element STORELOCATOR_POPUP contains text storelocator.label.title
		When Checkout Delivery Page: In section STORELOCATOR_POPUP click USE_MY_LOCATION_BUTTON
		#First available
		Then Checkout Delivery Page: In section STORELOCATOR_POPUP element HILTI_CENTER_NAME is visible
		And Checkout Delivery Page: Remember value of HILTI_CENTER_NAME as HILTI_CENTER_NAME1
		When Checkout Delivery Page: In section STORELOCATOR_POPUP click SELECT_HILTI_CENTER_BUTTON
		And General: Wait 2 seconds
		Then Checkout Delivery Page: STORELOCATOR_POPUP is not visible
		And Checkout Delivery Page: Section DELIVERY_ADDRESS_FORM contains remembered value HILTI_CENTER_NAME1	
	 
	Examples:
      |	email_address			|	password			|	user_name		|	account_number	|	product_id			|	product_quantity	|
      |	US_fleet_email			|	US_fleet_password	|	US_fleet_name	|	US_fleet_id		|	US_fleet_product1	|	1					|