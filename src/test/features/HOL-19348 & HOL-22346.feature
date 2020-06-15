@Sprint2
Feature: HOL-19348 & HOL-22346 My Account Profile + error messages

  Scenario Outline: HOL-19348 - My Account Profile + error messages: My Account header & HOL-22346 - My Account Profile + error messages: My login data
		
		#My Account profile + error messages: My Account header
		#Enter the page
		Given General: open webshop for Ireland
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
		
		When Webshop Main Page: Section ACCOUNT_DASHBOARD is visible
		And Webshop Main Page: Section ACCOUNT_DASHBOARD contains text <user_name>
		And Webshop Main Page: In section ACCOUNT_DASHBOARD click VIEW_YOUR_PROFILE_LINK
		Then Profile Page: Section YOUR_ACCOUNT is visible
		
		#Check if the user name is visible and if User can see company data and account number in the header section
		When Profile Page: Section YOUR_ACCOUNT contains text <user_name>
		And Profile Page: Section YOUR_ACCOUNT contains text <company_address>
		And Profile Page: Section YOUR_ACCOUNT contains text <account_number>
		
		#Contact us verification
		When Profile Page: In section MESSAGE_BOX click PLEASE_CONTACT_CUSTOMER_SERVICE_LINK
		Then Webshop Main Page: Section CONTACT_US is visible
		And Webshop Main Page: In section CONTACT_US element CALL_US is visible
		And Webshop Main Page: In section CONTACT_US element CALL_US contains text contact.label.callUsText
		And Webshop Main Page: In section CONTACT_US click CLOSE_CHAT_BUTTON
		And General: Wait 3 seconds
		
		When Profile Page: In section YOUR_COMPANY_DATA click PLEASE_CONTACT_CUSTOMER_SERVICE_LINK
		Then Webshop Main Page: Section CONTACT_US is visible
		And Webshop Main Page: In section CONTACT_US element CALL_US is visible
		And Webshop Main Page: In section CONTACT_US element CALL_US contains text contact.label.callUsText
		And Webshop Main Page: In section CONTACT_US click CLOSE_CHAT_BUTTON
		And General: Wait 1 second
				
		#Edit E-mail address - Failure and cancel
		When Profile Page: Element DUMMY_EMAIL_ADDRESS has value <email_address>
		Then Profile Page: In section YOUR_LOGIN_DATA click EDIT_EMAIL_BUTTON
		And Profile Page: In section YOUR_LOGIN_DATA in field EMAIL_CHANGE_TEXTFIELD type in incorrect.address.us
		And General: Lose focus
		Then Profile Page: Section YOUR_LOGIN_DATA contains text common.message.error.invalidEmail
		And Profile Page: In section YOUR_LOGIN_DATA check EMAIL_CHANGE_SHOW_PASSWORD_CHECKBOX
		And Profile Page: In section YOUR_LOGIN_DATA in field CONFIRM_PASSWORD_TEXFIELD type in BadPass
		Then Profile Page: In section YOUR_LOGIN_DATA element EMAIL_CHANGE_BUTTON is enabled
		Then Profile Page: In section YOUR_LOGIN_DATA click EMAIL_CHANGE_CANCEL_BUTTON
		And General: Wait 1 second
		And Profile Page: Section CHANGE_EMAIL_FORM is not visible
		
		#Edit E-mail address - Success (Without e-mail confirmation - Plain messages)
		When Profile Page: In section YOUR_LOGIN_DATA click EDIT_EMAIL_BUTTON
		Then Profile Page: In section YOUR_LOGIN_DATA in field EMAIL_CHANGE_TEXTFIELD type in RANDOM_EMAIL_ADDRESS
		And Profile Page: In section YOUR_LOGIN_DATA in field CONFIRM_PASSWORD_TEXFIELD type in <password>
		Then Profile Page: In section YOUR_LOGIN_DATA element EMAIL_CHANGE_BUTTON is enabled
		And Profile Page: In section YOUR_LOGIN_DATA click EMAIL_CHANGE_BUTTON
		Then Profile Page: Element SUCCESS_MESSAGE_BOX contains text profile.credentials.message.error.resend
		And Profile Page: Element ALERT_MESSAGE_BOX contains text profile.credentials.message.error.lostSubscription
		And Profile Page: Section CHANGE_EMAIL_FORM is not visible
		
		#Edit E-mail address - Error messages
		When Profile Page: In section YOUR_LOGIN_DATA click EDIT_EMAIL_BUTTON
		Then Profile Page: In section YOUR_LOGIN_DATA element EMAIL_CHANGE_BUTTON is enabled
		Then Profile Page: In section YOUR_LOGIN_DATA in field EMAIL_CHANGE_TEXTFIELD type in <email_address>
		And Profile Page: In section YOUR_LOGIN_DATA in field CONFIRM_PASSWORD_TEXFIELD type in <password>
		And Profile Page: In section YOUR_LOGIN_DATA click EMAIL_CHANGE_BUTTON
		Then Profile Page: Element EMAIL_ERROR_MESSAGE_BOX contains text profile.credentials.message.error.emailSame
		And General: Wait 3 seconds
		And Profile Page: In section YOUR_LOGIN_DATA click EMAIL_CHANGE_CANCEL_BUTTON
		And General: Wait 3 seconds
		When Profile Page: In section YOUR_LOGIN_DATA click EDIT_EMAIL_BUTTON
		And General: Wait 3 seconds
		Then Profile Page: In section YOUR_LOGIN_DATA in field EMAIL_CHANGE_TEXTFIELD type in RANDOM_EMAIL_ADDRESS
		And Profile Page: In section YOUR_LOGIN_DATA in field CONFIRM_PASSWORD_TEXFIELD type in BadPassAT
		And General: Wait 3 seconds
		And Profile Page: In section YOUR_LOGIN_DATA click EMAIL_CHANGE_BUTTON
		And General: Wait 3 second
		Then Profile Page: Element EMAIL_ERROR_MESSAGE_BOX contains text profile.message.error.invalidCurrentPasswordHeadline
		And Profile Page: In section YOUR_LOGIN_DATA click EMAIL_CHANGE_CANCEL_BUTTON
		
		#Edit Password - Failure
		When General: Wait 1 second
		Then Profile Page: In section YOUR_LOGIN_DATA click EDIT_PASSWORD_BUTTON
		And Profile Page: In section YOUR_LOGIN_DATA element PASSWORD_CHANGE_BUTTON is enabled
		And Profile Page: In section YOUR_LOGIN_DATA in field CURRENT_PASSWORD_TEXTFIELD type in WrongPassw0rd
		And Profile Page: In section YOUR_LOGIN_DATA in field NEW_PASSWORD_TEXTFIELD type in Testtest2
		And Profile Page: In section YOUR_LOGIN_DATA in field REPEAT_NEW_PASSWORD_TEXTFIELD type in Testtest2
		And Profile Page: Section CHANGE_PASSWORD_FORM contains text passwordReset.message.success.passwordMatch
		And Profile Page: In section YOUR_LOGIN_DATA click PASSWORD_CHANGE_BUTTON
		Then Profile Page: Element PASSWORD_ERROR_MESSAGE_BOX contains text profile.message.error.invalidCurrentPasswordHeadline
		
		#Edit Password - Success (Change back to previous password)
		When General: Wait 2 seconds
		Then Profile Page: In section YOUR_LOGIN_DATA click PASSWORD_CHANGE_CANCEL_BUTTON
		When General: Wait 1 second
		When Profile Page: In section YOUR_LOGIN_DATA click EDIT_PASSWORD_BUTTON
		Then Profile Page: In section YOUR_LOGIN_DATA in field CURRENT_PASSWORD_TEXTFIELD type in <password>
		And Profile Page: In section YOUR_LOGIN_DATA in field NEW_PASSWORD_TEXTFIELD type in Testtest2
		And Profile Page: In section YOUR_LOGIN_DATA in field REPEAT_NEW_PASSWORD_TEXTFIELD type in Testtest2
		And Profile Page: In section YOUR_LOGIN_DATA click PASSWORD_CHANGE_BUTTON
		And Profile Page: Element PASSWORD_SUCCESS_MESSAGE_BOX contains text profile.message.success.passwordChanged
		
		#Change password back
		When General: Wait 1 second
		When Profile Page: In section YOUR_LOGIN_DATA click EDIT_PASSWORD_BUTTON
		Then Profile Page: In section YOUR_LOGIN_DATA in field CURRENT_PASSWORD_TEXTFIELD type in Testtest2 
		And Profile Page: In section YOUR_LOGIN_DATA in field NEW_PASSWORD_TEXTFIELD type in <password>
		And Profile Page: In section YOUR_LOGIN_DATA in field REPEAT_NEW_PASSWORD_TEXTFIELD type in <password>
		And Profile Page: In section YOUR_LOGIN_DATA click PASSWORD_CHANGE_BUTTON
		And Profile Page: Element PASSWORD_SUCCESS_MESSAGE_BOX contains text profile.message.success.passwordChanged

	Examples:
      |	email_address		|	password			|	company_address		|	account_number	|	user_name		|
      |	IE_user2_email		|	IE_user2_password	|	IE_user2_address	|	IE_user2_id		|	IE_user2_name	|