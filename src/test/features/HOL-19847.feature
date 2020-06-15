@Sprint2 
Feature: HOL-19847 Product Recommendations

  Scenario Outline: Recommended products - positive
		#Enter the page
		Given General: open webshop for Germany
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

		#2.Check is there recommended products section visible along with products
		Then Webshop Main Page: contains text home.productrecommendations.label.title
		And Webshop Main Page: Section RECOMMENDED_PRODUCTS is visible
		And Webshop Main Page: In section RECOMMENDED_PRODUCTS there are at most 4 SLICK_BOX elements
		And Webshop Main Page: In section RECOMMENDED_PRODUCTS element SLIDER_DOTS is not visible
		
		#3.Check if SLIDER BOXES are visible
		When General: Set browser window dimension to 400x850
		And General: Wait 1 second
		Then Webshop Main Page: In section RECOMMENDED_PRODUCTS there is at most 1 SLICK_BOX element
		And Webshop Main Page: In section RECOMMENDED_PRODUCTS element SLIDER_DOTS is visible

		
		Examples:
      |	email_address	|	password			|	user_name		|	user_id		|
      |	DE_user_email	|	DE_user_password	|	DE_user_name	|	DE_user_id	|    

	Scenario Outline: Recommended products - negative
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

		#2.Check is there recommended products section not visible
		Then Webshop Main Page: not contains text home.productrecommendations.label.title
		And Webshop Main Page: Section RECOMMENDED_PRODUCTS is not visible

		
		Examples:
      |	email_address	|	password			|	user_name		|	user_id		|
      |	US_user_email	|	US_user_password	|	US_user_name	|	US_user_id	|    