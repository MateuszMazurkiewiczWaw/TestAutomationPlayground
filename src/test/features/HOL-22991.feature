@Sprint6
Feature: HOL-22991 Login as layer

  Scenario Outline: Login as layer functionality - success scenario
		#Enter the page - success scenario
		Given General: open webshop_login_as for United States
		And Webshop Main Page: If section I_UNDERSTAND_COOKIES is visible click I_UNDERSTAND_BUTTON
		And Webshop Main Page: If section ONE_MORE_THING_BANNER is visible click DO_NOT_ASK_AGAIN_BUTTON
	    When Webshop Main Page: In section HEADER element LOG_IN_OR_REGISTER_BUTTON is visible
	    And Webshop Main Page: Section LOG_IN_OR_REGISTER is visible
	    
	    #Fill out login-as section
	    When Webshop Main Page: Section LOG_IN_OR_REGISTER contains text common.login.label.header
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER element LOG_IN_BUTTON is enabled
	    Then Webshop Main Page: In section LOG_IN_OR_REGISTER in field EMAIL_ADDRESS_TEXTFIELD type in <email_address>
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER in field PASSWORD_TEXTFIELD type in <password>
	    Then Webshop Main Page: In section LOG_IN_OR_REGISTER in field LOGIN_AS_EMAIL_ADDRESS_TEXTFIELD type in <customer_email_address>
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER element LOG_IN_BUTTON is enabled
	    Then Webshop Main Page: In section LOG_IN_OR_REGISTER click LOG_IN_BUTTON
	    And Webshop Main Page: Section HEADER contains text <user_name>
	    And Webshop Main Page: Section HEADER contains text <account_number>
	    And Webshop Main Page: If section DO_YOU_NEED_HELP is visible click DONT_ASK_ME_AGAIN_BUTTON
	    
	    #Checking if the submit button is disabled
	    When Webshop Main Page: In section HEADER click SHOPPING_CART_BUTTON
	 	Then Cart Page: Section QUICK_ITEM_ENTRY is visible
	 	And Cart Page: In section QUICK_ITEM_ENTRY click QUICK_ITEM_ENTRY_TEXTFIELD
	 	And General: Wait 1 second
	 	And Cart Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <item_number_valid>
	 	And Cart Page: Click ADD_TO_CART_BUTTON
	 	And Webshop Main Page: The SHOPPING_CART contains 1 item
	 	And Cart Page: In section SHOPPING_CART_HEADER click CHECK_OUT_BUTTON
	 	And General: Wait 3 seconds
	 	And Checkout Delivery Page: Click CONTINUE_BUTTON
		And General: Wait 3 seconds
		And Checkout Billing Page: Click ENTER_CARD_INFORMATION_BUTTON
		And General: Wait 2 seconds
		And Checkout Billing Page: CREDIT_CARD_OVERLAY is visible
		And Checkout Billing Page: Switch to frame CREDIT_CARD_OVERLAY_CONTENT
		And Checkout Billing Page: Click CREDIT_CARD_TYPE_DROPDOWN_BUTTON
		And Checkout Billing Page: In section CREDIT_CARD_TYPE_LIST click element with text <credit_card_type>
		And Checkout Billing Page: In section CREDIT_CARD_OVERLAY_FORM in field CARD_NUMBER_TEXTFIELD type in <credit_card_number_valid>
		And Checkout Billing Page: Click CREDIT_CARD_EXPIRY_MONTH_DROPDOWN_BUTTON
		And Checkout Billing Page: In section CREDIT_CARD_EXPIRY_MONTH_LIST click element with text <credit_card_expiry_month>
		And Checkout Billing Page: Click CREDIT_CARD_EXPIRY_YEAR_DROPDOWN_BUTTON
		And Checkout Billing Page: In section CREDIT_CARD_EXPIRY_YEAR_LIST click element with text <credit_card_expiry_year>
		And Checkout Billing Page: In section CREDIT_CARD_OVERLAY_FORM in field CVC_NUMBER_TEXTFIELD type in <credit_card_cvc_number_valid>
		And Checkout Billing Page: Click SUBMIT_CREDIT_CARD_DATA_BUTTON
		And General: Wait 3 seconds
		And General: Switch back to default frame
	 	And Checkout Billing Page: Click CONTINUE_BUTTON
	 	And General: Wait 3 seconds
		And Checkout Order Summary Page: Click SUBMIT_ORDER_BUTTON
		And General: Wait 3 seconds
		And Checkout Order Summary Page: Element ERROR_MESSAGE_BOX contains text checkout.summary.message.error.notAllowedCheckoutForSurrogate
	    
	 	
	Examples:
      |	customer_email_address		|	email_address		|	password				|	account_number		|	user_name				|	item_number_valid		|	credit_card_number_valid	|	credit_card_expiry_month	|	credit_card_expiry_year	|	credit_card_cvc_number_valid	|	credit_card_type	|
      |	US_user_loginas_email		|	US_user6_email		|	US_user6_password		|	US_user_loginas_id	|	US_user_loginas_name	|	US_standard_product2	|	4002710978101008			|	09							|	2018					|	222								|	Visa				|
     
      
  Scenario Outline: Login as layer functionality - fail scenario - wrong email
		#Enter the page - failure scenarios
		Given General: open webshop_login_as for United States
		And Webshop Main Page: If section I_UNDERSTAND_COOKIES is visible click I_UNDERSTAND_BUTTON
		And Webshop Main Page: If section ONE_MORE_THING_BANNER is visible click DO_NOT_ASK_AGAIN_BUTTON
	    When Webshop Main Page: In section HEADER element LOG_IN_OR_REGISTER_BUTTON is visible
	    And Webshop Main Page: Section LOG_IN_OR_REGISTER is visible
	    
	    #Wrong email
	    When Webshop Main Page: Section LOG_IN_OR_REGISTER contains text common.login.label.header
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER element LOG_IN_BUTTON is enabled
	    And Webshop Main Page: If section DO_YOU_NEED_HELP is visible click DONT_ASK_ME_AGAIN_BUTTON
	    Then Webshop Main Page: In section LOG_IN_OR_REGISTER in field EMAIL_ADDRESS_TEXTFIELD type in <invalid_email_address>
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER in field PASSWORD_TEXTFIELD type in <password>
	    Then Webshop Main Page: In section LOG_IN_OR_REGISTER in field LOGIN_AS_EMAIL_ADDRESS_TEXTFIELD type in <customer_email_address>
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER element LOG_IN_BUTTON is enabled
	    Then Webshop Main Page: In section LOG_IN_OR_REGISTER click LOG_IN_BUTTON
	    And Webshop Main Page: ERROR_MESSAGE_AUTO_LOGOUT is visible
	    And Webshop Main Page: Element ERROR_MESSAGE_AUTO_LOGOUT contains text common.login.message.error.title
	    
	Examples:
      |	customer_email_address		|	email_address		|	password				|	account_number		|	user_name				|	invalid_email_address		|	invalid_password	|	invalid_customer_email_address		|
      |	US_user_loginas_email		|	US_user6_email		|	US_user6_password		|	US_user_loginas_id	|	US_user_loginas_name	|	aaa@kkbb.eu					|	aaaaaaAA01			|	bbb@kkbb.eu							|
	   
  Scenario Outline: Login as layer functionality - fail scenario - wrong password
		#Enter the page - failure scenarios
		Given General: open webshop_login_as for United States
		And Webshop Main Page: If section I_UNDERSTAND_COOKIES is visible click I_UNDERSTAND_BUTTON
		And Webshop Main Page: If section ONE_MORE_THING_BANNER is visible click DO_NOT_ASK_AGAIN_BUTTON
	    When Webshop Main Page: In section HEADER element LOG_IN_OR_REGISTER_BUTTON is visible
	    And Webshop Main Page: Section LOG_IN_OR_REGISTER is visible
	    
	    #Wrong password
	    When Webshop Main Page: In section LOG_IN_OR_REGISTER in field EMAIL_ADDRESS_TEXTFIELD type in <email_address>
	    Then Webshop Main Page: In section LOG_IN_OR_REGISTER in field PASSWORD_TEXTFIELD type in <invalid_password>
	    Then Webshop Main Page: In section LOG_IN_OR_REGISTER in field LOGIN_AS_EMAIL_ADDRESS_TEXTFIELD type in <customer_email_address>
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER element LOG_IN_BUTTON is enabled
	    Then Webshop Main Page: In section LOG_IN_OR_REGISTER click LOG_IN_BUTTON
	    And Webshop Main Page: ERROR_MESSAGE_AUTO_LOGOUT is visible
	    And Webshop Main Page: Element ERROR_MESSAGE_AUTO_LOGOUT contains text common.login.message.error.title
	    
	Examples:
      |	customer_email_address		|	email_address		|	password				|	account_number		|	user_name				|	invalid_email_address		|	invalid_password	|	invalid_customer_email_address		|
      |	US_user_loginas_email		|	US_user6_email		|	US_user6_password		|	US_user_loginas_id	|	US_user_loginas_name	|	aaa@kkbb.eu					|	aaaaaaAA01			|	bbb@kkbb.eu							|
	   
	   
  Scenario Outline: Login as layer functionality - fail scenario - wrong customer email
		#Enter the page - failure scenarios
		Given General: open webshop_login_as for United States
		And Webshop Main Page: If section I_UNDERSTAND_COOKIES is visible click I_UNDERSTAND_BUTTON
		And Webshop Main Page: If section ONE_MORE_THING_BANNER is visible click DO_NOT_ASK_AGAIN_BUTTON
	    When Webshop Main Page: In section HEADER element LOG_IN_OR_REGISTER_BUTTON is visible
	    And Webshop Main Page: Section LOG_IN_OR_REGISTER is visible
	    
	    #Wrong customer email
	    When Webshop Main Page: In section LOG_IN_OR_REGISTER in field EMAIL_ADDRESS_TEXTFIELD type in <email_address>
	    Then Webshop Main Page: In section LOG_IN_OR_REGISTER in field PASSWORD_TEXTFIELD type in <password>
	    Then Webshop Main Page: In section LOG_IN_OR_REGISTER in field LOGIN_AS_EMAIL_ADDRESS_TEXTFIELD type in <invalid_customer_email_address>
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER element LOG_IN_BUTTON is enabled
	    Then Webshop Main Page: In section LOG_IN_OR_REGISTER click LOG_IN_BUTTON
	    And Webshop Main Page: ERROR_MESSAGE_AUTO_LOGOUT is visible
	    And Webshop Main Page: Element ERROR_MESSAGE_AUTO_LOGOUT contains text common.login.message.error.title
	 	
	Examples:
      |	customer_email_address		|	email_address		|	password				|	account_number		|	user_name				|	invalid_email_address		|	invalid_password	|	invalid_customer_email_address		|
      |	US_user_loginas_email		|	US_user6_email		|	US_user6_password		|	US_user_loginas_id	|	US_user_loginas_name	|	aaa@kkbb.eu					|	aaaaaaAA01			|	bbb@kkbb.eu							|