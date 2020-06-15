@Sprint5
Feature: HOL-20305 Range Page Standard and Fleet item

  Scenario Outline: Full content and functionalities of Range Page - Fleet items
		
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
		Then Cart Page: In section FLEET_PRODUCTS_TABLE_CONTENT move cursor to element TABLE_DESCRIPTION_COLUMN
		And Cart Page: In section FLEET_PRODUCTS_TABLE_CONTENT click TABLE_SEE_PRODUCT_DETAILS_LINK
		And General: Wait 1 second
		
		#1. Bread crumbs testing
		 #1st position - Home Page
		 #2nd position - Product Category 1st level
		 #3rd position - Product Category 2nd level
		 #4th position - Product Category 3rd level
		 #5th position - Grid Page
		 #6th position - Range Page
		 #Additional INACTIVE 7th position - Item Page

		And Item Page: Section BREADCRUMB_LIST is visible
		And Item Page: In section BREADCRUMB_LIST there is exactly 3 BREADCRUMB_LIST_POSITION elements
		And Item Page: In section BREADCRUMB_LIST click element BREADCRUMB_LIST_POSITION in position 3
		And General: Wait 2 seconds
		
		And Range Page: Section BREADCRUMB_LIST is visible
		And Range Page: In section BREADCRUMB_LIST there is exactly 2 BREADCRUMB_LIST_POSITION elements
		
		When General: Wait 2 seconds
		Then Range Page: PRODUCT_HEADER is visible
		And Range Page: In section PRODUCT_HEADER element RATINGS_LINK is visible
		And Range Page: SOCIAL_MEDIA_WIDGET is visible
		
		#Below line disabled. It's not 100% sure that item won't have any review
		#And Range Page: In section PRODUCT_HEADER element RATINGS_LINK contains text range.label.ratingsAndReviewLinkNoReviews
		
		
		#1. Product variants section testing
		When Range Page: ITEM_IMAGE is visible
		And Range Page: Section PRODUCT_VARIANTS_AND_CART_WIDGET is visible
		And Range Page: In section PRODUCT_VARIANTS_AND_CART_WIDGET element BUY_RADIOBUTTON is visible
		And Range Page: In section PRODUCT_VARIANTS_AND_CART_WIDGET click BUY_RADIOBUTTON
		And Range Page: In section PRODUCT_VARIANTS_AND_CART_WIDGET element FLEET_CONTRACT_WARNING is visible
		And Range Page: In section PRODUCT_VARIANTS_AND_CART_WIDGET element FLEET_CONTRACT_LINK is visible
		And Range Page: In section PRODUCT_VARIANTS_AND_CART_WIDGET element FLEET_RADIOBUTTON is visible
		And Range Page: In section PRODUCT_VARIANTS_AND_CART_WIDGET click FLEET_RADIOBUTTON
		And Range Page: In section PRODUCT_VARIANTS_AND_CART_WIDGET element ITEM_PIECES_TEXTFIELD is visible
		And Range Page: CHECK_AVAILABILITY_LINK is visible
		And Range Page: Click CHECK_AVAILABILITY_LINK
		And Range Page: Section CHECK_AVAILABILITY_POPUP is visible
		And Range Page: Click CLOSE_POPUP_BUTTON
		And General: Wait 1 second
		And Range Page: ADD_TO_FAVORITES_LINK is visible
		And Range Page: Click ADD_TO_FAVORITES_LINK
		And Range Page: Section ADD_TO_FAVORITES_POPUP is visible
		And Range Page: In section ADD_TO_FAVORITES_POPUP click element FAVORITE_LIST_FIRST_POSITION in position 1
		And General: Wait 1 second
		And Range Page: FAVORITE_LIST_ADDITION is visible
		And Range Page: Click CLOSE_FAVORITE_LIST_POPUP_BUTTON
		And General: Wait 1 second
		And Range Page: Click ADD_TO_FAVORITES_LINK
		And Range Page: Section ADD_TO_FAVORITES_POPUP is visible
		And Range Page: Click CREATE_NEW_LIST_BUTTON
		And General: Wait 1 second
		And Range Page: In element CREATE_NEW_LIST_TEXTFIELD type in 6 random characters
		And General: Wait 1 second
		And Range Page: Click SUBMIT_CREATE_NEW_LIST_BUTTON
		And General: Wait 1 second
		And Range Page: FAVORITE_LIST_ADDITION is visible
		And Range Page: Click CLOSE_FAVORITE_LIST_POPUP_BUTTON
		And General: Wait 1 second
		#TODO: Favorites list checking
		And Range Page: ZOOM_IN_BUTTON is visible
		And Range Page: Section KEY_TECHNICAL_DATA is visible
		And Range Page: MORE_TECHNICAL_DATA_LINK is visible
		And Range Page: In section PRODUCT_VARIANTS_AND_CART_WIDGET element MORE_DETAILS_PRODUCT_LINK is visible
		And Range Page: Section PRODUCT_VARIANTS_AND_CART_WIDGET contains remembered value FLEET_PRICE1
		And Range Page: Open MORE_DETAILS_PRODUCT_LINK in new tab
		And General: Switch to tab number 2
		And Item Page: PRODUCT_HEADER is visible
		And General: Discard last tab
		And General: Wait 1 second
		
		#1. Features and applications section testing
		When General: Go back
		And General: Wait 2 seconds
		Then Range Page: Scroll to FEATURES_AND_APPLICATIONS
		And General: Wait 2 seconds
		And Range Page: Section FEATURES_AND_APPLICATIONS is visible
		And Range Page: In section FEATURES_AND_APPLICATIONS element FEATURES_COLUMN is visible
		And Range Page: In section FEATURES_AND_APPLICATIONS element APPLICATIONS_COLUMN is visible
		
		#1. Related products section and technical data table testing
		When Range Page: Click EXPAND_BAR_MENU_BUTTON
		Then Range Page: Click RELATED_PRODUCTS_LINK
		And General: Wait 3 seconds
		
		When Range Page: Section RELATED_PRODUCTS is visible
		Then Range Page: In section RELATED_PRODUCTS element ALL_PRODUCTS_RADIOBUTTON is visible
		And Range Page: In section RELATED_PRODUCTS element TOOLS_PRODUCTS_RADIOBUTTON is visible
		And Range Page: In section RELATED_PRODUCTS element CONSUMABLES_PRODUCTS_RADIOBUTTON is visible
		And Range Page: In section RELATED_PRODUCTS element SHOW_ALL_PRODUCTS_BUTTON is visible
		And Range Page: In section RELATED_PRODUCTS click SHOW_ALL_PRODUCTS_BUTTON
		And Range Page: In section RELATED_PRODUCTS element RELATED_PRODUCTS_LIST is visible
		And Range Page: Click TECHNICAL_DATA_LINK
		And General: Wait 3 seconds
		And Range Page: Section TECHNICAL_DATA_TABLE is visible
		
		#1. Documents section testing
		And Range Page: Scroll to ITEM_IMAGE
		When Range Page: Click DOCUMENTS_AND_VIDEOS_LINK
		Then General: Wait 3 seconds
		
		When Range Page: Section DOCUMENTS is visible
		Then Range Page: In section DOCUMENTS element APPROVAL_DOCUMENT_BUTTON is visible
		And Range Page: In section DOCUMENTS click APPROVAL_DOCUMENT_BUTTON
		And Range Page: APPROVAL_DOCUMENT_PDF_LINK is visible
		
		#1. Consulting & support section testing
		When Range Page: Scroll to CONSULTING_AND_SUPPORT_PLACEHOLDER
		Then General: Wait 3 second
		
		When Range Page: Section CONSULTING_AND_SUPPORT is visible
		Then Range Page: In section CONSULTING_AND_SUPPORT element REQUEST_LIVE_DEMO_BUTTON is visible
		And Range Page: In section CONSULTING_AND_SUPPORT element START_LIVE_CHAT_BUTTON is visible
		And Range Page: In section CONSULTING_AND_SUPPORT element REQUEST_CALLBACK_BUTTON is visible
		
		#1. Ratings & reviews section testing
		When Range Page: Scroll to RATINGS_AND_REVIEWS_PLACEHOLDER
		Then General: Wait 3 second
		
		When Range Page: Section RATINGS_AND_REVIEWS is visible
		Then Range Page: Section ALERT_MESSAGE_BOX is visible
		And Range Page: Section ALERT_MESSAGE_BOX contains text ratingsReviews.loggedInUser.label.isThisYourAccount
		And Range Page: In section ALERT_MESSAGE_BOX element LOG_OUT_LINK is visible
		And Range Page: PRODUCT_REVIEWS_DISCLAIMER is visible
		And Range Page: ITEM_PAGE_FOOTER is visible
		And Range Page: Scroll to FEATURES_AND_APPLICATIONS

		#1. Consulting & support section testing2
		When Range Page: Scroll to CONSULTING_AND_SUPPORT
		Then General: Wait 3 second
		
		When Range Page: Section CONSULTING_AND_SUPPORT is visible
		Then Range Page: In section CONSULTING_AND_SUPPORT element REQUEST_LIVE_DEMO_BUTTON is visible
		And Range Page: In section CONSULTING_AND_SUPPORT click REQUEST_LIVE_DEMO_BUTTON
		And Range Page: Section REQUEST_LIVE_DEMO_OVERLAY is visible
		And Range Page: Click CLOSE_POPUP_BUTTON
		And General: Wait 1 second
		And Range Page: In section CONSULTING_AND_SUPPORT element REQUEST_CALLBACK_BUTTON is visible
		
		#Request call back covered in: HOL-20313
		
		#1. Side bar controller and cart bar wrapper testing
		When Item Page: Click CLOSE_SIDE_BAR_BUTTON
		And Item Page: Scroll to FEATURES_AND_APPLICATIONS
		
		When Range Page: Section SIDE_BAR_CONTROLLER is visible
		Then Range Page: In section SIDE_BAR_CONTROLLER element EXPAND_BAR_MENU_BUTTON is visible
		And Range Page: In section SIDE_BAR_CONTROLLER element DOWN_ARROW_BAR_MENU_BUTTON is visible
		And Range Page: In section SIDE_BAR_CONTROLLER element UP_ARROW_BAR_MENU_BUTTON is visible
		And Range Page: In section SIDE_BAR_CONTROLLER click EXPAND_BAR_MENU_BUTTON
		And General: Wait 1 second
		And Range Page: Section SIDE_BAR_MENU is visible
		And Range Page: BASIC_INFORMATION_LINK is visible
		And Range Page: FEATURES_AND_APPLICATIONS_LINK is visible
		And Range Page: RELATED_PRODUCTS_LINK is visible
		And Range Page: TECHNICAL_DATA_LINK is visible
		And Range Page: PRODUCT_VARIANTS_AND_SETS_LINK is visible
		And Range Page: CONSULTING_AND_SUPPORT_LINK is visible
		And Range Page: RATINGS_AND_REVIEWS_LINK is visible
		And Range Page: DOCUMENTS_AND_VIDEOS_LINK is visible
		And Range Page: Click CLOSE_SIDE_BAR_BUTTON
		
		#1. Upper section - not logged in for fleet
		When Webshop Main Page: In section HEADER click OPEN_DASHBOARD_BUTTON
		Then Webshop Main Page: Click LOG_OUT_BUTTON
		And General: Wait 2 seconds
		And Webshop Main Page: In section HEADER click SHOPPING_CART_BUTTON
		And General: Wait 1 second
		Then Cart Page: Section QUICK_ITEM_ENTRY is visible
	 	And Cart Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <item_number_valid>
	 	And Cart Page: Click ADD_TO_CART_BUTTON
	 	And Webshop Main Page: The SHOPPING_CART contains 1 items
		And Cart Page: In STANDARD_PRODUCTS_TABLE_CONTENT in row 1 remember value of TABLE_TOTAL_PRICE_COLUMN as FLEET_PRICE2
		And Cart Page: In section STANDARD_PRODUCTS_TABLE_CONTENT move cursor to element TABLE_DESCRIPTION_COLUMN 
		And Cart Page: In section STANDARD_PRODUCTS_TABLE_CONTENT click TABLE_SEE_PRODUCT_DETAILS_LINK
		And General: Wait 1 second
		And Item Page: Section BREADCRUMB_LIST is visible
		And Item Page: In section BREADCRUMB_LIST there is exactly 6 BREADCRUMB_LIST_POSITION elements
		And Item Page: In section BREADCRUMB_LIST click element BREADCRUMB_LIST_POSITION in position 6
		And General: Wait 2 seconds
		And Range Page: PRODUCT_HEADER is visible
		And Range Page: Section PRODUCT_VARIANTS_AND_CART_WIDGET contains remembered value FLEET_PRICE2
		And Range Page: In section BASIC_INFORMATION in field ITEM_PIECES_TEXTFIELD type in 2
		And Range Page: In section PRODUCT_VARIANTS_AND_CART_WIDGET element ADD_TO_CART_BUTTON is visible
		And Range Page: In section PRODUCT_VARIANTS_AND_CART_WIDGET click ADD_TO_CART_BUTTON
		And General: Wait 2 seconds
		And Webshop Main Page: The SHOPPING_CART contains 3 items
		And Range Page: CART_ADDITION_POPUP is visible
	 
	Examples:
      |	email_address			|	password			|	user_name		|	account_number	|	item_number_valid	|	summed_up_quantity	|
	  |	US_fleet_email			|	US_fleet_password	|	US_fleet_name	|	US_fleet_id		|	US_fleet_product1	|	1					|
        
  Scenario Outline: Full content and functionalities of Range Page - Standard items
		
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
		Then Cart Page: In section STANDARD_PRODUCTS_TABLE_CONTENT move cursor to element TABLE_DESCRIPTION_COLUMN 
		And Cart Page: In section STANDARD_PRODUCTS_TABLE_CONTENT click TABLE_SEE_PRODUCT_DETAILS_LINK
		And General: Wait 2 seconds
		
		#1. Bread crumbs testing
		 #1st position - Home Page
		 #2nd position - Product Category 1st level
		 #3rd position - Product Category 2nd level
		 #4th position - Product Category 3rd level
		 #5th position - Range Page
		 #Additional INACTIVE 6th position - Item Page

		And Item Page: Section BREADCRUMB_LIST is visible
		And Item Page: In section BREADCRUMB_LIST there is exactly 5 BREADCRUMB_LIST_POSITION elements
		And Item Page: In section BREADCRUMB_LIST click element BREADCRUMB_LIST_POSITION in position 5
		And General: Wait 2 seconds
		
		And Range Page: Section BREADCRUMB_LIST is visible
		And Range Page: In section BREADCRUMB_LIST there is exactly 4 BREADCRUMB_LIST_POSITION elements
		
		#2. Upper section testing
		When Range Page: ITEM_IMAGE is visible
		And Range Page: ZOOM_IN_BUTTON is visible
		And Range Page: SOCIAL_MEDIA_WIDGET is visible
