@Sprint6
Feature: HOL-20625 Firestop Systems 2nd page - HNA/Canada only

  Scenario Outline: Firestop submittals 2nd page functionalities
		
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
		
		#Define Your requirements section testing
		When Firestops Page: JOINT_RADIOBUTTON is visible
		Then Firestops Page: PENETRATION_RADIOBUTTON is visible
		And Firestops Page: In section DEFINE_YOUR_REQUIREMENTS click PENETRATION_RADIOBUTTON
		And General: Wait 3 seconds
		
		#Off to the 2nd step
		When Firestops Page: In section FIRESTOPS_LIST click element ITEM_CHECKBOX in position 1
		Then Firestops Page: Click CREATE_SUBMITTAL_BUTTON
		And General: Wait 2 seconds
		And Firestops Builder Page: CREATE_SUBMITTAL_2ND_STEP_HEADER is visible
		
		#Main sections and elements testing
		When Firestops Builder Page: Section SELECTED_FIRESTOP_SYSTEMS_TABLE is visible
		Then Firestops Builder Page: ADD_MORE_SYSTEMS_BUTTON is visible
		And Firestops Builder Page: Section SELECTED_FIRESTOP_PRODUCTS is visible
		And Firestops Builder Page: Section SELECTED_SUBMITTAL_OPTIONS is visible
		
		When Firestops Builder Page: BACK_TO_SYSTEM_SELECTION_LINK is visible
		Then Firestops Builder Page: SAVE_AS_FAVORITE_LINK is visible
		And Firestops Builder Page: GENERATE_SUBMITTAL_BUTTON is visible
		
		#Selected firestop products section testing
		When Firestops Builder Page: In section SELECTED_FIRESTOP_PRODUCTS all elements SELECTED_PRODUCT_CHECKBOX are checked
		
		#Selected submittals options section testing
		When Firestops Builder Page: In section SELECTED_SUBMITTAL_OPTIONS element HILTI_COVER_PAGE_RADIOBUTTON is visible
		Then Firestops Builder Page: In section SELECTED_SUBMITTAL_OPTIONS click CUSTOM_COVER_PAGE_RADIOBUTTON
		And General: Wait 2 seconds
		And Firestops Builder Page: Section UPLOAD_CUSTOM_COVER is visible
		And Firestops Builder Page: In section UPLOAD_CUSTOM_COVER element SELECT_FILE_LINK is visible
		And Firestops Builder Page: In section UPLOAD_CUSTOM_COVER element DRAG_AND_DROP_BOX is visible
		
		When Firestops Builder Page: In section SELECTED_SUBMITTAL_OPTIONS click NO_COVER_PAGE_RADIOBUTTON
		Then Firestops Builder Page: INCLUDE_PAGE_NUMBER_YES_RADIOBUTTON is visible
		And Firestops Builder Page: INCLUDE_PAGE_NUMBER_NO_RADIOBUTTON is visible
		
		#Go back links testing
		When Firestops Builder Page: Click BACK_TO_SYSTEM_SELECTION_LINK
		And General: Wait 2 seconds
		Then Firestops Page: CREATE_SUBMITTAL_1ST_STEP_HEADER is visible
		And General: Go back
		And General: Wait 2 seconds
		Then Firestops Builder Page: Click ADD_MORE_SYSTEMS_BUTTON
		And General: Wait 2 seconds
		Then Firestops Page: CREATE_SUBMITTAL_1ST_STEP_HEADER is visible
		And General: Go back
		And General: Wait 2 seconds
		Then Firestops Builder Page: CREATE_SUBMITTAL_2ND_STEP_HEADER is visible
		
		#Main table testing
		When Firestops Builder Page: In section SELECTED_FIRESTOP_SYSTEMS_TABLE element SYSTEM_COLUMN_HEADER is visible
		Then Firestops Builder Page: In section SELECTED_FIRESTOP_SYSTEMS_TABLE element DESCRIPTION_COLUMN_HEADER is visible
		And Firestops Builder Page: In section SELECTED_FIRESTOP_SYSTEMS_TABLE element ATTRIBUTES_COLUMN_HEADER is visible
		And Firestops Builder Page: In section SELECTED_FIRESTOP_SYSTEMS_TABLE element F_RATING_COLUMN_HEADER is visible
		
		#Generating the submittal
		When Firestops Builder Page: Click GENERATE_SUBMITTAL_BUTTON
		And General: Wait 3 seconds
		Then Firestops Builder Page: GENERATE_SUCCESS_MESSAGE_BOX is visible
		And Firestops Builder Page: Element GENERATE_SUCCESS_MESSAGE_BOX contains text technicalLibrary.firestopsStepTwo.message.success.buildSuccessfullMessage
		And Firestops Builder Page: DOWNLOAD_SUBMITTAL_BUTTON is visible
		
		
		
	Examples:
      |	email_address		|	password			|	company_address		|	account_number	|	user_name		|
      |	US_fleet_email		|	US_fleet_password	|	US_fleet_address	|	US_fleet_id		|	US_fleet_name	|