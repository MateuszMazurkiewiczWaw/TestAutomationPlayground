@Sprint4
Feature: HOL-20505 Checkout - Manage contacts overlay

    Scenario Outline: Checkout - Manage contacts overlay
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
	 	When Cart Page: In section QUICK_ITEM_ENTRY click QUICK_ITEM_ENTRY_TEXTFIELD
	 	And Cart Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <STANDARD_PRODUCT1>
	 	And Cart Page: Click ADD_TO_CART_BUTTON

		Then Cart Page: Section STANDARD_PRODUCTS_TABLE is visible
		And Webshop Main Page: The SHOPPING_CART contains 1 item
	 	When Cart Page: In section SHOPPING_CART_HEADER click CHECK_OUT_BUTTON 
	 	Then General: Wait 2 seconds
		When Checkout Delivery Page: In section DELIVERY_ADDRESS_FORM click CHANGE_DELIVERY_CONTACT_BUTTON
		Then Checkout Delivery Page: CHANGE_DELIVERY_CONTACT_POPUP is visible
		
		#Edit columns of the addresses table
		When General: Set browser window dimension to 1000x700
		Then General: Wait 2 seconds
		When Checkout Delivery Page: Remember value of FIRST_DISPLAYED_CONTACT_CLOUMN as NAME_OF_FIRST_EDITABLE_COLUMN
		And Checkout Delivery Page: In section CHANGE_DELIVERY_CONTACT_POPUP click EDIT_COLUMNS_BUTTON
		Then Checkout Delivery Page: Section EDIT_COLUMNS_OVERLAY is visible
		And Checkout Delivery Page: In section EDIT_COLUMNS_OVERLAY click element with text NAME_OF_FIRST_EDITABLE_COLUMN
		And General: Wait 3 seconds
		And Checkout Delivery Page: Section FIRST_DISPLAYED_CONTACT_CLOUMN not contains remembered value NAME_OF_FIRST_EDITABLE_COLUMN
		And Checkout Delivery Page: In section EDIT_COLUMNS_OVERLAY click CLOSE_EDIT_COLUMNS_OVERLAY
		
		#show all button
		When Checkout Delivery Page: In section CHANGE_DELIVERY_CONTACT_POPUP click SHOW_ALL_COLUMNS_BUTTON
		Then Checkout Delivery Page: In section CHANGE_DELIVERY_CONTACT_POPUP there is exactly 9 DISPLAYED_CONTACT_CLOUMNS elements
		And Checkout Delivery Page: In section CHANGE_DELIVERY_CONTACT_POPUP element SHOW_ALL_COLUMNS_BUTTON is disabled
		And General: Set browser window dimension to default
		
		#sorting verification
		When Checkout Delivery Page: In section SELECT_CONTACT_TABLE_HEADER click FIRST_NAME_COLUMN_SORT_BUTTON
		And General: Wait 1 second
		Then Checkout Delivery Page: In SELECT_CONTACT_TABLE FIRST_NAME_COLUMN is sorted ascending
		When Checkout Delivery Page: In section SELECT_CONTACT_TABLE_HEADER click FIRST_NAME_COLUMN_SORT_BUTTON
		And General: Wait 1 second
		Then Checkout Delivery Page: In SELECT_CONTACT_TABLE FIRST_NAME_COLUMN is sorted descending		
		When Checkout Delivery Page: In section SELECT_CONTACT_TABLE_HEADER click LAST_NAME_COLUMN_SORT_BUTTON
		And General: Wait 1 second
		Then Checkout Delivery Page: In SELECT_CONTACT_TABLE LAST_NAME_COLUMN is sorted ascending
		When Checkout Delivery Page: In section SELECT_CONTACT_TABLE_HEADER click LAST_NAME_COLUMN_SORT_BUTTON
		And General: Wait 1 second
		Then Checkout Delivery Page: In SELECT_CONTACT_TABLE LAST_NAME_COLUMN is sorted descending		
		When Checkout Delivery Page: In section SELECT_CONTACT_TABLE_HEADER click FUNCTION_COLUMN_SORT_BUTTON
		And General: Wait 1 second
		Then Checkout Delivery Page: In SELECT_CONTACT_TABLE FUNCTION_COLUMN is sorted ascending
		When Checkout Delivery Page: In section SELECT_CONTACT_TABLE_HEADER click FUNCTION_COLUMN_SORT_BUTTON
		And General: Wait 1 second
		Then Checkout Delivery Page: In SELECT_CONTACT_TABLE FUNCTION_COLUMN is sorted descending
				
		And Checkout Delivery Page: In section CHANGE_DELIVERY_CONTACT_POPUP element CREATE_NEW_DELIVERY_CONTACT_BUTTON is visible
		And Checkout Delivery Page: In section CHANGE_DELIVERY_CONTACT_POPUP element SEARCH_CONTACT_INPUT is visible
		And Checkout Delivery Page: In section CHANGE_DELIVERY_CONTACT_POPUP element AVAILABLE_DELIVERY_CONTACTS_LIST is visible

		#User can see an overview of addresses assigned to the customer.
		When Checkout Delivery Page: In section AVAILABLE_DELIVERY_CONTACTS_LIST move cursor to element ADDRESS_LIST_POSITION_2
		Then General: Wait 2 seconds
		Then Checkout Delivery Page: In section AVAILABLE_DELIVERY_CONTACTS_LIST element CHOOSE_AS_SHIPPING_ADDRESS is visible 
		Then General: Wait 2 seconds
		When Checkout Delivery Page: In section AVAILABLE_DELIVERY_CONTACTS_LIST click CHOOSE_AS_SHIPPING_ADDRESS
		Then General: Wait 1 second
		And Checkout Delivery Page: CHANGE_DELIVERY_CONTACT_POPUP is not visible
	
		When Checkout Delivery Page: In section DELIVERY_ADDRESS_FORM click CHANGE_DELIVERY_CONTACT_BUTTON
		Then General: Wait 2 seconds

		#Search Field Error
		When Checkout Delivery Page: In section CHANGE_DELIVERY_CONTACT_POPUP in field SEARCH_CONTACT_INPUT type and remember 20_RANDOM_CHARACTERS as RANDOM_SEARCH_STRING
		Then Checkout Delivery Page: In section CHANGE_DELIVERY_CONTACT_POPUP element ADDRESS_NOT_FOUND_MESSAGE is visible
		And Checkout Delivery Page: In section CHANGE_DELIVERY_CONTACT_POPUP element SEARCH_CONTACT_INPUT is visible
		When Checkout Delivery Page: In section CHANGE_DELIVERY_CONTACT_POPUP click CREATE_NEW_DELIVERY_CONTACT_EMPTY_SEARCH
		And General: Wait 3 seconds
		Then Checkout Delivery Page: Section ADD_NEW_DELIVERY_CONTACT is visible
		And Checkout Delivery Page: In section ADD_NEW_DELIVERY_CONTACT click CANCEL_BUTTON
		And General: Wait 3 seconds
		
		#Clear search button
		When Checkout Delivery Page: Click CLEAR_CONTACT_SEARCH_BUTTON
		Then Checkout Delivery Page: Section CHANGE_DELIVERY_CONTACT_POPUP not contains text RANDOM_SEARCH_STRING
		And Checkout Delivery Page: In section AVAILABLE_DELIVERY_CONTACTS_LIST element CURRENT_ADDRESS is visible	
		And General: Wait 3 seconds
		When Checkout Delivery Page: In section CHANGE_DELIVERY_CONTACT_POPUP click CREATE_NEW_DELIVERY_CONTACT_BUTTON
		And General: Wait 3 seconds
		Then Checkout Delivery Page: Section ADD_NEW_DELIVERY_CONTACT is visible
		
		#verify validations for new address
		When Checkout Delivery Page: In section ADD_NEW_DELIVERY_CONTACT click ADD_NEW_DELIVERY_ADDRESS_BUTTON
		Then Checkout Delivery Page: In section ADD_NEW_DELIVERY_CONTACT element CONTACT_VALIDATION_ERROR_TITLE is visible
		Then Checkout Delivery Page: In section ADD_NEW_DELIVERY_CONTACT element CONTACT_VALIDATION_ERROR_FIRST_NAME is visible
		Then Checkout Delivery Page: In section ADD_NEW_DELIVERY_CONTACT element CONTACT_VALIDATION_ERROR_LAST_NAME is visible
		Then Checkout Delivery Page: In section ADD_NEW_DELIVERY_CONTACT element CONTACT_VALIDATION_ERROR_FUNCTION is visible
		Then Checkout Delivery Page: In section ADD_NEW_DELIVERY_CONTACT element CONTACT_VALIDATION_ERROR_PHONE is visible
		
		#add new address
		And Checkout Delivery Page: Generate 15 random characters and remember as GENERATED_FIRST_NAME
		And Checkout Delivery Page: In section ADD_NEW_DELIVERY_CONTACT in field NEW_CONTACT_FIRST_NAME_TEXTFIELD type in GENERATED_FIRST_NAME
		Then Checkout Delivery Page: Generate 15 random characters and remember as GENERATED_LAST_NAME
		When Checkout Delivery Page: In section ADD_NEW_DELIVERY_CONTACT in field NEW_CONTACT_LAST_NAME_TEXTFIELD type in GENERATED_LAST_NAME
		And Checkout Delivery Page: In section ADD_NEW_DELIVERY_CONTACT click NEW_CONTACT_TITLE_DROPDOWN
		And Checkout Delivery Page: In section NEW_CONTACT_TITLE_DROPDOWN_CONTENT click element with text <title>
		And Checkout Delivery Page: In section ADD_NEW_DELIVERY_CONTACT click NEW_CONTACT_FUNCTION_DROPDOWN
		And Checkout Delivery Page: In section NEW_CONTACT_FUNCTION_DROPDOWN_CONTENT click element with text <function>
		And Checkout Delivery Page: In section ADD_NEW_DELIVERY_CONTACT in field NEW_CONTACT_PHONE_TEXTFIELD type in <phone_number>
		And Checkout Delivery Page: In section ADD_NEW_DELIVERY_CONTACT click ADD_NEW_DELIVERY_ADDRESS_BUTTON
		
		#verify address visibility on delivery info page
		And General: Wait 5 seconds
		And Checkout Delivery Page: Element DISPLAYED_DELIVERY_CONTACT contains remembered value GENERATED_FIRST_NAME
		And Checkout Delivery Page: Element DISPLAYED_DELIVERY_CONTACT contains remembered value GENERATED_LAST_NAME
		
		#verify if user can search for added address
		When Checkout Delivery Page: In section DELIVERY_ADDRESS_FORM click CHANGE_DELIVERY_CONTACT_BUTTON
		And General: Wait 3 seconds
		When Checkout Delivery Page: In section CHANGE_DELIVERY_CONTACT_POPUP in field SEARCH_CONTACT_INPUT type in GENERATED_LAST_NAME
		And Checkout Delivery Page: Section AVAILABLE_DELIVERY_CONTACTS_LIST contains remembered value GENERATED_FIRST_NAME
		And Checkout Delivery Page: Section AVAILABLE_DELIVERY_CONTACTS_LIST contains remembered value GENERATED_LAST_NAME
		And Checkout Delivery Page: Section AVAILABLE_DELIVERY_CONTACTS_LIST contains text <function>
		And Checkout Delivery Page: Section AVAILABLE_DELIVERY_CONTACTS_LIST contains text <title>
		And Checkout Delivery Page: Section AVAILABLE_DELIVERY_CONTACTS_LIST contains text <phone_number>
		
		#verify if user can close overlay with [X]
		When Checkout Delivery Page: Click POPUP_CLOSE_BUTTON 
		And General: Wait 3 seconds
		Then Checkout Delivery Page: CHANGE_DELIVERY_CONTACT_POPUP is not visible
	
		
		Examples:
      |	STANDARD_PRODUCT1		|	phone_number	|	state		|	email_address		|	password			|	user_name		|	user_id		|	title	|	function			|
      |	US_standard_product2	|	666-666-1234	|	Oklahoma	|	US_user2_email		|	US_user2_password	|	US_user2_name	|	US_user2_id	|	Mrs.	|	Master Craftsman 	|