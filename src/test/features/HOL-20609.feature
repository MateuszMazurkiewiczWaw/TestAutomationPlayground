@Sprint4
Feature: HOL-20609 Uniserv check layer

    Scenario Outline: Uniserv check layer
		
		#Get to the Check In STEP-2 section.
	    #1-Fill out login
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
	    And Webshop Main Page: Section HEADER contains text <user_id>
	    
		When Webshop Main Page: In section HEADER element SHOPPING_CART_BUTTON is visible
	    Then Webshop Main Page: In section HEADER click SHOPPING_CART_BUTTON
	    Then Cart Page: Section QUICK_ITEM_ENTRY is visible
		And Cart Page: In section SHOPPING_CART_HEADER element CONTINUE_SHOPPING_LINK is visible
	 	And Cart Page: In section QUICK_ITEM_ENTRY element QUICK_ITEM_ENTRY_TEXTFIELD is visible
	 	And Cart Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <STANDARD_PRODUCT1>
	 	And Cart Page: Click ADD_TO_CART_BUTTON

		Then Cart Page: Section STANDARD_PRODUCTS_TABLE is visible
		And Webshop Main Page: The SHOPPING_CART contains <product_qunatity> item
	 	And Cart Page: In section SHOPPING_CART_HEADER click CHECK_OUT_BUTTON   		
	 	Then Checkout Delivery Page: Section DELIVERY_ADDRESS_FORM is visible
	 	And Checkout Delivery Page: Section DELIVERY_ADDRESS_FORM not contains text <user_name>
		
		#Click Change Delivery address button
		Then Checkout Delivery Page: In section DELIVERY_ADDRESS_FORM click CHANGE_DELIVERY_ADDRESS_BUTTON
		And Checkout Delivery Page: CHANGE_DELIVERY_ADDRESS_POPUP is visible
		And Checkout Delivery Page: Element CHANGE_DELIVERY_ADDRESS_POPUP contains text checkout.deliveryAddressOverlay.label.title
		
		When Checkout Delivery Page: In section CHANGE_DELIVERY_ADDRESS_POPUP click CREATE_NEW_DELIVERY_ADDRESS_BUTTON
		Then Checkout Delivery Page: Section ADD_NEW_DELIVERY_ADDRESS is visible
		When Checkout Delivery Page: In section ADD_NEW_DELIVERY_ADDRESS in field NEW_COMPANY_NAME_TEXTFIELD type in <user_name>
		And Checkout Delivery Page: In section ADD_NEW_DELIVERY_ADDRESS in field NEW_ADDRESS_STREET_TEXTFIELD type in <street>
		And Checkout Delivery Page: In section ADD_NEW_DELIVERY_ADDRESS in field NEW_ADDRESS_CITY_TEXTFIELD type in <city>
		And Checkout Delivery Page: In section ADD_NEW_DELIVERY_ADDRESS click NEW_ADDRESS_STATE_DROPDOWN
		And Checkout Delivery Page: In section NEW_ADDRESS_STATE_DROPDOWN_CONTENT click element with text <state>
		And Checkout Delivery Page: In section ADD_NEW_DELIVERY_ADDRESS in field NEW_ADDRESS_ZIPCODE_TEXTFIELD type in <zip_code>
		And Checkout Delivery Page: In section ADD_NEW_DELIVERY_ADDRESS click ADD_NEW_DELIVERY_ADDRESS_BUTTON
		
		Then Checkout Delivery Page: Section ADDRESS_CONFIRMATION is visible
		And Checkout Delivery Page: Section ADDRESS_CONFIRMATION contains text uniservOverlay.checkoutAddNewAddress.label.description
		
		#check if section stays open
		When Checkout Delivery Page: Click outside of section ADDRESS_CONFIRMATION
		Then Checkout Delivery Page: Section ADDRESS_CONFIRMATION is visible
		
		And Checkout Delivery Page: Section ADDRESS_CONFIRMATION contains text <street>
		And Checkout Delivery Page: Section ADDRESS_CONFIRMATION contains text <city>
		And Checkout Delivery Page: Section ADDRESS_CONFIRMATION contains text <zip_code>
		And Checkout Delivery Page: Section ADDRESS_CONFIRMATION contains text <state>
		
		When Checkout Delivery Page: In section ADDRESS_CONFIRMATION click USE_OUR_SUGGESTION_BUTTON
		And General: Wait 3 seconds
		Then Checkout Delivery Page: Section ADDRESS_CONFIRMATION is not visible
		
		And Checkout Delivery Page: Section DELIVERY_ADDRESS_FORM contains text <user_name>
		And Checkout Delivery Page: Section DELIVERY_ADDRESS_FORM contains text <street>
		And Checkout Delivery Page: Section DELIVERY_ADDRESS_FORM contains text <city>
		And Checkout Delivery Page: Section DELIVERY_ADDRESS_FORM contains text <zip_code>
		And Checkout Delivery Page: Section DELIVERY_ADDRESS_FORM contains text <state>
	
		
		Examples:
      |	STANDARD_PRODUCT1		|	product_qunatity	|	street				|	city			|	zip_code			|	state				|	email_address		|	password			|	user_name		|	user_id		|
      |	US_standard_product2	|	1					|	US_uniserv_street	|	US_uniserv_city	|	US_uniserv_zipcode	|	US_uniserv_state	|	US_user3_email		|	US_user3_password	|	US_user3_name	|	US_user3_id	| 