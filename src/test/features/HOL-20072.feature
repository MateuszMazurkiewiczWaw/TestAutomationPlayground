@Sprint1 
Feature: HOL-20072 Forgotten Password Overlay / Sent email success

   Scenario Outline: Login forgot password layer
		#PLAIN LOG IN
	    Given General: open webshop for United States
	    And Webshop Main Page: If section I_UNDERSTAND_COOKIES is visible click I_UNDERSTAND_BUTTON
	    And Webshop Main Page: If section ONE_MORE_THING_BANNER is visible click DO_NOT_ASK_AGAIN_BUTTON
	   	And Webshop Main Page: If section DO_YOU_NEED_HELP is visible click DONT_ASK_ME_AGAIN_BUTTON
	    When Webshop Main Page: In section HEADER element LOG_IN_OR_REGISTER_BUTTON is visible
	    Then Webshop Main Page: In section HEADER click LOG_IN_OR_REGISTER_BUTTON
	    #1-Fill out login
	    When Webshop Main Page: Section LOG_IN_OR_REGISTER contains text common.login.label.header
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER element LOG_IN_BUTTON is enabled
	    #2-Forgotten password
	    Then Webshop Main Page: In section LOG_IN_OR_REGISTER click FORGOTTEN_PASSWORD_BUTTON
	    And Webshop Main Page: Section FORGOTTEN_PASSWORD is visible
	    When Webshop Main Page: In section FORGOTTEN_PASSWORD in field FORGOTTEN_PASSWORD_EMAIL_ADDRESS_TEXTFIELD type in <email_address>
	    Then Webshop Main Page: In section FORGOTTEN_PASSWORD element FORGOTTEN_PASSWORD_CONTINUE_BUTTON is enabled
	    And Webshop Main Page: In section FORGOTTEN_PASSWORD click FORGOTTEN_PASSWORD_CONTINUE_BUTTON
	    
	    Then Webshop Main Page: Section FORGOTTEN_PASSWORD_SUCCESS is visible
	    Then Webshop Main Page: Section FORGOTTEN_PASSWORD_SUCCESS contains text common.login.forgotPassword.message.success.title
	   	And Webshop Main Page: Section FORGOTTEN_PASSWORD_SUCCESS contains text <email_address>
	   	
	   	And Webshop Main Page: Section FORGOTTEN_PASSWORD contains element CONTACT_US_BUTTON
	    And Webshop Main Page: In section FORGOTTEN_PASSWORD click CONTACT_US_BUTTON
	    Then Webshop Main Page: Section CONTACT_US_OFF_CANVAS is visible
	  	And Webshop Main Page: In section CONTACT_US_OFF_CANVAS element CALL_US is visible
	   	
	Examples:
      |	email_address		|
      |	US_user_email		|