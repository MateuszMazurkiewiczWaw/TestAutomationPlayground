@Sprint6
Feature: HOL-20104 Auto logout NB 

  Scenario Outline: Auto logout - Keep Me Logged In - Flag On
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
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER element KEEP_ME_LOGGED_IN_CHECKBOX is checked
	    Then Webshop Main Page: In section LOG_IN_OR_REGISTER in field EMAIL_ADDRESS_TEXTFIELD type in <email_address>
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER in field PASSWORD_TEXTFIELD type in <password>
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER element LOG_IN_BUTTON is enabled
	    Then Webshop Main Page: In section LOG_IN_OR_REGISTER click LOG_IN_BUTTON
	    
	    And Webshop Main Page: Section HEADER contains text <user_name>
	    And Webshop Main Page: Section HEADER contains text <user_id> 
	    
	    When Webshop Main Page: In section HEADER element SHOPPING_CART_BUTTON is visible
	    Then Webshop Main Page: In section HEADER click SHOPPING_CART_BUTTON
	    When General: Make session expired with page refresh
	    And Cart Page: Section QUICK_ITEM_ENTRY is visible
	 	And Cart Page: In section QUICK_ITEM_ENTRY element QUICK_ITEM_ENTRY_TEXTFIELD is visible
	 	And Cart Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <STANDARD_PRODUCT>
	 	And Cart Page: Click ADD_TO_CART_BUTTON
	 	
	 	And Webshop Main Page: The SHOPPING_CART contains <qunatity_of_item> item
	 	
	 	And Cart Page: In section SHOPPING_CART_HEADER click CHECK_OUT_BUTTON
	 	
	 	Then Webshop Main Page: Section AUTO_LOGOUT is visible
	 	And Webshop Main Page: In section AUTO_LOGOUT element KEEP_ME_LOGGED_IN_CHECKBOX is checked
	    And Webshop Main Page: In section AUTO_LOGOUT element EMAIL_ADDRESS_TEXTFIELD has value <email_address>
	    And Webshop Main Page: In section AUTO_LOGOUT in field PASSWORD_TEXTFIELD type in <password>
	    And Webshop Main Page: In section AUTO_LOGOUT click LOG_IN_BUTTON
	    
	   	And Webshop Main Page: Section HEADER contains text <user_name>
	    And Webshop Main Page: Section HEADER contains text <user_id> 
	 	
		And Cart Page: Section QUICK_ITEM_ENTRY is visible
		 And General: Wait 2 seconds
		And Webshop Main Page: In section HEADER click OPEN_DASHBOARD_BUTTON		
		When Webshop Main Page: Section ACCOUNT_DASHBOARD is visible
		And Webshop Main Page: Section ACCOUNT_DASHBOARD contains text <user_name>
		And Webshop Main Page: In section ACCOUNT_DASHBOARD click VIEW_YOUR_PROFILE_LINK
		Then Profile Page: Section YOUR_ACCOUNT is visible
		
		When General: Make session expired with page refresh
		And General: Wait 1 second
		And Webshop Main Page: In section HEADER click OPEN_DASHBOARD_BUTTON
		And Webshop Main Page: Section ACCOUNT_DASHBOARD is visible
		And Webshop Main Page: Section ACCOUNT_DASHBOARD contains text <user_name>
		Then Webshop Main Page: In section YOUR_FAVORITE_LISTS click GO_TO_FAVORITE_LISTS_LINK
		
		Then My Favorite Lists Page: Section FAVORITE_LIST is visible
		And General: Wait 1 second
		And Webshop Main Page: Section AUTO_LOGOUT is not visible
		Then Webshop Main Page: In section HEADER click SHOPPING_CART_BUTTON
	    And Cart Page: Section QUICK_ITEM_ENTRY is visible
	 	And Cart Page: In section QUICK_ITEM_ENTRY element QUICK_ITEM_ENTRY_TEXTFIELD is visible
	 	And Cart Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <STANDARD_PRODUCT>
	 	And Cart Page: Click ADD_TO_CART_BUTTON
	 	
	 	Then Webshop Main Page: The SHOPPING_CART contains more than 0 items
	 	
	 	And Cart Page: In section SHOPPING_CART_HEADER click CHECK_OUT_BUTTON
	 	
	 	Then Webshop Main Page: Section AUTO_LOGOUT is visible
	 	Then Webshop Main Page: In section AUTO_LOGOUT element KEEP_ME_LOGGED_IN_CHECKBOX is checked
	    And Webshop Main Page: In section AUTO_LOGOUT element EMAIL_ADDRESS_TEXTFIELD has value <email_address>
	    And Webshop Main Page: In section AUTO_LOGOUT click CLOSE_AUTO_LOGOUT_BUTTON
	    And General: Wait 1 second
	    And Webshop Main Page: Section AUTO_LOGOUT is not visible
	    
	    When Cart Page: In section SHOPPING_CART_HEADER click CHECK_OUT_BUTTON
	 	Then Webshop Main Page: Section AUTO_LOGOUT is visible
	 	And Webshop Main Page: In section AUTO_LOGOUT element KEEP_ME_LOGGED_IN_CHECKBOX is checked
	    And Webshop Main Page: In section AUTO_LOGOUT element EMAIL_ADDRESS_TEXTFIELD has value <email_address>
	    
	    When Webshop Main Page: In section AUTO_LOGOUT in field PASSWORD_TEXTFIELD type in WrongPassword1
	   	And Webshop Main Page: In section AUTO_LOGOUT click LOG_IN_BUTTON
	   	And General: Wait 2 seconds
	   	Then Webshop Main Page: Section AUTO_LOGOUT is visible
	   	And Webshop Main Page: In section AUTO_LOGOUT element ERROR_MESSAGE_AUTO_LOGOUT is visible
	   	And Webshop Main Page: In section AUTO_LOGOUT element ERROR_MESSAGE_AUTO_LOGOUT contains text common.login.message.error.title
	   	And Webshop Main Page: In section AUTO_LOGOUT element KEEP_ME_LOGGED_IN_CHECKBOX is checked
	    And Webshop Main Page: In section AUTO_LOGOUT element EMAIL_ADDRESS_TEXTFIELD has value <email_address>
	    
	    When Webshop Main Page: In section AUTO_LOGOUT click CONTACT_US_AUTO_LOGOUT_BUTTON
	    And General: Wait 1 second
	    And Webshop Main Page: Section AUTO_LOGOUT is not visible
	    Then Webshop Main Page: Section CONTACT_US is visible
		And Webshop Main Page: In section CONTACT_US element CALL_US is visible
		And Webshop Main Page: In section CONTACT_US element CALL_US contains text contact.label.callUsText
		And Webshop Main Page: In section CONTACT_US click CLOSE_CHAT_BUTTON
		And General: Wait 1 second
		When Cart Page: In section SHOPPING_CART_HEADER click CHECK_OUT_BUTTON
	    Then Webshop Main Page: Section AUTO_LOGOUT is visible
	 	And Webshop Main Page: In section AUTO_LOGOUT element KEEP_ME_LOGGED_IN_CHECKBOX is checked
	    And Webshop Main Page: In section AUTO_LOGOUT element EMAIL_ADDRESS_TEXTFIELD has value <email_address>
		And Webshop Main Page: In section AUTO_LOGOUT click FORGOT_YOUR_PASSWORD_AUTO_LOGOUT_BUTTON
		And General: Wait 1 second
		Then Webshop Main Page: Section AUTO_LOGOUT is not visible
		And Webshop Main Page: Section FORGOTTEN_PASSWORD is visible
		
		And Cart Page: In section SHOPPING_CART_HEADER click CHECK_OUT_BUTTON
	 	
	 	Then Webshop Main Page: Section AUTO_LOGOUT is visible
	 	And Webshop Main Page: In section AUTO_LOGOUT element KEEP_ME_LOGGED_IN_CHECKBOX is checked
	    And Webshop Main Page: In section AUTO_LOGOUT element EMAIL_ADDRESS_TEXTFIELD has value <email_address>
	    And Webshop Main Page: In section AUTO_LOGOUT in field PASSWORD_TEXTFIELD type in <password>
	    And Webshop Main Page: In section AUTO_LOGOUT click LOG_IN_BUTTON
	    
	   	And Webshop Main Page: Section HEADER contains text <user_name>
	    And Webshop Main Page: Section HEADER contains text <user_id> 
		
		When Cart Page: Section QUICK_ITEM_ENTRY is visible
	 	And Cart Page: In section QUICK_ITEM_ENTRY element QUICK_ITEM_ENTRY_TEXTFIELD is visible
	 	And Cart Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <STANDARD_PRODUCT>
	 	And Cart Page: Click ADD_TO_CART_BUTTON
	 	
	 	Then Webshop Main Page: The SHOPPING_CART contains more than 0 items
	 	
	 	And Cart Page: In section SHOPPING_CART_HEADER click CHECK_OUT_BUTTON
	 	And General: Wait 1 second
	 	Then Checkout Delivery Page: Section DELIVERY_ADDRESS_FORM is visible
	 	
	 	And Checkout Delivery Page: Click CONTINUE_BUTTON
		And General: Wait 3 seconds
	 	And Checkout Billing Page: Click CONTINUE_BUTTON
	 	And General: Wait 3 seconds
		And Checkout Order Summary Page: Section CHECKOUT_FORM is visible
		
		When General: Make session expired without page refresh
		And General: Wait 1 second
		And Checkout Order Summary Page: Click SUBMIT_ORDER_BUTTON
		
		Then Webshop Main Page: Section AUTO_LOGOUT is visible
	 	And Webshop Main Page: In section AUTO_LOGOUT element KEEP_ME_LOGGED_IN_CHECKBOX is checked
	    And Webshop Main Page: In section AUTO_LOGOUT element EMAIL_ADDRESS_TEXTFIELD has value <email_address>
	    And Webshop Main Page: In section AUTO_LOGOUT in field PASSWORD_TEXTFIELD type in <password>
	    And Webshop Main Page: In section AUTO_LOGOUT click LOG_IN_BUTTON
	    
	   	And Webshop Main Page: Section HEADER contains text <user_name>
	    And Webshop Main Page: Section HEADER contains text <user_id> 
		
		Then Cart Page: Section QUICK_ITEM_ENTRY is visible
		And Cart Page: In section QUICK_ITEM_ENTRY element QUICK_ITEM_ENTRY_TEXTFIELD is visible
	 	And Cart Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <STANDARD_PRODUCT>
	 	And Cart Page: Click ADD_TO_CART_BUTTON
	 	
	 	Then Webshop Main Page: The SHOPPING_CART contains more than 0 items
	 	
	 	And Cart Page: In section SHOPPING_CART_HEADER click CHECK_OUT_BUTTON
	 	And General: Wait 1 second
	 	Then Checkout Delivery Page: Section DELIVERY_ADDRESS_FORM is visible
	 	
	 	And Checkout Delivery Page: Click CONTINUE_BUTTON
		And General: Wait 3 seconds
	 	And Checkout Billing Page: Click CONTINUE_BUTTON
	 	And General: Wait 3 seconds
		And Checkout Order Summary Page: Section CHECKOUT_FORM is visible
		
		And General: Wait 1 second
		And Checkout Order Summary Page: Click SUBMIT_ORDER_BUTTON
		And General: Wait 3 seconds
		Then Checkout Order Confirmation Page: SUCCESS_MESSAGE_BOX is visible
		And Checkout Order Confirmation Page: Element SUCCESS_MESSAGE_BOX contains text checkout.orderConfirmation.message.success.HeadlineTitle
		
		Examples:
	|	email_address		|	password			|	user_name		|	user_id			|	STANDARD_PRODUCT		|	qunatity_of_item	|
	|	US_user_email		|	US_user_password	|	US_user_id		|	US_user_name	|	US_standard_product1	|	5					|

  Scenario Outline: Auto logout - Keep Me Logged In - Flag Off
		#Enter the page
		Given General: open webshop for United States
		And Webshop Main Page: If section I_UNDERSTAND_COOKIES is visible click I_UNDERSTAND_BUTTON
		And Webshop Main Page: If section ONE_MORE_THING_BANNER is visible click DO_NOT_ASK_AGAIN_BUTTON
		And Webshop Main Page: If section DO_YOU_NEED_HELP is visible click DONT_ASK_ME_AGAIN_BUTTON
		When Webshop Main Page: In section HEADER element LOG_IN_OR_REGISTER_BUTTON is visible
	    Then Webshop Main Page: In section HEADER click LOG_IN_OR_REGISTER_BUTTON
	    And Webshop Main Page: Section LOG_IN_OR_REGISTER is visible
	    #1-Fill out login
	    And General: Wait 1 second
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER uncheck KEEP_ME_LOGGED_IN_LABEL_CHECKBOX
	    Then Webshop Main Page: In section LOG_IN_OR_REGISTER in field EMAIL_ADDRESS_TEXTFIELD type in <email_address>
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER in field PASSWORD_TEXTFIELD type in <password>
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER element LOG_IN_BUTTON is enabled
	    Then Webshop Main Page: In section LOG_IN_OR_REGISTER click LOG_IN_BUTTON
	    
	    And Webshop Main Page: Section HEADER contains text <user_name>
	    And Webshop Main Page: Section HEADER contains text <user_id> 
	    
	    When Webshop Main Page: In section HEADER element SHOPPING_CART_BUTTON is visible
	    Then Webshop Main Page: In section HEADER click SHOPPING_CART_BUTTON
	    When General: Make session expired with page refresh
	    And Cart Page: Section QUICK_ITEM_ENTRY is visible
	 	And Cart Page: In section QUICK_ITEM_ENTRY element QUICK_ITEM_ENTRY_TEXTFIELD is visible
	 	And Cart Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <STANDARD_PRODUCT>
	 	And Cart Page: Click ADD_TO_CART_BUTTON
	 	
	 	And Webshop Main Page: The SHOPPING_CART contains <qunatity_of_item> item
	 	
	 	And Cart Page: In section SHOPPING_CART_HEADER click CHECK_OUT_NOT_LOGGED_IN_BUTTON
	 	And General: Wait 1 second
	    And Webshop Main Page: Section LOG_IN_OR_REGISTER is visible
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER uncheck KEEP_ME_LOGGED_IN_LABEL_CHECKBOX
	    Then Webshop Main Page: In section LOG_IN_OR_REGISTER in field EMAIL_ADDRESS_TEXTFIELD type in <email_address>
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER in field PASSWORD_TEXTFIELD type in <password>
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER element LOG_IN_BUTTON is enabled
	    Then Webshop Main Page: In section LOG_IN_OR_REGISTER click LOG_IN_BUTTON
	    And General: Wait 1 second
	   	And Webshop Main Page: Section HEADER contains text <user_name>
	    And Webshop Main Page: Section HEADER contains text <user_id> 
	 	
		And Cart Page: Section QUICK_ITEM_ENTRY is visible
		And Webshop Main Page: In section HEADER click OPEN_DASHBOARD_BUTTON
		When Webshop Main Page: Section ACCOUNT_DASHBOARD is visible
		And Webshop Main Page: Section ACCOUNT_DASHBOARD contains text <user_name>
		And Webshop Main Page: In section ACCOUNT_DASHBOARD click VIEW_YOUR_PROFILE_LINK
		Then Profile Page: Section YOUR_ACCOUNT is visible
		
		When General: Make session expired with page refresh
		Then Webshop Main Page: Section AUTO_LOGOUT is visible
		And General: Wait 1 second	 	
	    And Webshop Main Page: In section AUTO_LOGOUT element EMAIL_ADDRESS_TEXTFIELD is empty
	    And Webshop Main Page: In section AUTO_LOGOUT in field EMAIL_ADDRESS_AUTOLOGOUT_TEXTFIELD type in <email_address>
	    And Webshop Main Page: In section AUTO_LOGOUT in field PASSWORD_AUTOLOGOUT_TEXTFIELD type in <password>
	    And Webshop Main Page: In section AUTO_LOGOUT uncheck KEEP_ME_LOGGED_IN_LABEL_AUTOLOGOUT_CHECKBOX
	    And Webshop Main Page: In section AUTO_LOGOUT click LOG_IN_BUTTON
	    And General: Wait 2 seconds
	   	And Webshop Main Page: In section HEADER click OPEN_DASHBOARD_BUTTON	    
		And Webshop Main Page: Section ACCOUNT_DASHBOARD is visible
		And Webshop Main Page: Section ACCOUNT_DASHBOARD contains text <user_name>
		
		Then Webshop Main Page: In section YOUR_FAVORITE_LISTS click GO_TO_FAVORITE_LISTS_LINK
		And General: Wait 3 seconds
		Then My Favorite Lists Page: Section FAVORITE_LIST is visible
		
		Then Webshop Main Page: In section HEADER click SHOPPING_CART_BUTTON
	    And Cart Page: Section QUICK_ITEM_ENTRY is visible
	 	And Cart Page: In section QUICK_ITEM_ENTRY element QUICK_ITEM_ENTRY_TEXTFIELD is visible
	 	And Cart Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <STANDARD_PRODUCT>
	 	And Cart Page: Click ADD_TO_CART_BUTTON
	 	
	 	Then Webshop Main Page: The SHOPPING_CART contains more than 0 items
	 	
	 	And Cart Page: In section SHOPPING_CART_HEADER click CHECK_OUT_BUTTON
	    And Webshop Main Page: Section AUTO_LOGOUT is not visible
	 	
	 	And General: Wait 1 second
	 	Then Checkout Delivery Page: Section DELIVERY_ADDRESS_FORM is visible
	 	And General: Wait 1 second
	 	Then Checkout Delivery Page: Section DELIVERY_ADDRESS_FORM is visible
	 	
	 	And Checkout Delivery Page: Click CONTINUE_BUTTON
		And General: Wait 3 seconds
	 	And Checkout Billing Page: Click CONTINUE_BUTTON
	 	And General: Wait 3 seconds
		And Checkout Order Summary Page: Section CHECKOUT_FORM is visible
		
		When General: Make session expired without page refresh
		And Checkout Order Summary Page: Click SUBMIT_ORDER_BUTTON
		
		Then Webshop Main Page: Section AUTO_LOGOUT is visible
		And General: Wait 1 second	 	
	    And Webshop Main Page: In section AUTO_LOGOUT element EMAIL_ADDRESS_TEXTFIELD is empty
	    And Webshop Main Page: In section AUTO_LOGOUT in field EMAIL_ADDRESS_AUTOLOGOUT_TEXTFIELD type in <email_address>
	    And Webshop Main Page: In section AUTO_LOGOUT in field PASSWORD_AUTOLOGOUT_TEXTFIELD type in <password>
	    And Webshop Main Page: In section AUTO_LOGOUT uncheck KEEP_ME_LOGGED_IN_LABEL_AUTOLOGOUT_CHECKBOX
	    And Webshop Main Page: In section AUTO_LOGOUT click LOG_IN_BUTTON
	    
	   	And Webshop Main Page: Section HEADER contains text <user_name>
	    And Webshop Main Page: Section HEADER contains text <user_id> 
		
		Then Cart Page: Section QUICK_ITEM_ENTRY is visible
		And Cart Page: In section QUICK_ITEM_ENTRY element QUICK_ITEM_ENTRY_TEXTFIELD is visible
	 	And Cart Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <STANDARD_PRODUCT>
	 	And Cart Page: Click ADD_TO_CART_BUTTON
	 	
	 	Then Webshop Main Page: The SHOPPING_CART contains more than 0 items
	 	
	 	And Cart Page: In section SHOPPING_CART_HEADER click CHECK_OUT_BUTTON
	 	And General: Wait 1 second
	 	Then Checkout Delivery Page: Section DELIVERY_ADDRESS_FORM is visible
	 	
	 	And Checkout Delivery Page: Click CONTINUE_BUTTON
		And General: Wait 3 seconds
	 	And Checkout Billing Page: Click CONTINUE_BUTTON
	 	And General: Wait 3 seconds
		And Checkout Order Summary Page: Section CHECKOUT_FORM is visible
		
		And General: Wait 1 second
		And Checkout Order Summary Page: Click SUBMIT_ORDER_BUTTON
		And General: Wait 3 seconds
		Then Checkout Order Confirmation Page: SUCCESS_MESSAGE_BOX is visible
		And Checkout Order Confirmation Page: Element SUCCESS_MESSAGE_BOX contains text checkout.orderConfirmation.message.success.HeadlineTitle
		
		Examples:
	|	email_address		|	password			|	user_name		|	user_id			|	STANDARD_PRODUCT		|	qunatity_of_item	|
	|	US_user_email		|	US_user_password	|	US_user_id		|	US_user_name	|	US_standard_product1	|	5					|