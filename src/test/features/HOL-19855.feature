@Sprint5 @ContactUsLayer
Feature: HOL-19855 Contact Us

	#Functionally tests covered in other feature with tag @ContactUsLayer
	Scenario Outline: Contact Us - Overlay
 		#Enter the page
		Given General: open webshop for Ireland
		And Webshop Main Page: If section I_UNDERSTAND_COOKIES is visible click I_UNDERSTAND_BUTTON
		And Webshop Main Page: If section ONE_MORE_THING_BANNER is visible click DO_NOT_ASK_AGAIN_BUTTON
		And Webshop Main Page: If section DO_YOU_NEED_HELP is visible click DONT_ASK_ME_AGAIN_BUTTON
		And General: Scroll to the bottom
		
	  	Then Webshop Main Page: In section FOOTER_MIDDLE element SERVICE_HOTLINE_LINK is visible
	  	
	  	When Webshop Main Page: In section FOOTER_MIDDLE element CALL_ME_BACK_LINK is visible
	  	And Webshop Main Page: In section FOOTER_MIDDLE click CALL_ME_BACK_LINK
	 	Then Webshop Main Page: If test is executed between <Chat_Open_Hour> and <Chat_Close_Hour> section LET_US_CALL_YOU_BACK is visible otherwise it contains text contact.callMeBackSection.label.unavailable
	  	And Webshop Main Page: In section CONTACT_US click CLOSE_CHAT_BUTTON
	  	And General: Wait 1 second
	  	
	  	When Webshop Main Page: In section FOOTER_MIDDLE element LIVE_CHAT_LINK is visible
	  	And Webshop Main Page: In section FOOTER_MIDDLE click LIVE_CHAT_LINK
	  	Then Webshop Main Page: If test is executed between <Chat_Open_Hour> and <Chat_Close_Hour> section LIVE_CHAT_WITH_US is visible otherwise it contains text contact.chatSection.label.unavailable
	  	And Webshop Main Page: In section CONTACT_US click CLOSE_CHAT_BUTTON
	  	And General: Wait 1 second
	  	
	  	When Webshop Main Page: In section FOOTER_MIDDLE element FEEDBACK_EMAIL_FORM_LINK is visible
	  	And Webshop Main Page: In section FOOTER_MIDDLE click FEEDBACK_EMAIL_FORM_LINK
	  	Then Webshop Main Page: Section SEND_US_MESSAGE is visible
	  	And Webshop Main Page: In section CONTACT_US click CLOSE_CHAT_BUTTON
	  	And General: Wait 1 second
	  	
	  	When Webshop Main Page: In section FOOTER_MIDDLE element FIND_A_hybris_CENTER_LINK is visible
	  	And Webshop Main Page: In section FOOTER_MIDDLE click FIND_A_hybris_CENTER_LINK
	  	Then Find hybris Center Page: USE_MY_LOCATION_BUTTON is visible
	  	And Webshop Main Page: Click hybris_LOGO_BUTTON
	
		And General: Wait 1 second
		And General: Scroll to the bottom
		And General: Wait 2 seconds
	  	When Webshop Main Page: In section FOOTER_TOP element CALL_ME_BACK_LINK is visible
	  	And Webshop Main Page: In section FOOTER_TOP click CALL_ME_BACK_LINK
	 	Then Webshop Main Page: If test is executed between <Chat_Open_Hour> and <Chat_Close_Hour> section LET_US_CALL_YOU_BACK is visible otherwise it contains text contact.callMeBackSection.label.unavailable
	  	And Webshop Main Page: In section CONTACT_US click CLOSE_CHAT_BUTTON
	  	And General: Wait 1 second
	  	
	  	When Webshop Main Page: In section FOOTER_TOP element LIVE_CHAT_LINK is visible
	  	And Webshop Main Page: In section FOOTER_TOP click LIVE_CHAT_LINK
	  	Then Webshop Main Page: If test is executed between <Chat_Open_Hour> and <Chat_Close_Hour> section LIVE_CHAT_WITH_US is visible otherwise it contains text contact.chatSection.label.unavailable
	  	And Webshop Main Page: In section CONTACT_US click CLOSE_CHAT_BUTTON
	    

	Examples:
		|	Chat_Open_Hour			|	Chat_Close_Hour			|
		|	IE_chat_opening_hour	|	IE_chat_closing_hour	|

	Scenario Outline: Contact Us - Off canvas
		#Enter the page
		Given General: open webshop for Ireland
		And Webshop Main Page: If section I_UNDERSTAND_COOKIES is visible click I_UNDERSTAND_BUTTON
		And Webshop Main Page: If section ONE_MORE_THING_BANNER is visible click DO_NOT_ASK_AGAIN_BUTTON
	    
	  	When Webshop Main Page: In section HEADER click CONTACT_US_OFF_CANVAS_BUTTON
	  	Then Webshop Main Page: Section CONTACT_US_OFF_CANVAS is visible
	  	And Webshop Main Page: In section CONTACT_US_OFF_CANVAS element CALL_US is visible
	  	
	  	When Webshop Main Page: In section CONTACT_US_OFF_CANVAS click LET_US_CALL_YOU_BACK_OFF_OFF_CANVAS_BUTTON
	  	And General: Wait 1 second
	  	Then Webshop Main Page: If test is executed between <Chat_Open_Hour> and <Chat_Close_Hour> section LET_US_CALL_YOU_BACK_OFF_CANVAS is visible otherwise it contains text contact.callMeBackSection.label.unavailable
	    
	    When Webshop Main Page: In section CONTACT_US_OFF_CANVAS click LIVE_CHAT_WITH_US_OFF_CANVAS_BUTTON
	   	And General: Wait 1 second
	    Then Webshop Main Page: If test is executed between <Chat_Open_Hour> and <Chat_Close_Hour> section LIVE_CHAT_WITH_US_OFF_CANVAS is visible otherwise it contains text contact.chatSection.label.unavailable
	    
	    When Webshop Main Page: In section CONTACT_US_OFF_CANVAS click SEND_US_A_MESSAGE_OFF_CANVAS_BUTTON
	    And General: Wait 1 second
	    Then Webshop Main Page: Section SEND_US_A_MESSAGE_OFF_CANVAS is visible
	    
	    And Webshop Main Page: In section CONTACT_US_OFF_CANVAS click FIND_A_hybris_CENTER_LINK
	  	Then Find hybris Center Page: USE_MY_LOCATION_BUTTON is visible
	  	And Webshop Main Page: Click hybris_LOGO_BUTTON
	  	
	  	When Webshop Main Page: In section HEADER click LOG_IN_OR_REGISTER_BUTTON
	  	And Webshop Main Page: In section LOG_IN_OR_REGISTER click CONTACT_US_BUTTON
	  	
	  	Then Webshop Main Page: Section CONTACT_US_OFF_CANVAS is visible
	  	And Webshop Main Page: In section CONTACT_US_OFF_CANVAS element CALL_US is visible
	  	
	  	When Webshop Main Page: In section CONTACT_US_OFF_CANVAS click LET_US_CALL_YOU_BACK_OFF_OFF_CANVAS_BUTTON
	  	And General: Wait 1 second
	  	Then Webshop Main Page: If test is executed between <Chat_Open_Hour> and <Chat_Close_Hour> section LET_US_CALL_YOU_BACK_OFF_CANVAS is visible otherwise it contains text contact.callMeBackSection.label.unavailable
	    
	    When Webshop Main Page: In section CONTACT_US_OFF_CANVAS click LIVE_CHAT_WITH_US_OFF_CANVAS_BUTTON
	   	And General: Wait 1 second
	    Then Webshop Main Page: If test is executed between <Chat_Open_Hour> and <Chat_Close_Hour> section LIVE_CHAT_WITH_US_OFF_CANVAS is visible otherwise it contains text contact.chatSection.label.unavailable
	    
	    When Webshop Main Page: In section CONTACT_US_OFF_CANVAS click SEND_US_A_MESSAGE_OFF_CANVAS_BUTTON
	    And General: Wait 1 second
	    Then Webshop Main Page: Section SEND_US_A_MESSAGE_OFF_CANVAS is visible
	    
	    And Webshop Main Page: In section CONTACT_US_OFF_CANVAS click FIND_A_hybris_CENTER_LINK
	  	Then Find hybris Center Page: USE_MY_LOCATION_BUTTON is visible
	  	
	Examples:
		|	Chat_Open_Hour			|	Chat_Close_Hour			|
		|	IE_chat_opening_hour	|	IE_chat_closing_hour	|
	