#		And Range Page: MORE_TECHNICAL_DATA_LINK is visible
		
		#2. Product variants section testing
		When Range Page: Section PRODUCT_VARIANTS_AND_SETS is visible
#		Then Range Page: In section PRODUCT_VARIANTS_AND_SETS element PRODUCT_VARIANTS_FILTER_DROPDOWN_BUTTON is visible
#		And Range Page: In section PRODUCT_VARIANTS_AND_SETS click PRODUCT_VARIANTS_FILTER_DROPDOWN_BUTTON
#		And General: Wait 2 seconds
#		And Range Page: Section EXPANDED_PRODUCT_VARIANTS_FILTER_LIST is visible
#		And Range Page: In section EXPANDED_PRODUCT_VARIANTS_FILTER_LIST click element LIST_OBJECT in position 4
#		And General: Wait 1 second
		And Range Page: In section PRODUCT_VARIANTS_AND_SETS element ITEM_PIECES_TEXTFIELD is visible
		And Range Page: Section PRODUCT_VARIANTS_TABLE is visible
		And Range Page: Section PRODUCT_VARIANTS_TABLE contains remembered value STANDARD_PRICE1
		And Range Page: Open MORE_DETAILS_PRODUCT_LINK in new tab
		And General: Wait 2 seconds
		And General: Switch to tab number 2
		And Item Page: PRODUCT_HEADER is visible
		And General: Discard last tab
		And General: Wait 1 second
		And General: Go back
		And General: Wait 3 seconds
		
		And Range Page: In PRODUCT_VARIANTS_TABLE in row 6 click CHECK_AVAILABILITY_LINK
		And Range Page: Section CHECK_AVAILABILITY_POPUP is visible
		And Range Page: Click CLOSE_POPUP_BUTTON
		And General: Wait 1 second
		And Range Page: In PRODUCT_VARIANTS_TABLE in row 6 click ADD_TO_FAVORITES_LINK
		And Range Page: Section ADD_TO_FAVORITES_POPUP is visible
		And Range Page: Click CREATE_NEW_LIST_BUTTON
		And General: Wait 1 second
		And Range Page: In element CREATE_NEW_LIST_TEXTFIELD type in 6 random characters
		And General: Wait 1 second
		And Range Page: Click SUBMIT_CREATE_NEW_LIST_BUTTON
		And General: Wait 1 second
		And Range Page: FAVORITE_LIST_ADDITION is visible
		And Range Page: Click CLOSE_FAVORITE_LIST_POPUP_BUTTON
		And General: Wait 3 seconds
		And Range Page: In PRODUCT_VARIANTS_TABLE in row 4 click ADD_TO_FAVORITES_LINK
		And Range Page: Section ADD_TO_FAVORITES_POPUP is visible
		And Range Page: In section ADD_TO_FAVORITES_POPUP click element FAVORITE_LIST_FIRST_POSITION in position 1
		And General: Wait 1 second
		And Range Page: FAVORITE_LIST_ADDITION is visible
		And Range Page: Click CLOSE_FAVORITE_LIST_POPUP_BUTTON
		And General: Wait 1 second
		#TODO: Favorites list checking
		
		#2. Features and applications section testing
		When Range Page: Scroll to FEATURES_AND_APPLICATIONS
		Then Range Page: Section FEATURES_AND_APPLICATIONS is visible
		And Range Page: In section FEATURES_AND_APPLICATIONS element FEATURES_COLUMN is visible
		
		#2. Related products section and technical data table testing
		When Range Page: Click EXPAND_BAR_MENU_BUTTON
		Then Range Page: Click RELATED_PRODUCTS_LINK
		And General: Wait 3 seconds
		
		When Range Page: Section RELATED_PRODUCTS is visible
		Then Range Page: In section RELATED_PRODUCTS element ALL_PRODUCTS_RADIOBUTTON is visible
		And Range Page: In section RELATED_PRODUCTS element TOOLS_PRODUCTS_RADIOBUTTON is visible
		And Range Page: In section RELATED_PRODUCTS element INSERTS_PRODUCTS_RADIOBUTTON is visible
		And Range Page: In section RELATED_PRODUCTS element RELATED_PRODUCTS_LIST is visible
