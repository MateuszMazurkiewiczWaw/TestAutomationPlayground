@Sprint5 @ContactUsLayer
Feature: HOL-20313 Request demo layer

  Scenario Outline: Request demo layer - logged in validation
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
	    And Webshop Main Page: Section HEADER contains text <user_id>
		
		When Webshop Main Page: Section ACCOUNT_DASHBOARD is visible
		And Webshop Main Page: Section ACCOUNT_DASHBOARD contains text <user_name>
		And General: open <item> item page
		
		When Item Page: Scroll to CONSULTING_AND_SUPPORT_PLACEHOLDER
		And General: Wait 3 seconds
		And Item Page: In section CONSULTING_AND_SUPPORT element START_LIVE_CHAT_BUTTON is visible
		And Item Page: In section CONSULTING_AND_SUPPORT click START_LIVE_CHAT_BUTTON
		And Item Page: If test is executed between <Chat_Open_Hour> and <Chat_Close_Hour> section CONTACT_OVERLAY is visible otherwise it's not
		And Item Page: If section CONTACT_OVERLAY is visible click CLOSE_POPUP_BUTTON
		And General: Wait 2 seconds
		
		And Item Page: In section CONSULTING_AND_SUPPORT element REQUEST_CALLBACK_BUTTON is visible
		And Item Page: In section CONSULTING_AND_SUPPORT click REQUEST_CALLBACK_BUTTON
		And Item Page: If test is executed between <Chat_Open_Hour> and <Chat_Close_Hour> section CONTACT_OVERLAY is visible otherwise it's not
		And Item Page: If section CONTACT_OVERLAY is visible click CLOSE_POPUP_BUTTON
		And General: Wait 2 seconds
		
		When Item Page: Section CONSULTING_AND_SUPPORT is visible
		Then Item Page: In section CONSULTING_AND_SUPPORT element REQUEST_LIVE_DEMO_BUTTON is visible
		And Item Page: In section CONSULTING_AND_SUPPORT click REQUEST_LIVE_DEMO_BUTTON
		And Item Page: Section REQUEST_LIVE_DEMO_OVERLAY is visible
		And Item Page: In section REQUEST_LIVE_DEMO_OVERLAY click CANCEL_BUTTON
		And General: Wait 1 second
		And Item Page: Section REQUEST_LIVE_DEMO_OVERLAY is not visible
		And Item Page: In section CONSULTING_AND_SUPPORT click REQUEST_LIVE_DEMO_BUTTON
		And Item Page: Section REQUEST_LIVE_DEMO_OVERLAY is visible
		
		And Item Page: In section REQUEST_LIVE_DEMO_OVERLAY element YOUR_EMAIL_ADDRESS_TEXTFIELD has value <email_address>
		And Item Page: In section REQUEST_LIVE_DEMO_OVERLAY element YOUR_PHONE_NUMBER_TEXTFIELD has value <phone_number>
		And Item Page: In section REQUEST_LIVE_DEMO_OVERLAY element REQUEST_DEMO_BUTTON is disabled
		
		When Item Page: In section REQUEST_LIVE_DEMO_OVERLAY click YOUR_EMAIL_ADDRESS_TEXTFIELD
		And Item Page: In section REQUEST_LIVE_DEMO_OVERLAY element REQUEST_DEMO_BUTTON is enabled
		And Item Page: In section REQUEST_LIVE_DEMO_OVERLAY click REQUEST_DEMO_BUTTON
		
		And General: Wait 3 seconds
		Then Item Page: In section REQUEST_LIVE_DEMO_OVERLAY element SUCCESS_MESSAGE_BOX is visible
		And Item Page: In section REQUEST_LIVE_DEMO_OVERLAY element SUCCESS_MESSAGE_BOX contains text demoRequest.overlay.message.success.headline
		And Item Page: In section REQUEST_LIVE_DEMO_OVERLAY element SUCCESS_MESSAGE_BOX contains text demoRequest.overlay.message.success.text
		And Item Page: Click CLOSE_POPUP_BUTTON
		And General: Wait 1 second
		And Item Page: Section REQUEST_LIVE_DEMO_OVERLAY is not visible
		
		Then Item Page: In section CONSULTING_AND_SUPPORT element REQUEST_LIVE_DEMO_BUTTON is visible
		And Item Page: In section CONSULTING_AND_SUPPORT click REQUEST_LIVE_DEMO_BUTTON
		And Item Page: Section REQUEST_LIVE_DEMO_OVERLAY is visible
		And Item Page: In section REQUEST_LIVE_DEMO_OVERLAY element YOUR_EMAIL_ADDRESS_TEXTFIELD has value <email_address>
		And Item Page: In section REQUEST_LIVE_DEMO_OVERLAY element YOUR_PHONE_NUMBER_TEXTFIELD has value <phone_number>
		And Item Page: In section REQUEST_LIVE_DEMO_OVERLAY element REQUEST_DEMO_BUTTON is enabled
		
		When Item Page: In section REQUEST_LIVE_DEMO_OVERLAY click YOUR_PHONE_NUMBER_TEXTFIELD
		And Item Page: In section REQUEST_LIVE_DEMO_OVERLAY element REQUEST_DEMO_BUTTON is enabled
		And Item Page: In section REQUEST_LIVE_DEMO_OVERLAY click REQUEST_DEMO_BUTTON
		
		And General: Wait 3 seconds
		Then Item Page: In section REQUEST_LIVE_DEMO_OVERLAY element SUCCESS_MESSAGE_BOX is visible
		And Item Page: In section REQUEST_LIVE_DEMO_OVERLAY element SUCCESS_MESSAGE_BOX contains text demoRequest.overlay.message.success.headline
		And Item Page: In section REQUEST_LIVE_DEMO_OVERLAY element SUCCESS_MESSAGE_BOX contains text demoRequest.overlay.message.success.text		
		
		And Item Page: Click CLOSE_POPUP_BUTTON
		And General: Wait 1 second
		And Item Page: Section REQUEST_LIVE_DEMO_OVERLAY is not visible
		
		
	Examples:
		|	email_address		|	password			|	user_name		|	user_id		|	phone_number			|	item	|	Chat_Open_Hour			|	Chat_Close_Hour			|
		|	IE_user_email		|	IE_user_password	|	IE_user_name	|	IE_user_id	|	IE_user_phone_number	|	263439	|	IE_chat_opening_hour	|	IE_chat_closing_hour	|
	
  Scenario Outline: Request demo layer - not logged in validation
		#Enter the page
		Given General: open webshop for Ireland
		And Webshop Main Page: If section I_UNDERSTAND_COOKIES is visible click I_UNDERSTAND_BUTTON
		And Webshop Main Page: If section ONE_MORE_THING_BANNER is visible click DO_NOT_ASK_AGAIN_BUTTON
		And Webshop Main Page: If section DO_YOU_NEED_HELP is visible click DONT_ASK_ME_AGAIN_BUTTON
		
		And General: open <item> item page		
		
		When Item Page: Scroll to CONSULTING_AND_SUPPORT_PLACEHOLDER
		And General: Wait 5 seconds
		And Item Page: In section CONSULTING_AND_SUPPORT element START_LIVE_CHAT_BUTTON is visible
		And Item Page: In section CONSULTING_AND_SUPPORT click START_LIVE_CHAT_BUTTON
		And Item Page: If test is executed between <Chat_Open_Hour> and <Chat_Close_Hour> section CONTACT_OVERLAY is visible otherwise it's not
		And Item Page: If section CONTACT_OVERLAY is visible click CLOSE_POPUP_BUTTON
		And General: Wait 2 seconds
		
		And Item Page: In section CONSULTING_AND_SUPPORT element REQUEST_CALLBACK_BUTTON is visible
		And Item Page: In section CONSULTING_AND_SUPPORT click REQUEST_CALLBACK_BUTTON
		And Item Page: If test is executed between <Chat_Open_Hour> and <Chat_Close_Hour> section CONTACT_OVERLAY is visible otherwise it's not
		And Item Page: If section CONTACT_OVERLAY is visible click CLOSE_POPUP_BUTTON
		And General: Wait 2 seconds
		
		When Item Page: Section CONSULTING_AND_SUPPORT is visible
		Then Item Page: In section CONSULTING_AND_SUPPORT element REQUEST_LIVE_DEMO_BUTTON is visible
		And Item Page: In section CONSULTING_AND_SUPPORT click REQUEST_LIVE_DEMO_BUTTON
		And Item Page: Section REQUEST_LIVE_DEMO_OVERLAY is visible
		And Item Page: In section REQUEST_LIVE_DEMO_OVERLAY click CANCEL_BUTTON
		And General: Wait 1 second
		And Item Page: Section REQUEST_LIVE_DEMO_OVERLAY is not visible
		And Item Page: In section CONSULTING_AND_SUPPORT click REQUEST_LIVE_DEMO_BUTTON
		And Item Page: Section REQUEST_LIVE_DEMO_OVERLAY is visible
		
		And Item Page: In section REQUEST_LIVE_DEMO_OVERLAY element YOUR_EMAIL_ADDRESS_TEXTFIELD is empty
		And Item Page: In section REQUEST_LIVE_DEMO_OVERLAY element YOUR_PHONE_NUMBER_TEXTFIELD is empty
		And Item Page: In section REQUEST_LIVE_DEMO_OVERLAY element REQUEST_DEMO_BUTTON is disabled
		When Item Page: In section REQUEST_LIVE_DEMO_OVERLAY click YOUR_EMAIL_ADDRESS_TEXTFIELD
		When Item Page: In section REQUEST_LIVE_DEMO_OVERLAY in field YOUR_EMAIL_ADDRESS_TEXTFIELD type in not_email
		And Item Page: In section REQUEST_LIVE_DEMO_OVERLAY element REQUEST_DEMO_BUTTON is disabled
		When Item Page: In section REQUEST_LIVE_DEMO_OVERLAY in field YOUR_EMAIL_ADDRESS_TEXTFIELD type in email@address.com
		And Item Page: In section REQUEST_LIVE_DEMO_OVERLAY element REQUEST_DEMO_BUTTON is enabled
		And Item Page: In section REQUEST_LIVE_DEMO_OVERLAY click REQUEST_DEMO_BUTTON
		
		And General: Wait 3 seconds
		Then Item Page: In section REQUEST_LIVE_DEMO_OVERLAY element SUCCESS_MESSAGE_BOX is visible
		And Item Page: In section REQUEST_LIVE_DEMO_OVERLAY element SUCCESS_MESSAGE_BOX contains text demoRequest.overlay.message.success.headline
		And Item Page: In section REQUEST_LIVE_DEMO_OVERLAY element SUCCESS_MESSAGE_BOX contains text demoRequest.overlay.message.success.text
		And Item Page: Click CLOSE_POPUP_BUTTON
		And General: Wait 1 second
		And Item Page: Section REQUEST_LIVE_DEMO_OVERLAY is not visible
		
		Then Item Page: In section CONSULTING_AND_SUPPORT element REQUEST_LIVE_DEMO_BUTTON is visible
		And Item Page: In section CONSULTING_AND_SUPPORT click REQUEST_LIVE_DEMO_BUTTON
		And Item Page: Section REQUEST_LIVE_DEMO_OVERLAY is visible
		And Item Page: In section REQUEST_LIVE_DEMO_OVERLAY element YOUR_EMAIL_ADDRESS_TEXTFIELD is empty
		And Item Page: In section REQUEST_LIVE_DEMO_OVERLAY element YOUR_PHONE_NUMBER_TEXTFIELD is empty
		And Item Page: In section REQUEST_LIVE_DEMO_OVERLAY element REQUEST_DEMO_BUTTON is disabled
		When Item Page: In section REQUEST_LIVE_DEMO_OVERLAY click YOUR_PHONE_NUMBER_TEXTFIELD
		When Item Page: In section REQUEST_LIVE_DEMO_OVERLAY in field YOUR_PHONE_NUMBER_TEXTFIELD type in 0003217890
		And Item Page: In section REQUEST_LIVE_DEMO_OVERLAY element REQUEST_DEMO_BUTTON is enabled

		And Item Page: In section REQUEST_LIVE_DEMO_OVERLAY click REQUEST_DEMO_BUTTON
		
		And General: Wait 3 seconds
		Then Item Page: In section REQUEST_LIVE_DEMO_OVERLAY element SUCCESS_MESSAGE_BOX is visible
		And Item Page: In section REQUEST_LIVE_DEMO_OVERLAY element SUCCESS_MESSAGE_BOX contains text demoRequest.overlay.message.success.headline
		And Item Page: In section REQUEST_LIVE_DEMO_OVERLAY element SUCCESS_MESSAGE_BOX contains text demoRequest.overlay.message.success.text		
		
		And Item Page: Click CLOSE_POPUP_BUTTON
		And General: Wait 1 second
		And Item Page: Section REQUEST_LIVE_DEMO_OVERLAY is not visible
		
		
	Examples:
		|	item	|	Chat_Open_Hour			|	Chat_Close_Hour			|
		|	263439	|	IE_chat_opening_hour	|	IE_chat_closing_hour	|
		
