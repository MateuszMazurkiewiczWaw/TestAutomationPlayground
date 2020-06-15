@Sprint5
Feature: HOL-20441 and HOL-20449 Ratings & Reviews - Range page 

  Scenario Outline: Ratings & Reviews Range page - not logged user
  
		# Enter the page
		Given General: open webshop for United States
		And Webshop Main Page: If section I_UNDERSTAND_COOKIES is visible click I_UNDERSTAND_BUTTON
		And Webshop Main Page: If section ONE_MORE_THING_BANNER is visible click DO_NOT_ASK_AGAIN_BUTTON
		#And General: Wait 5 seconds
	    And Webshop Main Page: If section DO_YOU_NEED_HELP is visible click DONT_ASK_ME_AGAIN_BUTTON
	    
	    # Enter range page
	    When General: open <range_page_id> range page
	    And Range Page: Click RATINGS_AND_REVIEWS_LINK
	    And General: Wait 5 seconds
	    Then Range Page: STARS_RATING_TABLE is visible
	    
	    # Read More link
	    When Range Page: Click READ_MORE_LINK
	    And General: Wait 3 seconds
	    Then Range Page: STARS_RATING_TABLE is not visible
	    And Range Page: SINGLE_REVIEW_BACK_LINK is visible
	    
	    # Show all reviews button
	    When Range Page: Click SHOW_ALL_REVIEWS_BUTTON
	    And General: Wait 3 seconds
	    Then Range Page: STARS_RATING_TABLE is visible
	    
	    # Verify proper display reviews with certain rating
	    When Range Page: Remember value of TWO_STARS_REVIEWS_DISPLAYED_COUNT as NUMBER_OF_TWO_STARS_REVIEWS
	    When Range Page: Click TWO_STARS_REVIEWS_LINK
	    And General: Wait 3 seconds
	    Then Range Page: In section REVIEW_LIST there is exactly NUMBER_OF_TWO_STARS_REVIEWS REVIEW elements
	    
	    # Verify Register button
	    When Range Page: Click WRITE_REVIEW
	    Then Webshop Main Page: Section LOG_IN_OR_REGISTER is visible
	    
	    # Fill out login
	    When Webshop Main Page: Section LOG_IN_OR_REGISTER contains text common.login.label.header
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER element LOG_IN_BUTTON is enabled
	    Then Webshop Main Page: In section LOG_IN_OR_REGISTER in field EMAIL_ADDRESS_TEXTFIELD type in <email_address>
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER in field PASSWORD_TEXTFIELD type in <password>
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER element LOG_IN_BUTTON is enabled
	    When Webshop Main Page: In section LOG_IN_OR_REGISTER click LOG_IN_BUTTON
	    Then Webshop Main Page: Section HEADER contains text <user_name>
	    
	    And Range Page: Section PLEASE_LOGIN_OR_REGISTER is not visible
	    And Range Page: ADD_REVIEW_TITLE is visible
	    And Range Page: ADD_REVIEW_MESSAGE is visible
	    And Range Page: ADD_REVIEW_ALIAS is visible
	    And Range Page: Element ADD_REVIEW_BUTTON is enabled
	    

	 Examples:
      | 	email_address		|	password			|	user_name		|	range_page_id	|
      |		US_user_email		|	US_user_password	|	US_user_name	|	r0057			|
      
      
      
  Scenario Outline: Ratings & Reviews Range page - not logged user and no reviews
  
		# Enter the page
		Given General: open webshop for United States
		And Webshop Main Page: If section I_UNDERSTAND_COOKIES is visible click I_UNDERSTAND_BUTTON
		And Webshop Main Page: If section ONE_MORE_THING_BANNER is visible click DO_NOT_ASK_AGAIN_BUTTON
		#And General: Wait 5 seconds
	    And Webshop Main Page: If section DO_YOU_NEED_HELP is visible click DONT_ASK_ME_AGAIN_BUTTON
	    
	    # Enter range page
	    When General: open <range_page_id> range page
	    
	    # first review
	    When Range Page: Click BE_THE_FIRST_TO_WRITE_REVIEW
	    And General: Wait 5 seconds
	    Then Range Page: STARS_RATING_TABLE is not visible
	    And Range Page: REVIEW_LIST is not visible
	    
	    # Verify Register button
	    When Range Page: Click WRITE_REVIEW
	    Then Webshop Main Page: Section LOG_IN_OR_REGISTER is visible
	    
	    #1-Fill out login
	    When Webshop Main Page: Section LOG_IN_OR_REGISTER contains text common.login.label.header
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER element LOG_IN_BUTTON is enabled
	    Then Webshop Main Page: In section LOG_IN_OR_REGISTER in field EMAIL_ADDRESS_TEXTFIELD type in <email_address>
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER in field PASSWORD_TEXTFIELD type in <password>
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER element LOG_IN_BUTTON is enabled
	    When Webshop Main Page: In section LOG_IN_OR_REGISTER click LOG_IN_BUTTON
	    Then Webshop Main Page: Section HEADER contains text <user_name>
	    
	    And Range Page: Section PLEASE_LOGIN_OR_REGISTER is not visible
	    And Range Page: ADD_REVIEW_TITLE is visible
	    And Range Page: ADD_REVIEW_MESSAGE is visible
	    And Range Page: ADD_REVIEW_ALIAS is visible
	    And Range Page: Element ADD_REVIEW_BUTTON is enabled
	    

	 Examples:
      | 	email_address		|	password			|	user_name		|	range_page_id	|
      |		US_user_email		|	US_user_password	|	US_user_name	|	r0052			|