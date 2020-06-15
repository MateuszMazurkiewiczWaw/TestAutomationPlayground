@Sprint3
Feature: HOL-20521 Cart Default

  Scenario Outline: Shopping Cart functionalities
		#Enter the page
		Given General: open webshop for United States
		And Webshop Main Page: If section I_UNDERSTAND_COOKIES is visible click I_UNDERSTAND_BUTTON
		And Webshop Main Page: If section ONE_MORE_THING_BANNER is visible click DO_NOT_ASK_AGAIN_BUTTON
	    And Webshop Main Page: If section DO_YOU_NEED_HELP is visible click DONT_ASK_ME_AGAIN_BUTTON
	    When Webshop Main Page: In section HEADER element LOG_IN_OR_REGISTER_BUTTON is visible
	    Then Webshop Main Page: In section HEADER click LOG_IN_OR_REGISTER_BUTTON
	    And Webshop Main Page: Section LOG_IN_OR_REGISTER is visible
	    
	    #Fill out login
	    When Webshop Main Page: Section LOG_IN_OR_REGISTER contains text common.login.label.header
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER element LOG_IN_BUTTON is enabled
	    Then Webshop Main Page: In section LOG_IN_OR_REGISTER in field EMAIL_ADDRESS_TEXTFIELD type in <email_address>
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER in field PASSWORD_TEXTFIELD type in <password>
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER element LOG_IN_BUTTON is enabled
	    Then Webshop Main Page: In section LOG_IN_OR_REGISTER click LOG_IN_BUTTON
	    And Webshop Main Page: Section HEADER contains text <user_name>
	    And Webshop Main Page: Section HEADER contains text <account_number>
	    
	    #Adding items to the cart
	 	When Webshop Main Page: In section HEADER click SHOPPING_CART_BUTTON
	 	Then Cart Page: Section QUICK_ITEM_ENTRY is visible
	 	And Cart Page: Section QUICK_ITEM_ENTRY contains text quickorder.label.description
	 	Then Cart Page: In section SHOPPING_CART_HEADER element VISIT_FAVORITES_LISTS_LINK is enabled
	 	And Cart Page: In section QUICK_ITEM_ENTRY element QUICK_ITEM_ENTRY_TEXTFIELD is visible
	 	And Cart Page: In section QUICK_ITEM_ENTRY click QUICK_ITEM_ENTRY_TEXTFIELD
	 	And General: Wait 1 second
	 	Then Cart Page: Section QUICK_ITEM_ENTRY contains text quickorder.label.legend 
	 	And Cart Page: In section QUICK_ITEM_ENTRY element LEARN_MORE_BUTTON is visible
	 	And Cart Page: In section QUICK_ITEM_ENTRY click LEARN_MORE_BUTTON
	 	And Cart Page: Section LEARN_MORE_SHOPPING_CART_POPUP is visible
	 	And Cart Page: Section LEARN_MORE_SHOPPING_CART_POPUP contains text quickorder.label.tooltipContent
	 	And Cart Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <item_number_valid>#<item_number_qunatity_valid>
	 	And Cart Page: Press ENTER on a keyboard
	 	And Cart Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <item_number_valid2>
	 	And Cart Page: Press ENTER on a keyboard
	 	And Cart Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <item_number_valid3>#<item_number_qunatity_valid3>
	 	And Cart Page: Click ADD_TO_CART_BUTTON

	 	And Webshop Main Page: The SHOPPING_CART contains <items_total_quantity> items
	 	And Cart Page: SUCCESS_MESSAGE_BOX is visible
	 	And Cart Page: Element SUCCESS_MESSAGE_BOX contains text <items_total_quantity> 
	 	And Cart Page: Element SUCCESS_MESSAGE_BOX contains text quickorder.message.success.productAdded
	 	And Cart Page: Section STANDARD_PRODUCTS_TABLE is visible
	 	And Cart Page: Section SOFTWARE_PRODUCTS_TABLE is visible
	 	And Cart Page: Section FLEET_PRODUCTS_TABLE is visible
	 	
	 	#Fleet products management
	 	When Cart Page: Scroll to FLEET_PRODUCTS_TABLE
	 	And General: Wait 1 second
	 	Then Cart Page: In section FLEET_PRODUCTS_TABLE click FLEET_CONTRACT_INFORMATION_BUTTON
	 	And Cart Page: Section FLEET_CONTRACT_INFORMATION_POPUP is visible
	 	And Cart Page: Section FLEET_CONTRACT_INFORMATION_POPUP contains text cart.contractFleetOverlay.label.masterContract
	 	And Cart Page: Section FLEET_CONTRACT_INFORMATION_POPUP contains text cart.contractFleetOverlay.label.contractType
	 	And Cart Page: Section FLEET_CONTRACT_INFORMATION_POPUP contains text cart.contractFleetOverlay.label.theftCoverage
	 	And Cart Page: In FLEET_PRODUCTS_TABLE_CONTENT element TABLE_DESCRIPTION_COLUMN is visible
	 	And Cart Page: In FLEET_PRODUCTS_TABLE_CONTENT element TABLE_USAGE_PERIOD_COLUMN is visible
	 	And Cart Page: In FLEET_PRODUCTS_TABLE_CONTENT element TABLE_INVOICE_COLUMN is visible
	 	And Cart Page: In FLEET_PRODUCTS_TABLE_CONTENT element TABLE_PRICE_COLUMN is visible
	 	And Cart Page: In FLEET_PRODUCTS_TABLE_CONTENT element TABLE_TOTAL_PRICE_COLUMN is visible
	 	And Cart Page: In FLEET_PRODUCTS_TABLE_CONTENT in row 1 remember value of TABLE_TOTAL_PRICE_COLUMN as TOTAL_PRICE_FLEET
	 	And Cart Page: In FLEET_PRODUCTS_TABLE_CONTENT element TABLE_AMOUNT_COLUMN is visible
	 	And Cart Page: In section FLEET_PRODUCTS_TABLE_CONTENT move cursor to element TABLE_DESCRIPTION_COLUMN
	 	Then Cart Page: TABLE_SEE_PRODUCT_DETAILS_LINK is visible
	 	And Cart Page: In section FLEET_PRODUCTS_TABLE_CONTENT element TABLE_AMOUNT_LABEL is visible
	 	And General: Wait 1 second
	 	And Cart Page: In section FLEET_PRODUCTS_TABLE_CONTENT click TABLE_ADD_TO_FAVORITES_BUTTON
		And Cart Page: Section TABLE_ADD_TO_FAVORITES_DROPDOWN is visible
		And Cart Page: Section TABLE_ADD_TO_FAVORITES_DROPDOWN contains text cart.favoriteListOverlay.label.createNewList
		And Cart Page: In section TABLE_ADD_TO_FAVORITES_DROPDOWN element TABLE_ADD_TO_FAVORITES_CREATE_NEW_LIST_BUTTON is visible
		And Cart Page: In section TABLE_ADD_TO_FAVORITES_DROPDOWN click TABLE_ADD_TO_FAVORITES_CREATE_NEW_LIST_BUTTON
		And Cart Page: In section TABLE_ADD_TO_FAVORITES_DROPDOWN element TABLE_ADD_TO_FAVORITES_TEXTFIELD is visible
		And Cart Page: In section TABLE_ADD_TO_FAVORITES_DROPDOWN element TABLE_ADD_TO_FAVORITES_CREATE_LIST_BUTTON is visible
		And Cart Page: In section TABLE_ADD_TO_FAVORITES_DROPDOWN click TABLE_ADD_TO_FAVORITES_CLOSE_BUTTON
	 	
	 	When Cart Page: Section FLEET_SUBTOTAL_MANAGEMENT_ITEMS is visible
	 	Then Cart Page: Section FLEET_SUBTOTAL_MANAGEMENT_ITEMS contains text cart.fleet.label.monthlyFee
	 	And Cart Page: Section FLEET_SUBTOTAL_MANAGEMENT_ITEMS contains remembered value TOTAL_PRICE_FLEET
	 	And Cart Page: In section FLEET_SUBTOTAL_MANAGEMENT_ITEMS element MONTHLY_FEE_LEARN_MORE_BUTTON is visible
	 	And Cart Page: In section FLEET_SUBTOTAL_MANAGEMENT_ITEMS click MONTHLY_FEE_LEARN_MORE_BUTTON
	 	Then Cart Page: Section MONTHLY_FEE_LEARN_MORE_POPUP is visible
	 	And Cart Page: Section MONTHLY_FEE_LEARN_MORE_POPUP contains text cart.fleet.label.monthlyFeeTooltipContent
	 	And Cart Page: In section MONTHLY_FEE_LEARN_MORE_POPUP click MONTHLY_FEE_LEARN_MORE_POPUP_CLOSE_BUTTON
	 	And General: Wait 1 second
	 	And Cart Page: In section FLEET_PRODUCTS_TABLE element TABLE_REMOVE_ITEM_BUTTON is visible
	 	And Cart Page: In section FLEET_PRODUCTS_TABLE click TABLE_REMOVE_ITEM_BUTTON
	 	And General: Wait 1 second
	 	Then Cart Page: Section FLEET_PRODUCTS_TABLE is not visible
	 	
	 	#Standard products management
	 	When Cart Page: In STANDARD_PRODUCTS_TABLE_CONTENT element TABLE_DESCRIPTION_COLUMN is visible
	 	And Cart Page: In STANDARD_PRODUCTS_TABLE_CONTENT element TABLE_PACKAGING_UNIT_COLUMN is visible
	 	And Cart Page: In STANDARD_PRODUCTS_TABLE_CONTENT element TABLE_PRICE_COLUMN is visible
	 	And Cart Page: In STANDARD_PRODUCTS_TABLE_CONTENT element TABLE_TOTAL_PRICE_COLUMN is visible
	 	And Cart Page: In STANDARD_PRODUCTS_TABLE_CONTENT in row 1 remember value of TABLE_TOTAL_PRICE_COLUMN as TOTAL_PRICE_STANDARD
	 	And Cart Page: In STANDARD_PRODUCTS_TABLE_CONTENT element TABLE_AMOUNT_COLUMN is visible
	 	And Cart Page: In section STANDARD_PRODUCTS_TABLE_CONTENT move cursor to element TABLE_DESCRIPTION_COLUMN
	 	Then Cart Page: TABLE_SEE_PRODUCT_DETAILS_LINK is visible
	 	And Cart Page: In section STANDARD_PRODUCTS_TABLE_CONTENT element TABLE_AMOUNT_LABEL is visible
		And General: Wait 1 second
	 	And Cart Page: In section STANDARD_PRODUCTS_TABLE_CONTENT click TABLE_ADD_TO_FAVORITES_BUTTON
		And Cart Page: Section TABLE_ADD_TO_FAVORITES_DROPDOWN is visible
		And Cart Page: Section TABLE_ADD_TO_FAVORITES_DROPDOWN contains text cart.favoriteListOverlay.label.createNewList
		And Cart Page: In section TABLE_ADD_TO_FAVORITES_DROPDOWN element TABLE_ADD_TO_FAVORITES_CREATE_NEW_LIST_BUTTON is visible
		And Cart Page: In section TABLE_ADD_TO_FAVORITES_DROPDOWN click TABLE_ADD_TO_FAVORITES_CREATE_NEW_LIST_BUTTON
		And Cart Page: In section TABLE_ADD_TO_FAVORITES_DROPDOWN element TABLE_ADD_TO_FAVORITES_TEXTFIELD is visible
		And Cart Page: In section TABLE_ADD_TO_FAVORITES_DROPDOWN element TABLE_ADD_TO_FAVORITES_CREATE_LIST_BUTTON is visible
		And Cart Page: In section TABLE_ADD_TO_FAVORITES_DROPDOWN click TABLE_ADD_TO_FAVORITES_CLOSE_BUTTON
		
		When Cart Page: Section STANDARD_SUBTOTAL_MANAGEMENT_ITEMS is visible
	 	Then Cart Page: Section STANDARD_SUBTOTAL_MANAGEMENT_ITEMS contains text cart.label.oneTimeFee
	 	And Cart Page: Section STANDARD_SUBTOTAL_MANAGEMENT_ITEMS contains remembered value TOTAL_PRICE_STANDARD
	 	And Cart Page: In section STANDARD_SUBTOTAL_MANAGEMENT_ITEMS element ONE_TIME_LEARN_MORE_BUTTON is visible
	 	And Cart Page: In section STANDARD_SUBTOTAL_MANAGEMENT_ITEMS click ONE_TIME_LEARN_MORE_BUTTON
	 	Then Cart Page: Section ONE_TIME_LEARN_MORE_POPUP is visible
	 	And Cart Page: Section ONE_TIME_LEARN_MORE_POPUP contains text cart.label.oneTimePrice	 	
	 	And Cart Page: In section ONE_TIME_LEARN_MORE_POPUP click ONE_TIME_LEARN_MORE_POPUP_CLOSE_BUTTON
	 	And General: Wait 1 second
	 	And Cart Page: In section STANDARD_PRODUCTS_TABLE element TABLE_REMOVE_ITEM_BUTTON is visible
	 	And Cart Page: In section STANDARD_PRODUCTS_TABLE click TABLE_REMOVE_ITEM_BUTTON
	 	And General: Wait 1 second
	 	Then Cart Page: Section STANDARD_PRODUCTS_TABLE is not visible
	 	
	 	#Software products management
	 	When Cart Page: In SOFTWARE_PRODUCTS_TABLE_CONTENT element TABLE_DESCRIPTION_COLUMN is visible
	 	And Cart Page: In SOFTWARE_PRODUCTS_TABLE_CONTENT element TABLE_PACKAGING_UNIT_COLUMN is visible
	 	And Cart Page: In SOFTWARE_PRODUCTS_TABLE_CONTENT element TABLE_BILLING_CYCLE_COLUMN is visible
	 	And Cart Page: In SOFTWARE_PRODUCTS_TABLE_CONTENT element TABLE_PRICE_COLUMN is visible
	 	And Cart Page: In SOFTWARE_PRODUCTS_TABLE_CONTENT element TABLE_TOTAL_PRICE_COLUMN is visible
	 	And Cart Page: In SOFTWARE_PRODUCTS_TABLE_CONTENT in row 1 remember value of TABLE_TOTAL_PRICE_COLUMN as TOTAL_PRICE_SOFTWARE
	 	And Cart Page: In SOFTWARE_PRODUCTS_TABLE_CONTENT element TABLE_AMOUNT_COLUMN is visible
	 	And Cart Page: In section SOFTWARE_PRODUCTS_TABLE_CONTENT move cursor to element TABLE_DESCRIPTION_COLUMN
	 	Then Cart Page: TABLE_SEE_PRODUCT_DETAILS_LINK is visible
	 	And Cart Page: In section SOFTWARE_PRODUCTS_TABLE_CONTENT element TABLE_AMOUNT_LABEL is visible
	 	And General: Wait 1 second
	 	And Cart Page: In section SOFTWARE_PRODUCTS_TABLE_CONTENT click TABLE_ADD_TO_FAVORITES_BUTTON
		And Cart Page: Section TABLE_ADD_TO_FAVORITES_DROPDOWN is visible
		And Cart Page: Section TABLE_ADD_TO_FAVORITES_DROPDOWN contains text Create new list
		And Cart Page: In section TABLE_ADD_TO_FAVORITES_DROPDOWN element TABLE_ADD_TO_FAVORITES_CREATE_NEW_LIST_BUTTON is visible
		And Cart Page: In section TABLE_ADD_TO_FAVORITES_DROPDOWN click TABLE_ADD_TO_FAVORITES_CREATE_NEW_LIST_BUTTON
		And Cart Page: In section TABLE_ADD_TO_FAVORITES_DROPDOWN element TABLE_ADD_TO_FAVORITES_TEXTFIELD is visible
		And Cart Page: In section TABLE_ADD_TO_FAVORITES_DROPDOWN element TABLE_ADD_TO_FAVORITES_CREATE_LIST_BUTTON is visible
		And Cart Page: In section TABLE_ADD_TO_FAVORITES_DROPDOWN click TABLE_ADD_TO_FAVORITES_CLOSE_BUTTON
	 	
	 	When Cart Page: Section SOFTWARE_SUBTOTAL_MANAGEMENT_ITEMS is visible
	 	And Cart Page: Section SOFTWARE_SUBTOTAL_MANAGEMENT_ITEMS contains remembered value TOTAL_PRICE_SOFTWARE
	 	Then Cart Page: Section SOFTWARE_SUBTOTAL_MANAGEMENT_ITEMS contains text cart.software.label.yearlyFee
	 	And Cart Page: In section SOFTWARE_SUBTOTAL_MANAGEMENT_ITEMS element YEARLY_FEE_LEARN_MORE_BUTTON is visible
	 	And Cart Page: In section SOFTWARE_SUBTOTAL_MANAGEMENT_ITEMS click YEARLY_FEE_LEARN_MORE_BUTTON
	 	Then Cart Page: Section YEARLY_FEE_LEARN_MORE_POPUP is visible
	 	And Cart Page: Section YEARLY_FEE_LEARN_MORE_POPUP contains text cart.software.label.yearlyFeeDescription
	 	And Cart Page: In section YEARLY_FEE_LEARN_MORE_POPUP click YEARLY_FEE_LEARN_MORE_POPUP_CLOSE_BUTTON
	 	And General: Wait 1 second
	 	And Cart Page: In section SOFTWARE_PRODUCTS_TABLE element TABLE_REMOVE_ITEM_BUTTON is visible
	 	And Cart Page: In section SOFTWARE_PRODUCTS_TABLE click TABLE_REMOVE_ITEM_BUTTON
	 	And General: Wait 1 second
	 	Then Cart Page: Section SOFTWARE_PRODUCTS_TABLE is not visible
	 	
	 	#Continue shopping process and checking the Remove All Items functionality
	 	When Cart Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <item_number_valid>#<item_number_qunatity_valid>
	 	Then Cart Page: Press ENTER on a keyboard
	 	And Cart Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <item_number_valid2>
	 	And Cart Page: Press ENTER on a keyboard
	 	And Cart Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <item_number_valid3>#<item_number_qunatity_valid3>
	 	And Cart Page: Click ADD_TO_CART_BUTTON
	
	 	And Webshop Main Page: The SHOPPING_CART contains <items_total_quantity> items
	 	And Cart Page: Click REMOVE_ALL_ITEMS_BUTTON
	 	Then Cart Page: Section REMOVE_ALL_ITEMS_POPUP is visible
	 	And Cart Page: In section REMOVE_ALL_ITEMS_POPUP click CONFIRM_REMOVING_ALL_ITEMS
	 	And General: Wait 1 second
	 	Then Cart Page: FLEET_PRODUCTS_TABLE is not visible
	 	Then Cart Page: STANDARD_PRODUCTS_TABLE is not visible
	 	Then Cart Page: SOFTWARE_PRODUCTS_TABLE is not visible
	 	
	 	When Cart Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <item_number_valid>#<item_number_qunatity_valid>
	 	Then Cart Page: Press ENTER on a keyboard
	 	And Cart Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <item_number_valid2>
	 	And Cart Page: Press ENTER on a keyboard
	 	And Cart Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <item_number_valid3>#<item_number_qunatity_valid3>
	 	And Cart Page: Click ADD_TO_CART_BUTTON
	 	
	 	And Webshop Main Page: The SHOPPING_CART contains <items_total_quantity> items
	 	And Cart Page: In FLEET_PRODUCTS_TABLE_CONTENT clear value of TABLE_AMOUNT_TEXTFIELD
	 	And Cart Page: In section FLEET_PRODUCTS_TABLE_CONTENT click TABLE_ADD_TO_FAVORITES_BUTTON
	 	And Cart Page: In section FLEET_PRODUCTS_TABLE_CONTENT element TABLE_AMOUNT_TEXTFIELD has value <item_number_qunatity_valid2>
	 	And Cart Page: In STANDARD_PRODUCTS_TABLE_CONTENT clear value of TABLE_AMOUNT_TEXTFIELD
	 	And Cart Page: In section STANDARD_PRODUCTS_TABLE_CONTENT click TABLE_ADD_TO_FAVORITES_BUTTON
	 	And Cart Page: In section STANDARD_PRODUCTS_TABLE_CONTENT element TABLE_AMOUNT_TEXTFIELD has value <item_number_qunatity_valid>
	 	And Cart Page: In SOFTWARE_PRODUCTS_TABLE_CONTENT clear value of TABLE_AMOUNT_TEXTFIELD
	 	And Cart Page: In section SOFTWARE_PRODUCTS_TABLE_CONTENT click TABLE_ADD_TO_FAVORITES_BUTTON
	 	And Cart Page: In section SOFTWARE_PRODUCTS_TABLE_CONTENT element TABLE_AMOUNT_TEXTFIELD has value <item_number_qunatity_valid3>
	 	
	 	And Cart Page: In section FLEET_PRODUCTS_TABLE_CONTENT in field TABLE_AMOUNT_TEXTFIELD type in 0
	 	And General: Wait 1 second
	 	Then Cart Page: In section FLEET_PRODUCTS_TABLE_CONTENT element TABLE_UPDATE_QUANTITY_BUTTON is visible
	 	And Cart Page: In section FLEET_PRODUCTS_TABLE_CONTENT click TABLE_UPDATE_QUANTITY_BUTTON
	 	And Cart Page: In section STANDARD_PRODUCTS_TABLE_CONTENT in field TABLE_AMOUNT_TEXTFIELD type in 0
	 	Then Cart Page: In section STANDARD_PRODUCTS_TABLE_CONTENT element TABLE_UPDATE_QUANTITY_BUTTON is visible
	 	And Cart Page: In section STANDARD_PRODUCTS_TABLE_CONTENT click TABLE_UPDATE_QUANTITY_BUTTON
	 	And Cart Page: In section SOFTWARE_PRODUCTS_TABLE_CONTENT in field TABLE_AMOUNT_TEXTFIELD type in 0
	 	Then Cart Page: In section SOFTWARE_PRODUCTS_TABLE_CONTENT element TABLE_UPDATE_QUANTITY_BUTTON is visible
	 	And Cart Page: In section SOFTWARE_PRODUCTS_TABLE_CONTENT click TABLE_UPDATE_QUANTITY_BUTTON
	 	And Webshop Main Page: The SHOPPING_CART contains 0 items
	 	
	 	When Cart Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <item_number_valid>#<item_number_qunatity_valid>
	 	Then Cart Page: Press ENTER on a keyboard
	 	And Cart Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <item_number_valid2>
	 	And Cart Page: Press ENTER on a keyboard
	 	And Cart Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <item_number_valid3>#<item_number_qunatity_valid3>
	 	And Cart Page: Click ADD_TO_CART_BUTTON

	 	And Cart Page: In section SHOPPING_CART_HEADER element CONTINUE_SHOPPING_LINK is visible
	 	And Cart Page: In section SHOPPING_CART_HEADER element CHECK_OUT_BUTTON is enabled
	 	And Cart Page: In section SHOPPING_CART_HEADER click CHECK_OUT_BUTTON
	 	And General: Wait 1 second
	 	Then Checkout Delivery Page: Section DELIVERY_ADDRESS_FORM is visible
	 	
	 	
	Examples:
      |	item_number_valid		|	item_number_qunatity_valid	|	item_number_valid2	|	item_number_qunatity_valid2		|	item_number_valid3		|	item_number_qunatity_valid3	|	items_total_quantity	|	email_address		|	password				|	account_number		|	user_name		|
      |	US_standard_product1	|	5							|	US_fleet_product1	|	1								|	US_software_product1	|	2							|	8						|	US_fleet_email		|	US_fleet_password		|	US_fleet_id			|	US_fleet_name	|