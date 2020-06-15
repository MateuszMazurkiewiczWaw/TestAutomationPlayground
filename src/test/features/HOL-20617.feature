@Sprint6
Feature: HOL-20617 Firestop Systems 1st page - HNA/Canada only

  Scenario Outline: Firestop submittals 1st page functionalities
		
		#Enter the page
		Given General: open webshop for United States
		And Webshop Main Page: If section I_UNDERSTAND_COOKIES is visible click I_UNDERSTAND_BUTTON
		And Webshop Main Page: If section ONE_MORE_THING_BANNER is visible click DO_NOT_ASK_AGAIN_BUTTON
		And Webshop Main Page: If section DO_YOU_NEED_HELP is visible click DONT_ASK_ME_AGAIN_BUTTON
		When Webshop Main Page: In section HEADER element LOG_IN_OR_REGISTER_BUTTON is visible
	    Then Webshop Main Page: In section HEADER click LOG_IN_OR_REGISTER_BUTTON
	    And Webshop Main Page: Section LOG_IN_OR_REGISTER is visible
	    
	    #Fill out login
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
		And Profile Page: Section YOUR_ACCOUNT contains text <company_address>
		And Profile Page: Section YOUR_ACCOUNT contains text <account_number>
		
		#Off to the My Submittals section
		When Profile Page: Click OPEN_DASHBOARD_BUTTON
		And General: Wait 1 second
		Then Profile Page: In section ACCOUNT_DASHBOARD click GO_TO_YOUR_SUBMITTALS_LINK
		And General: Wait 1 second
		And My Submittals Page: MY_SUBMITTALS_HEADER is visible
		
		#Firestop submittals 1st step testing
		When My Submittals Page: Click CREATE_NEW_SUBMITTAL_BUTTON
		And General: Wait 1 second
		Then Firestops Page: CREATE_SUBMITTAL_1ST_STEP_HEADER is visible
		And Firestops Page: Section DEFINE_YOUR_REQUIREMENTS is visible
		And Firestops Page: Section GENERATE_SUBMITTAL_NOTE is visible
		
		#Define Your requirements section testing
		When Firestops Page: JOINT_RADIOBUTTON is visible
		Then Firestops Page: PENETRATION_RADIOBUTTON is visible
		And Firestops Page: In section DEFINE_YOUR_REQUIREMENTS element DEFINE_YOUR_REQUIREMENTS_TEXTFIELD is visible
		And Firestops Page: In section DEFINE_YOUR_REQUIREMENTS element DEFINE_YOUR_REQUIREMENTS_SEARCH_BUTTON is visible
		
		When Firestops Page: In section DEFINE_YOUR_REQUIREMENTS click PENETRATION_RADIOBUTTON
		And General: Wait 5 seconds
		And Firestops Page: Section FIRESTOPS_MAIN_LIST is visible
		Then Firestops Page: Section SEARCH_FILTERS_AND_RADIOBUTTONS is visible
		And Firestops Page: RESET_ALL_FILTERS_BUTTON is visible
		
		#Filters and textfield testing
		When Firestops Page: Click PENETRATING_ITEM_FILTER_BUTTON
		And General: Wait 1 second
		Then Firestops Page: Section PENETRATING_ITEM_LIST is visible
		And Firestops Page: In section PENETRATING_ITEM_LIST click element LIST_POSITION in position 2
		And General: Wait 5 seconds
		
		When Firestops Page: Click F_RATING_FILTER_BUTTON
		And General: Wait 1 second
		Then Firestops Page: Section F_RATING_LIST is visible
		And Firestops Page: In section F_RATING_LIST click element LIST_POSITION in position 2
		And General: Wait 2 seconds
		
		When Firestops Page: Click APPLICATION_METHOD_FILTER_BUTTON
		And General: Wait 1 second
		Then Firestops Page: Section APPLICATION_METHOD_LIST is visible
		And Firestops Page: In section APPLICATION_METHOD_LIST click element LIST_POSITION in position 2
		And General: Wait 5 seconds
		
		When Firestops Page: Click SEISMIC_PERFORMANCE_FILTER_BUTTON
		And General: Wait 1 second
		Then Firestops Page: Section SEISMIC_PERFORMANCE_LIST is visible
		And Firestops Page: In section SEISMIC_PERFORMANCE_LIST click element LIST_POSITION in position 2
		And General: Wait 2 seconds
		
		When Firestops Page: Click T_RATING_FILTER_BUTTON
		And General: Wait 1 second
		Then Firestops Page: Section T_RATING_FILTER_LIST is visible
		And Firestops Page: In section T_RATING_FILTER_LIST click element LIST_POSITION in position 2
		And General: Wait 2 seconds
		
		When Firestops Page: Scroll to TRADE_FILTER_BUTTON
		And Firestops Page: Click TRADE_FILTER_BUTTON
		And General: Wait 1 second
		Then Firestops Page: Section TRADE_LIST is visible
		And Firestops Page: In section TRADE_LIST click element LIST_POSITION in position 2
		And General: Wait 2 seconds
		
		When Firestops Page: In section FIRESTOPS_MAIN_LIST there is at least 1 FIRESTOPS_LIST_POSITION element
		Then Firestops Page: SYSTEM_TYPE_FILTER is visible
		And Firestops Page: PENETRATING_ITEM_FILTER is visible
		And Firestops Page: F_RATING_FILTER is visible
		And Firestops Page: APPLICATION_METHOD_FILTER is visible
		And Firestops Page: SEISMIC_PERFORMANCE_FILTER is visible
		And Firestops Page: T_RATING_FILTER is visible
		And Firestops Page: TRADE_FILTER is visible
		
		When Firestops Page: Click DELETE_TRADE_FILTER_BUTTON
		And General: Wait 2 seconds
		And General: Scroll to the top
		Then Firestops Page: Click DELETE_T_RATING_FILTER_BUTTON
		And General: Wait 2 seconds
		And General: Scroll to the top
		And Firestops Page: Click DELETE_SEISMIC_PERFORMANCE_FILTER_BUTTON
		And General: Wait 2 seconds
		And General: Scroll to the top
		And Firestops Page: Click DELETE_APPLICATION_METHOD_FILTER_BUTTON
		And General: Wait 2 seconds
		And General: Scroll to the top
		And Firestops Page: Click DELETE_F_RATING_FILTER_BUTTON
		And General: Wait 2 seconds
		And General: Scroll to the top
		And Firestops Page: Click DELETE_PENETRATING_ITEM_FILTER_BUTTON
		
		#Reset all filters button testing
		And General: Wait 2 seconds
		And General: Scroll to the top
		When Firestops Page: Click PENETRATING_ITEM_FILTER_BUTTON
		And General: Wait 1 second
		Then Firestops Page: Section PENETRATING_ITEM_LIST is visible
		And Firestops Page: In section PENETRATING_ITEM_LIST click element LIST_POSITION in position 2
		And General: Wait 2 seconds
		
		When Firestops Page: Click F_RATING_FILTER_BUTTON
		And General: Wait 1 second
		Then Firestops Page: Section F_RATING_LIST is visible
		And Firestops Page: In section F_RATING_LIST click element LIST_POSITION in position 1
		And General: Wait 2 seconds
		
		When Firestops Page: Click APPLICATION_METHOD_FILTER_BUTTON
		And General: Wait 1 second
		Then Firestops Page: Section APPLICATION_METHOD_LIST is visible
		And Firestops Page: In section APPLICATION_METHOD_LIST click element LIST_POSITION in position 1
		And General: Wait 2 seconds
		And Firestops Page: Click RESET_ALL_FILTERS_BUTTON
		And General: Wait 3 seconds
		And Firestops Page: Section FIRESTOPS_MAIN_LIST is not visible
		
		#Search text field testing
		When Firestops Page: In section DEFINE_YOUR_REQUIREMENTS in field DEFINE_YOUR_REQUIREMENTS_TEXTFIELD type in <search_term>
		Then Firestops Page: In section DEFINE_YOUR_REQUIREMENTS click DEFINE_YOUR_REQUIREMENTS_SEARCH_BUTTON
		And General: Wait 2 seconds
		
		#Firestops table testing
		When Firestops Page: Section FIRESTOPS_MAIN_LIST is visible
		Then Firestops Page: In section FIRESTOPS_MAIN_LIST there is at least 1 FIRESTOPS_LIST_POSITION element
		And Firestops Page: In section FIRESTOPS_MAIN_LIST element DESCRIPTION_FIELD in position 1 is visible
		And Firestops Page: In section FIRESTOPS_MAIN_LIST element SHOW_ALL_LINK in position 1 is visible
		And Firestops Page: In section FIRESTOPS_MAIN_LIST element DOWNLOAD_LINK in position 1 is visible
		And Firestops Page: In section FIRESTOPS_MAIN_LIST element MINATURE_IMAGES in position 1 is visible
		
		#Show all link testing
		When Firestops Page: In section FIRESTOPS_MAIN_LIST click element SHOW_ALL_LINK in position 1
		And General: Wait 2 seconds
		Then Firestops Page: Section RELATED_PRODUCTS_OVERLAY is visible
		And Firestops Page: Click CLOSE_OVERLAY_BUTTON
		And General: Wait 2 seconds
		
		#Redirection to 2nd step testing
		When Firestops Page: In section FIRESTOPS_LIST click element ITEM_CHECKBOX in position 10
		Then Firestops Page: Click CREATE_SUBMITTAL_BUTTON
		And General: Wait 2 seconds
		And Firestops Builder Page: CREATE_SUBMITTAL_2ND_STEP_HEADER is visible
		
	Examples:
      |	email_address		|	password			|	company_address		|	account_number	|	user_name		|	search_term	|
      |	US_fleet_email		|	US_fleet_password	|	US_fleet_address	|	US_fleet_id		|	US_fleet_name	|	F-B-2045	|