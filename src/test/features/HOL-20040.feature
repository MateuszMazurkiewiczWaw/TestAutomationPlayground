@Sprint1
Feature: HOL-20040 Login layer - Registration/Login

  Scenario: Registration layer
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

   Scenario Outline: Login layer
		#PLAIN LOG IN
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
	    And Webshop Main Page: Section HEADER contains text <user_id> 
	    
	Examples:
      |	email_address		|	password			|	user_name		|	user_id		|
      |	US_user_email		|	US_user_password	|	US_user_name	|	US_user_id	|
      
	Scenario: Login layer - verification
		#PLAIN LOG IN
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
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER click LOG_IN_BUTTON
	    Then Webshop Main Page: EMAIL_ERROR_MESSAGE is visible
	    
		And Webshop Main Page: In section LOG_IN_OR_REGISTER in field EMAIL_ADDRESS_TEXTFIELD type in emailAddress
		And General: Lose focus
		Then Webshop Main Page: EMAIL_ERROR_MESSAGE is visible
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER click PASSWORD_TEXTFIELD
	    And General: Lose focus
	    And Webshop Main Page: PASSWORD_ERROR_MESSAGE is visible
	    
	    When Webshop Main Page: In section LOG_IN_OR_REGISTER in field EMAIL_ADDRESS_TEXTFIELD type in RANDOM_EMAIL_ADDRESS	  
	    And  Webshop Main Page: In section LOG_IN_OR_REGISTER in field PASSWORD_TEXTFIELD type in Hilti2016!
	    And General: Lose focus
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER click LOG_IN_BUTTON	    	  
	    Then Webshop Main Page: Section WRONG_PASSWORD_ERRORBOX is visible
	    And Webshop Main Page: Section WRONG_PASSWORD_ERRORBOX contains text common.login.message.error.title
	    And Webshop Main Page: Section WRONG_PASSWORD_ERRORBOX contains element RESET_PASSWORD_BUTTON
	    And Webshop Main Page: Section WRONG_PASSWORD_ERRORBOX not contains element FORGOTTEN_PASSWORD_BUTTON
	    And Webshop Main Page: Section LOG_IN_OR_REGISTER contains element CONTACT_US_BUTTON
	    
	    When Webshop Main Page: Click RESET_PASSWORD_BUTTON
	    And General: Wait 1 second
	    Then Webshop Main Page: Section FORGOTTEN_PASSWORD is visible
	    And Webshop Main Page: Section FORGOTTEN_PASSWORD contains element FORGOTTEN_PASSWORD_EMAIL_ADDRESS_TEXTFIELD
	    And Webshop Main Page: Section FORGOTTEN_PASSWORD contains element FORGOTTEN_PASSWORD_CONTINUE_BUTTON
    
    Scenario Outline: Login layer - show password and keep me logged in
		#PLAIN LOG IN
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
	    When Webshop Main Page: In section LOG_IN_OR_REGISTER in field PASSWORD_TEXTFIELD type in <password>
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER click SHOW_PASSWORD_CHECKBOX
	    Then Webshop Main Page: In section LOG_IN_OR_REGISTER in field PASSWORD_TEXTFIELD text is visible
	    When Webshop Main Page: In section LOG_IN_OR_REGISTER click SHOW_PASSWORD_CHECKBOX 
	    Then Webshop Main Page: In section LOG_IN_OR_REGISTER in field PASSWORD_TEXTFIELD text is masked
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER click KEEP_ME_LOGGED_IN_LABEL_CHECKBOX
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER element LOG_IN_BUTTON is enabled
	    Then Webshop Main Page: In section LOG_IN_OR_REGISTER click LOG_IN_BUTTON
	 	And Webshop Main Page: Section HEADER contains text <user_name>
	 	And Webshop Main Page: Section HEADER contains text <user_id> 
	 	
	 	#Opening new tab will not work on MAC due to: https://bugs.chromium.org/p/chromedriver/issues/detail?id=30
	 	Given General: open new tab
	 	When General: open webshop for United States
	 	Then Webshop Main Page: Section HEADER contains text <user_name>
	 	And Webshop Main Page: Section HEADER contains text <user_id> 
	 	
   	Examples:
      |	email_address		|	password			|	user_name		|	user_id		|
      |	US_user_email		|	US_user_password	|	US_user_name	|	US_user_id	|
      