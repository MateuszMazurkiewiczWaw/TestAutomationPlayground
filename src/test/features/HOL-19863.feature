@Sprint3 @ContactUsLayer
Feature: HOL-19863 Call back layer

	Scenario Outline: HOL-19863 Call back layer - logged in
  		#Enter the page
		Given General: open webshop for Ireland
		When Webshop Main Page: If section I_UNDERSTAND_COOKIES is visible click I_UNDERSTAND_BUTTON
		And Webshop Main Page: If section ONE_MORE_THING_BANNER is visible click DO_NOT_ASK_AGAIN_BUTTON
		
	    Then Webshop Main Page: In section HEADER click LOG_IN_OR_REGISTER_BUTTON	    
	    #1-Fill out login
	    When Webshop Main Page: In section LOG_IN_OR_REGISTER in field EMAIL_ADDRESS_TEXTFIELD type in <email_address>
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER in field PASSWORD_TEXTFIELD type in <password>
	    Then Webshop Main Page: In section LOG_IN_OR_REGISTER click LOG_IN_BUTTON

	    And Webshop Main Page: Section HEADER contains text <user_name>
	    And Webshop Main Page: Section HEADER contains text <account_number> 
	    
	    And General: Scroll to the bottom
	    When Webshop Main Page: In section FOOTER_MIDDLE click CALL_ME_BACK_LINK
	    And General: Wait 1 second
	    Then Webshop Main Page: Section CONTACT_US is visible
	    
	    When Webshop Main Page: If test is executed between <Call_Back_Open_Hour> and <Call_Back_Close_Hour> section LET_US_CALL_YOU_BACK is visible otherwise it contains text contact.callMeBackSection.label.unavailable
	    And Webshop Main Page: If call back is open then in section LET_US_CALL_YOU_BACK field YOUR_NAME_CALLBACK_TEXTFIELD contains value <user_name>
	    And Webshop Main Page: If call back is open then in section LET_US_CALL_YOU_BACK field YOUR_PHONE_NUMBER_TEXTFIELD contains value <phone_number>
	   
	    When Webshop Main Page: If call back is open then in section LET_US_CALL_YOU_BACK click SUBMIT_CALLBACK_BUTTON
	    Then General: Wait 2 seconds
	    And Webshop Main Page: If call back is open then section LET_US_CALL_YOU_BACK contains text contact.callMeBackSection.label.successHeadlineLabel
	    
	    
	Examples:
		|	email_address		|	password			|	company_address	|	account_number	|	user_name		|	phone_number			|	Call_Back_Open_Hour		|	Call_Back_Close_Hour	|
		|	IE_user_email		|	IE_user_password	|	IE_user_address	|	IE_user_id		|	IE_user_name	|	IE_user_phone_number	|	IE_chat_opening_hour	|	IE_chat_closing_hour	|

	Scenario Outline: HOL-19863 Call back layer - not logged in
  		#Enter the page
		Given General: open webshop for Ireland
		When Webshop Main Page: If section I_UNDERSTAND_COOKIES is visible click I_UNDERSTAND_BUTTON
		And Webshop Main Page: If section ONE_MORE_THING_BANNER is visible click DO_NOT_ASK_AGAIN_BUTTON
		And General: Scroll to the bottom
		And General: Wait 1 second
	    
	    When Webshop Main Page: In section FOOTER_MIDDLE click CALL_ME_BACK_LINK
	    Then Webshop Main Page: Section CONTACT_US is visible
	    
	    When Webshop Main Page: If test is executed between <Call_Back_Open_Hour> and <Call_Back_Close_Hour> section LET_US_CALL_YOU_BACK is visible otherwise it contains text contact.callMeBackSection.label.unavailable
	    And Webshop Main Page: If call back is open then in section LET_US_CALL_YOU_BACK in field YOUR_NAME_CALLBACK_TEXTFIELD type in hybris Customer
	    And Webshop Main Page: If call back is open then in section LET_US_CALL_YOU_BACK in field YOUR_PHONE_NUMBER_TEXTFIELD type in 0123456789
	   
	    When Webshop Main Page: If call back is open then in section CONTACT_US click SUBMIT_CALLBACK_BUTTON
	    Then General: Wait 2 seconds
	   	And Webshop Main Page: If call back is open then section LET_US_CALL_YOU_BACK contains text contact.callMeBackSection.label.successHeadlineLabel

	Examples:
		|	Call_Back_Open_Hour		|	Call_Back_Close_Hour	|
		|	IE_chat_opening_hour	|	IE_chat_closing_hour	|
		
	
	Scenario Outline: HOL-19863 Call back layer - validation
  		#Enter the page
		Given General: open webshop for Ireland
		When Webshop Main Page: If section I_UNDERSTAND_COOKIES is visible click I_UNDERSTAND_BUTTON
		And Webshop Main Page: If section ONE_MORE_THING_BANNER is visible click DO_NOT_ASK_AGAIN_BUTTON
		And General: Scroll to the bottom
		And General: Wait 1 second
	    
	    When Webshop Main Page: In section FOOTER_MIDDLE click CALL_ME_BACK_LINK
	    Then Webshop Main Page: Section CONTACT_US is visible
	    
	    When Webshop Main Page: If test is executed between <Call_Back_Open_Hour> and <Call_Back_Close_Hour> section LET_US_CALL_YOU_BACK is visible otherwise it contains text contact.callMeBackSection.label.unavailable
	    
	    #Empty field
	    And Webshop Main Page: If call back is open then in section LET_US_CALL_YOU_BACK in field YOUR_NAME_CALLBACK_TEXTFIELD type in hybris Customer
	    And Webshop Main Page: If call back is open then in section CONTACT_US click SUBMIT_CALLBACK_BUTTON	    
	    And General: Wait 2 seconds
	   	Then Webshop Main Page: If call back is open then section CONTACT_US contains text common.message.error.required
	   	
	   	#Letters
	   	And Webshop Main Page: If call back is open then in section LET_US_CALL_YOU_BACK in field YOUR_PHONE_NUMBER_TEXTFIELD type in test   
	    And Webshop Main Page: If call back is open then in section CONTACT_US click SUBMIT_CALLBACK_BUTTON
	    And General: Wait 2 seconds  
	   	Then Webshop Main Page: If call back is open then section CONTACT_US contains text common.message.error.invalidPhone
	   	
	   	#1 digit
	   	And Webshop Main Page: If call back is open then in section LET_US_CALL_YOU_BACK in field YOUR_PHONE_NUMBER_TEXTFIELD type in 1  
	    And Webshop Main Page: If call back is open then in section CONTACT_US click SUBMIT_CALLBACK_BUTTON
	    And General: Wait 2 seconds  
	   	Then Webshop Main Page: If call back is open then section CONTACT_US contains text contact.callMeBackSection.label.successHeadlineLabel
	   
	   	#18 digits
	   	When General: Press ESCAPE on a keyboard
	   	And General: Wait 1 second
	   	And Webshop Main Page: In section FOOTER_MIDDLE click CALL_ME_BACK_LINK
	    And Webshop Main Page: Section CONTACT_US is visible
	    When Webshop Main Page: If test is executed between <Call_Back_Open_Hour> and <Call_Back_Close_Hour> section LET_US_CALL_YOU_BACK is visible otherwise it contains text contact.callMeBackSection.label.unavailable
	   
	    And General: Wait 2 seconds
	    And Webshop Main Page: If call back is open then in section LET_US_CALL_YOU_BACK attribute maxlength of field YOUR_PHONE_NUMBER_TEXTFIELD contains value 18
	  	
	    And Webshop Main Page: If call back is open then in section LET_US_CALL_YOU_BACK in field YOUR_NAME_CALLBACK_TEXTFIELD type in hybris Customer
	   	And Webshop Main Page: If call back is open then in section LET_US_CALL_YOU_BACK in field YOUR_PHONE_NUMBER_TEXTFIELD type in 012345678910111213  
	    And Webshop Main Page: If call back is open then in section CONTACT_US click SUBMIT_CALLBACK_BUTTON	    
	   	Then Webshop Main Page: If call back is open then section CONTACT_US contains text contact.callMeBackSection.label.successHeadlineLabel

	Examples:
		|	Call_Back_Open_Hour		|	Call_Back_Close_Hour	|
		|	IE_chat_opening_hour	|	IE_chat_closing_hour	|