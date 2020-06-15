@Sprint2
Feature: HOL-20096 New Account Dashboard - replacing existing account overlay

  Scenario Outline: New Account Dashboard - multi account
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
	    
	    #2-Check header and dashboard functionality
	    
	   	When Webshop Main Page: Section ACCOUNT_SELECTION is visible
	   	And Webshop Main Page: Section ACCOUNT_SELECTION contains text dashboard.label.overlayTitle
	   	When General: Scroll to the bottom
	   	And General: Scroll to the top
	   	Then Webshop Main Page: Section ACCOUNT_SELECTION is visible
	   	#And Webshop Main Page: In section HEADER click USER_ACCOUNT_BUTTON
	   	And General: Wait 1 second
	   	And Webshop Main Page: Section ACCOUNT_SELECTION is visible
	    
	    When Webshop Main Page: Select account <user_id1>
	    And General: Wait 1 second
	    Then Webshop Main Page: Section HEADER contains text <user_name1>
	    And Webshop Main Page: Section HEADER contains text <user_id1> 
	        
		Then Webshop Main Page: Section ACCOUNT_DASHBOARD is visible
		And Webshop Main Page: Section ACCOUNT_DASHBOARD contains text <user_name1>
		And Webshop Main Page: Section ACCOUNT_DASHBOARD contains text <user_id1>
		
		When Webshop Main Page: In section ACCOUNT_DASHBOARD select account <user_id2>
		And General: Wait 1 second
		
		Then Webshop Main Page: Section ACCOUNT_DASHBOARD is visible
		And Webshop Main Page: Section HEADER contains text <user_name2>
	    And Webshop Main Page: Section HEADER contains text <user_id2>
	    When Webshop Main Page: Close ACCOUNT_DASHBOARD
	    And General: Wait 1 second
	    Then Webshop Main Page: Section ACCOUNT_DASHBOARD is not visible
	    
	    #3-Check widgets
	    When Webshop Main Page: In section HEADER click USER_ACCOUNT_BUTTON
	    Then Webshop Main Page: Section ACCOUNT_DASHBOARD is visible
		And Webshop Main Page: Section ACCOUNT_DASHBOARD contains text <user_name2>
		And Webshop Main Page: Section ACCOUNT_DASHBOARD contains text <user_id2>
		And Webshop Main Page: Section MANAGE_YOUR_ACCOUNT is visible
		And Webshop Main Page: In section MANAGE_YOUR_ACCOUNT there is at least 1 DASHBOARD_QUICK_LINK element
		And Webshop Main Page: Section YOUR_ORDERS is visible
		And Webshop Main Page: In section YOUR_ORDERS there is at least 1 DASHBOARD_QUICK_LINK element
		And Webshop Main Page: Section YOUR_FAVORITE_LISTS is visible
		And Webshop Main Page: In section YOUR_FAVORITE_LISTS there is at least 1 DASHBOARD_QUICK_LINK element
		And Webshop Main Page: Section MANAGE_YOUR_TOOLS is visible
		And Webshop Main Page: In section MANAGE_YOUR_TOOLS there is at least 1 DASHBOARD_QUICK_LINK element
		
		When Webshop Main Page: In section YOUR_FAVORITE_LISTS click GO_TO_COMPANY_LISTS_LINK
		Then Webshop Main Page: Section ACCOUNT_DASHBOARD is not visible
		And My Company Lists Page: Section MENU_BAR is visible
		
		#3-Log out
		And General: Wait 1 second
		When My Company Lists Page: In section YOUR_ACCOUNT click LOG_OUT_BUTTON
		Then My Company Lists Page: Section YOUR_ACCOUNT is not visible
		And Webshop Main Page: In section HEADER element LOG_IN_OR_REGISTER_BUTTON is visible
		
	Examples:
      |	email_address			|	password				|	user_name1				|	user_name2				|	user_id1			|	user_id2			|
      |	US_multi_user_email		|	US_multi_user_password	|	US_multi_user_name1		|	US_multi_user_name2		|	US_multi_user_id1	|	US_multi_user_id2	|   