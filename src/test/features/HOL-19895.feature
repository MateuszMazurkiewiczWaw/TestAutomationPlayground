@Sprint6
Feature: HOL-19895 Search results page

  Scenario Outline: Search results page functionalities and content
		
		#Enter the page
		Given General: open webshop for United States
		And Webshop Main Page: If section I_UNDERSTAND_COOKIES is visible click I_UNDERSTAND_BUTTON
		And Webshop Main Page: If section ONE_MORE_THING_BANNER is visible click DO_NOT_ASK_AGAIN_BUTTON
		And Webshop Main Page: If section DO_YOU_NEED_HELP is visible click DONT_ASK_ME_AGAIN_BUTTON
	    
		#Testing search results main components
		When Webshop Main Page: In section HEADER in field PRODUCT_SEARCH_TEXTFIELD type in <valid_product_search_example>
		And General: Wait 5 seconds
		Then Webshop Main Page: SHOW_ALL_RESULTS_BUTTON is visible
		And Webshop Main Page: Click SHOW_ALL_RESULTS_BUTTON
		And General: Wait 1 second
		And Search Results Page: SEARCH_RESULTS_HEADER is visible
		And Search Results Page: Section SEARCH_RESULTS_MAIN_BAR is visible
		And Search Results Page: Section SEARCH_RESULTS_DEFINE_YOUR_REQUIREMENTS is visible
		And Search Results Page: Section SEARCH_RESULTS_LIST is visible
		
		#Testing search results main bar content
		When Search Results Page: In section SEARCH_RESULTS_MAIN_BAR element PRODUCTS_CATEGORY_LINK is visible
		Then Search Results Page: In section SEARCH_RESULTS_MAIN_BAR element TECHNICAL_DOCUMENTS_CATEGORY_LINK is visible
		And Search Results Page: In section SEARCH_RESULTS_MAIN_BAR element VIDEOS_CATEGORY_LINK is visible
		And Search Results Page: In section SEARCH_RESULTS_MAIN_BAR element FIRESTOP_SYSTEM_DETAILS_CATEGORY_LINK is visible
		And Search Results Page: In section SEARCH_RESULTS_MAIN_BAR element EDITORIALS_CATEGORY_LINK is visible
		
		#1 Testing search results list
		When Search Results Page: In section SEARCH_RESULTS_DEFINE_YOUR_REQUIREMENTS in field DEFINE_YOUR_REQUIREMENTS_TEXTFIELD type in <valid_product_search_example2>
		Then Search Results Page: In section SEARCH_RESULTS_DEFINE_YOUR_REQUIREMENTS click SEARCH_BUTTON
		And General: Wait 1 second
		And Search Results Page: Remember value of PRODUCTS_CATEGORY_LINK as TOTAL_CATEGORY_QUANTITY
		
		# Add two products to compare
        When Search Results Page: In section PRODUCT_LIST click element COMPARE_CHECKBOX in position 1
        And General: Wait 1 second
        And Search Results Page: In section PRODUCT_LIST click element COMPARE_CHECKBOX in position 2
        And General: Wait 1 second
        And Search Results Page: In section PRODUCT_LIST click element COMPARE_CHECKBOX in position 3
        And General: Wait 1 second
        Then Search Results Page: Section COMPARED_PRODUCT_COUNT contains text 3
        
        When Search Results Page: Click COMPARE_BUTTON_TOP
        And General: Wait 5 seconds
        Then Search Results Page: Section COMPARE_LAYER is visible
        Then Search Results Page: In section COMPARE_LAYER element HIGHLIGHT_DIFFRENCIES_CHECKBOX is checked
        
        # 3 items are visible
        And Search Results Page: In section COMPARE_LAYER there is exactly 3 COMPARISON_ITEM elements
           
        # remove 1 product - verify if it disappears
        When Search Results Page: In section COMPARE_LAYER click element COMPARISION_REMOVE_PRODUCT in position 3
        And General: Wait 3 seconds
        And Search Results Page: In section COMPARE_LAYER there is exactly 2 COMPARISON_ITEM elements
        
        # Unchecking Highlighted Differences and verify if no row is shaded
        When Search Results Page: In section COMPARE_LAYER element HIGHLIGHT_DIFFRENCIES_CHECKBOX is checked
        Then Search Results Page: HIGHLIGHTED_DIFFRENCIES is visible
        And Search Results Page: In section COMPARE_LAYER click HIGHLIGHT_DIFFRENCIES_LABEL_CHECKBOX
        And General: Wait 3 seconds
   		Then Search Results Page: HIGHLIGHTED_DIFFRENCIES is not visible

        # remove all from comparison - overlay disappears
        When Search Results Page: In section COMPARE_LAYER click COMPARISION_REMOVE_ALL
        And General: Wait 3 seconds
        Then Search Results Page: Section COMPARED_PRODUCT_COUNT contains text 0
        Then Search Results Page: Section COMPARE_LAYER is not visible
        
        # check again 2 products - overlay is shown
        When Search Results Page: In section PRODUCT_LIST click element COMPARE_CHECKBOX in position 1
        And Search Results Page: In section PRODUCT_LIST click element COMPARE_CHECKBOX in position 3
        Then Search Results Page: Section COMPARED_PRODUCT_COUNT contains text 2
        
        When Search Results Page: Click COMPARE_BUTTON_TOP
        And General: Wait 5 seconds
        Then Search Results Page: Section COMPARE_LAYER is visible
        And Search Results Page: In section COMPARE_LAYER there is exactly 2 COMPARISON_ITEM elements
        
        # close overlay by clicking X
        When Search Results Page: In section PRODUCT_LIST click CLOSE_BUTTON
        And General: Wait 3 seconds
        Then Search Results Page: Section COMPARE_LAYER is not visible
        And General: Wait 2 seconds
		
		#First filter selection
		When Search Results Page: Section FILTER_DROPDOWN_SELECTION_LIST is visible
		Then Search Results Page: In section FILTER_DROPDOWN_SELECTION_LIST there is exactly 1 FILTER_DROPDOWN_SELECTION_BUTTON elements
		And Search Results Page: In section FILTER_DROPDOWN_SELECTION_LIST click element FILTER_DROPDOWN_SELECTION_BUTTON in position 1
		And General: Wait 3 seconds
		
		#HOL-23165 update - checking if the button is a radio button 07.03.2017
		When Search Results Page: MAIN_CHAPTER_PRODUCTS_SELECTION_RADIOBUTTON is visible
		
		When Search Results Page: Section FILTER_SELECTION_FIRST_LIST is visible
		Then Search Results Page: In section FILTER_SELECTION_FIRST_LIST click element FILTER_SELECTION_LIST_RADIOBUTTON in position 1
		And General: Wait 3 seconds
		
		And Search Results Page: In FILTER_LIST remember value of FILTER_LIST_POSITION in position 1 as TOTAL_CHAPTER_QUANTITY
		And Search Results Page: In section SEARCH_RESULTS_LIST element SEARCH_LIST_HEADER contains numeric part of remembered value TOTAL_CATEGORY_QUANTITY
		And Search Results Page: In section SEARCH_RESULTS_LIST element SEARCH_LIST_HEADER contains numeric part of remembered value TOTAL_CHAPTER_QUANTITY
		
		# 30.01.2017 - below dropdown started to open automatically after selecting value from the one above
		#When Search Results Page: Click SUBCHAPTER_DROPDOWN_BUTTON
		
		#Second filter selection
		When Search Results Page: Section FILTER_SELECTION_SECOND_LIST is visible
		Then Search Results Page: In section FILTER_SELECTION_SECOND_LIST click element FILTER_SELECTION_LIST_RADIOBUTTON in position 1
		And General: Wait 3 seconds
		
		#Third filter selection
		When Search Results Page: Section FILTER_DROPDOWN_SELECTION_LIST is visible
		Then Search Results Page: In section FILTER_DROPDOWN_SELECTION_LIST there is exactly 5 FILTER_DROPDOWN_SELECTION_BUTTON elements
		And Search Results Page: In section FILTER_DROPDOWN_SELECTION_LIST click element FILTER_DROPDOWN_SELECTION_BUTTON in position 3
		And General: Wait 3 seconds
		
		When Search Results Page: Section FILTER_SELECTION_THIRD_LIST is visible
		Then Search Results Page: In section FILTER_SELECTION_THIRD_LIST click element FILTER_SELECTION_LIST_CHECKBOX in position 1
		And General: Wait 3 seconds
		
		#Fourth filter selection
		When Search Results Page: In section FILTER_DROPDOWN_SELECTION_LIST click element FILTER_DROPDOWN_SELECTION_BUTTON in position 4
		Then General: Wait 3 seconds
		
		When Search Results Page: Section FILTER_SELECTION_FOURTH_LIST is visible
		Then Search Results Page: In section FILTER_SELECTION_FOURTH_LIST click element FILTER_SELECTION_LIST_CHECKBOX in position 1
		And General: Wait 3 seconds
		
		#Fifth filter selection
		When Search Results Page: In section FILTER_DROPDOWN_SELECTION_LIST click element FILTER_DROPDOWN_SELECTION_BUTTON in position 5
		Then General: Wait 3 seconds
		
		When Search Results Page: Section FILTER_SELECTION_FIFTH_LIST is visible
		Then Search Results Page: In section FILTER_SELECTION_FIFTH_LIST click element FILTER_SELECTION_LIST_CHECKBOX in position 1
		And General: Wait 3 seconds

		And Search Results Page: In section FILTER_DROPDOWN_SELECTION_LIST click element FILTER_DROPDOWN_SELECTION_BUTTON in position 5
		And General: Wait 1 second
		
		#Filters checking
		And Search Results Page: FILTER_LIST is visible
		And Search Results Page: In section FILTER_LIST there is exactly 5 FILTER_LIST_POSITION elements
		And Search Results Page: In section FILTER_LIST there is exactly 5 FILTER_LIST_POSITION_DELETE_BUTTON elements
		
		#Deleting the filters
		When Search Results Page: Click RESET_ALL_FILTERS_BUTTON
		And General: Wait 3 seconds
		
		#Checking the delete
		And Search Results Page: In section FILTER_LIST there is exactly 0 FILTER_LIST_POSITION elements
		And Search Results Page: In section FILTER_LIST there is exactly 0 FILTER_LIST_POSITION_DELETE_BUTTON elements
		
		#Testing tile redirection and text field 
		When Search Results Page: Open FIRST_PRODUCT_TILE_LINK in new tab
		And General: Wait 2 seconds
		Then General: Switch to tab number 2
		And Range Page: PRODUCT_HEADER is visible
		And General: Discard last tab
		And General: Wait 1 second
		
		When Search Results Page: In section SEARCH_RESULTS_DEFINE_YOUR_REQUIREMENTS in field DEFINE_YOUR_REQUIREMENTS_TEXTFIELD type in <valid_product_search_example>
		Then Search Results Page: In section SEARCH_RESULTS_DEFINE_YOUR_REQUIREMENTS click SEARCH_BUTTON
		And General: Wait 1 second
		
		#2 Technical documents section testing
		When Search Results Page: Click TECHNICAL_DOCUMENTS_CATEGORY_LINK
		And General: Wait 2 seconds
		Then Search Results Page: Section DOCUMENTS_LIST is visible
		And Search Results Page: Remember value of TECHNICAL_DOCUMENTS_CATEGORY_LINK as TOTAL_CATEGORY_QUANTITY2
		And Search Results Page: In section DOCUMENTS_LIST there is at least 1 DOCUMENTS_POSITION elements
		And Search Results Page: In section DOCUMENTS_LIST there is at least 1 DOCUMENTS_DOWNLOAD_LINK elements
		And Search Results Page: In section DOCUMENTS_LIST there is at least 1 SHOW_ALL_LINK elements
		
		#Download link testing
		And Search Results Page: In section DOCUMENTS_LIST click element DOCUMENTS_DOWNLOAD_LINK in position 1
		And General: Wait 2 seconds
		Then General: There are 2 tabs opened
		And General: Discard tab number 2
		And General: Switch to tab number 1
		
		#First filter selection
		When Search Results Page: Section FILTER_DROPDOWN_SELECTION_LIST is visible
		Then Search Results Page: In section FILTER_DROPDOWN_SELECTION_LIST there is exactly 3 FILTER_DROPDOWN_SELECTION_BUTTON elements
		And Search Results Page: In section FILTER_DROPDOWN_SELECTION_LIST click element FILTER_DROPDOWN_SELECTION_BUTTON in position 1
		And General: Wait 3 seconds
		
		#HOL-23165 update - checking if the button is a radio button 07.03.2017
		When Search Results Page: MAIN_CHAPTER_DOCUMENTS_SELECTION_RADIOBUTTON is visible
		
		When Search Results Page: Section FILTER_SELECTION_FIRST_LIST is visible
		Then Search Results Page: In section FILTER_SELECTION_FIRST_LIST click element FILTER_SELECTION_LIST_RADIOBUTTON in position 1
		And General: Wait 3 seconds
		And Search Results Page: In section FILTER_DROPDOWN_SELECTION_LIST click element FILTER_DROPDOWN_SELECTION_BUTTON in position 2
		
		#Second filter selection
		When Search Results Page: Section FILTER_SELECTION_SECOND_LIST is visible
		Then Search Results Page: In section FILTER_SELECTION_SECOND_LIST click element FILTER_SELECTION_LIST_CHECKBOX in position 1
		And General: Wait 3 seconds
		And Search Results Page: In section FILTER_DROPDOWN_SELECTION_LIST click element FILTER_DROPDOWN_SELECTION_BUTTON in position 2
		
		And Search Results Page: In FILTER_LIST remember value of FILTER_LIST_POSITION in position 1 as TOTAL_CHAPTER_QUANTITY2
		And Search Results Page: In section FIRESTOP_AND_DOCUMENTS_SEARCH_RESULTS_LIST element FIRESTOP_AND_DOCUMENTS_SEARCH_LIST_HEADER contains numeric part of remembered value TOTAL_CATEGORY_QUANTITY2
		And Search Results Page: In section FIRESTOP_AND_DOCUMENTS_SEARCH_RESULTS_LIST element FIRESTOP_AND_DOCUMENTS_SEARCH_LIST_HEADER contains numeric part of remembered value TOTAL_CHAPTER_QUANTITY2
		When Search Results Page: In section DOCUMENTS_LIST click element SHOW_ALL_LINK in position 1
		And General: Wait 5 seconds
		Then Search Results Page: Section RELATED_PRODUCTS_OVERLAY is visible
		And Search Results Page: Click CLOSE_OVERLAY_BUTTON
		And General: Wait 5 seconds
		
		And Search Results Page: In section FILTER_LIST click element FILTER_LIST_POSITION_DELETE_BUTTON in position 2
		And General: Wait 1 second
		And Search Results Page: In section FILTER_LIST click element FILTER_LIST_POSITION_DELETE_BUTTON in position 1
		And General: Wait 1 second
		
		#Checking the delete
		And Search Results Page: In section FILTER_LIST there is exactly 0 FILTER_LIST_POSITION elements
		And Search Results Page: In section FILTER_LIST there is exactly 0 FILTER_LIST_POSITION_DELETE_BUTTON elements
		
		#3Videos section testing
		When Search Results Page: Click VIDEOS_CATEGORY_LINK
		And General: Wait 2 seconds
		Then Search Results Page: Section VIDEOS_LIST is visible
		And Search Results Page: Remember value of VIDEOS_CATEGORY_LINK as TOTAL_CATEGORY_QUANTITY3
		And Search Results Page: In section FILTER_DROPDOWN_SELECTION_LIST click element FILTER_DROPDOWN_SELECTION_BUTTON in position 2
		
		#First filter selection
		When Search Results Page: Section FILTER_SELECTION_SECOND_LIST is visible
		Then Search Results Page: In section FILTER_SELECTION_SECOND_LIST click element FILTER_SELECTION_LIST_CHECKBOX in position 1
		And General: Wait 3 seconds
		And Search Results Page: In section FILTER_DROPDOWN_SELECTION_LIST click element FILTER_DROPDOWN_SELECTION_BUTTON in position 2
		
		And Search Results Page: In FILTER_LIST remember value of FILTER_LIST_POSITION in position 1 as TOTAL_LANGUAGE_QUANTITY
		And Search Results Page: In section SEARCH_RESULTS_LIST element SEARCH_LIST_HEADER contains numeric part of remembered value TOTAL_CATEGORY_QUANTITY3
		And Search Results Page: In section SEARCH_RESULTS_LIST element SEARCH_LIST_HEADER contains numeric part of remembered value TOTAL_LANGUAGE_QUANTITY
		
		And Search Results Page: In section FILTER_LIST click element FILTER_LIST_POSITION_DELETE_BUTTON in position 1
		And General: Wait 1 second
		
		#Checking the delete
		And Search Results Page: In section FILTER_LIST there is exactly 0 FILTER_LIST_POSITION elements
		And Search Results Page: In section FILTER_LIST there is exactly 0 FILTER_LIST_POSITION_DELETE_BUTTON elements
		
		#4Firestop system details section testing
		When Search Results Page: Click FIRESTOP_SYSTEM_DETAILS_CATEGORY_LINK
		And General: Wait 3 seconds
		Then Search Results Page: JOINT_RADIOBUTTON is visible
		And Search Results Page: FIRESTOPS_LIST is visible
		And Search Results Page: Remember value of VIDEOS_CATEGORY_LINK as TOTAL_CATEGORY_QUANTITY4
		And Search Results Page: Section FILTER_SYSTEM_TYPE_SELECTION_LIST is visible
		And Search Results Page: In section FILTER_SYSTEM_TYPE_SELECTION_LIST click element FILTER_SELECTION_LIST_RADIOBUTTON in position 1
		And General: Wait 2 seconds
		And Search Results Page: Section FILTER_DROPDOWNS is visible
		And Search Results Page: In FILTER_LIST remember value of FILTER_LIST_POSITION in position 1 as TOTAL_JOINT_QUANTITY
		And Search Results Page: In section FIRESTOP_AND_DOCUMENTS_SEARCH_RESULTS_LIST element FIRESTOP_AND_DOCUMENTS_SEARCH_LIST_HEADER contains numeric part of remembered value TOTAL_CATEGORY_QUANTITY4
		And Search Results Page: In section FIRESTOP_AND_DOCUMENTS_SEARCH_RESULTS_LIST element FIRESTOP_AND_DOCUMENTS_SEARCH_LIST_HEADER contains numeric part of remembered value TOTAL_JOINT_QUANTITY
		And Search Results Page: In section FILTER_LIST click element FILTER_LIST_POSITION_DELETE_BUTTON in position 1
		And General: Wait 1 second
		And Search Results Page: In section FILTER_LIST there is exactly 0 FILTER_LIST_POSITION elements
		And Search Results Page: In section FILTER_LIST there is exactly 0 FILTER_LIST_POSITION_DELETE_BUTTON elements
		And General: Wait 2 seconds
		
		#5Editorials section testing
		When Search Results Page: Click EDITORIALS_CATEGORY_LINK
		And General: Wait 2 seconds
		And Search Results Page: EDITORIALS_LIST is visible
		And Search Results Page: In section EDITORIALS_LIST there is at least 1 EDITORIAL_POSITION elements
		And Search Results Page: In section EDITORIALS_LIST there is at least 1 EDITORIAL_READ_MORE_LINK elements
		
	Examples:
      |	valid_product_search_example	|	valid_product_search_example2	|
      |	pe 30							|	pe								|