@Sprint3
Feature: HOL-20537 Cart Messages - Standard Cart Messages
  Scenario Outline: Cart messages behaviour
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
	    
	    #Adding items to the cart
	    When Webshop Main Page: In section HEADER click SHOPPING_CART_BUTTON
	 	Then Cart Page: Section QUICK_ITEM_ENTRY is visible
	 	And Cart Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <item_number1>
	 	And Cart Page: Click ADD_TO_CART_BUTTON
	 	And Webshop Main Page: The SHOPPING_CART contains <item_quantity> items
	 	And Cart Page: REPLACEMENT_ERROR_MESSAGE_BOX is visible
	 	And Cart Page: Element REPLACEMENT_ERROR_MESSAGE_BOX contains text cart.message.error.itemsNoMoreAvailableHeadline
	 	And Cart Page: Element REPLACEMENT_ERROR_MESSAGE_BOX contains text cart.message.error.itemsNoMoreAvailableText
	 	And Cart Page: In section SHOPPING_CART_HEADER element CHECK_OUT_BUTTON is disabled
	 	And Cart Page: Section STANDARD_PRODUCTS_REPLACEMENT_TABLE is visible
		And Cart Page: In section STANDARD_PRODUCTS_REPLACEMENT_TABLE element OUT_OF_STOCK_MESSAGE is visible
		And Cart Page: Element OUT_OF_STOCK_MESSAGE contains text cart.item.message.error.noMoreAvailableHeadline
		And Cart Page: Element OUT_OF_STOCK_MESSAGE contains text cart.item.message.error.noMoreAvailableText
		And Cart Page: Section STANDARD_PRODUCTS_REPLACEMENT_TABLE contains text cart.item.label.replacementSuggestions
		And Cart Page: In section STANDARD_PRODUCTS_REPLACEMENT_TABLE element REPLACEMENT_ROW is visible
		And Cart Page: In section STANDARD_PRODUCTS_REPLACEMENT_TABLE element TABLE_REPLACE_BUTTON is enabled
		And Cart Page: In section STANDARD_PRODUCTS_REPLACEMENT_TABLE element REMOVE_FROM_CART_REPLACEMENT_BUTTON is enabled
			 		
	Examples:
		|	email_address		|	password				|	account_number		|	user_name		|	item_number1				|	item_quantity	|
		|	US_user_email		|	US_user_password		|	US_user_id			|	US_user_name	|	US_replacement_product1		|	10				|