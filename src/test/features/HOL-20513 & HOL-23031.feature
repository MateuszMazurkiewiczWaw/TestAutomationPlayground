@Sprint4
Feature: HOL-20513 & HOL-23031 Checkout - Manage delivery address overlay

    Scenario Outline: Checkout - Manage delivery address overlay
		
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
		And Webshop Main Page: The SHOPPING_CART contains 1 item
	 	When Cart Page: In section SHOPPING_CART_HEADER click CHECK_OUT_BUTTON 
	 	And General: Wait 5 seconds
	 	
		When Checkout Delivery Page: In section DELIVERY_ADDRESS_FORM click CHANGE_DELIVERY_ADDRESS_BUTTON
		Then Checkout Delivery Page: CHANGE_DELIVERY_ADDRESS_POPUP is visible
		And Checkout Delivery Page: In section CHANGE_DELIVERY_ADDRESS_POPUP element CREATE_NEW_DELIVERY_ADDRESS_BUTTON is visible
		And Checkout Delivery Page: In section CHANGE_DELIVERY_ADDRESS_POPUP element SEARCH_ADDRESS_INPUT is visible
		And Checkout Delivery Page: In section CHANGE_DELIVERY_ADDRESS_POPUP element AVAILABLE_DELIVERY_ADDRESSES_LIST is visible

		#User can see an overview of addresses assigned to the customer.
		When Checkout Delivery Page: In section AVAILABLE_DELIVERY_ADDRESSES_LIST move cursor to element ADDRESS_LIST_POSITION_2
		Then General: Wait 2 seconds
		Then Checkout Delivery Page: In section AVAILABLE_DELIVERY_ADDRESSES_LIST element CHOOSE_AS_SHIPPING_ADDRESS is visible 
		Then General: Wait 2 seconds
		When Checkout Delivery Page: In section AVAILABLE_DELIVERY_ADDRESSES_LIST click CHOOSE_AS_SHIPPING_ADDRESS
		Then General: Wait 1 second
		And Checkout Delivery Page: CHANGE_DELIVERY_ADDRESS_POPUP is not visible
		And Checkout Delivery Page: Section SHIPPING_METHOD not contains text null value

		#Edit columns of the addresses table	
		When Checkout Delivery Page: In section DELIVERY_ADDRESS_FORM click CHANGE_DELIVERY_ADDRESS_BUTTON
		When Checkout Delivery Page: Remember value of SECOND_DISPLAYED_CLOUMN as NAME_OF_FIRST_EDITABLE_COLUMN
		
		And General: Set browser window dimension to 1000x700
		And Checkout Delivery Page: In section CHANGE_DELIVERY_ADDRESS_POPUP click EDIT_COLUMNS_BUTTON
		Then Checkout Delivery Page: Section EDIT_COLUMNS_OVERLAY is visible
		And Checkout Delivery Page: In section EDIT_COLUMNS_OVERLAY click element with text NAME_OF_FIRST_EDITABLE_COLUMN
		And General: Wait 3 seconds
		And Checkout Delivery Page: Section SECOND_DISPLAYED_CLOUMN not contains remembered value NAME_OF_FIRST_EDITABLE_COLUMN
		And Checkout Delivery Page: In section EDIT_COLUMNS_OVERLAY click CLOSE_EDIT_COLUMNS_OVERLAY
		And General: Set browser window dimension to default
		
		#show all button
		#HOL-26245 (comments)
		When Checkout Delivery Page: In section CHANGE_DELIVERY_ADDRESS_POPUP click SHOW_ALL_COLUMNS_BUTTON
		Then Checkout Delivery Page: In section CHANGE_DELIVERY_ADDRESS_POPUP there is exactly 7 DISPLAYED_CLOUMNS elements
		And Checkout Delivery Page: In section CHANGE_DELIVERY_ADDRESS_POPUP element SHOW_ALL_COLUMNS_BUTTON is disabled

		#Search Field Error
		When Checkout Delivery Page: In section CHANGE_DELIVERY_ADDRESS_POPUP in field SEARCH_ADDRESS_INPUT type and remember 20_RANDOM_CHARACTERS as RANDOM_SEARCH_STRING
		Then Checkout Delivery Page: In section CHANGE_DELIVERY_ADDRESS_POPUP element ADDRESS_NOT_FOUND_MESSAGE is visible
		And Checkout Delivery Page: In section CHANGE_DELIVERY_ADDRESS_POPUP element SEARCH_ADDRESS_INPUT is visible
		When Checkout Delivery Page: In section CHANGE_DELIVERY_ADDRESS_POPUP click CREATE_NEW_DELIVERY_ADDRESS_EMPTY_SEARCH
		Then Checkout Delivery Page: Section ADD_NEW_DELIVERY_ADDRESS is visible
		And Checkout Delivery Page: In section ADD_NEW_DELIVERY_ADDRESS click CANCEL_BUTTON
		And General: Wait 3 seconds
		
		#Clear search button
		When Checkout Delivery Page: Click CLEAR_SEARCH_BUTTON
		Then Checkout Delivery Page: Section CHANGE_DELIVERY_ADDRESS_POPUP not contains text RANDOM_SEARCH_STRING
		And Checkout Delivery Page: In section AVAILABLE_DELIVERY_ADDRESSES_LIST element CURRENT_ADDRESS is visible
		
		And General: Wait 3 seconds

		When Checkout Delivery Page: In section CHANGE_DELIVERY_ADDRESS_POPUP click CREATE_NEW_DELIVERY_ADDRESS_BUTTON
		Then Checkout Delivery Page: Section ADD_NEW_DELIVERY_ADDRESS is visible
		
		#verify validations for new address
		When Checkout Delivery Page: In ADD_NEW_DELIVERY_ADDRESS clear value of NEW_ADDRESS_COMPANY_TEXTFIELD
		And Checkout Delivery Page: In section ADD_NEW_DELIVERY_ADDRESS click ADD_NEW_DELIVERY_ADDRESS_BUTTON
		Then Checkout Delivery Page: In section ADD_NEW_DELIVERY_ADDRESS element VALIDATION_ERROR_COMPANY is visible
		Then Checkout Delivery Page: In section ADD_NEW_DELIVERY_ADDRESS element VALIDATION_ERROR_STREET is visible
		Then Checkout Delivery Page: In section ADD_NEW_DELIVERY_ADDRESS element VALIDATION_ERROR_CITY is visible
		Then Checkout Delivery Page: In section ADD_NEW_DELIVERY_ADDRESS element VALIDATION_ERROR_STATE is visible
		Then Checkout Delivery Page: In section ADD_NEW_DELIVERY_ADDRESS element VALIDATION_ERROR_ZIP_CODE is visible
		
		#add new address
		And Checkout Delivery Page: Generate 15 random characters and remember as GENERATED_COMPANY_NAME
		And Checkout Delivery Page: In section ADD_NEW_DELIVERY_ADDRESS in field NEW_ADDRESS_COMPANY_TEXTFIELD type in GENERATED_COMPANY_NAME
		Then Checkout Delivery Page: Generate 15 random characters and remember as GENERATED_STREET_NAME
		When Checkout Delivery Page: In section ADD_NEW_DELIVERY_ADDRESS in field NEW_ADDRESS_STREET_TEXTFIELD type in GENERATED_STREET_NAME
		And Checkout Delivery Page: Generate 15 random characters and remember as GENERATED_CITY_NAME
		And Checkout Delivery Page: In section ADD_NEW_DELIVERY_ADDRESS in field NEW_ADDRESS_CITY_TEXTFIELD type in GENERATED_CITY_NAME
		And Checkout Delivery Page: In section ADD_NEW_DELIVERY_ADDRESS click NEW_ADDRESS_STATE_DROPDOWN
		And Checkout Delivery Page: In section NEW_ADDRESS_STATE_DROPDOWN_CONTENT click element with text <state>
		And Checkout Delivery Page: In section ADD_NEW_DELIVERY_ADDRESS in field NEW_ADDRESS_ZIPCODE_TEXTFIELD type in <zip_code>
		And Checkout Delivery Page: In section ADD_NEW_DELIVERY_ADDRESS click ADD_NEW_DELIVERY_ADDRESS_BUTTON
		
		#verify address visibility on delivery info page
		And General: Wait 10 seconds
		And Checkout Delivery Page: Element DISPLAYED_DELIVERY_ADDRESS contains remembered value GENERATED_COMPANY_NAME
		And Checkout Delivery Page: Element DISPLAYED_DELIVERY_ADDRESS contains remembered value GENERATED_STREET_NAME
		And Checkout Delivery Page: Element DISPLAYED_DELIVERY_ADDRESS contains remembered value GENERATED_CITY_NAME
		And Checkout Delivery Page: Section DISPLAYED_DELIVERY_ADDRESS contains text <zip_code>
		And Checkout Delivery Page: Section DISPLAYED_DELIVERY_ADDRESS contains text <state>
		
		#verify if user can search for added address
		When Checkout Delivery Page: In section DELIVERY_ADDRESS_FORM click CHANGE_DELIVERY_ADDRESS_BUTTON
		When Checkout Delivery Page: In section CHANGE_DELIVERY_ADDRESS_POPUP in field SEARCH_ADDRESS_INPUT type in GENERATED_COMPANY_NAME
		And Checkout Delivery Page: Section AVAILABLE_DELIVERY_ADDRESSES_LIST contains remembered value GENERATED_COMPANY_NAME
		And Checkout Delivery Page: Section AVAILABLE_DELIVERY_ADDRESSES_LIST contains remembered value GENERATED_STREET_NAME
		And Checkout Delivery Page: Section AVAILABLE_DELIVERY_ADDRESSES_LIST contains remembered value GENERATED_CITY_NAME
		And Checkout Delivery Page: Section AVAILABLE_DELIVERY_ADDRESSES_LIST contains text <zip_code>
		And Checkout Delivery Page: Section AVAILABLE_DELIVERY_ADDRESSES_LIST contains text <state>
		
		#verify if user can close overlay with [X]
		When Checkout Delivery Page: Click POPUP_CLOSE_BUTTON 
		And General: Wait 3 seconds
		Then Checkout Delivery Page: CHANGE_DELIVERY_ADDRESS_POPUP is not visible
	
		
		Examples:
      |	STANDARD_PRODUCT1		|	zip_code	|	state		|	email_address		|	password			|	user_name		|	user_id		|
      |	US_standard_product2	|	12345		|	Oklahoma	|	US_user_email		|	US_user_password	|	US_user_name	|	US_user_id	| 