@Sprint1
Feature: HOL-20064 Forgotten Password Overlay

  Scenario Outline: Forgotten Password Overlay 
		#Enter the page
		Given General: open webshop for United States
		And Webshop Main Page: If section I_UNDERSTAND_COOKIES is visible click I_UNDERSTAND_BUTTON
		And Webshop Main Page: If section ONE_MORE_THING_BANNER is visible click DO_NOT_ASK_AGAIN_BUTTON
		And Webshop Main Page: If section DO_YOU_NEED_HELP is visible click DONT_ASK_ME_AGAIN_BUTTON
		When Webshop Main Page: In section HEADER element LOG_IN_OR_REGISTER_BUTTON is visible
	    Then Webshop Main Page: In section HEADER click LOG_IN_OR_REGISTER_BUTTON
	    And Webshop Main Page: Section LOG_IN_OR_REGISTER is visible
	    
	    #1-Choose "Forgot Your password"
	    When Webshop Main Page: Section LOG_IN_OR_REGISTER contains text common.login.label.header
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER click FORGOTTEN_PASSWORD_BUTTON
	    When Webshop Main Page: Section FORGOTTEN_PASSWORD contains text forgotpassword.label.form.header
	    Then Webshop Main Page: In section FORGOTTEN_PASSWORD element FORGOTTEN_PASSWORD_CONTINUE_BUTTON is enabled
	   
	    And Webshop Main Page: Section FORGOTTEN_PASSWORD contains element CONTACT_US_BUTTON
	    And Webshop Main Page: In section FORGOTTEN_PASSWORD click CONTACT_US_BUTTON
	    Then Webshop Main Page: Section CONTACT_US_OFF_CANVAS is visible
	  	And Webshop Main Page: In section CONTACT_US_OFF_CANVAS element CALL_US is visible
		And General: Go back
	    
	    And Webshop Main Page: In section FORGOTTEN_PASSWORD element FORGOTTEN_PASSWORD_CANCEL_BUTTON is enabled
	    
	    #2-Type in uncorrect e-mail address
	    When Webshop Main Page: In section FORGOTTEN_PASSWORD in field FORGOTTEN_PASSWORD_EMAIL_ADDRESS_TEXTFIELD type in joe.smith@phalanxcom
	    Then General: Lose focus
	    And Webshop Main Page: Section FORGOTTEN_PASSWORD contains text common.message.error.invalidEmail
	    And Webshop Main Page: In section FORGOTTEN_PASSWORD element FORGOTTEN_PASSWORD_CONTINUE_BUTTON is enabled
	    Then General: Lose focus
	    #3-Type in not existing e-mail address, and cancel the password recovery section
	    When Webshop Main Page: In section FORGOTTEN_PASSWORD in field FORGOTTEN_PASSWORD_EMAIL_ADDRESS_TEXTFIELD type in this.mail.does.not.exist@hybrisshop.com
	    Then General: Lose focus
	    Then Webshop Main Page: In section FORGOTTEN_PASSWORD element FORGOTTEN_PASSWORD_CONTINUE_BUTTON is enabled
	    Then Webshop Main Page: In section FORGOTTEN_PASSWORD click FORGOTTEN_PASSWORD_CONTINUE_BUTTON
	    And Webshop Main Page: Section FORGOTTEN_PASSWORD_ERROR is visible
	    And Webshop Main Page: Section FORGOTTEN_PASSWORD_ERROR contains text common.login.forgotPassword.message.error.title
	    And Webshop Main Page: Section FORGOTTEN_PASSWORD_ERROR contains text this.mail.does.not.exist@hybrisshop.com
	    And Webshop Main Page: Section FORGOTTEN_PASSWORD_ERROR contains element GO_TO_REGISTRATION_LINK
	    And Webshop Main Page: Section FORGOTTEN_PASSWORD_ERROR contains element CONTACT_US_BUTTON
		Then Webshop Main Page: In section FORGOTTEN_PASSWORD click FORGOTTEN_PASSWORD_CANCEL_BUTTON
	    And General: Wait 1 second
	    
	    #4-Enter, and leave recovery section by scrolling down the webshop page
	    Then Webshop Main Page: Section LOG_IN_OR_REGISTER is visible
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER click FORGOTTEN_PASSWORD_BUTTON
	    Then Webshop Main Page: Section FORGOTTEN_PASSWORD contains text forgotpassword.label.form.header
	    Then General: Scroll to the bottom
	    And General: Scroll to the top
	    Then Webshop Main Page: Section FORGOTTEN_PASSWORD is not visible
	    
	    #5-Enter and finish recovery password steps by entering the correct e-mail address
	    When Webshop Main Page: In section HEADER click LOG_IN_OR_REGISTER_BUTTON
	    Then Webshop Main Page: In section LOG_IN_OR_REGISTER click FORGOTTEN_PASSWORD_BUTTON
	    And Webshop Main Page: In section FORGOTTEN_PASSWORD in field FORGOTTEN_PASSWORD_EMAIL_ADDRESS_TEXTFIELD type in <email_address>
	    Then Webshop Main Page: In section FORGOTTEN_PASSWORD element FORGOTTEN_PASSWORD_CONTINUE_BUTTON is enabled
	    When Webshop Main Page: In section FORGOTTEN_PASSWORD click FORGOTTEN_PASSWORD_CONTINUE_BUTTON

	    Then Webshop Main Page: Section FORGOTTEN_PASSWORD_SUCCESS is visible
	    Then Webshop Main Page: Section FORGOTTEN_PASSWORD_SUCCESS contains text common.login.forgotPassword.message.success.title
	   	And Webshop Main Page: Section FORGOTTEN_PASSWORD_SUCCESS contains text <email_address>
		Then Webshop Main Page: Click FORGOTTEN_PASSWORD_CLOSE_BUTTON
		And General: Wait 1 second
		And Webshop Main Page: Section FORGOTTEN_PASSWORD_SUCCESS is not visible
		
	Examples:
      |	email_address		|
      |	US_user_email		|
      
