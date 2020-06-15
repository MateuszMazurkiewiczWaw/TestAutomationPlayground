@Sprint3
Feature: HOL-22465 Grid Product Filter mechanism

  Scenario Outline: Product Filter - setting and resetting one single-choice filter
        
		#Enter Webshop Main Page and navigate to specific category
        Given General: open webshop for United States
        And Webshop Main Page: If section I_UNDERSTAND_COOKIES is visible click I_UNDERSTAND_BUTTON
        And Webshop Main Page: If section ONE_MORE_THING_BANNER is visible click DO_NOT_ASK_AGAIN_BUTTON
        And Webshop Main Page: If section DO_YOU_NEED_HELP is visible click DONT_ASK_ME_AGAIN_BUTTON
        When Webshop Main Page: In section MENU_BAR element PRODUCTS_BUTTON is visible
        Then Webshop Main Page: In section MENU_BAR click PRODUCTS_BUTTON
        And General: Wait 2 seconds
		And Webshop Main Page: PRODUCT_OR_CATEGORY_LIST contains more than 1 PRODUCT_OR_CATEGORY_NAMES
		When Webshop Main Page: On PRODUCT_OR_CATEGORY_LIST click category <PRODUCT_CATEGORY_1ST_LEVEL>
 		And General: Wait 2 seconds
 		And Webshop Main Page: Section PRODUCT_OR_CATEGORY_LIST_NAVIGATION_BAR contains text <PRODUCT_CATEGORY_1ST_LEVEL>

        Then Webshop Main Page: On PRODUCT_OR_CATEGORY_LIST click category <PRODUCT_CATEGORY_2ND_LEVEL>
        And General: Wait 2 seconds
       	Then Grid Page: Section PAGE_TITLE contains text <PRODUCT_CATEGORY_2ND_LEVEL>
        And Grid Page: Remember value of DISPLAYED_PRODUCTS_COUNTER as NO_FILTER_ELEMENTS_COUNT
        
        #Select filter condition from single-choice filter 
		When Grid Page: Section DEFINE_YOUR_REQUIREMENTS contains element CLASS_FILTERBAR
		Then Grid Page: In section DEFINE_YOUR_REQUIREMENTS click CLASS_FILTERBAR
		And Grid Page: Section CLASS_FILTERBAR contains more than 1 FILTERBAR_RADIOBUTTON
		And Grid Page: In CLASS_FILTERBAR remember value of FILTERBAR_RADIOBUTTON_COUNTER_LABEL in position 2 as EXPECTED_PRODUCT_COUNT		
		When Grid Page: In section CLASS_FILTERBAR click element FILTERBAR_RADIOBUTTON_LABEL in position 2
		And Grid Page: Wait for full PRODUCT_LIST load
		
		#Verify if filter is applied on page
		Then Grid Page: Element DISPLAYED_PRODUCTS_COUNTER contains remembered value EXPECTED_PRODUCT_COUNT
		And Grid Page: In CLASS_FILTERBAR element RESULTS_COUNTER contains remembered value EXPECTED_PRODUCT_COUNT
		And Grid Page: In section PRODUCT_LIST there is exactly EXPECTED_PRODUCT_COUNT PRODUCT elements

		#Select 'None' and verify if all products are on the list
		When Grid Page: In section CLASS_FILTERBAR click element FILTERBAR_RADIOBUTTON_LABEL in position 1	
		And Grid Page: Wait for full PRODUCT_LIST load
		Then Grid Page: Element DISPLAYED_PRODUCTS_COUNTER contains remembered value NO_FILTER_ELEMENTS_COUNT
		And Grid Page: In CLASS_FILTERBAR element RESULTS_COUNTER contains remembered value NO_FILTER_ELEMENTS_COUNT
		And Grid Page: In section PRODUCT_LIST there is exactly NO_FILTER_ELEMENTS_COUNT PRODUCT elements
		
		#Select filter again
		When Grid Page: In section CLASS_FILTERBAR click element FILTERBAR_RADIOBUTTON_LABEL in position 2	
		And Grid Page: Wait for full PRODUCT_LIST load
		
		#Verify if filter is applied on page
		Then Grid Page: Element DISPLAYED_PRODUCTS_COUNTER contains remembered value EXPECTED_PRODUCT_COUNT
		And Grid Page: In CLASS_FILTERBAR element RESULTS_COUNTER contains remembered value EXPECTED_PRODUCT_COUNT
		And Grid Page: In section PRODUCT_LIST there is exactly EXPECTED_PRODUCT_COUNT PRODUCT elements
		
		#Close filter dropdown list
		And Grid Page: In section CLASS_FILTERBAR click FILTERBAR_HEADER
		
		#Verify if reset (X) button is displayed, click it and verify if no filter is applied
		And Grid Page: In section CLASS_FILTERBAR there is exactly 1 RESET_FILTER element		
		When Grid Page: In section CLASS_FILTERBAR click RESET_FILTER
		And Grid Page: Wait for full PRODUCT_LIST load
		Then Grid Page: Element DISPLAYED_PRODUCTS_COUNTER contains remembered value NO_FILTER_ELEMENTS_COUNT
		And Grid Page: In section PRODUCT_LIST there is exactly NO_FILTER_ELEMENTS_COUNT PRODUCT elements
		
        
	Examples:
      |	PRODUCT_CATEGORY_1ST_LEVEL	| PRODUCT_CATEGORY_2ND_LEVEL	|
      |	Direct Fastening			| Ceiling Hanger Systems		|
      

   Scenario Outline: Product Filter - setting and resetting one multiple-choice filter  
   		
   		#Enter Webshop Main Page and navigate to specific category
        Given General: open webshop for United States
        And Webshop Main Page: If section I_UNDERSTAND_COOKIES is visible click I_UNDERSTAND_BUTTON
        And Webshop Main Page: If section ONE_MORE_THING_BANNER is visible click DO_NOT_ASK_AGAIN_BUTTON
        And Webshop Main Page: If section DO_YOU_NEED_HELP is visible click DONT_ASK_ME_AGAIN_BUTTON
        When Webshop Main Page: In section MENU_BAR element PRODUCTS_BUTTON is visible
        Then Webshop Main Page: In section MENU_BAR click PRODUCTS_BUTTON
        And General: Wait 2 seconds
		And Webshop Main Page: PRODUCT_OR_CATEGORY_LIST contains more than 1 PRODUCT_OR_CATEGORY_NAMES
		When Webshop Main Page: On PRODUCT_OR_CATEGORY_LIST click category <PRODUCT_CATEGORY_1ST_LEVEL>
 		And General: Wait 2 seconds
 		And Webshop Main Page: Section PRODUCT_OR_CATEGORY_LIST_NAVIGATION_BAR contains text <PRODUCT_CATEGORY_1ST_LEVEL>

        Then Webshop Main Page: On PRODUCT_OR_CATEGORY_LIST click category <PRODUCT_CATEGORY_2ND_LEVEL>
        And General: Wait 2 seconds
       	Then Grid Page: Section PAGE_TITLE contains text <PRODUCT_CATEGORY_2ND_LEVEL>
        And Grid Page: Remember value of DISPLAYED_PRODUCTS_COUNTER as NO_FILTER_ELEMENTS_COUNT
        
        #Select filter condition from multiple-choice filter 
		When Grid Page: Section DEFINE_YOUR_REQUIREMENTS contains element PRODUCT_TYPE_FILTERBAR
		Then Grid Page: In section DEFINE_YOUR_REQUIREMENTS click PRODUCT_TYPE_FILTERBAR
		And Grid Page: In PRODUCT_TYPE_FILTERBAR remember value of FILTERBAR_CHECKBOX_COUNTER_LABEL in position 2 as EXPECTED_PRODUCT_COUNT_1ST_CHECKBOX
		When Grid Page: In section PRODUCT_TYPE_FILTERBAR click element FILTERBAR_CHECKBOX_LABEL in position 2	
		And Grid Page: Wait for full PRODUCT_LIST load
		
		#Verify if filter is applied on page
		Then Grid Page: Element DISPLAYED_PRODUCTS_COUNTER contains remembered value EXPECTED_PRODUCT_COUNT_1ST_CHECKBOX
		And Grid Page: In PRODUCT_TYPE_FILTERBAR element RESULTS_COUNTER contains remembered value EXPECTED_PRODUCT_COUNT_1ST_CHECKBOX
		And Grid Page: In section PRODUCT_LIST there is exactly EXPECTED_PRODUCT_COUNT_1ST_CHECKBOX PRODUCT elements

		#Add 2nd checkbox to filter
		And Grid Page: In PRODUCT_TYPE_FILTERBAR remember value of FILTERBAR_CHECKBOX_COUNTER_LABEL in position 3 as EXPECTED_PRODUCT_COUNT_2ND_CHECKBOX
		When Grid Page: In section PRODUCT_TYPE_FILTERBAR click element FILTERBAR_CHECKBOX_LABEL in position 3
		And General: Remember sum of values EXPECTED_PRODUCT_COUNT_2ND_CHECKBOX and EXPECTED_PRODUCT_COUNT_1ST_CHECKBOX as SUM_EXPECTED_PRODUCT_COUNT
		And Grid Page: Wait for full PRODUCT_LIST load
		
		#Verify if second filter condition is applied on page
		Then Grid Page: Element DISPLAYED_PRODUCTS_COUNTER contains remembered value SUM_EXPECTED_PRODUCT_COUNT
		And Grid Page: In PRODUCT_TYPE_FILTERBAR element RESULTS_COUNTER contains remembered value SUM_EXPECTED_PRODUCT_COUNT
		And Grid Page: In section PRODUCT_LIST there is exactly SUM_EXPECTED_PRODUCT_COUNT PRODUCT elements
		
		#Uncheck 1st checkbox an verify results
		When Grid Page: In section PRODUCT_TYPE_FILTERBAR click element FILTERBAR_CHECKBOX_LABEL in position 2	
		And Grid Page: Wait for full PRODUCT_LIST load
		Then Grid Page: Element DISPLAYED_PRODUCTS_COUNTER contains remembered value EXPECTED_PRODUCT_COUNT_2ND_CHECKBOX
		And Grid Page: In PRODUCT_TYPE_FILTERBAR element RESULTS_COUNTER contains remembered value EXPECTED_PRODUCT_COUNT_2ND_CHECKBOX
		And Grid Page: In section PRODUCT_LIST there is exactly EXPECTED_PRODUCT_COUNT_2ND_CHECKBOX PRODUCT elements
		
		#Close filter dropdown list
		And Grid Page: In section PRODUCT_TYPE_FILTERBAR click FILTERBAR_HEADER
		And General: Wait 1 second
		
		#Reset filter using X
		And Grid Page: In section PRODUCT_TYPE_FILTERBAR click RESET_FILTER
		And Grid Page: Wait for full PRODUCT_LIST load
		Then Grid Page: Element DISPLAYED_PRODUCTS_COUNTER contains remembered value NO_FILTER_ELEMENTS_COUNT
		And Grid Page: In section PRODUCT_LIST there is exactly NO_FILTER_ELEMENTS_COUNT PRODUCT elements
		
		#Verify if show all checkbox is working properly
		And Grid Page: In section DEFINE_YOUR_REQUIREMENTS click PRODUCT_TYPE_FILTERBAR
		When Grid Page: In section PRODUCT_TYPE_FILTERBAR click element FILTERBAR_CHECKBOX_LABEL in position 1	
		And Grid Page: Wait for full PRODUCT_LIST load
		Then Grid Page: In section PRODUCT_TYPE_FILTERBAR all elements FILTERBAR_CHECKBOX are checked
		
		#Verify if show none checkbox is working properly
		When Grid Page: In section PRODUCT_TYPE_FILTERBAR click element FILTERBAR_CHECKBOX_LABEL in position 1	
		And Grid Page: Wait for full PRODUCT_LIST load
		Then Grid Page: In section PRODUCT_TYPE_FILTERBAR all elements FILTERBAR_CHECKBOX are unchecked
		And Grid Page: Element DISPLAYED_PRODUCTS_COUNTER contains remembered value NO_FILTER_ELEMENTS_COUNT
		And Grid Page: In PRODUCT_TYPE_FILTERBAR element RESULTS_COUNTER contains remembered value NO_FILTER_ELEMENTS_COUNT
		And Grid Page: In section PRODUCT_LIST there is exactly NO_FILTER_ELEMENTS_COUNT PRODUCT elements
		
        
	Examples:
      |	PRODUCT_CATEGORY_1ST_LEVEL	| PRODUCT_CATEGORY_2ND_LEVEL	|
      |	Direct Fastening			| Ceiling Hanger Systems		|
      
    
   Scenario Outline: Product Filter - using two filters and reset all button
   		
   		#Enter Webshop Main Page and navigate to specific category
        Given General: open webshop for United States
        And Webshop Main Page: If section I_UNDERSTAND_COOKIES is visible click I_UNDERSTAND_BUTTON
        And Webshop Main Page: If section ONE_MORE_THING_BANNER is visible click DO_NOT_ASK_AGAIN_BUTTON
        And Webshop Main Page: If section DO_YOU_NEED_HELP is visible click DONT_ASK_ME_AGAIN_BUTTON
        When Webshop Main Page: In section MENU_BAR element PRODUCTS_BUTTON is visible
        Then Webshop Main Page: In section MENU_BAR click PRODUCTS_BUTTON
        And General: Wait 2 seconds
		And Webshop Main Page: PRODUCT_OR_CATEGORY_LIST contains more than 1 PRODUCT_OR_CATEGORY_NAMES
		When Webshop Main Page: On PRODUCT_OR_CATEGORY_LIST click category <PRODUCT_CATEGORY_1ST_LEVEL>
 		And General: Wait 2 seconds
 		And Webshop Main Page: Section PRODUCT_OR_CATEGORY_LIST_NAVIGATION_BAR contains text <PRODUCT_CATEGORY_1ST_LEVEL>

        Then Webshop Main Page: On PRODUCT_OR_CATEGORY_LIST click category <PRODUCT_CATEGORY_2ND_LEVEL>
        And General: Wait 2 seconds
       	Then Grid Page: Section PAGE_TITLE contains text <PRODUCT_CATEGORY_2ND_LEVEL>
        And Grid Page: Remember value of DISPLAYED_PRODUCTS_COUNTER as NO_FILTER_ELEMENTS_COUNT
        
        #Select filter condition from multiple-choice filter 
		When Grid Page: Section DEFINE_YOUR_REQUIREMENTS contains element PRODUCT_TYPE_FILTERBAR
		Then Grid Page: In section DEFINE_YOUR_REQUIREMENTS click PRODUCT_TYPE_FILTERBAR
		When Grid Page: In section PRODUCT_TYPE_FILTERBAR click element FILTERBAR_CHECKBOX_LABEL in position 3	
		And Grid Page: Wait for full PRODUCT_LIST load
		And Grid Page: In section PRODUCT_TYPE_FILTERBAR click element FILTERBAR_CHECKBOX_LABEL in position 4
		And Grid Page: Wait for full PRODUCT_LIST load	
		And Grid Page: In section PRODUCT_TYPE_FILTERBAR click FILTERBAR_HEADER
		
		#Select filter condition from single-choice filter 
		When Grid Page: Section DEFINE_YOUR_REQUIREMENTS contains element CLASS_FILTERBAR
		Then Grid Page: In section DEFINE_YOUR_REQUIREMENTS click CLASS_FILTERBAR
		And Grid Page: In CLASS_FILTERBAR remember value of FILTERBAR_RADIOBUTTON_COUNTER_LABEL in position 2 as EXPECTED_PRODUCT_COUNT	
		When Grid Page: In section CLASS_FILTERBAR click element FILTERBAR_RADIOBUTTON_LABEL in position 2	
		And Grid Page: Wait for full PRODUCT_LIST load
		And Grid Page: In section CLASS_FILTERBAR click FILTERBAR_HEADER
		
		#Verify if filter is applied on page
		Then Grid Page: Element DISPLAYED_PRODUCTS_COUNTER contains remembered value EXPECTED_PRODUCT_COUNT
		And Grid Page: In section PRODUCT_LIST there is exactly EXPECTED_PRODUCT_COUNT PRODUCT elements

		#Verify if selected choices are visible under filter-bars
		And Grid Page: In section PRODUCT_TYPE_FILTERBAR there are exactly 2 RESET_FILTER elements
		And Grid Page: In section CLASS_FILTERBAR there is exactly 1 RESET_FILTER elements
		
		#Use Reset All button and verify if no filter is applied
		When Grid Page: In section DEFINE_YOUR_REQUIREMENTS click RESET_ALL_FILTERS_BUTTON
		And General: Wait 3 seconds
		Then Grid Page: Section PRODUCT_TYPE_FILTERBAR not contains element RESET_FILTER
		And Grid Page: Section CLASS_FILTERBAR not contains element RESET_FILTER
		And Grid Page: Element DISPLAYED_PRODUCTS_COUNTER contains remembered value NO_FILTER_ELEMENTS_COUNT
		And Grid Page: In section PRODUCT_LIST there is exactly NO_FILTER_ELEMENTS_COUNT PRODUCT elements
		
		 
	Examples:
      |	PRODUCT_CATEGORY_1ST_LEVEL	| PRODUCT_CATEGORY_2ND_LEVEL	|
      |	Direct Fastening			| Ceiling Hanger Systems		|