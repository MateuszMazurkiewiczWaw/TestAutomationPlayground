@Sprint1
Feature: HOL-20080 Forgotten Password Overlay / Sent email error

  Scenario: Forgotten Password Overlay/ Sent email error
		#Enter the page
		Given General: open webshop for United States
		And Webshop Main Page: If section I_UNDERSTAND_COOKIES is visible click I_UNDERSTAND_BUTTON
		And Webshop Main Page: If section ONE_MORE_THING_BANNER is visible click DO_NOT_ASK_AGAIN_BUTTON
		And Webshop Main Page: If section DO_YOU_NEED_HELP is visible click DONT_ASK_ME_AGAIN_BUTTON
		When Webshop Main Page: In section HEADER element LOG_IN_OR_REGISTER_BUTTON is visible
	    Then Webshop Main Page: In section HEADER click LOG_IN_OR_REGISTER_BUTTON
	    And Webshop Main Page: Section LOG_IN_OR_REGISTER is visible

  		#1. Close Forgot password section by clicking "X" button
     	Then Webshop Main Page: In section LOG_IN_OR_REGISTER click FORGOTTEN_PASSWORD_BUTTON
     	Then Webshop Main Page: Section FORGOTTEN_PASSWORD is visible
     	When Webshop Main Page: In section FORGOTTEN_PASSWORD in field FORGOTTEN_PASSWORD_EMAIL_ADDRESS_TEXTFIELD type in this.mail.does.not.exist@hybrisshop.com
     	Then Webshop Main Page: Click FORGOTTEN_PASSWORD_CLOSE_BUTTON
     	And General: Wait 1 second
    	Then Webshop Main Page: Section FORGOTTEN_PASSWORD is not visible
	    
	    #2.Close Forgot password section by scrolling down, and up again
	    When Webshop Main Page: In section HEADER click LOG_IN_OR_REGISTER_BUTTON
	    Then Webshop Main Page: Section LOG_IN_OR_REGISTER is visible
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER click FORGOTTEN_PASSWORD_BUTTON
	    Then Webshop Main Page: Section FORGOTTEN_PASSWORD contains text forgotpassword.label.form.header
	    Then General: Scroll to the bottom
	    And General: Scroll to the top
	    Then Webshop Main Page: Section FORGOTTEN_PASSWORD is not visible
	    
	    #3-Type in not existing e-mail address, and click go to registration link
	    When Webshop Main Page: In section HEADER click LOG_IN_OR_REGISTER_BUTTON
	    And Webshop Main Page: Section LOG_IN_OR_REGISTER is visible
	    Then Webshop Main Page: In section LOG_IN_OR_REGISTER click FORGOTTEN_PASSWORD_BUTTON
	    When Webshop Main Page: In section FORGOTTEN_PASSWORD in field FORGOTTEN_PASSWORD_EMAIL_ADDRESS_TEXTFIELD type in this.mail.does.not.exist@hybrisshop.com
	    Then General: Lose focus
	    Then Webshop Main Page: In section FORGOTTEN_PASSWORD element FORGOTTEN_PASSWORD_CONTINUE_BUTTON is enabled
	    Then Webshop Main Page: In section FORGOTTEN_PASSWORD click FORGOTTEN_PASSWORD_CONTINUE_BUTTON
	    And Webshop Main Page: Section FORGOTTEN_PASSWORD_ERROR is visible
	    And Webshop Main Page: Section FORGOTTEN_PASSWORD_ERROR contains text common.login.forgotPassword.message.error.title
	    And Webshop Main Page: Section FORGOTTEN_PASSWORD_ERROR contains text this.mail.does.not.exist@hybrisshop.com
	    And Webshop Main Page: Section FORGOTTEN_PASSWORD_ERROR contains element GO_TO_REGISTRATION_LINK
	    
	    And Webshop Main Page: In section FORGOTTEN_PASSWORD_ERROR open GO_TO_REGISTRATION_LINK in new tab
	    And General: Switch to tab number 1
	    
	    And Webshop Main Page: Section FORGOTTEN_PASSWORD_ERROR contains element CONTACT_US_BUTTON	    
	    And Webshop Main Page: In section FORGOTTEN_PASSWORD_ERROR click CONTACT_US_BUTTON
	    Then Webshop Main Page: Section CONTACT_US_OFF_CANVAS is visible
	  	And Webshop Main Page: In section CONTACT_US_OFF_CANVAS element CALL_US is visible
	  	
	  	And General: Switch to tab number 2
	  	
		When Webshop Registration Page: Section REGISTRATION_FORM contains text E-mail address
	    And Webshop Registration Page: Section REGISTRATION_FORM contains text registration.label.form.password
	    And Webshop Registration Page: Section REGISTRATION_FORM contains text registration.label.form.repeatPassword