@Sprint3 @ContactUsLayer 
Feature: HOL-19871 Chat layer & HOL-19887 Chat Windows - which slides in from the bottom

	Scenario Outline: HOL-19871 Chat layer - logged in
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
	    
	    And General: Wait 10 seconds
	    When Webshop Main Page: If test is executed between <Chat_Open_Hour> and <Chat_Close_Hour> section DO_YOU_NEED_HELP is visible otherwise it's not
	    Then Webshop Main Page: If chat is open then in section DO_YOU_NEED_HELP click CHAT_NOW_BUTTON
	    And Webshop Main Page: If chat is open then in section CONTACT_US field YOUR_NAME_CHAT_TEXTFIELD contains value <user_name>
	    And Webshop Main Page: If chat is open then in section CONTACT_US field YOUR_EMAIL_CHAT_TEXTFIELD contains value <email_address>
	    And Webshop Main Page: If chat is open then in section CONTACT_US in field YOUR_QUESTION_CHAT_TEXTFIELD type in Is it possible to pay with credit card?
	    And General: If chat is open then there is 1 window open
	    And Webshop Main Page: If chat is open then in section CONTACT_US click SUBMIT_CHAT_BUTTON
	    When General: Wait 2 seconds
	    Then General: If chat is open then there are 2 windows open
	    

	Examples:
		|	email_address		|	password			|	company_address	|	account_number	|	user_name		|	Chat_Open_Hour			|	Chat_Close_Hour			|
		|	IE_user_email		|	IE_user_password	|	IE_user_address	|	IE_user_id		|	IE_user_name	|	IE_chat_opening_hour	|	IE_chat_closing_hour	|

	Scenario Outline: HOL-19871 Chat layer - not logged in
		#Enter the page
		Given General: open webshop for Ireland
		When Webshop Main Page: If section I_UNDERSTAND_COOKIES is visible click I_UNDERSTAND_BUTTON
		And Webshop Main Page: If section ONE_MORE_THING_BANNER is visible click DO_NOT_ASK_AGAIN_BUTTON
	    
	    And General: Wait 10 seconds
	    When Webshop Main Page: If test is executed between <Chat_Open_Hour> and <Chat_Close_Hour> section DO_YOU_NEED_HELP is visible otherwise it's not
	    Then Webshop Main Page: If chat is open then in section DO_YOU_NEED_HELP click CHAT_NOW_BUTTON
	    And Webshop Main Page: If chat is open then in section CONTACT_US in field YOUR_NAME_CHAT_TEXTFIELD type in Hilti Customer
	    And Webshop Main Page: If chat is open then in section CONTACT_US in field YOUR_EMAIL_CHAT_TEXTFIELD type in Hilti.customer1@hilti.xyz
	    And Webshop Main Page: If chat is open then in section CONTACT_US in field YOUR_QUESTION_CHAT_TEXTFIELD type in Is it possible to pay with credit card?
	    And General: If chat is open then there is 1 window open
	    And Webshop Main Page: If chat is open then in section CONTACT_US click SUBMIT_CHAT_BUTTON
	    When General: Wait 2 seconds
	    Then General: If chat is open then there are 2 windows open
	    

	Examples:
		|	Chat_Open_Hour			|	Chat_Close_Hour			|
		|	IE_chat_opening_hour	|	IE_chat_closing_hour	|
	
	Scenario Outline: HOL-19887 Chat Window - not logged in
  		#Enter the page
		Given General: open webshop for Ireland
		When Webshop Main Page: If section I_UNDERSTAND_COOKIES is visible click I_UNDERSTAND_BUTTON
		And Webshop Main Page: If section ONE_MORE_THING_BANNER is visible click DO_NOT_ASK_AGAIN_BUTTON
	    
	    And General: Wait 10 seconds
	    When Webshop Main Page: If test is executed between <Chat_Open_Hour> and <Chat_Close_Hour> section DO_YOU_NEED_HELP is visible otherwise it's not
	    Then Webshop Main Page: If chat is open then in section DO_YOU_NEED_HELP click CHAT_NOW_BUTTON
	    And Webshop Main Page: If chat is open then in section CONTACT_US click CLOSE_CHAT_BUTTON
	    And General: Wait 1 second
	    When Webshop Main Page: If chat is open then in section DO_YOU_NEED_HELP click CLOSE_NEED_HELP_WINDOW_BUTTON
	    Then General: Wait 10 seconds
	    Then Webshop Main Page: Section DO_YOU_NEED_HELP is not visible
	    Then General: Refresh current page
	    
	    And General: Wait 10 seconds
	    When Webshop Main Page: If test is executed between <Chat_Open_Hour> and <Chat_Close_Hour> section DO_YOU_NEED_HELP is visible otherwise it's not
	    Then Webshop Main Page: If chat is open then in section DO_YOU_NEED_HELP click DONT_ASK_ME_AGAIN_BUTTON
		Then Webshop Main Page: Section DO_YOU_NEED_HELP is not visible
		Then General: Refresh current page
		Then General: Wait 10 seconds
		Then Webshop Main Page: Section DO_YOU_NEED_HELP is not visible

	Examples:
		|	Chat_Open_Hour			|	Chat_Close_Hour			|
		|	IE_chat_opening_hour	|	IE_chat_closing_hour	|
	