@Sprint2
Feature: HOL-20249 & HOL-23016 Grid Page with ranges/items

  Scenario Outline: Grid Page with ranges/items: Display of products only & View All button within pagination
		
		#My Account profile + error messages: My Account header
		#Enter the page
		Given General: open webshop for United States
		And Webshop Main Page: If section I_UNDERSTAND_COOKIES is visible click I_UNDERSTAND_BUTTON
		And Webshop Main Page: If section ONE_MORE_THING_BANNER is visible click DO_NOT_ASK_AGAIN_BUTTON
		And Webshop Main Page: If section DO_YOU_NEED_HELP is visible click DONT_ASK_ME_AGAIN_BUTTON
		When Webshop Main Page: In section MENU_BAR element PRODUCTS_BUTTON is visible
		Then Webshop Main Page: In section MENU_BAR click PRODUCTS_BUTTON
		And General: Wait 5 seconds
		Then Webshop Main Page: Section PRODUCT_OR_CATEGORY_LIST is visible
		And Webshop Main Page: Section PRODUCT_OR_CATEGORY_LIST_NAVIGATION_BAR contains text headerstaticcomponent.label.products
		And Webshop Main Page: PRODUCT_OR_CATEGORY_LIST contains more than 1 PRODUCT_OR_CATEGORY_NAMES
		When Webshop Main Page: On PRODUCT_OR_CATEGORY_LIST click category <PRODUCT_CATEGORY_1ST_LEVEL>

		And Webshop Main Page: Section PRODUCT_OR_CATEGORY_LIST_NAVIGATION_BAR contains text <PRODUCT_CATEGORY_1ST_LEVEL>
		And Webshop Main Page: In section PRODUCT_OR_CATEGORY_LIST element BACK_BUTTON is visible
		
		When Webshop Main Page: On PRODUCT_OR_CATEGORY_LIST click category <PRODUCT_CATEGORY_2ND_LEVEL>
		Then Webshop Main Page: Section PRODUCT_OR_CATEGORY_LIST_NAVIGATION_BAR contains text <PRODUCT_CATEGORY_2ND_LEVEL>
		And Webshop Main Page: In section PRODUCT_OR_CATEGORY_LIST element BACK_BUTTON is visible
		And Webshop Main Page: PRODUCT_OR_CATEGORY_LIST_CLOSE_BUTTON is visible
		
		When Webshop Main Page: On PRODUCT_OR_CATEGORY_LIST click category <PRODUCT_CATEGORY_3RD_LEVEL>
		Then Grid Page: Section PAGE_TITLE contains text <PRODUCT_CATEGORY_3RD_LEVEL>
		
		#Checking if there are bread crumbs on the Product or category section
		When Grid Page: Section BREADCRUMBS contains text breadcrumb.label.home
		And Grid Page: Section BREADCRUMBS contains text breadcrumb.label.products
		And Grid Page: Section BREADCRUMBS contains text <PRODUCT_CATEGORY_1ST_LEVEL>
		And Grid Page: Section BREADCRUMBS contains text <PRODUCT_CATEGORY_2ND_LEVEL>
		Then Grid Page: Section BREADCRUMBS contains text <PRODUCT_CATEGORY_3RD_LEVEL>
		
		#Checking "Define your requirements" area
		When Grid Page: Section DEFINE_YOUR_REQUIREMENTS contains element PACKAGE_QUANTITY_FILTERBAR
		Then Grid Page: In section DEFINE_YOUR_REQUIREMENTS click PACKAGE_QUANTITY_FILTERBAR
		
		# Not an object of translation. Not crucial to check this.
		#And Grid Page: Section PACKAGE_QUANTITY_FILTERBAR contains text Package Quantity
		
		And Grid Page: Section PACKAGE_QUANTITY_FILTERBAR contains more than 1 FILTERBAR_RADIOBUTTON
		And Grid Page: In section PACKAGE_QUANTITY_FILTERBAR element FILTERBAR_RADIOBUTTON in position 1 is selected
		When Grid Page: In section DEFINE_YOUR_REQUIREMENTS click PACKAGE_QUANTITY_FILTERBAR

		#Checking "Products" area
		When Grid Page: SHOW_ALL_BUTTON is visible
		And Grid Page: In section PRODUCT_LIST there is exactly 50 PRODUCT elements
		
		#Check The Item description
		When Grid Page: In section PRODUCT_LIST element PRODUCT_DESCRIPTION_BOLD in position 1 is visible
		And Grid Page: In section PRODUCT_LIST element PRODUCT_DESCRIPTION in position 1 is visible
		
		Then Grid Page: Click SHOW_ALL_BUTTON
		And Grid Page: Wait for full PRODUCT_LIST load
		And Grid Page: Section PRODUCT_LIST contains more than 50 PRODUCT
		And Grid Page: SHOW_ALL_BUTTON is not visible
		When Grid Page: Element COMPARE_BUTTON_TOP is disabled
		And Grid Page: Element COMPARE_BUTTON_BOTTOM is disabled
		And General: Scroll to the top

		Then Grid Page: In section PRODUCT_LIST click element COMPARE_CHECKBOX in position 1
		And Grid Page: In section PRODUCT_LIST click element COMPARE_CHECKBOX in position 2
		And General: Wait 1 second
		When Grid Page: Element COMPARE_BUTTON_TOP is enabled
		And Grid Page: Element COMPARE_BUTTON_BOTTOM is enabled
		#CLICKING THE COMPARE BUTTON FUNCTIONALLITY ISN'T PROVIDED YET - THE STEP NEEDS TO BE ADDED AS A DIFFERENT USER STORY
		
	Examples:
      |	PRODUCT_CATEGORY_1ST_LEVEL		| PRODUCT_CATEGORY_2ND_LEVEL		|	PRODUCT_CATEGORY_3RD_LEVEL		|
      |	US_Product_Category_1st_Level2	| US_Product_Category_2nd_Level2	|	US_Product_Category_3rd_Level2	|