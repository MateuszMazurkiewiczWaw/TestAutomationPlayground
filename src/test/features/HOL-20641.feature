@Sprint6
Feature: HOL-20641 Technical Library - Technical Documents

  Scenario Outline: Technical Library functionalities and content
		
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

		#2 Technical documents section testing
		When Search Results Page: Click TECHNICAL_DOCUMENTS_CATEGORY_LINK
		And General: Wait 2 seconds
		Then Search Results Page: Section DOCUMENTS_LIST is visible
		And Search Results Page: In section DOCUMENTS_LIST there is at least 3 DOCUMENTS_POSITION elements
		And Search Results Page: In section DOCUMENTS_LIST there is at least 3 DOCUMENTS_DOWNLOAD_LINK elements
		And Search Results Page: In section DOCUMENTS_LIST there is at least 3 SHOW_ALL_LINK elements
		And Search Results Page: In section DOCUMENTS_LIST there is at least 3 DESCRIPTION_FIELD elements
		
		When Search Results Page: In section DOCUMENTS_LIST click element SHOW_ALL_LINK in position 1
		And General: Wait 5 seconds
		Then Search Results Page: Section RELATED_PRODUCTS_OVERLAY is visible
		And Search Results Page: Click CLOSE_OVERLAY_BUTTON
		And General: Wait 5 seconds
		And Search Results Page: PRODUCT_TYPE_DROPDOWN_BUTTON is not visible
		
		#Filters testing
		When Search Results Page: Click PRODUCT_GROUP_DROPDOWN_BUTTON
		Then Search Results Page: Click MAIN_CHAPTER_DOCUMENTS_SELECTION_RADIOBUTTON
		And General: Wait 3 seconds
		And Search Results Page: PRODUCT_TYPE_DROPDOWN_BUTTON is visible
		
		When Search Results Page: Click PRODUCT_TYPE_DROPDOWN_BUTTON
		Then Search Results Page: Click EXPANSION_ANCHORS_CHECKBOX
		And General: Wait 3 seconds
		
		When Search Results Page: Click LANGUAGE_DROPDOWN_LIST_BUTTON
		Then Search Results Page: Click ENGLISH_LANGUAGE_CHECKBOX
		And General: Wait 3 seconds
		
		And Search Results Page: PRODUCT_GROUP_FILTER is visible
		And Search Results Page: PRODUCT_TYPE_FILTER is visible
		And Search Results Page: LANGUAGE_FILTER is visible
		And Search Results Page: Click DELETE_LANGUAGE_FILTER_BUTTON
		And General: Wait 3 seconds
		And Search Results Page: LANGUAGE_FILTER is not visible
		
		#No results found scenario
		When Search Results Page: In section SEARCH_RESULTS_DEFINE_YOUR_REQUIREMENTS in field DEFINE_YOUR_REQUIREMENTS_TEXTFIELD type in <invalid_product_search_example>
		Then Search Results Page: In section SEARCH_RESULTS_DEFINE_YOUR_REQUIREMENTS click SEARCH_BUTTON
		And General: Wait 1 second
		And Search Results Page: ALERT_MESSAGE_BOX is visible
		And Search Results Page: Element ALERT_MESSAGE_BOX contains text category.grid.message.noProducts
		
	Examples:
      |	valid_product_search_example	|	invalid_product_search_example	|
      |	pe 30							|	xxxxx							|