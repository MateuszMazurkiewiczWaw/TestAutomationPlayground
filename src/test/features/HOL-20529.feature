@Sprint2
Feature: HOL-20529 Cart Empty
  Scenario Outline: Empty Cart functionalities
		#Enter the page
		Given General: open webshop for United States
		And Webshop Main Page: If section I_UNDERSTAND_COOKIES is visible click I_UNDERSTAND_BUTTON
		And Webshop Main Page: If section ONE_MORE_THING_BANNER is visible click DO_NOT_ASK_AGAIN_BUTTON
	    And Webshop Main Page: If section DO_YOU_NEED_HELP is visible click DONT_ASK_ME_AGAIN_BUTTON
	    
	    #Checking the content of upper section
	 	When Webshop Main Page: In section HEADER click SHOPPING_CART_BUTTON
	 	Then Cart Page: In section SHOPPING_CART_HEADER element VISIT_FAVORITES_LISTS_LINK is not visible
	 	And Cart Page: Section YOUR_SHOPPING_CART_EMPTY contains text cart.empty.label.headline
	 	And Cart Page: Section SEARCHING_ITEM_BAR is visible
	 	And Cart Page: Section SEARCHING_ITEM_BAR contains text cart.empty.title.search
	 	And Cart Page: In section SEARCHING_ITEM_BAR in field SEARCH_FOR_PRODUCT_TEXTFIELD type in <item_number_valid>
	 	#TO-DO: Item searching verification along with info display about added items
	 	
	 	#Checking the content of lower section
	 	When Cart Page: Section BOTTOM_LOG_IN_REGISTER is visible
	 	Then Cart Page: In section BOTTOM_LOG_IN_REGISTER element LOG_IN_HERE_LINK is visible
	 	And Cart Page: Section BOTTOM_LOG_IN_REGISTER contains text cart.register.label.headline
	 	And Cart Page: Section BOTTOM_LOG_IN_REGISTER contains text cart.register.label.benefits
	 	And Cart Page: Section BOTTOM_LOG_IN_REGISTER contains text cart.register.label.createAccount
	 	And Cart Page: In section BOTTOM_LOG_IN_REGISTER element SAVE_MONEY_SHIPPING_LINK is visible
	 	And Cart Page: In section BOTTOM_LOG_IN_REGISTER element CHECK_STOCK_LINK is visible
	 	And Cart Page: In section BOTTOM_LOG_IN_REGISTER element VIEW_YOUR_ACCOUNT_HISTORY_LINK is visible
	 	And Cart Page: In section BOTTOM_LOG_IN_REGISTER element MANAGE_hybris_TOOLS_LINK is visible
	 	And Cart Page: In section BOTTOM_LOG_IN_REGISTER element QUICK_REORDER_LINK is visible
	 	And Cart Page: In section BOTTOM_LOG_IN_REGISTER element REGISTER_HERE_LINK is visible
	 	And Cart Page: Section LEARN_MORE is visible
	 	
	 	#Not an object of translation. Not crucial to check this.
	 	#And Cart Page: Section LEARN_MORE contains text New products & Innovations
	 	
	 	And Cart Page: Section BANNER_CONTAINERS_SHOPPING_CART is visible
	 	And Cart Page: In section BANNER_CONTAINERS_SHOPPING_CART element INNOVATION_MAGAZINE_MARKETING_BANNER is visible
	 	And Cart Page: In section BANNER_CONTAINERS_SHOPPING_CART element NEW_PRODUCTS_MARKETING_BANNER is visible
	 	
	 	#Checking Register Here link
	 	When Cart Page: Click REGISTER_HERE_LINK
	 	Then Webshop Registration Page: Section REGISTRATION_FORM is visible
	 	And Webshop Main Page: In section HEADER click SHOPPING_CART_BUTTON
	 	And Cart Page: Section BOTTOM_LOG_IN_REGISTER is visible
	 	
	 	#Checking Log In Here link
	 	When Cart Page: Click LOG_IN_HERE_LINK
	 	Then Webshop Main Page: Section LOG_IN_OR_REGISTER is visible
	 	And Webshop Main Page: Section LOG_IN_OR_REGISTER contains text common.login.label.header
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER element LOG_IN_BUTTON is enabled
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER in field EMAIL_ADDRESS_TEXTFIELD type in <email_address>
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER in field PASSWORD_TEXTFIELD type in <password>
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER element LOG_IN_BUTTON is enabled
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER click LOG_IN_BUTTON
	    And Webshop Main Page: Section HEADER contains text <user_name>
	    And Webshop Main Page: Section HEADER contains text <account_number>
	    And General: Wait 2 second
	    Then Cart Page: Section BOTTOM_LOG_IN_REGISTER is not visible
	    And Cart Page: Section LEARN_MORE_SHOPPING_CART is not visible
	    
		
		
	Examples:
      |	item_number_valid		|	email_address		|	password				|	account_number		|	user_name		|
      |	US_standard_product1	|	US_user_email		|	US_user_password		|	US_user_id			|	US_user_name	|