@Sprint6 
Feature: HOL-20345 Compare Layer - grid page

  Scenario Outline: Compare layer - comparing products
        
		#Enter Webshop Main Page and navigate to grid page
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
       	
       	# Add two products to compare
        When Grid Page: In section PRODUCT_LIST click element COMPARE_CHECKBOX in position 1
        And Grid Page: In section PRODUCT_LIST click element COMPARE_CHECKBOX in position 3
        And Grid Page: In section PRODUCT_LIST click element COMPARE_CHECKBOX in position 5
        Then Grid Page: Section COMPARED_PRODUCT_COUNT contains text 3
        
        When Grid Page: Click COMPARE_BUTTON_TOP
        And General: Wait 5 seconds
        Then Grid Page: Section COMPARE_LAYER is visible
        Then Grid Page: In section COMPARE_LAYER element HIGHLIGHT_DIFFRENCIES_CHECKBOX is checked
        
        # 3 items are visible
        And Grid Page: In section COMPARE_LAYER there is exactly 3 COMPARISON_ITEM elements
           
        # remove 1 product - verify if it dissapears
        When Grid Page: In section COMPARE_LAYER click element COMPARISION_REMOVE_PRODUCT in position 3
        And General: Wait 3 seconds
        And Grid Page: In section COMPARE_LAYER there is exactly 2 COMPARISON_ITEM elements
        
        # uncheck Highlight Diffrencies and verify if no row is shaded
        When Grid Page: In section COMPARE_LAYER element HIGHLIGHT_DIFFRENCIES_CHECKBOX is checked
        Then Grid Page: HIGHLIGHTED_DIFFRENCIES is visible
        And Grid Page: In section COMPARE_LAYER click HIGHLIGHT_DIFFRENCIES_LABEL_CHECKBOX
        And General: Wait 3 seconds
   		Then Grid Page: HIGHLIGHTED_DIFFRENCIES is not visible

        # remove all from comaprision - overlay dissapears
        When Grid Page: In section COMPARE_LAYER click COMPARISION_REMOVE_ALL
        And General: Wait 3 seconds
        Then Grid Page: Section COMPARE_LAYER is not visible
        
        # check again 2 products - overlay is shown
        When Grid Page: In section PRODUCT_LIST click element COMPARE_CHECKBOX in position 1
        And Grid Page: In section PRODUCT_LIST click element COMPARE_CHECKBOX in position 3
        Then Grid Page: Section COMPARED_PRODUCT_COUNT contains text 2
        
        When Grid Page: Click COMPARE_BUTTON_TOP
        And General: Wait 5 seconds
        Then Grid Page: Section COMPARE_LAYER is visible
        And Grid Page: In section COMPARE_LAYER there is exactly 2 COMPARISON_ITEM elements
        
        # close overlay by clicking X
        When Grid Page: In section PRODUCT_LIST click CLOSE_BUTTON
        And General: Wait 3 seconds
        Then Grid Page: Section COMPARE_LAYER is not visible
        
        
	Examples:
      |	PRODUCT_CATEGORY_1ST_LEVEL	| PRODUCT_CATEGORY_2ND_LEVEL	|
      |	Direct Fastening			| Ceiling Hanger Systems		|