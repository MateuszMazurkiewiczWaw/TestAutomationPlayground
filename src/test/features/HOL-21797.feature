@Sprint3
Feature: HOL-21797 My Account Profile + error messages: My contact data, subscription preferences, company data

  Scenario Outline: My profile page functionality and content without the subscription preferences
		
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
		Then Profile Page: Section YOUR_ACCOUNT contains text <account_number>
		
		#Check My Contact Data Section
		When Profile Page: Section YOUR_CONTACT_DATA is visible
		Then Profile Page: In section YOUR_CONTACT_DATA element CONTACT_DATA_EDIT_BUTTON is visible
		And Profile Page: In section YOUR_CONTACT_DATA element CONTACT_DATA_TITLE_FIELD is visible
		And Profile Page: In section YOUR_CONTACT_DATA element CONTACT_DATA_FIRST_NAME_FIELD is visible
		And Profile Page: In section YOUR_CONTACT_DATA element CONTACT_DATA_LAST_NAME_FIELD is visible
		And Profile Page: In section YOUR_CONTACT_DATA element CONTACT_DATA_FUNCTION_FIELD is visible
		And Profile Page: In section YOUR_CONTACT_DATA element CONTACT_DATA_PHONE_FIELD is visible
		And Profile Page: In section YOUR_CONTACT_DATA element CONTACT_DATA_MOBILE_PHONE_FIELD is visible
		And Profile Page: In section YOUR_CONTACT_DATA element CONTACT_DATA_FAX_FIELD is visible
		And Profile Page: In section YOUR_CONTACT_DATA element CONTACT_DATA_NEWSLETTER_CONFIRMATION_CHECKBOX is visible
		And Profile Page: In section YOUR_CONTACT_DATA click CONTACT_DATA_EDIT_BUTTON
		
		#Your contact data text fields
		When Profile Page: In section YOUR_CONTACT_DATA element FIRST_NAME_TEXTFIELD is visible
		Then Profile Page: In section YOUR_CONTACT_DATA element LAST_NAME_TEXTFIELD is visible
		And Profile Page: In section YOUR_CONTACT_DATA element PHONE_TEXTFIELD is visible
		And Profile Page: In section YOUR_CONTACT_DATA element MOBILE_PHONE_TEXTFIELD is visible
		And Profile Page: In section YOUR_CONTACT_DATA element FAX_TEXTFIELD is visible
		
		#Your contact data - making incorrect changes
		When Profile Page: In section YOUR_CONTACT_DATA element YOUR_CONTACT_DATA_SAVE_BUTTON is disabled
		And Profile Page: In section YOUR_CONTACT_DATA in field FIRST_NAME_TEXTFIELD type in Test
		And Profile Page: In section YOUR_CONTACT_DATA in field LAST_NAME_TEXTFIELD type in TestenSieBitte
		And Profile Page: In section YOUR_CONTACT_DATA in field PHONE_TEXTFIELD type in 133456779
		And Profile Page: In section YOUR_CONTACT_DATA in field MOBILE_PHONE_TEXTFIELD type in 987654321
		And Profile Page: In section YOUR_CONTACT_DATA in field FAX_TEXTFIELD type in 122655779
		
		#Title selection
		When Profile Page: Section TITLE_SELECTION_DROPDOWN is visible
		Then Profile Page: Section TITLE_SELECTION_DROPDOWN contains text Ms
		And Profile Page: Click TITLE_SELECTION_DROPDOWN
		And General: Wait 1 second
		And Profile Page: In section TITLE_SELECTION_DROPDOWN element COMPANY_TITLE is visible
		And Profile Page: In section TITLE_SELECTION_DROPDOWN click COMPANY_TITLE
		And Profile Page: Section TITLE_SELECTION_DROPDOWN contains text Company
	
		#Function selection
		When Profile Page: Section FUNCTION_SELECTION_DROPDOWN is visible
		Then Profile Page: Section FUNCTION_SELECTION_DROPDOWN contains text Other
		And Profile Page: Click FUNCTION_SELECTION_DROPDOWN
		And General: Wait 1 second
		And Profile Page: In section FUNCTION_SELECTION_DROPDOWN element FOREMAN_FUNCTION is visible
		And Profile Page: In section FUNCTION_SELECTION_DROPDOWN click FOREMAN_FUNCTION
		And Profile Page: Section FUNCTION_SELECTION_DROPDOWN contains text Foreman
		
		#Saving the changes
		And Profile Page: In section YOUR_CONTACT_DATA element YOUR_CONTACT_DATA_SAVE_BUTTON is enabled
		And Profile Page: In section YOUR_CONTACT_DATA click YOUR_CONTACT_DATA_SAVE_BUTTON
		
		#Your contact data - testing error messages
		And General: Wait 3 seconds
		Then Profile Page: FAX_ERROR_MESSAGE_BOX is visible
		And Profile Page: Element FAX_ERROR_MESSAGE_BOX contains text validation.profileContact.message.error.fax.pattern
		And Profile Page: PHONE_ERROR_MESSAGE_BOX is visible
		And Profile Page: Element PHONE_ERROR_MESSAGE_BOX contains text validation.profileContact.message.error.phone.pattern
		And Profile Page: MOBILE_PHONE_ERROR_MESSAGE_BOX is visible
		And Profile Page: Element MOBILE_PHONE_ERROR_MESSAGE_BOX contains text validation.profileContact.message.error.mobilePhone.pattern
		
		#Your contact data - making correct changes
		And General: Wait 3 seconds
		#When Profile Page: In section YOUR_CONTACT_DATA click CONTACT_DATA_EDIT_BUTTON
		Then Profile Page: In section YOUR_CONTACT_DATA element YOUR_CONTACT_DATA_SAVE_BUTTON is disabled
		And Profile Page: In section YOUR_CONTACT_DATA in field FIRST_NAME_TEXTFIELD type in Testeeen
		And Profile Page: In section YOUR_CONTACT_DATA in field LAST_NAME_TEXTFIELD type in TestingNow
		And Profile Page: In section YOUR_CONTACT_DATA in field PHONE_TEXTFIELD type in 678-445-7887
		And Profile Page: In section YOUR_CONTACT_DATA in field MOBILE_PHONE_TEXTFIELD type in 447-774-3266
		And Profile Page: In section YOUR_CONTACT_DATA in field FAX_TEXTFIELD type in 111-554-9900
		And Profile Page: In section YOUR_CONTACT_DATA element YOUR_CONTACT_DATA_SAVE_BUTTON is enabled
		And Profile Page: In section YOUR_CONTACT_DATA click YOUR_CONTACT_DATA_SAVE_BUTTON
		And General: Wait 3 seconds
		
		#Returning to default data
		#When Profile Page: In section YOUR_CONTACT_DATA click CONTACT_DATA_EDIT_BUTTON
		Then Profile Page: In section YOUR_CONTACT_DATA element YOUR_CONTACT_DATA_SAVE_BUTTON is enabled
		And Profile Page: In section YOUR_CONTACT_DATA in field FIRST_NAME_TEXTFIELD type in US QA
		And Profile Page: In section YOUR_CONTACT_DATA in field LAST_NAME_TEXTFIELD type in Test Account
		And Profile Page: Scroll to FUNCTION_SELECTION_DROPDOWN
		And General: Wait 1 second
		And Profile Page: Click FUNCTION_SELECTION_DROPDOWN
		And Profile Page: In section FUNCTION_SELECTION_DROPDOWN element OTHER_FUNCTION is visible
		And Profile Page: In section FUNCTION_SELECTION_DROPDOWN click OTHER_FUNCTION
		And Profile Page: Section FUNCTION_SELECTION_DROPDOWN contains text Other
		And Profile Page: Click TITLE_SELECTION_DROPDOWN
		And Profile Page: In section TITLE_SELECTION_DROPDOWN element MS_TITLE is visible
		And Profile Page: In section TITLE_SELECTION_DROPDOWN click MS_TITLE
		And Profile Page: Section TITLE_SELECTION_DROPDOWN contains text Ms
		And Profile Page: In section YOUR_CONTACT_DATA element YOUR_CONTACT_DATA_SAVE_BUTTON is enabled
		And Profile Page: In section YOUR_CONTACT_DATA click YOUR_CONTACT_DATA_SAVE_BUTTON
		And General: Wait 5 seconds
		And General: Scroll to the top
		And General: Wait 3 seconds
		
		#Checking the cancel option and form disappearing
		When Profile Page: In section YOUR_CONTACT_DATA element YOUR_CONTACT_DATA_SAVE_BUTTON is disabled
		Then Profile Page: In section YOUR_CONTACT_DATA click CONTACT_DATA_EDIT_BUTTON
		And Profile Page: In section YOUR_CONTACT_DATA element YOUR_CONTACT_DATA_SAVE_BUTTON is visible
		And Profile Page: In section YOUR_CONTACT_DATA click CONTACT_DATA_CANCEL_BUTTON
		And General: Wait 1 second
		And Profile Page: In section YOUR_CONTACT_DATA element YOUR_CONTACT_DATA_SAVE_BUTTON is disabled
		
		#Checking Your Company Data
		When Profile Page: Section YOUR_COMPANY_DATA is visible
		Then Profile Page: In section YOUR_COMPANY_DATA element COMPANY_NAME_ROW is visible
		And Profile Page: In section YOUR_COMPANY_DATA element SECOND_COMPANY_NAME_ROW is visible
		And Profile Page: In section YOUR_COMPANY_DATA element STREET_ADDRESS_ROW is visible
		And Profile Page: In section YOUR_COMPANY_DATA element SECOND_STREET_ADDRESS_ROW is visible
		And Profile Page: In section YOUR_COMPANY_DATA element CITY_ROW is visible
		And Profile Page: In section YOUR_COMPANY_DATA element STATE_ROW is visible
		And Profile Page: In section YOUR_COMPANY_DATA element ZIP_CODE_ROW is visible
		And Profile Page: In section YOUR_COMPANY_DATA element COUNTRY_ROW is visible
		And Profile Page: In section YOUR_COMPANY_DATA element TRADE_ROW is visible
		And Profile Page: In section YOUR_COMPANY_DATA element NO_OF_EMPLOYEES_ROW is visible
		And Profile Page: Section YOUR_COMPANY_DATA contains text account.companyData.label.editHeadline
		And Profile Page: Section YOUR_COMPANY_DATA contains text account.companyData.label.editText
		And Profile Page: In section YOUR_COMPANY_DATA element CONTACT_CUSTOMER_SERVICE_LINK is visible
		And Profile Page: AGREE_AND_ACCEPT_CHECKBOX is visible
		
	Examples:
      |	email_address		|	password			|	user_name		|	account_number	|
      |	US_user3_email		|	US_user3_password	|	US_user3_name	|	US_user3_id		|