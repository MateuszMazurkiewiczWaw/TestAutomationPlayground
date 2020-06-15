@Sprint2
Feature: HOL-19351 Order History

	Scenario Outline: Order History - order managing functionality
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

	    Then Webshop Main Page: Section HEADER contains text <user_name>
	    And Webshop Main Page: Section HEADER contains text <user_id> 
	        
		Then Webshop Main Page: Section YOUR_ORDERS is visible		
		When Webshop Main Page: In section YOUR_ORDERS click VIEW_YOUR_ORDER_LIST_LINK
		And Order History Page: ORDER_HISTORY_TABLE is visible
		
		Then Order History Page: Section ORDER_HISTORY is visible
		And Order History Page: Section ORDER_HISTORY contains text account.orderHistory.label.hint	
		And Order History Page: Section SHIPMENT_TRACKING is visible
		And Order History Page: Section SHIPMENT_TRACKING contains text account.orderHistory.label.shipmentTracking
		And Order History Page: REQUEST_COPY_OF_INVOICE_BUTTON is visible
		And Order History Page: Element REQUEST_COPY_OF_INVOICE_BUTTON is disabled
		And Order History Page: REORDER_BUTTON is visible
		And Order History Page: Element REORDER_BUTTON is disabled
		
		#sort to have completed order in first row
		When Order History Page: Click DELIVERY_STATUS_SORT_BUTTON
		
		#Copy of invoice request
		Then Order History Page: In ORDER_HISTORY_TABLE in row 1 check ORDER_HISTORY_CHECKBOX
		And Order History Page: Element REQUEST_COPY_OF_INVOICE_BUTTON is enabled
		And Order History Page: Element REORDER_BUTTON is enabled
		
		When Order History Page: Click REQUEST_COPY_OF_INVOICE_BUTTON
		
		And Order History Page: MESSAGE_BOX is visible
		#Depending on an env. Checking any message box
		#Then Order History Page: Element MESSAGE_BOX contains text COULD NOT REQUEST INVOICE
		And General: Wait 3 seconds
		When Order History Page: In section ORDER_HISTORY click REORDER_BUTTON
		Then Order History Page: SUCCESS_MESSAGE_BOX is visible
		And Order History Page: Element SUCCESS_MESSAGE_BOX contains text account.orderHistory.message.success.reorder
		
		#Display the "Details" button
		When Order History Page: In ORDER_HISTORY_TABLE in row 2 move cursor to element ORDER_NUMBER_COLUMN
		Then Order History Page: In ORDER_HISTORY_TABLE in row 2 DETAILS_BUTTON is visible
		
		#Sorting the table by name
		When Order History Page: Click ORDER_NUMBER_SORT_BUTTON
		Then Order History Page: In ORDER_HISTORY_TABLE ORDER_NUMBER_COLUMN is sorted ascending
		And Order History Page: Click ORDER_NUMBER_SORT_BUTTON
		When Order History Page: In ORDER_HISTORY_TABLE ORDER_NUMBER_COLUMN is sorted descending 
		
		#Sorting table by date
		When Order History Page: Click DATE_SORT_BUTTON
		Then Order History Page: In ORDER_HISTORY_TABLE DATE_COLUMN is sorted ascending
		When Order History Page: Click DATE_SORT_BUTTON
		Then Order History Page: In ORDER_HISTORY_TABLE DATE_COLUMN is sorted descending
		
	Examples:
      	|	email_address	|	password			|	user_name		|	user_id		|
		|	US_user_email	|	US_user_password	|	US_user_name	|	US_user_id	|   
		
	Scenario Outline: Order History - no orders placed
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

	    Then Webshop Main Page: Section HEADER contains text <user_name>
	    And Webshop Main Page: Section HEADER contains text <user_id> 
	        
		Then Webshop Main Page: Section YOUR_ORDERS is visible		
		When Webshop Main Page: In section YOUR_ORDERS click VIEW_YOUR_ORDER_LIST_LINK
		And General: Wait 3 seconds
		And Order History Page: ORDER_HISTORY_TABLE is not visible
		And Order History Page: NO_ORDERS_MESSAGE_BOX is visible
		And Order History Page: Element NO_ORDERS_MESSAGE_BOX contains text account.orderHistory.label.emptyList.headline
		And Order History Page: Element NO_ORDERS_MESSAGE_BOX contains text account.orderHistory.label.emptyList.text
		
		
		
	Examples:
      	|	email_address	|	password			|	user_name		|	user_id		|
		|	US_user2_email	|	US_user2_password	|	US_user2_name	|	US_user2_id	|   
