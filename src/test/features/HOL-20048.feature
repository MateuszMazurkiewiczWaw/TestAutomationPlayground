@Sprint2
Feature: HOL-20048 Register: Step 1+2 - Registration Form and Confirmation E-Mail

	Scenario: Registration Form - Step 1+2
		#REGISTERING TO REGISTRATION FORM ONLY
	    Given General: open webshop for United States
	    And Webshop Main Page: If section I_UNDERSTAND_COOKIES is visible click I_UNDERSTAND_BUTTON
	    And Webshop Main Page: If section ONE_MORE_THING_BANNER is visible click DO_NOT_ASK_AGAIN_BUTTON
	    And Webshop Main Page: If section DO_YOU_NEED_HELP is visible click DONT_ASK_ME_AGAIN_BUTTON
	    When Webshop Main Page: In section HEADER element LOG_IN_OR_REGISTER_BUTTON is visible
	    Then Webshop Main Page: In section HEADER click LOG_IN_OR_REGISTER_BUTTON
	    And Webshop Main Page: Section LOG_IN_OR_REGISTER is visible
	    When Webshop Main Page: REGISTER_HERE_BUTTON is visible
	    Then Webshop Main Page: Click REGISTER_HERE_BUTTON
	    #1-Fill out registration form
	    When Webshop Registration Page: Section REGISTRATION_FORM contains text registration.label.form.email
	    And Webshop Registration Page: Section REGISTRATION_FORM contains text registration.label.form.password
	    And Webshop Registration Page: Section REGISTRATION_FORM contains text registration.label.form.repeatPassword
	    And Webshop Registration Page: In section REGISTRATION_FORM element REGISTER_NOW_BUTTON is enabled
	    Then Webshop Registration Page: In section REGISTRATION_FORM in field EMAIL_ADDRESS_TEXTFIELD type and remember RANDOM_EMAIL_ADDRESS as EMAIL
	    And Webshop Registration Page: In section REGISTRATION_FORM in field ENTER_PASSWORD_TEXTFIELD type in Hilti2016!
	    And Webshop Registration Page: In section REGISTRATION_FORM in field REPEAT_PASSWORD_TEXTFIELD type in Hilti2016!
	    Then Webshop Registration Page: In section REGISTRATION_FORM check TERMS_OF_CONDITION_CHECKBOX
	    When Webshop Registration Page: In section REGISTRATION_FORM element REGISTER_NOW_BUTTON is enabled
	    And Webshop Registration Page: In section REGISTRATION_FORM click REGISTER_NOW_BUTTON
	    Then Webshop Registration Page: THANK_YOU_FOR_REGISTERING_BANNER is visible
	    And Webshop Registration Page: Element THANK_YOU_FOR_REGISTERING_BANNER contains text registration.verification.message.success.headline
	    And Webshop Registration Page: Element THANK_YOU_FOR_REGISTERING_BANNER contains remembered value EMAIL
	    And Webshop Registration Page: SEND_ACTIVATION_EMAIL_AGAIN_BUTTON is visible
	    And Webshop Registration Page: BACK_TO_REGISTRATION_FORM_BUTTON is visible
	    And Webshop Registration Page: Click BACK_TO_REGISTRATION_FORM_BUTTON
	    
	    When Webshop Registration Page: Section REGISTRATION_FORM contains text registration.label.form.email
	    And Webshop Registration Page: Section REGISTRATION_FORM contains text registration.label.form.password
	    And Webshop Registration Page: Section REGISTRATION_FORM contains text registration.label.form.repeatPassword
	    And Webshop Registration Page: In section REGISTRATION_FORM element REGISTER_NOW_BUTTON is enabled

	Scenario: Registration Form - verification
		
		Given General: open webshop for United States
		And Webshop Main Page: If section I_UNDERSTAND_COOKIES is visible click I_UNDERSTAND_BUTTON
		And Webshop Main Page: If section ONE_MORE_THING_BANNER is visible click DO_NOT_ASK_AGAIN_BUTTON
	    And Webshop Main Page: If section DO_YOU_NEED_HELP is visible click DONT_ASK_ME_AGAIN_BUTTON
	    When Webshop Main Page: In section HEADER element LOG_IN_OR_REGISTER_BUTTON is visible
	    Then Webshop Main Page: In section HEADER click LOG_IN_OR_REGISTER_BUTTON
	    And Webshop Main Page: Section LOG_IN_OR_REGISTER is visible
	    When Webshop Main Page: REGISTER_HERE_BUTTON is visible
	    Then Webshop Main Page: Click REGISTER_HERE_BUTTON
	    #1-Fill out registration form
	    When Webshop Registration Page: Section REGISTRATION_FORM contains text registration.label.form.email
	    And Webshop Registration Page: Section REGISTRATION_FORM contains text registration.label.form.password
	    And Webshop Registration Page: Section REGISTRATION_FORM contains text registration.label.form.repeatPassword
	    And Webshop Registration Page: In section REGISTRATION_FORM element REGISTER_NOW_BUTTON is enabled
	    
	    And Webshop Registration Page: In section REGISTRATION_FORM in field EMAIL_ADDRESS_TEXTFIELD type in emailAddress
	    And Webshop Registration Page: Click ENTER_PASSWORD_TEXTFIELD
	    Then Webshop Registration Page: EMAIL_ERROR_MESSAGE is visible
	    
	    When Webshop Registration Page: In section REGISTRATION_FORM in field EMAIL_ADDRESS_TEXTFIELD type in RANDOM_EMAIL_ADDRESS
	    And Webshop Registration Page: Click ENTER_PASSWORD_TEXTFIELD
	    Then Webshop Registration Page: EMAIL_ERROR_MESSAGE is not visible
	    
	    When Webshop Registration Page: In section REGISTRATION_FORM all PASSWORD_SECURITY_REQUIREMENTS are invalid
	    And Webshop Registration Page: In section REGISTRATION_FORM in field ENTER_PASSWORD_TEXTFIELD type in H
	    Then Webshop Registration Page: In section REGISTRATION_FORM 2 of PASSWORD_SECURITY_REQUIREMENTS are valid
	    
	    And Webshop Registration Page: In section REGISTRATION_FORM in field ENTER_PASSWORD_TEXTFIELD type in Hi
	    Then Webshop Registration Page: In section REGISTRATION_FORM 3 of PASSWORD_SECURITY_REQUIREMENTS are valid	 
	    
	    And Webshop Registration Page: In section REGISTRATION_FORM in field ENTER_PASSWORD_TEXTFIELD type in Hilti2
	    Then Webshop Registration Page: In section REGISTRATION_FORM 4 of PASSWORD_SECURITY_REQUIREMENTS are valid
	    
	    When Webshop Registration Page: In section REGISTRATION_FORM in field ENTER_PASSWORD_TEXTFIELD type in Hilti2016!
	    Then Webshop Registration Page: In section REGISTRATION_FORM all PASSWORD_SECURITY_REQUIREMENTS are valid
	    
	    And Webshop Registration Page: In section REGISTRATION_FORM in field REPEAT_PASSWORD_TEXTFIELD type in Hilti2016!	    
	    
	   	When Webshop Registration Page: In section REGISTRATION_FORM click SHOW_PASSWORDS_CHECKBOX
	    Then Webshop Registration Page: In section REGISTRATION_FORM in field ENTER_PASSWORD_TEXTFIELD text is visible
	    And Webshop Registration Page: In section REGISTRATION_FORM in field REPEAT_PASSWORD_TEXTFIELD text is visible
	    When Webshop Registration Page: In section REGISTRATION_FORM click SHOW_PASSWORDS_CHECKBOX 
	    Then Webshop Registration Page: In section REGISTRATION_FORM in field ENTER_PASSWORD_TEXTFIELD text is masked
	    And Webshop Registration Page: In section REGISTRATION_FORM in field REPEAT_PASSWORD_TEXTFIELD text is masked
		