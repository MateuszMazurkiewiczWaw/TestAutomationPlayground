@Sprint3
Feature: HOL-19879 Store locator

  Scenario: Using Store Locator - my location and center search
		#Enter the page
		Given General: open webshop for United States
		And Webshop Main Page: If section I_UNDERSTAND_COOKIES is visible click I_UNDERSTAND_BUTTON
		And Webshop Main Page: If section ONE_MORE_THING_BANNER is visible click DO_NOT_ASK_AGAIN_BUTTON
	    And Webshop Main Page: If section DO_YOU_NEED_HELP is visible click DONT_ASK_ME_AGAIN_BUTTON
	    
	    #Navigate to Find hybris Center Page
	    And General: Scroll to the bottom
	    And General: Wait 1 second
		When Webshop Main Page: In section FOOTER_TOP click FIND_hybris_STORE_BUTTON
		
		#check Use My Location Button
		And Find hybris Center Page: Remember value of FIND_hybris_CENTER_INPUT as INITIAL_SEARCH_WINDOW_TEXT
		And Find hybris Center Page: Click USE_MY_LOCATION_BUTTON
		Then Find hybris Center Page: Remember value of FIND_hybris_CENTER_INPUT as SEARCH_WINDOW_TEXT_AFTER_ACTION
		And Find hybris Center Page: Remembered values INITIAL_SEARCH_WINDOW_TEXT and SEARCH_WINDOW_TEXT_AFTER_ACTION are not equal
		
		#List of stores is displayed on the map area
		And Find hybris Center Page: MAP_WRAPPER contains more than 0 SUGGESTED_hybris_CENTERS
		
		#Go to selected store details
		When Find hybris Center Page: In section MAP_WRAPPER click SUGGESTED_hybris_CENTERS
		Then hybris Center Details Page: Remember value of hybris_CENTER_NAME as FIRST_SELECTED_hybris_CENTER_NAME
		And hybris Center Details Page: In section hybris_CENTER_DETAILS element hybris_CENTER_EMAIL is visible
		And hybris Center Details Page: In section hybris_CENTER_DETAILS element hybris_CENTER_PHONE is visible
		
		#Go to nearby center
		When hybris Center Details Page: In section NEARBY_hybris_CENTERS click NEARBY_CENTER_LINK
		Then hybris Center Details Page: Remember value of hybris_CENTER_NAME as SELECTED_NEARBY_hybris_CENTER_NAME
		And hybris Center Details Page: Remembered values FIRST_SELECTED_hybris_CENTER_NAME and SELECTED_NEARBY_hybris_CENTER_NAME are not equal
		
		#Restart search  
		When hybris Center Details Page: Click GO_TO_hybris_CENTER_SEARCH
		Then Find hybris Center Page: FIND_hybris_CENTER_INPUT is visible