#		And Range Page: Click TECHNICAL_DATA_LINK
		And General: Wait 3 seconds
#		And Range Page: Section TECHNICAL_DATA_TABLE is visible
		
		#1. Documents section testing
		When Range Page: Click DOCUMENTS_AND_VIDEOS_LINK
		Then General: Wait 3 seconds
		
		When Range Page: Section DOCUMENTS is visible
		Then Range Page: In section DOCUMENTS element APPROVAL_DOCUMENT_BUTTON is visible
		And Range Page: In section DOCUMENTS click APPROVAL_DOCUMENT_BUTTON
		And Range Page: MATERIAL_DOCUMENT_PDF_LINK is visible
		
		#2. Consulting & support section testing
		When General: Wait 3 seconds
		Then Range Page: Section CONSULTING_AND_SUPPORT is visible
		And Range Page: In section CONSULTING_AND_SUPPORT element REQUEST_LIVE_DEMO_BUTTON is visible
		And Range Page: In section CONSULTING_AND_SUPPORT element START_LIVE_CHAT_BUTTON is visible
		And Range Page: In section CONSULTING_AND_SUPPORT element REQUEST_CALLBACK_BUTTON is visible
		
		#2. Ratings & reviews section testing
		When Range Page: Scroll to RATINGS_AND_REVIEWS_PLACEHOLDER
		Then General: Wait 3 second
		
		When Range Page: Section RATINGS_AND_REVIEWS is visible
		Then Range Page: Section ALERT_MESSAGE_BOX is visible
		And Range Page: Section ALERT_MESSAGE_BOX contains text ratingsReviews.loggedInUser.label.isThisYourAccount
		And Range Page: In section ALERT_MESSAGE_BOX element LOG_OUT_LINK is visible
		And Range Page: PRODUCT_REVIEWS_DISCLAIMER is visible
		And Range Page: ITEM_PAGE_FOOTER is visible
		
		#2. Consulting & support section testing2
		
		When Range Page: Section CONSULTING_AND_SUPPORT is visible
		Then Range Page: In section CONSULTING_AND_SUPPORT element REQUEST_LIVE_DEMO_BUTTON is visible
		And Range Page: In section CONSULTING_AND_SUPPORT click REQUEST_LIVE_DEMO_BUTTON
		And Range Page: Section REQUEST_LIVE_DEMO_OVERLAY is visible
		And Range Page: Click CLOSE_POPUP_BUTTON
		And General: Wait 2 seconds
		
		#Request call back covered in: HOL-20313
		
		#2. Side bar controller and cart bar wrapper testing
		When Item Page: Click CLOSE_SIDE_BAR_BUTTON
		And Item Page: Scroll to FEATURES_AND_APPLICATIONS
		
		When Range Page: Section SIDE_BAR_CONTROLLER is visible
		Then Range Page: In section SIDE_BAR_CONTROLLER element EXPAND_BAR_MENU_BUTTON is visible
		And Range Page: In section SIDE_BAR_CONTROLLER element DOWN_ARROW_BAR_MENU_BUTTON is visible
		And Range Page: In section SIDE_BAR_CONTROLLER click EXPAND_BAR_MENU_BUTTON
		And General: Wait 1 second
		And Range Page: Section SIDE_BAR_MENU is visible
		And Range Page: BASIC_INFORMATION_LINK is visible
		And Range Page: FEATURES_AND_APPLICATIONS_LINK is visible
		And Range Page: PRODUCT_VARIANTS_LINK is visible
		And Range Page: RELATED_PRODUCTS_LINK is visible
