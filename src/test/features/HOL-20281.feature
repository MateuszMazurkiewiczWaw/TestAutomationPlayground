@Sprint5
Feature: HOL-20281 Item Page Standard + Fleet item

  Scenario Outline: Full content and functionalities of Item Page - Fleet items
		
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
		Then Profile Page: Section YOUR_ACCOUNT contains text <account_number>
		
		#Adding items to the cart
	 	When Webshop Main Page: In section HEADER click SHOPPING_CART_BUTTON
	 	Then Cart Page: Section QUICK_ITEM_ENTRY is visible
	 	And Cart Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <item_number_valid>
	 	And Cart Page: Click ADD_TO_CART_BUTTON
	 	And Webshop Main Page: The SHOPPING_CART contains <summed_up_quantity> items
	 	
		#1. Continuing to the fleet product item page and testing header section
		When Cart Page: In FLEET_PRODUCTS_TABLE_CONTENT in row 1 remember value of TABLE_TOTAL_PRICE_COLUMN as FLEET_PRICE1
		And General: Wait 2 seconds
		Then Cart Page: In section FLEET_PRODUCTS_TABLE_CONTENT move cursor to element TABLE_DESCRIPTION_COLUMN
		And Cart Page: In section FLEET_PRODUCTS_TABLE_CONTENT click TABLE_SEE_PRODUCT_DETAILS_LINK
		And General: Wait 1 second
		And Item Page: PRODUCT_HEADER is visible
		And Item Page: In section PRODUCT_HEADER element RATINGS_LINK is visible
		
		#Below line disabled. It's not 100% sure that item won't have any review
		#And Item Page: In section PRODUCT_HEADER element RATINGS_LINK contains text range.label.ratingsAndReviewLinkNoReviews
		
		And Item Page: SOCIAL_MEDIA_WIDGET is visible
		And Item Page: Section PRODUCT_HEADER contains text <item_number_valid>
		
		#1. Bread crumbs testing: 
		 #1st position - Home Page
		 #2nd position - Product Category 1st level
		 #3rd position - Product Category 2nd level
		 #4th position - Product Category 3rd level
		 #5th position - Grid Page
		 #6th position - Range Page
		 #Additional INACTIVE 7th position - Item Page
		And Item Page: Section BREADCRUMB_LIST is visible
		And Item Page: In section BREADCRUMB_LIST there is exactly 3 BREADCRUMB_LIST_POSITION elements
		
		#1. Upper section testing
		When Item Page: ITEM_IMAGE is visible
		And Item Page: Section PRODUCT_VARIANTS_AND_CART_WIDGET is visible
		And Item Page: In section PRODUCT_VARIANTS_AND_CART_WIDGET element BUY_RADIOBUTTON is visible
		And Item Page: In section PRODUCT_VARIANTS_AND_CART_WIDGET click BUY_RADIOBUTTON
		And Item Page: In section PRODUCT_VARIANTS_AND_CART_WIDGET element FLEET_CONTRACT_WARNING is visible
		And Item Page: In section PRODUCT_VARIANTS_AND_CART_WIDGET element FLEET_CONTRACT_LINK is visible
		And Item Page: In section PRODUCT_VARIANTS_AND_CART_WIDGET element FLEET_RADIOBUTTON is visible
		And Item Page: In section PRODUCT_VARIANTS_AND_CART_WIDGET click FLEET_RADIOBUTTON
		And Item Page: In section PRODUCT_VARIANTS_AND_CART_WIDGET element ITEM_PIECES_TEXTFIELD is visible
		And Item Page: CHECK_AVAILABILITY_LINK is visible
		And Item Page: Click CHECK_AVAILABILITY_LINK
		And Item Page: Section CHECK_AVAILABILITY_POPUP is visible
		And Item Page: Click CLOSE_POPUP_BUTTON
		And General: Wait 1 second
		And Item Page: ADD_TO_FAVORITES_LINK is visible
		And Item Page: Click ADD_TO_FAVORITES_LINK
		And Item Page: Section ADD_TO_FAVORITES_POPUP is visible
		And General: Wait 1 second
		And Item Page: Click ADD_TO_FAVORITES_LINK
		And Item Page: Section ADD_TO_FAVORITES_POPUP is visible
		And Item Page: Click CREATE_NEW_LIST_BUTTON
		And General: Wait 1 second
		And Item Page: In element CREATE_NEW_LIST_TEXTFIELD type in 6 random characters
		And General: Wait 1 second
		And Item Page: Click SUBMIT_CREATE_NEW_LIST_BUTTON
		And General: Wait 1 second
		And Item Page: FAVORITE_LIST_ADDITION is visible
		And Item Page: Click CLOSE_FAVORITE_LIST_POPUP_BUTTON
		And General: Wait 1 second
		And Item Page: Click ADD_TO_FAVORITES_LINK
		And General: Wait 1 second
		And Item Page: In section ADD_TO_FAVORITES_POPUP click element FAVORITE_LIST_FIRST_POSITION in position 1
		And General: Wait 1 second
		And Item Page: FAVORITE_LIST_ADDITION is visible
		And Item Page: Click CLOSE_FAVORITE_LIST_POPUP_BUTTON
		#TODO: Favorites list checking
		And Item Page: SEE_ALL_PRODUCTS_AND_PACKAGES_LINK is visible
		And Item Page: Open SEE_ALL_PRODUCTS_AND_PACKAGES_LINK in new tab
		And General: Switch to tab number 2
		And Range Page: PRODUCT_HEADER is visible
		And General: Discard last tab
		And Item Page: ZOOM_IN_BUTTON is visible
		And Item Page: Section KEY_TECHNICAL_DATA is visible
		And Item Page: MORE_TECHNICAL_DATA_LINK is visible
		And Item Page: Section PACKAGE_CONTENTS is visible
		And Item Page: Section BASIC_INFORMATION contains remembered value FLEET_PRICE1
		
		#1. Features and applications section testing
		When Item Page: Scroll to FEATURES_AND_APPLICATIONS
		Then Item Page: Section FEATURES_AND_APPLICATIONS is visible
		And Item Page: In section FEATURES_AND_APPLICATIONS element FEATURES_COLUMN is visible
		And Item Page: In section FEATURES_AND_APPLICATIONS element APPLICATIONS_COLUMN is visible
		
		#1. Related products section and technical data table testing
		When Item Page: Click EXPAND_BAR_MENU_BUTTON
		Then General: Wait 1 second
		And Item Page: Section SIDE_BAR_MENU is visible
		And Item Page: Click RELATED_PRODUCTS_LINK
		And General: Wait 3 seconds
		
		When Item Page: Section RELATED_PRODUCTS is visible
		Then Item Page: In section RELATED_PRODUCTS element ALL_PRODUCTS_RADIOBUTTON is visible
		And Item Page: In section RELATED_PRODUCTS element TOOLS_PRODUCTS_RADIOBUTTON is visible
		And Item Page: In section RELATED_PRODUCTS element CONSUMABLES_PRODUCTS_RADIOBUTTON is visible
		And Item Page: In section RELATED_PRODUCTS element SHOW_ALL_PRODUCTS_BUTTON is visible
		And Item Page: In section RELATED_PRODUCTS click SHOW_ALL_PRODUCTS_BUTTON
		And Item Page: In section RELATED_PRODUCTS element RELATED_PRODUCTS_LIST is visible
		And Item Page: Click TECHNICAL_DATA_LINK
		And General: Wait 3 seconds
		And Item Page: Section TECHNICAL_DATA_TABLE is visible
		
		#1. Documents section testing
		When Item Page: Scroll to TECHNICAL_DATA_TABLE
		When Item Page: Click EXPAND_BAR_MENU_BUTTON
		Then General: Wait 1 second
		And Item Page: Click DOCUMENTS_AND_VIDEOS_LINK
		Then General: Wait 3 seconds
		
		When Item Page: Section DOCUMENTS is visible
		Then Item Page: In section DOCUMENTS element APPROVAL_DOCUMENT_BUTTON is visible
		And Item Page: In section DOCUMENTS click APPROVAL_DOCUMENT_BUTTON
		And Item Page: APPROVAL_DOCUMENT_PDF_LINK is visible
		
		#1. Consulting & support section testing
		When Item Page: Section CONSULTING_AND_SUPPORT is visible
		Then Item Page: In section CONSULTING_AND_SUPPORT element REQUEST_LIVE_DEMO_BUTTON is visible
		And Item Page: In section CONSULTING_AND_SUPPORT element START_LIVE_CHAT_BUTTON is visible
		And Item Page: In section CONSULTING_AND_SUPPORT element REQUEST_CALLBACK_BUTTON is visible
		
		#1. Ratings & reviews section testing
		And Item Page: Click RATINGS_AND_REVIEWS_LINK
		Then General: Wait 3 seconds
		And Item Page: Wait for full RATINGS_AND_REVIEWS load

		
		When Item Page: Section RATINGS_AND_REVIEWS is visible
		Then Item Page: Section ALERT_MESSAGE_BOX is visible
		And Item Page: Section ALERT_MESSAGE_BOX contains text ratingsReviews.loggedInUser.label.isThisYourAccount
		And Item Page: In section ALERT_MESSAGE_BOX element LOG_OUT_LINK is visible
		And Item Page: PRODUCT_REVIEWS_DISCLAIMER is visible
		And Item Page: ITEM_PAGE_FOOTER is visible

		#1. Consulting & support section testing2
		When Item Page: Section CONSULTING_AND_SUPPORT is visible
		Then Item Page: In section CONSULTING_AND_SUPPORT element REQUEST_LIVE_DEMO_BUTTON is visible
		And Item Page: In section CONSULTING_AND_SUPPORT click REQUEST_LIVE_DEMO_BUTTON
		And Item Page: Section REQUEST_LIVE_DEMO_OVERLAY is visible
		And Item Page: Click CLOSE_POPUP_BUTTON
		And General: Wait 1 second
		And Item Page: In section CONSULTING_AND_SUPPORT element REQUEST_CALLBACK_BUTTON is visible
		
		#Request call back covered in: HOL-20313
		
		#1. Side bar controller and cart bar wrapper testing
		When Item Page: Click CLOSE_SIDE_BAR_BUTTON
		And Item Page: Scroll to DOCUMENTS
		Then Item Page: Section SIDE_BAR_CONTROLLER is visible
		And Item Page: In section SIDE_BAR_CONTROLLER element EXPAND_BAR_MENU_BUTTON is visible
		And Item Page: In section SIDE_BAR_CONTROLLER element UP_ARROW_BAR_MENU_BUTTON is visible
		And General: Wait 1 second
		And Item Page: Click CLOSE_SIDE_BAR_BUTTON
		And Item Page: Section CART_BAR_WRAPPER is visible
		And Item Page: CART_BAR_PRODUCT_NAME is visible
		And Item Page: FLEET_CART_BAR_PRODUCT_PRICE is visible
		And Item Page: WIDGET_BUY_RADIOBUTTON is visible
		And Item Page: WIDGET_FLEET_RADIOBUTTON is visible
		And Item Page: CART_BAR_CART_WIDGET is visible
		
		#1. Upper section - not logged in for fleet
		When Webshop Main Page: In section HEADER click OPEN_DASHBOARD_BUTTON
		Then Webshop Main Page: Click LOG_OUT_BUTTON
		And General: Wait 2 seconds
		And Webshop Main Page: In section HEADER click SHOPPING_CART_BUTTON
		And General: Wait 1 second
		Then Cart Page: Section QUICK_ITEM_ENTRY is visible
	 	And Cart Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <item_number_valid>
	 	And Cart Page: Click ADD_TO_CART_BUTTON
	 	And Webshop Main Page: The SHOPPING_CART contains <summed_up_quantity> items
		And Cart Page: In STANDARD_PRODUCTS_TABLE_CONTENT in row 1 remember value of TABLE_TOTAL_PRICE_COLUMN as FLEET_PRICE2
		And Cart Page: In section STANDARD_PRODUCTS_TABLE_CONTENT move cursor to element TABLE_DESCRIPTION_COLUMN 
		And Cart Page: In section STANDARD_PRODUCTS_TABLE_CONTENT click TABLE_SEE_PRODUCT_DETAILS_LINK
		And General: Wait 1 second
		And Item Page: PRODUCT_HEADER is visible
		And Item Page: Section BASIC_INFORMATION contains remembered value FLEET_PRICE2
		And Item Page: In section BASIC_INFORMATION in field ITEM_PIECES_TEXTFIELD type in 2
		And Item Page: In section PRODUCT_VARIANTS_AND_CART_WIDGET element ADD_TO_CART_BUTTON is visible
		And Item Page: In section PRODUCT_VARIANTS_AND_CART_WIDGET click ADD_TO_CART_BUTTON
		And General: Wait 2 seconds
		And Webshop Main Page: The SHOPPING_CART contains <summed_up_quantity2> items
		And Item Page: CART_ADDITION_POPUP is visible
	 
	Examples:
      |	email_address			|	password			|	user_name		|	account_number	|	item_number_valid	|	summed_up_quantity	|	summed_up_quantity2	|
	  |	US_fleet_email			|	US_fleet_password	|	US_fleet_name	|	US_fleet_id		|	US_fleet_product1	|	1					|	3					|
      
  Scenario Outline: Full content and functionalities of Item Page - Standard items
		
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
		Then Profile Page: Section YOUR_ACCOUNT contains text <account_number>
		
		#Adding items to the cart
	 	When Webshop Main Page: In section HEADER click SHOPPING_CART_BUTTON
	 	Then Cart Page: Section QUICK_ITEM_ENTRY is visible
	 	And Cart Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <item_number_valid>
	 	And Cart Page: Click ADD_TO_CART_BUTTON
	 	And Webshop Main Page: The SHOPPING_CART contains <summed_up_quantity> items
	 	
		#2. Continuing to the standard product item page and testing header section
		When Cart Page: In STANDARD_PRODUCTS_TABLE_CONTENT in row 1 remember value of TABLE_PRICE_COLUMN as STANDARD_PRICE1
		And General: Wait 2 seconds
		Then Cart Page: In section STANDARD_PRODUCTS_TABLE_CONTENT move cursor to element TABLE_DESCRIPTION_COLUMN 
		And Cart Page: In section STANDARD_PRODUCTS_TABLE_CONTENT click TABLE_SEE_PRODUCT_DETAILS_LINK
		And General: Wait 1 second
		And Item Page: PRODUCT_HEADER is visible
		And Item Page: In section PRODUCT_HEADER element RATINGS_LINK is visible
		And Item Page: SOCIAL_MEDIA_WIDGET is visible
		And Item Page: Section PRODUCT_HEADER contains text <item_number_valid>
		
		#1. Bread crumbs testing
		 #1st position - Home Page
		 #2nd position - Product Category 1st level
		 #3rd position - Product Category 2nd level
		 #4th position - Product Category 3rd level
		 #5th position - Range Page
		 #Additional INACTIVE 6th position - Item Page
		 
		And Item Page: Section BREADCRUMB_LIST is visible
		And Item Page: In section BREADCRUMB_LIST there is exactly 5 BREADCRUMB_LIST_POSITION elements
		
		#2. Upper section testing
		When Item Page: ITEM_IMAGE is visible
		And Item Page: Section PRODUCT_VARIANTS_AND_CART_WIDGET is visible
		And Item Page: In section PRODUCT_VARIANTS_AND_CART_WIDGET element ITEM_PIECES_TEXTFIELD is visible
		And Item Page: SEE_ALL_PRODUCTS_AND_PACKAGES_LINK is visible
		And Item Page: Open SEE_ALL_PRODUCTS_AND_PACKAGES_LINK in new tab
		And General: Switch to tab number 2
		And Range Page: PRODUCT_HEADER is visible
		And General: Discard last tab
		And Item Page: ZOOM_IN_BUTTON is visible
		And Item Page: In section PRODUCT_VARIANTS_AND_CART_WIDGET element CHECK_AVAILABILITY_LINK is visible
		And Item Page: In section PRODUCT_VARIANTS_AND_CART_WIDGET element ADD_TO_FAVORITES_LINK is visible
		And Item Page: Click ADD_TO_FAVORITES_LINK
		And Item Page: Section ADD_TO_FAVORITES_POPUP is visible
		And Item Page: In section ADD_TO_FAVORITES_POPUP click element FAVORITE_LIST_FIRST_POSITION in position 1
		And General: Wait 1 second
		And Item Page: FAVORITE_LIST_ADDITION is visible
		And Item Page: Click CLOSE_FAVORITE_LIST_POPUP_BUTTON
		And General: Wait 1 second
		And Item Page: Click ADD_TO_FAVORITES_LINK
		And Item Page: Section ADD_TO_FAVORITES_POPUP is visible
		And Item Page: Click CREATE_NEW_LIST_BUTTON
		And General: Wait 1 second
		And Item Page: In element CREATE_NEW_LIST_TEXTFIELD type in 6 random characters
		And General: Wait 1 second
		And Item Page: Click SUBMIT_CREATE_NEW_LIST_BUTTON
		And General: Wait 1 second
		And Item Page: FAVORITE_LIST_ADDITION is visible
		And Item Page: Click CLOSE_FAVORITE_LIST_POPUP_BUTTON
		And General: Wait 1 second
		#TODO: Favorites list checking
		And Item Page: Section PACKAGE_CONTENTS is visible
		And Item Page: Section BASIC_INFORMATION contains remembered value STANDARD_PRICE1
		
		#2. Features and applications section testing
		When Item Page: Scroll to FEATURES_AND_APPLICATIONS
		Then Item Page: Section FEATURES_AND_APPLICATIONS is visible
		And Item Page: In section FEATURES_AND_APPLICATIONS element FEATURES_COLUMN is visible
		
		#2. Related products section and technical data table testing
		When Item Page: Click EXPAND_BAR_MENU_BUTTON
		Then General: Wait 1 second
		And Item Page: Section SIDE_BAR_MENU is visible
		And Item Page: Click RELATED_PRODUCTS_LINK
		And General: Wait 5 seconds
		
		When Item Page: Section RELATED_PRODUCTS is visible
		Then Item Page: In section RELATED_PRODUCTS element ALL_PRODUCTS_RADIOBUTTON is visible
		And Item Page: In section RELATED_PRODUCTS element TOOLS_PRODUCTS_RADIOBUTTON is visible
		And Item Page: In section RELATED_PRODUCTS element INSERTS_PRODUCTS_RADIOBUTTON is visible
		And Item Page: In section RELATED_PRODUCTS element RELATED_PRODUCTS_LIST is visible
		And Item Page: Section TECHNICAL_DATA_TABLE is visible
		
		#2. Consulting & support section testing
		When Item Page: Click CONSULTING_AND_SUPPORT_LINK
		Then General: Wait 3 seconds
		And Item Page: Wait for full CONSULTING_AND_SUPPORT load
		
		When Item Page: Section CONSULTING_AND_SUPPORT is visible
		Then Item Page: In section CONSULTING_AND_SUPPORT element REQUEST_LIVE_DEMO_BUTTON is visible
		And Item Page: In section CONSULTING_AND_SUPPORT element START_LIVE_CHAT_BUTTON is visible
		And Item Page: In section CONSULTING_AND_SUPPORT element REQUEST_CALLBACK_BUTTON is visible
		
		#2. Ratings & reviews section testing
		And Item Page: Click RATINGS_AND_REVIEWS_LINK
		Then General: Wait 3 seconds
		And Item Page: Wait for full RATINGS_AND_REVIEWS load
		
		When Item Page: Section RATINGS_AND_REVIEWS is visible
		Then Item Page: Section ALERT_MESSAGE_BOX is visible
		And Item Page: Section ALERT_MESSAGE_BOX contains text ratingsReviews.loggedInUser.label.isThisYourAccount
		And Item Page: In section ALERT_MESSAGE_BOX element LOG_OUT_LINK is visible
		And Item Page: PRODUCT_REVIEWS_DISCLAIMER is visible
		And Item Page: ITEM_PAGE_FOOTER is visible
		
		#2. Consulting & support section testing2
		When Item Page: Click CONSULTING_AND_SUPPORT_LINK
		Then General: Wait 3 seconds
		
		When Item Page: Section CONSULTING_AND_SUPPORT is visible
		Then Item Page: In section CONSULTING_AND_SUPPORT element REQUEST_LIVE_DEMO_BUTTON is visible
		And Item Page: In section CONSULTING_AND_SUPPORT click REQUEST_LIVE_DEMO_BUTTON
		And Item Page: Section REQUEST_LIVE_DEMO_OVERLAY is visible
		And Item Page: Click CLOSE_POPUP_BUTTON
		And General: Wait 2 seconds
		
		#Request call back covered in: HOL-20313
		
		#2. Side bar controller and cart bar wrapper testing
		When Item Page: Click CLOSE_SIDE_BAR_BUTTON
		And Item Page: Scroll to FEATURES_AND_APPLICATIONS
		
		When Item Page: Section SIDE_BAR_CONTROLLER is visible
		Then Item Page: In section SIDE_BAR_CONTROLLER element EXPAND_BAR_MENU_BUTTON is visible
		And Item Page: In section SIDE_BAR_CONTROLLER element DOWN_ARROW_BAR_MENU_BUTTON is visible
		And General: Wait 1 second
		And Item Page: Section CART_BAR_WRAPPER is visible
		And Item Page: CART_BAR_PRODUCT_NAME is visible
		And Item Page: CART_BAR_PRODUCT_PRICE is visible
		And Item Page: CART_BAR_CART_WIDGET is visible
		
		#2. Upper section - not logged in for standard
		When Webshop Main Page: In section HEADER click OPEN_DASHBOARD_BUTTON
		Then Webshop Main Page: Click LOG_OUT_BUTTON
		And General: Wait 2 seconds
		And Webshop Main Page: In section HEADER click SHOPPING_CART_BUTTON
		And General: Wait 1 second
		Then Cart Page: Section QUICK_ITEM_ENTRY is visible
	 	And Cart Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <item_number_valid>
	 	And Cart Page: Click ADD_TO_CART_BUTTON
	 	And Webshop Main Page: The SHOPPING_CART contains <summed_up_quantity> items
		And Cart Page: In STANDARD_PRODUCTS_TABLE_CONTENT in row 1 remember value of NOT_LOGGED_IN_TABLE_PRICE_COLUMN as STANDARD_PRICE2
		And Cart Page: In section STANDARD_PRODUCTS_TABLE_CONTENT move cursor to element TABLE_DESCRIPTION_COLUMN 
		And Cart Page: In section STANDARD_PRODUCTS_TABLE_CONTENT click TABLE_SEE_PRODUCT_DETAILS_LINK
		And General: Wait 1 second
		And Item Page: PRODUCT_HEADER is visible
		And Item Page: Section BASIC_INFORMATION contains remembered value STANDARD_PRICE2
		And Item Page: In section BASIC_INFORMATION in field ITEM_PIECES_TEXTFIELD type in 2
		And Item Page: In section PRODUCT_VARIANTS_AND_CART_WIDGET element ADD_TO_CART_BUTTON is visible
		And Item Page: In section PRODUCT_VARIANTS_AND_CART_WIDGET click ADD_TO_CART_BUTTON
		And General: Wait 2 seconds
		And Webshop Main Page: The SHOPPING_CART contains <summed_up_quantity2> items
		And Item Page: CART_ADDITION_POPUP is visible
	 
	Examples:
      |	email_address			|	password			|	user_name		|	account_number	|	item_number_valid		|	summed_up_quantity	|	summed_up_quantity2	|
      |	US_user2_email			|	US_user2_password	|	US_user2_name	|	US_user2_id		|	US_standard_product1	|	5					|	10					|
    
	Scenario Outline: Full content and functionalities of Item Page - Software items
		
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
		Then Profile Page: Section YOUR_ACCOUNT contains text <account_number>
		
		#Adding items to the cart
	 	When Webshop Main Page: In section HEADER click SHOPPING_CART_BUTTON
	 	Then Cart Page: Section QUICK_ITEM_ENTRY is visible
	 	And Cart Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <item_number_valid>
	 	And Cart Page: Click ADD_TO_CART_BUTTON
	 	And Webshop Main Page: The SHOPPING_CART contains <summed_up_quantity> items
	 	
		#3. Continuing to the software product item page and testing header section
		When Cart Page: In SOFTWARE_PRODUCTS_TABLE_CONTENT in row 1 remember value of TABLE_PRICE_COLUMN as SOFTWARE_PRICE1
		And General: Wait 2 seconds
		Then Cart Page: In section SOFTWARE_PRODUCTS_TABLE_CONTENT move cursor to element TABLE_DESCRIPTION_COLUMN 
		And Cart Page: In section SOFTWARE_PRODUCTS_TABLE_CONTENT click TABLE_SEE_PRODUCT_DETAILS_LINK
		And General: Wait 1 second
		And Item Page: PRODUCT_HEADER is visible
		And Item Page: In section PRODUCT_HEADER element RATINGS_LINK is visible
		And Item Page: In section PRODUCT_HEADER element RATINGS_LINK contains text range.label.ratingsAndReviewLinkNoReviews
		And Item Page: SOCIAL_MEDIA_WIDGET is visible
		And Item Page: Section PRODUCT_HEADER contains text <item_number_valid>
		And Item Page: Click ADD_TO_FAVORITES_LINK
		And Item Page: Section ADD_TO_FAVORITES_POPUP is visible
		And Item Page: In section ADD_TO_FAVORITES_POPUP click element FAVORITE_LIST_FIRST_POSITION in position 1
		And General: Wait 1 second
		And Item Page: FAVORITE_LIST_ADDITION is visible
		And Item Page: Click CLOSE_FAVORITE_LIST_POPUP_BUTTON
		And General: Wait 1 second
		And Item Page: Click ADD_TO_FAVORITES_LINK
		And Item Page: Section ADD_TO_FAVORITES_POPUP is visible
		And Item Page: Click CREATE_NEW_LIST_BUTTON
		And General: Wait 1 second
		And Item Page: In element CREATE_NEW_LIST_TEXTFIELD type in 6 random characters
		And General: Wait 1 second
		And Item Page: Click SUBMIT_CREATE_NEW_LIST_BUTTON
		And General: Wait 1 second
		And Item Page: FAVORITE_LIST_ADDITION is visible
		And Item Page: Click CLOSE_FAVORITE_LIST_POPUP_BUTTON
		And General: Wait 1 second
		#TODO: Favorites list checking
		
		#3. Bread crumbs testing: 
		 #1st position - Home Page
		 #2nd position - Product Category 1st level
		 #3rd position - Product Category 2nd level
		 #4th position - Product Category 3rd level
		 #Additional INACTIVE 5th position - Item Page
		And Item Page: Section BREADCRUMB_LIST is visible
		And Item Page: In section BREADCRUMB_LIST there is exactly 4 BREADCRUMB_LIST_POSITION elements
		
		#3. Upper section testing
		When Item Page: ITEM_IMAGE is visible
		And Item Page: Section PRODUCT_VARIANTS_AND_CART_WIDGET is visible
		And Item Page: In section PRODUCT_VARIANTS_AND_CART_WIDGET element YEARLY_RADIOBUTTON is visible
		And Item Page: In section PRODUCT_VARIANTS_AND_CART_WIDGET click YEARLY_RADIOBUTTON
		And Item Page: In section PRODUCT_VARIANTS_AND_CART_WIDGET element MONTHLY_RADIOBUTTON is visible
		And Item Page: In section PRODUCT_VARIANTS_AND_CART_WIDGET click MONTHLY_RADIOBUTTON
		And Item Page: In section PRODUCT_VARIANTS_AND_CART_WIDGET element ITEM_PIECES_TEXTFIELD is visible
		And Item Page: SEE_ALL_PRODUCTS_AND_PACKAGES_LINK is visible
		And Item Page: Open SEE_ALL_PRODUCTS_AND_PACKAGES_LINK in new tab
		And General: Switch to tab number 2
		And Range Page: PRODUCT_HEADER is visible
		And General: Discard last tab
		And Item Page: Section BASIC_INFORMATION contains remembered value SOFTWARE_PRICE1
		And Item Page: Scroll to CONSULTING_AND_SUPPORT
		And General: Wait 3 seconds
		
		#3. Consulting & support section testing
		When Item Page: Click EXPAND_BAR_MENU_BUTTON
		Then General: Wait 1 second
		And Item Page: Section SIDE_BAR_MENU is visible
		And Item Page: Click CONSULTING_AND_SUPPORT_LINK
		And General: Wait 3 seconds
		
		When Item Page: Section CONSULTING_AND_SUPPORT is visible
		Then Item Page: In section CONSULTING_AND_SUPPORT element REQUEST_LIVE_DEMO_BUTTON is visible
		And Item Page: In section CONSULTING_AND_SUPPORT element START_LIVE_CHAT_BUTTON is visible
		And Item Page: In section CONSULTING_AND_SUPPORT element REQUEST_CALLBACK_BUTTON is visible
		
		#3. Ratings & reviews section testing
		When Item Page: Scroll to RATINGS_AND_REVIEWS
		Then General: Wait 3 seconds
		And Item Page: Wait for full RATINGS_AND_REVIEWS load
		
		When Item Page: Section RATINGS_AND_REVIEWS is visible
		Then Item Page: Section ALERT_MESSAGE_BOX is visible
		And Item Page: Section ALERT_MESSAGE_BOX contains text ratingsReviews.loggedInUser.label.isThisYourAccount
		And Item Page: In section ALERT_MESSAGE_BOX element LOG_OUT_LINK is visible
		And Item Page: PRODUCT_REVIEWS_DISCLAIMER is visible
		And Item Page: ITEM_PAGE_FOOTER is visible
		
		#3. Consulting & support section testing2
		When Item Page: Scroll to CONSULTING_AND_SUPPORT
		Then General: Wait 5 seconds
		
		When Item Page: Section CONSULTING_AND_SUPPORT is visible
		Then Item Page: In section CONSULTING_AND_SUPPORT element REQUEST_LIVE_DEMO_BUTTON is visible
		And Item Page: In section CONSULTING_AND_SUPPORT click REQUEST_LIVE_DEMO_BUTTON
		And Item Page: Section REQUEST_LIVE_DEMO_OVERLAY is visible
		And Item Page: Click CLOSE_POPUP_BUTTON
		And General: Wait 1 second

		#Request call back covered in: HOL-20313
		When Item Page: Click CLOSE_SIDE_BAR_BUTTON
		And Item Page: Scroll to RATINGS_AND_REVIEWS
		And General: Wait 2 seconds
		
		#3. Side bar controller and cart bar wrapper testing
		When Item Page: Section SIDE_BAR_CONTROLLER is visible
		Then Item Page: In section SIDE_BAR_CONTROLLER element EXPAND_BAR_MENU_BUTTON is visible
		And General: Wait 1 second
		And Item Page: Section CART_BAR_WRAPPER is visible
		And Item Page: CART_BAR_PRODUCT_NAME is visible
		And Item Page: CART_BAR_PRODUCT_PRICE is visible
		And Item Page: CART_BAR_CART_WIDGET is visible
		
		#3. Upper section - not logged in for software
		When Webshop Main Page: In section HEADER click OPEN_DASHBOARD_BUTTON
		Then Webshop Main Page: Click LOG_OUT_BUTTON
		And General: Wait 2 seconds
		And Webshop Main Page: In section HEADER click SHOPPING_CART_BUTTON
		And General: Wait 1 second
		Then Cart Page: Section QUICK_ITEM_ENTRY is visible
	 	And Cart Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <item_number_valid>
	 	And Cart Page: Click ADD_TO_CART_BUTTON
	 	And Webshop Main Page: The SHOPPING_CART contains <summed_up_quantity> items
		And Cart Page: In SOFTWARE_PRODUCTS_TABLE_CONTENT in row 1 remember value of TABLE_TOTAL_PRICE_COLUMN as SOFTWARE_PRICE2
		And Cart Page: In section SOFTWARE_PRODUCTS_TABLE_CONTENT move cursor to element TABLE_DESCRIPTION_COLUMN 
		And Cart Page: In section SOFTWARE_PRODUCTS_TABLE_CONTENT click TABLE_SEE_PRODUCT_DETAILS_LINK
		And General: Wait 1 second
		And Item Page: PRODUCT_HEADER is visible
		And Item Page: Section BASIC_INFORMATION contains remembered value SOFTWARE_PRICE2
		And Item Page: In section BASIC_INFORMATION in field ITEM_PIECES_TEXTFIELD type in 2
		And Item Page: In section PRODUCT_VARIANTS_AND_CART_WIDGET element ADD_TO_CART_BUTTON is visible
		And Item Page: In section PRODUCT_VARIANTS_AND_CART_WIDGET click ADD_TO_CART_BUTTON
		And General: Wait 2 seconds
		And Webshop Main Page: The SHOPPING_CART contains <summed_up_quantity2> items
		And Item Page: CART_ADDITION_POPUP is visible
	 
	Examples:
      |	email_address			|	password			|	user_name		|	account_number	|	item_number_valid		|	summed_up_quantity	|	summed_up_quantity2	|
      |	US_user2_email			|	US_user2_password	|	US_user2_name	|	US_user2_id		|	US_software_product1	|	1					|	3					|