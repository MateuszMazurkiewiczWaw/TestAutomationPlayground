@Sprint5
Feature: HOL-22914 Show product suggestions when entering the search phrase

  Scenario Outline: Product search field suggestions functionality
		
		#Enter the page
		Given General: open webshop for United States
		And Webshop Main Page: If section I_UNDERSTAND_COOKIES is visible click I_UNDERSTAND_BUTTON
		And Webshop Main Page: If section ONE_MORE_THING_BANNER is visible click DO_NOT_ASK_AGAIN_BUTTON
		And Webshop Main Page: If section DO_YOU_NEED_HELP is visible click DONT_ASK_ME_AGAIN_BUTTON
	    
	    #Testing case with no products found
	    When Webshop Main Page: In section HEADER element PRODUCT_SEARCH_TEXTFIELD is visible
	    Then Webshop Main Page: In section HEADER in field PRODUCT_SEARCH_TEXTFIELD type in <invalid_product_search_example>
	    And Webshop Main Page: In section SUGGESTED_PRODUCTS_LIST there is exactly 0 PRODUCT_LIST_SUGGESTION elements
	    And General: Wait 1 second
	    And Webshop Main Page: NO_PRODUCT_FOUND_NOTIFICATION is visible
	    
	    #Inputing data into search field in order to test search results
	    When Webshop Main Page: In section HEADER element PRODUCT_SEARCH_TEXTFIELD is visible
	    Then Webshop Main Page: In section HEADER in field PRODUCT_SEARCH_TEXTFIELD type in <valid_product_search_example>
	    And Webshop Main Page: SUGGESTED_PRODUCTS_LIST is visible
	    
	    #Counting the elements in the list
	    And General: Wait 1 second
	    When Webshop Main Page: In section SUGGESTED_PRODUCTS_LIST there is at least 1 PRODUCT_LIST_SUGGESTION elements
	    Then Webshop Main Page: In section SUGGESTED_PRODUCTS_LIST there is at most 5 PRODUCT_LIST_SUGGESTION elements
	    
	    #Checking the links in search results
	  	When Webshop Main Page: In SUGGESTED_PRODUCTS_LIST remember value of PRODUCT_LIST_SUGGESTION in position 1 as PRODUCT_NAME1
	    Then Webshop Main Page: In section SUGGESTED_PRODUCTS_LIST click element PRODUCT_LIST_SUGGESTION in position 1
	    And General: Wait 1 second
	    And Range Page: Section PRODUCT_HEADER is visible
		And Range Page: Section PRODUCT_HEADER contains remembered value PRODUCT_NAME1
		And General: Go back
		
		When Webshop Main Page: In section HEADER in field PRODUCT_SEARCH_TEXTFIELD type in <valid_product_search_example>
		Then General: Wait 1 second
		And Webshop Main Page: In SUGGESTED_PRODUCTS_LIST remember value of PRODUCT_LIST_SUGGESTION in position 2 as PRODUCT_NAME2
	    And Webshop Main Page: In section SUGGESTED_PRODUCTS_LIST click element PRODUCT_LIST_SUGGESTION in position 2
	    And General: Wait 1 second
	    And Range Page: Section PRODUCT_HEADER is visible
		And Range Page: Section PRODUCT_HEADER contains remembered value PRODUCT_NAME2
		And General: Go back
		
		When Webshop Main Page: In section HEADER in field PRODUCT_SEARCH_TEXTFIELD type in <valid_product_search_example>
	    Then General: Wait 1 second
	    And Webshop Main Page: In SUGGESTED_PRODUCTS_LIST remember value of PRODUCT_LIST_SUGGESTION in position 3 as PRODUCT_NAME3
	    And Webshop Main Page: In section SUGGESTED_PRODUCTS_LIST click element PRODUCT_LIST_SUGGESTION in position 3
	    And General: Wait 1 second
	    And Range Page: Section PRODUCT_HEADER is visible
		And Range Page: Section PRODUCT_HEADER contains remembered value PRODUCT_NAME3
		And General: Go back
	    
		#Testing the Show All Results button
		When Webshop Main Page: In section HEADER in field PRODUCT_SEARCH_TEXTFIELD type in <valid_product_search_example>
		And General: Wait 1 second
		Then Webshop Main Page: SHOW_ALL_RESULTS_BUTTON is visible
		And Webshop Main Page: Click SHOW_ALL_RESULTS_BUTTON
		And General: Wait 1 second
		And Search Results Page: SEARCH_RESULTS_LIST is visible
		
	Examples:
      |	valid_product_search_example	|	invalid_product_search_example	|	item_name1	|	item_type1				|	item_name2	|	item_type2	|	item_name3	|	item_type3		|
      |	b2								|	gh								|	HS			|	Installation channel	|	X-ENP MXR	|	Nail		|	MQK-41 D-R	|	Double bracket	|