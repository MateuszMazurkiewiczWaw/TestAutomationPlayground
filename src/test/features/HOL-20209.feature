@Sprint6
Feature: HOL-20209 My firestop submittlas HNA only

  Scenario Outline: Firestop submittals functionalities
		
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
		
		#Redirection to 1st step testing
		When My Submittals Page: Click CREATE_NEW_SUBMITTAL_BUTTON
		And General: Wait 1 second
		Then Firestops Page: CREATE_SUBMITTAL_1ST_STEP_HEADER is visible
		And General: Go back
		And General: Wait 3 seconds
		
		When My Submittals Page: Click CREATE_NEW_SUBMITTAL_BUTTON
		And General: Wait 1 second
		Then Firestops Page: CREATE_SUBMITTAL_1ST_STEP_HEADER is visible
		
		When Firestops Page: Click JOINT_RADIOBUTTON
		And General: Wait 5 seconds
		And Firestops Page: In section FIRESTOPS_LIST click element ITEM_CHECKBOX in position 5
		Then Firestops Page: Click CREATE_SUBMITTAL_BUTTON
		And General: Wait 1 second
		Then Firestops Builder Page: CREATE_SUBMITTAL_2ND_STEP_HEADER is visible
		And Firestops Builder Page: Click SAVE_AS_FAVORITE_BUTTON
		And Firestops Builder Page: Section SAVE_AS_FAVORITE_OVERLAY is visible
		And Firestops Builder Page: In section SAVE_AS_FAVORITE_OVERLAY in field SAVE_AS_FAVORITE_TEXTFIELD type and remember 10_RANDOM_CHARACTERS as LIST_NAME_NEW
		And Firestops Builder Page: Click SAVE_AS_FAVORITE_OVERLAY_BUTTON
		And General: Wait 5 seconds
		
		When Firestops Builder Page: SUCCESS_MESSAGE_BOX is visible
		Then Firestops Builder Page: Element SUCCESS_MESSAGE_BOX contains text technicalLibrary.firestopsStepTwo.message.success.submittalSaved
		And Firestops Builder Page: Click ALL_SUBMITTAL_FAVORITES_LINK
		And General: Wait 1 second
		And My Submittals Page: Section SUBMITTALS_FAVORITES_TABLE is visible
		And My Submittals Page: Section SUBMITTALS_FAVORITES_TABLE contains remembered value LIST_NAME_NEW
		
		#My submittals table testing
		When My Submittals Page: Section SUBMITTALS_FAVORITES_TABLE is visible
		Then My Submittals Page: In section SUBMITTALS_FAVORITES_TABLE element LIST_NAME_COLUMN is visible
		And My Submittals Page: In section SUBMITTALS_FAVORITES_TABLE element DATE_CREATED_COLUMN is visible
		
		#List editing test
		And My Submittals Page: In MY_SUBMITTALS_TABLE in row 1 remember value of SUBMITTAL_NAME_COLUMN as LIST_NAME_INITIAL
		And My Submittals Page: In MY_SUBMITTALS_TABLE in row 1 click RENAME_LIST_BUTTON		
		
		And General: Wait 1 second
		When My Submittals Page: In MY_SUBMITTALS_TABLE in row 1 in element RENAME_LIST_TEXTFIELD type in value LIST_NAME_INITIAL
		And My Submittals Page: In MY_SUBMITTALS_TABLE in row 1 click CHANGE_NAME_BUTTON

		And General: Wait 1 second
		And My Submittals Page: ERROR_MESSAGE_BOX is visible
		And My Submittals Page: Element ERROR_MESSAGE_BOX contains text account.favouriteLists.message.error.duplicateName
		When My Submittals Page: In MY_SUBMITTALS_TABLE in row 1 in element RENAME_LIST_TEXTFIELD type in and remember 10 random characters as LIST_NAME_CHANGED
		And My Submittals Page: In MY_SUBMITTALS_TABLE in row 1 click CHANGE_NAME_BUTTON
		And General: Wait 1 second
		And My Submittals Page: SUCCESS_MESSAGE_BOX is visible
		And My Submittals Page: Element SUCCESS_MESSAGE_BOX contains text account.submittalLists.message.success.renameSubmittalList
		And My Submittals Page: Section SUBMITTALS_FAVORITES_TABLE contains remembered value LIST_NAME_CHANGED
		
		When My Submittals Page: In MY_SUBMITTALS_TABLE in row 1 click RENAME_LIST_BUTTON	
		And General: Wait 1 second
		Then My Submittals Page: In MY_SUBMITTALS_TABLE in row 1 click RENAME_CANCEL_BUTTON
		And My Submittals Page: In MY_SUBMITTALS_TABLE in row 1 move cursor to element LIST_NAME_COLUMN_CONTENT
		And My Submittals Page: In MY_SUBMITTALS_TABLE in row 1 click CREATE_SUBMITTAL_TABLE_BUTTON	
		And General: Wait 1 second
		Then Firestops Builder Page: CREATE_SUBMITTAL_2ND_STEP_HEADER is visible
		And General: Go back
		Then General: Wait 2 second
		And General: Scroll to the top
		
		When My Submittals Page: In MY_SUBMITTALS_TABLE in row 1 click DELETE_LIST_BUTTON
		Then General: Wait 1 second
		And My Submittals Page: Section DELETE_OVERLAY is visible
		And My Submittals Page: In section DELETE_OVERLAY click OVERLAY_CANCEL_BUTTON
		Then General: Wait 1 second
		And My Submittals Page: Section DELETE_OVERLAY is not visible
		And General: Scroll to the top
		When My Submittals Page: In MY_SUBMITTALS_TABLE in row 1 click DELETE_LIST_BUTTON
		Then General: Wait 1 second
		And My Submittals Page: Section DELETE_OVERLAY is visible
		And My Submittals Page: In section DELETE_OVERLAY click OVERLAY_DELETE_BUTTON
		Then General: Wait 1 second
		And My Submittals Page: SUCCESS_MESSAGE_BOX is visible
		And My Submittals Page: Element SUCCESS_MESSAGE_BOX contains text account.submittalLists.message.success.deleteSubmittalList
		
		#Returning to default

		
	Examples:
      |	email_address		|	password			|	company_address		|	account_number	|	user_name		|	list_name_changed					|
      |	US_fleet_email		|	US_fleet_password	|	US_fleet_address	|	US_fleet_id		|	US_fleet_name	|	aaaTest Submittal DO NOT DELETE2	|