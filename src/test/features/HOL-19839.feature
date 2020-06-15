@Sprint3
Feature: HOL-19839 Home Page - Content Area

  Scenario Outline: Homepage layout
		#Enter the page
		Given General: open webshop for United States
		And Webshop Main Page: If section I_UNDERSTAND_COOKIES is visible click I_UNDERSTAND_BUTTON
		And Webshop Main Page: If section ONE_MORE_THING_BANNER is visible click DO_NOT_ASK_AGAIN_BUTTON
		#And General: Wait 5 seconds
	    And Webshop Main Page: If section DO_YOU_NEED_HELP is visible click DONT_ASK_ME_AGAIN_BUTTON
	    
	    #Mainstage layout (not logged in)
		Then Webshop Main Page: Section MAINSTAGE_CONTAINER is visible
		And Webshop Main Page: In section MAINSTAGE_CONTAINER element MAIN_IMAGE is visible
		And Webshop Main Page: In section MAINSTAGE_CONTAINER element TITLE is visible
		And Webshop Main Page: In section MAINSTAGE_CONTAINER element SUBTITLE is visible
		
		#QUICK ACCESS CONTAINER
		Then Webshop Main Page: In section QUICK_ACCESS_CONTAINER element DOWNLOADS is visible
		
		#TRADE SELECTOR
		Then Webshop Main Page: Section TRADE_SELECTOR is visible   
		And Webshop Main Page: In section TRADE_SELECTOR element TRADE_PLEASE_CHOOSE_BUTTON is visible
		When Webshop Main Page: In section TRADE_SELECTOR click TRADE_PLEASE_CHOOSE_BUTTON
		Then  Webshop Main Page: TRADE_DROPDOWN_LIST contains more than 1 TRADE_OPTION
		And Webshop Main Page: In section TRADE_SELECTOR click TRADE_PLEASE_CHOOSE_BUTTON
		
		#QUICK ITEM ENTRY - SUCCESS
		Then Webshop Main Page: Section QUICK_ITEM_ENTRY is visible
	 	And Webshop Main Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <item_number_valid>#<item_first_quantity>
	 	And Webshop Main Page: Click ADD_TO_CART_BUTTON
	 	And Webshop Main Page: The SHOPPING_CART contains <item_first_quantity> items
	 	And Webshop Main Page: SUCCESS_MESSAGE_BOX is visible
	 	
	 	#QUICK ITEM ENTRY - FAILED ENTRY
	 	When Webshop Main Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <item_number_invalid>
	 	And Webshop Main Page: Click ADD_TO_CART_BUTTON
	 	Then Webshop Main Page: ERROR_MESSAGE_BOX is visible
	 	And Webshop Main Page: The SHOPPING_CART contains <item_first_quantity> items
	 	And Webshop Main Page: Element QUICK_ITEM_ENTRY_TEXTFIELD contains text <item_number_invalid>
	 	
	 	Then Webshop Main Page: In section ERROR_MESSAGE_BOX click PLEASE_CONTACT_US_IF_YOU_NEED_ASSISTANCE_LINK
	 	And Webshop Main Page: Section CONTACT_US is visible
		And Webshop Main Page: In section CONTACT_US element CALL_US is visible
		And Webshop Main Page: In section CONTACT_US element CALL_US contains text contact.label.callUsText
		And Webshop Main Page: In section CONTACT_US click CLOSE_CHAT_BUTTON
		And General: Wait 1 second
	 	
	 	
	 	#QUICK ITEM ENTRY - MIXED ENTRY
	 	When Webshop Main Page: In section QUICK_ITEM_ENTRY clear value of QUICK_ITEM_ENTRY_TEXTFIELD
	 	And Webshop Main Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <item_number_invalid>
	 	Then Webshop Main Page: Press ENTER on a keyboard
	 	And Webshop Main Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <item_number_valid>#<item_first_quantity>
	 	And General: Wait 2 seconds
	 	And Webshop Main Page: Click ADD_TO_CART_BUTTON
	 	And Webshop Main Page: SUCCESS_MESSAGE_BOX is visible
	 	And Webshop Main Page: ERROR_MESSAGE_BOX is visible
	 	And Webshop Main Page: The SHOPPING_CART contains <item_second_quantity> items
	 	And Webshop Main Page: Element QUICK_ITEM_ENTRY_TEXTFIELD contains text <item_number_invalid>

	 Examples:
      |	item_number_valid		|	item_first_quantity	|	item_second_quantity	|	item_number_invalid	|
      |	US_standard_product1	|	5					|	10						|	555666272#1			|
      
     Scenario Outline: HOL-23507 Home page logic - based on trade cookie after first login
		Given General: open webshop for United States
		And Webshop Main Page: If section I_UNDERSTAND_COOKIES is visible click I_UNDERSTAND_BUTTON
		And Webshop Main Page: If section ONE_MORE_THING_BANNER is visible click DO_NOT_ASK_AGAIN_BUTTON
		#And General: Wait 5 seconds
	    And Webshop Main Page: If section DO_YOU_NEED_HELP is visible click DONT_ASK_ME_AGAIN_BUTTON
	    
	    When General: Cookie <cookie_name> does not exist
	    And Webshop Main Page: Section QUICK_ACCESS is not visible
	    And Webshop Main Page: Section QUICK_ACCESS_SHORT is visible
	    And Webshop Main Page: Section TRADE_SELECTOR is visible   
		And Webshop Main Page: In section TRADE_SELECTOR element TRADE_PLEASE_CHOOSE_BUTTON is visible
		And Webshop Main Page: In section TRADE_SELECTOR click TRADE_PLEASE_CHOOSE_BUTTON
		And Webshop Main Page: TRADE_DROPDOWN_LIST contains more than 1 TRADE_OPTION
		
		When Webshop Main Page: In section HEADER click LOG_IN_OR_REGISTER_BUTTON
	    And Webshop Main Page: Section LOG_IN_OR_REGISTER is visible

	    And Webshop Main Page: In section LOG_IN_OR_REGISTER in field EMAIL_ADDRESS_TEXTFIELD type in <email_address>
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER in field PASSWORD_TEXTFIELD type in <password>
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER element LOG_IN_BUTTON is enabled
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER click LOG_IN_BUTTON

	    Then Webshop Main Page: Section HEADER contains text <user_name>
	    And Webshop Main Page: Section HEADER contains text <user_id> 
	    And General: Wait 2 seconds
		And General: Cookie <cookie_name> does exist
	    And General: Wait 2 seconds

		When Webshop Main Page: Click LOG_OUT_BUTTON
		And General: Wait 2 seconds
		Then Webshop Main Page: Section QUICK_ACCESS is visible
	    And Webshop Main Page: Section QUICK_ACCESS_SHORT is not visible
	    And Webshop Main Page: Section TRADE_SELECTOR is not visible
		And General: Cookie <cookie_name> does exist
		
		When General: Delete cookie <cookie_name>
		And General: Delete cookie JSESSIONID
		And General: Refresh current page
		Then General: Cookie <cookie_name> does not exist
		And Webshop Main Page: Section QUICK_ACCESS is not visible
	    And Webshop Main Page: Section QUICK_ACCESS_SHORT is visible
	    And Webshop Main Page: Section TRADE_SELECTOR is visible  
		
      
      Examples:
		|	cookie_name		|	email_address	|	password			|	user_name		|	user_id		|
		|	tradeSegment	|	US_user2_email	|	US_user2_password	|	US_user2_name	|	US_user2_id	|   
      