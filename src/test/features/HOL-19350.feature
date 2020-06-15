@Sprint1
Feature: HOL-19350 My Favorite Lists Page
  
  Scenario Outline: My Favorite Lists Page layer - create a list validation
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
	   
	    And Webshop Main Page: Section HEADER contains text <user_name>
	    And Webshop Main Page: Section HEADER contains text <user_id>
		
		When Webshop Main Page: Section ACCOUNT_DASHBOARD is visible
		And Webshop Main Page: Section ACCOUNT_DASHBOARD contains text <user_name>
		Then Webshop Main Page: In section YOUR_FAVORITE_LISTS click GO_TO_FAVORITE_LISTS_LINK
		
		Then My Favorite Lists Page: Section FAVORITE_LIST is visible
		#Creating new Favorite List
		#1.Try to create list without naming it
		And My Favorite Lists Page: In section FAVORITE_LIST element CREATE_NEW_FAVORITE_LIST_BUTTON is enabled 
		And My Favorite Lists Page: In section FAVORITE_LIST click CREATE_NEW_FAVORITE_LIST_BUTTON
		And My Favorite Lists Page: Element MESSAGE_BOX contains text account.favouriteLists.namelist.validation.error
		And General: Wait 1 second
		Then My Favorite Lists Page: Close MESSAGE_BOX
		
        #2.Try to create randomly named list
		When My Favorite Lists Page: In section FAVORITE_LIST element NEW_LIST_NAME_TEXTFIELD contains text account.favouriteLists.createFavoriteLists.label.createFavoriteListPlaceholder
		And My Favorite Lists Page: In element NEW_LIST_NAME_TEXTFIELD type in and remember 20 random characters as RANDOM_LIST1
		And My Favorite Lists Page: In section FAVORITE_LIST click CREATE_NEW_FAVORITE_LIST_BUTTON
		When My Favorite Lists Page: Element MESSAGE_BOX contains text account.favouriteLists.message.success.createNewFavoriteList
		Then My Favorite Lists Page: In FAVORITE_LIST_TABLE row 1 contains remembered value RANDOM_LIST1
		And General: Wait 1 second
		And My Favorite Lists Page: Close MESSAGE_BOX
		When My Favorite Lists Page: In element NEW_LIST_NAME_TEXTFIELD type in remembered value RANDOM_LIST1
		Then My Favorite Lists Page: In section FAVORITE_LIST click CREATE_NEW_FAVORITE_LIST_BUTTON
		When My Favorite Lists Page: Element MESSAGE_BOX contains text account.favouriteLists.message.error.duplicateName
		And General: Wait 1 second
		And My Favorite Lists Page: Close MESSAGE_BOX
		
		#Try to type in more than 50 characters
		And My Favorite Lists Page: In element NEW_LIST_NAME_TEXTFIELD type in and remember 51 random characters as RANDOM_LIST2
		And My Favorite Lists Page: Press ENTER on a keyboard
		When My Favorite Lists Page: Element MESSAGE_BOX contains text account.favouriteLists.message.success.createNewFavoriteList
		Then My Favorite Lists Page: In FAVORITE_LIST_TABLE row 1 column 1 has 50 characters value of remembered RANDOM_LIST2
		And General: Wait 1 second
		And My Favorite Lists Page: Close MESSAGE_BOX
		
		#Use 50 characters
		Then My Favorite Lists Page: In element NEW_LIST_NAME_TEXTFIELD type in and remember 50 random characters as RANDOM_LIST3
		And My Favorite Lists Page: In section FAVORITE_LIST click CREATE_NEW_FAVORITE_LIST_BUTTON
		And My Favorite Lists Page: Element MESSAGE_BOX contains text account.favouriteLists.message.success.createNewFavoriteList
		Then My Favorite Lists Page: In FAVORITE_LIST_TABLE row 1 column 1 has 50 characters value of remembered RANDOM_LIST3
		
	Examples:
      |	email_address		|	password			|	user_name		|	user_id		|
      |	US_user_email		|	US_user_password	|	US_user_name	|	US_user_id	|

  Scenario Outline: My Favorite Lists Page layer - Testing the behavior of MY FAVORITE LIST table
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
	    And Webshop Main Page: Section HEADER contains text <user_name>
	    And Webshop Main Page: Section HEADER contains text <user_id>
	    
		When Webshop Main Page: Section ACCOUNT_DASHBOARD is visible
		And Webshop Main Page: Section ACCOUNT_DASHBOARD contains text <user_name>
		Then Webshop Main Page: In section YOUR_FAVORITE_LISTS click GO_TO_FAVORITE_LISTS_LINK
		
		When My Favorite Lists Page: Section MENU_BAR is visible
		And My Favorite Lists Page: In section MENU_BAR click FAVORITE_LISTS_AND_SUBMITIALS_DROPDOWN
		And My Favorite Lists Page: Click MY_FAVORITE_LISTS_BUTTON
		Then My Favorite Lists Page: Section FAVORITE_LIST is visible
		
	    #Try to sort "My favorite list" table
		When My Favorite Lists Page: LIST_NAME_SORT_BUTTON is visible
		And My Favorite Lists Page: Section FAVORITE_LIST_TABLE_HEADER contains text account.favouriteLists.label.numberOfItems
		And My Favorite Lists Page: DATE_CREATED_SORT_BUTTON is visible
		 
		#1.Sorting the table by name
		When My Favorite Lists Page: Click LIST_NAME_SORT_BUTTON
		And General: Wait 1 second
		Then My Favorite Lists Page: In FAVORITE_LIST_TABLE LIST_NAME_COLUMN is sorted ascending
		And My Favorite Lists Page: Click LIST_NAME_SORT_BUTTON
		And General: Wait 1 second
		When My Favorite Lists Page: In FAVORITE_LIST_TABLE LIST_NAME_COLUMN is sorted descending 
		
		#2.Sorting table by date
		When My Favorite Lists Page: Click DATE_CREATED_SORT_BUTTON
		And General: Wait 1 second
		Then My Favorite Lists Page: In FAVORITE_LIST_TABLE DATE_CREATED_COLUMN is sorted ascending
		When My Favorite Lists Page: Click DATE_CREATED_SORT_BUTTON
		And General: Wait 1 second
		Then My Favorite Lists Page: In FAVORITE_LIST_TABLE DATE_CREATED_COLUMN is sorted descending
		
		#Create new list
		And My Favorite Lists Page: In element NEW_LIST_NAME_TEXTFIELD type in and remember 20 random characters as RANDOM_LIST1
		And My Favorite Lists Page: In section FAVORITE_LIST click CREATE_NEW_FAVORITE_LIST_BUTTON
		When My Favorite Lists Page: Element MESSAGE_BOX contains text account.favouriteLists.message.success.createNewFavoriteList
		Then My Favorite Lists Page: In FAVORITE_LIST_TABLE row 1 contains remembered value RANDOM_LIST1
		And General: Wait 1 second
		And My Favorite Lists Page: Close MESSAGE_BOX
		
		#3.Try to copy list to company list
		When My Favorite Lists Page: In FAVORITE_LIST_TABLE in row 1 click COPY_LIST_TO_COMPANY_LIST_BUTTON
		Then My Favorite Lists Page: Element MESSAGE_BOX contains text account.favouriteLists.message.success.copyToCompanyList
		And General: Wait 1 second
		And My Favorite Lists Page: Close MESSAGE_BOX
		And My Favorite Lists Page: In FAVORITE_LIST_TABLE in row 1 click COPY_LIST_TO_COMPANY_LIST_BUTTON
		And My Favorite Lists Page: Element MESSAGE_BOX contains text account.favouriteLists.message.error.listAlreadyExists
		Then My Favorite Lists Page: Close MESSAGE_BOX
		And General: Wait 3 seconds
		
		#3.1Try to rename one of the list - Canceling the rename
		And My Favorite Lists Page: In FAVORITE_LIST_TABLE in row 2 remember value of LIST_NAME_TEXTFIELD as LIST_NAME1
		When My Favorite Lists Page: In FAVORITE_LIST_TABLE in row 2 click RENAME_LINK
		Then My Favorite Lists Page: In FAVORITE_LIST_TABLE in row 2 CHANGE_NAME_CONFIRM_BUTTON is visible
		And My Favorite Lists Page: In FAVORITE_LIST_TABLE in row 2 CHANGE_NAME_CANCEL_BUTTON is visible
		And My Favorite Lists Page: In FAVORITE_LIST_TABLE in row 2 CHANGE_LIST_NAME_TEXTFIELD contains remebered value LIST_NAME1
		Then My Favorite Lists Page: In FAVORITE_LIST_TABLE in row 2 in element CHANGE_LIST_NAME_TEXTFIELD type in and remember 15 random characters as VALUE_TO_CANCEL
		Then My Favorite Lists Page: In FAVORITE_LIST_TABLE in row 2 click CHANGE_NAME_CANCEL_BUTTON
		And My Favorite Lists Page: In FAVORITE_LIST_TABLE row 2 contains remembered value LIST_NAME1
		
		When My Favorite Lists Page: In FAVORITE_LIST_TABLE in row 2 click RENAME_LINK
		Then My Favorite Lists Page: In FAVORITE_LIST_TABLE in row 2 in element CHANGE_LIST_NAME_TEXTFIELD type in and remember 13 random characters as VALUE_TO_CHANGE
		And My Favorite Lists Page: In FAVORITE_LIST_TABLE in row 2 click CHANGE_NAME_CONFIRM_BUTTON
		And My Favorite Lists Page: Element MESSAGE_BOX contains text account.companyLists.message.renameComapnyListSuccessMessage
		And General: Wait 1 second
		Then My Favorite Lists Page: Close MESSAGE_BOX
		And General: Wait 3 seconds
		And My Favorite Lists Page: In FAVORITE_LIST_TABLE row 2 contains remembered value VALUE_TO_CHANGE
		
		#4.Try do delete one of the list
		When My Favorite Lists Page: In FAVORITE_LIST_TABLE in row 2 click DELETE_LIST_BUTTON
		And My Favorite Lists Page: DELETE_FAVORITE_LIST_POPUP is visible
		And My Favorite Lists Page: Element DELETE_FAVORITE_LIST_POPUP contains remembered value VALUE_TO_CHANGE
		When My Favorite Lists Page: In element DELETE_FAVORITE_LIST_POPUP click CANCEL_DELETE_BUTTON
		And My Favorite Lists Page: In FAVORITE_LIST_TABLE row 2 contains remembered value VALUE_TO_CHANGE
		And General: Wait 1 second
		Then My Favorite Lists Page: In FAVORITE_LIST_TABLE in row 2 click DELETE_LIST_BUTTON
		And My Favorite Lists Page: DELETE_FAVORITE_LIST_POPUP is visible
		And My Favorite Lists Page: Element DELETE_FAVORITE_LIST_POPUP contains remembered value VALUE_TO_CHANGE
		And My Favorite Lists Page: In section DELETE_FAVORITE_LIST_POPUP click DELETE_LIST_CONFIRM_BUTTON
		And My Favorite Lists Page: Element MESSAGE_BOX contains text account.companyLists.message.success.deleteCompanyList
		And My Favorite Lists Page: In FAVORITE_LIST_TABLE row 2 not contains remembered value VALUE_TO_CHANGE
		
	Examples:
      |	email_address		|	password			|	user_name		|	user_id		|
      |	US_user_email		|	US_user_password	|	US_user_name	|	US_user_id	| 