#		And Range Page: TECHNICAL_DATA_LINK is visible
		And Range Page: PRODUCT_VARIANTS_AND_SETS_LINK is visible
		And Range Page: DOCUMENTS_AND_VIDEOS_LINK is visible
		And Range Page: CONSULTING_AND_SUPPORT_LINK is visible
		And Range Page: RATINGS_AND_REVIEWS_LINK is visible
		And Range Page: Click CLOSE_SIDE_BAR_BUTTON
		
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
		And Cart Page: In STANDARD_PRODUCTS_TABLE_CONTENT in row 1 remember value of TABLE_TOTAL_PRICE_COLUMN as STANDARD_PRICE2
		And Cart Page: In section STANDARD_PRODUCTS_TABLE_CONTENT move cursor to element TABLE_DESCRIPTION_COLUMN 
		And Cart Page: In section STANDARD_PRODUCTS_TABLE_CONTENT click TABLE_SEE_PRODUCT_DETAILS_LINK
		And General: Wait 1 second
		And Item Page: Section BREADCRUMB_LIST is visible
		And Item Page: In section BREADCRUMB_LIST there is exactly 5 BREADCRUMB_LIST_POSITION elements
		And Item Page: In section BREADCRUMB_LIST click element BREADCRUMB_LIST_POSITION in position 5
		And General: Wait 2 seconds
		And Range Page: PRODUCT_HEADER is visible
		And Range Page: Section PRODUCT_VARIANTS_TABLE contains remembered value STANDARD_PRICE2
		And Range Page: In section PRODUCT_VARIANTS_AND_SETS in field ITEM_PIECES_STANDARD_NOT_LOGGED_IN_TEXTFIELD type in 2
		And Range Page: In section PRODUCT_VARIANTS_TABLE click ADD_TO_CART_STANDARD_NOT_LOGGED_IN_BUTTON
		And General: Wait 2 seconds
		And Webshop Main Page: The SHOPPING_CART contains <summed_up_quantity2> items
		And Range Page: CART_ADDITION_POPUP is visible
	 
	Examples:
      |	email_address			|	password			|	user_name		|	account_number	|	item_number_valid		|	summed_up_quantity	|	summed_up_quantity2	|
      |	US_user2_email			|	US_user2_password	|	US_user2_name	|	US_user2_id		|	US_standard_product1	|	5					|	10					|