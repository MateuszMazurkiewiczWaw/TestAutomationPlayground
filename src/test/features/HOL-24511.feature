@Sprint6 
Feature: HOL-24511 Tool Management - Reorder tools list

  Scenario Outline: Tool Management - Reorder tools list
		
		#Enter the page
		Given General: open webshop for United States
		And Webshop Main Page: If section I_UNDERSTAND_COOKIES is visible click I_UNDERSTAND_BUTTON
		And Webshop Main Page: If section ONE_MORE_THING_BANNER is visible click DO_NOT_ASK_AGAIN_BUTTON
		And Webshop Main Page: If section DO_YOU_NEED_HELP is visible click DONT_ASK_ME_AGAIN_BUTTON
		When Webshop Main Page: In section HEADER element LOG_IN_OR_REGISTER_BUTTON is visible
	    Then Webshop Main Page: In section HEADER click LOG_IN_OR_REGISTER_BUTTON
	    And Webshop Main Page: Section LOG_IN_OR_REGISTER is visible
	    
	    #1-Fill out login
	    When Webshop Main Page: Section LOG_IN_OR_REGISTER contains text LOG IN
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER element LOG_IN_BUTTON is enabled
	    Then Webshop Main Page: In section LOG_IN_OR_REGISTER in field EMAIL_ADDRESS_TEXTFIELD type in <email_address>
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER in field PASSWORD_TEXTFIELD type in <password>
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER element LOG_IN_BUTTON is enabled
	    Then Webshop Main Page: In section LOG_IN_OR_REGISTER click LOG_IN_BUTTON

	    And Webshop Main Page: Section HEADER contains text <user_name>
	    And Webshop Main Page: Section HEADER contains text <account_number> 
		
		When Webshop Main Page: Click REORDER_TOOLS
		And General: Wait 3 seconds
		
		# Check initial state of table (HOL-23037)
		Then Tool Management Page: Section TOOLS_TABLE is visible
		And Tool Management Page: Section TOOLS_TABLE contains text profile.tools.label.fleetCombo
		And Tool Management Page: Section TOOLS_TABLE contains text profile.tools.label.fleetType
		And Tool Management Page: In section TOOLS_TABLE there is exactly 14 VISIBLE_COLUMN elements
		And Tool Management Page: In section TOOLS_TABLE element HEADING_ROW contains text profile.tools.label.typeLabel
		And Tool Management Page: In section TOOLS_TABLE element HEADING_ROW contains text profile.tools.label.nameLabel
		And Tool Management Page: In section TOOLS_TABLE element HEADING_ROW contains text profile.tools.label.serialLabel
		And Tool Management Page: In section TOOLS_TABLE element HEADING_ROW contains text profile.tools.label.orgRefLabel
		And Tool Management Page: In section TOOLS_TABLE element HEADING_ROW contains text profile.tools.label.inventoryKeyLabel
		And Tool Management Page: In section TOOLS_TABLE element HEADING_ROW contains text profile.tools.label.endDateLabel
		
		# Reorder fleet/purchased tool - add to cart with animation
		And Tool Management Page: In TOOLS_TABLE in row 1 IN_ROW_REORDER_BUTTON is visible	
		And Tool Management Page: In TOOLS_TABLE in row 1 click IN_ROW_REORDER_BUTTON
		Then Webshop Main Page: SHOPPING_CART_ANIMATION_POPUP is visible
		And General: Wait 2 seconds
		And Tool Management Page: In TOOLS_TABLE in row 3 click IN_ROW_REORDER_BUTTON
		And General: Wait 2 seconds
		And Webshop Main Page: The SHOPPING_CART contains <summed_up_quantity> items
		When Webshop Main Page: In section HEADER click SHOPPING_CART_BUTTON
		And General: Wait 2 seconds
		Then Cart Page: Section FLEET_PRODUCTS_TABLE_CONTENT is visible
		Then Cart Page: Section STANDARD_PRODUCTS_TABLE_CONTENT is visible
		When General: Go back
		And General: Wait 2 seconds
		
		# verify see details link for available products
		When Tool Management Page: In TOOLS_TABLE in row 1 move cursor to element PRODUCT_IMAGE
		Then Tool Management Page: In TOOLS_TABLE in row 1 SEE_DETAILS_LINK is visible	
		
		# verify see details link not showing for unavailable products
		When Tool Management Page: In TOOLS_TABLE in row 2 move cursor to element PRODUCT_IMAGE
		Then Tool Management Page: In TOOLS_TABLE in row 1 SEE_DETAILS_LINK is not visible	
			
		# SHOW ALL COLUMNS button (HOL-23037)
		When Tool Management Page: Click SHOW_ALL_COLUMNS_BUTTON
		Then Tool Management Page: In section TOOLS_TABLE there is exactly 0 NOT_VISIBLE_COLUMN elements
		And Tool Management Page: In section TOOLS_TABLE element HEADING_ROW contains text profile.tools.label.purchaseDateLabel
		Then Tool Management Page: In TOOLS_TABLE in row 1 remember value of ORG_REFERENCE_VALUE as INITIAL_ORG_REFERENCE
		Then Tool Management Page: In TOOLS_TABLE in row 1 remember value of INV_NUMBER_VALUE as INITIAL_INVENTORY_KEY
			
		# EDIT COLUMNS button (HOL-23037)
		When Tool Management Page: Click EDIT_COLUMNS_BUTTON
		And General: Wait 5 seconds
		Then Tool Management Page: In section EDIT_COLUMNS_OVERLAY there is exactly 9 COLUMN_VISIBILITY_CHECKBOX elements	
		When Tool Management Page: In section EDIT_COLUMNS_OVERLAY click element COLUMN_VISIBILITY_CHECKBOX in position 1
		Then Tool Management Page: In section TOOLS_TABLE there is exactly 1 NOT_VISIBLE_COLUMN elements
		
		# Verify displaying not available products
		And Tool Management Page: In TOOLS_TABLE in row 2 PRODUCT_NO_LONGER_AVAILABLE is visible
		
		# Verify displaying all types of products on the list fleet/purchased/fleet combo/purchased combo 
		And Tool Management Page: Section TOOLS_TABLE contains text profile.tools.label.purchasedType
		And Tool Management Page: Section TOOLS_TABLE contains text profile.tools.label.fleetType
		And Tool Management Page: Section TOOLS_TABLE contains text profile.tools.label.purchasedCombo
		And Tool Management Page: Section TOOLS_TABLE contains text profile.tools.label.fleetCombo
		
		# verify combo row display
		And Tool Management Page: In TOOLS_TABLE in row 5 COMBO_MAINROW is visible
		And Tool Management Page: In TOOLS_TABLE in row 5 COMBO_SUBITEM_ROW is visible
	
		#TODO: The list shows the first 50 tools and the SHOW MORE button in case of more. Next 50 tools gets added after click.

	 
	Examples:
    |	email_address			|	password			|	user_name		|	account_number	|	summed_up_quantity	|
    |	US_fleet_email			|	US_fleet_password	|	US_fleet_name	|	US_fleet_id		|	6					|
     
     
     
       Scenario Outline: Tool Management - Reorder tools list filtering
		
		#Enter the page
		Given General: open webshop for United States
		And Webshop Main Page: If section I_UNDERSTAND_COOKIES is visible click I_UNDERSTAND_BUTTON
		And Webshop Main Page: If section ONE_MORE_THING_BANNER is visible click DO_NOT_ASK_AGAIN_BUTTON
		And Webshop Main Page: If section DO_YOU_NEED_HELP is visible click DONT_ASK_ME_AGAIN_BUTTON
		When Webshop Main Page: In section HEADER element LOG_IN_OR_REGISTER_BUTTON is visible
	    Then Webshop Main Page: In section HEADER click LOG_IN_OR_REGISTER_BUTTON
	    And Webshop Main Page: Section LOG_IN_OR_REGISTER is visible
	    
	    #1-Fill out login
	    When Webshop Main Page: Section LOG_IN_OR_REGISTER contains text LOG IN
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER element LOG_IN_BUTTON is enabled
	    Then Webshop Main Page: In section LOG_IN_OR_REGISTER in field EMAIL_ADDRESS_TEXTFIELD type in <email_address>
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER in field PASSWORD_TEXTFIELD type in <password>
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER element LOG_IN_BUTTON is enabled
	    Then Webshop Main Page: In section LOG_IN_OR_REGISTER click LOG_IN_BUTTON

	    And Webshop Main Page: Section HEADER contains text <user_name>
	    And Webshop Main Page: Section HEADER contains text <account_number> 
		
		When Webshop Main Page: Click REORDER_TOOLS
		And General: Wait 3 seconds
		
		Then Tool Management Page: Section TOOLS_TABLE is visible
		Then Tool Management Page: In section TOOLS_TABLE remember number of ITEM_ROW elements as NUMBER_OF_ALL_ITEMS
		
		# testing purchased only filter
		When Tool Management Page: In section SEARCH_FILTERS_SECTION click FILTER_ONLY_PURCHASED_LABEL
		And General: Wait 1 second
		Then Tool Management Page: Section TOOLS_TABLE contains text profile.tools.label.purchasedCombo
		Then Tool Management Page: Section TOOLS_TABLE contains text profile.tools.label.purchasedType
		And Tool Management Page: Section TOOLS_TABLE not contains text profile.tools.label.fleetCombo
		And Tool Management Page: Section TOOLS_TABLE not contains text profile.tools.label.fleetType
		
		# testing  all types filter
		When Tool Management Page: In section SEARCH_FILTERS_SECTION click FILTER_ALL_TOOLS_LABEL
		And General: Wait 1 second
		Then Tool Management Page: Section TOOLS_TABLE contains text profile.tools.label.purchasedCombo
		Then Tool Management Page: Section TOOLS_TABLE contains text profile.tools.label.purchasedType
		And Tool Management Page: Section TOOLS_TABLE contains text profile.tools.label.fleetCombo
		And Tool Management Page: Section TOOLS_TABLE contains text profile.tools.label.fleetType		
		And Tool Management Page: In section TOOLS_TABLE there is exactly NUMBER_OF_ALL_ITEMS ITEM_ROW elements
		
		# testing fleet only filter
		When Tool Management Page: In section SEARCH_FILTERS_SECTION click FILTER_ONLY_FLEET_LABEL
		And General: Wait 1 second
		Then Tool Management Page: Section TOOLS_TABLE not contains text profile.tools.label.purchasedCombo
		Then Tool Management Page: Section TOOLS_TABLE not contains text profile.tools.label.purchasedType
		And Tool Management Page: Section TOOLS_TABLE contains text profile.tools.label.fleetCombo
		And Tool Management Page: Section TOOLS_TABLE contains text profile.tools.label.fleetType
		
		When Tool Management Page: In section SEARCH_FILTERS_SECTION in field SEARCH_TEXTFIELD type in <listed_product_id>
		And Tool Management Page: In section SEARCH_FILTERS_SECTION click SEARCH_BUTTON
		And General: Wait 2 seconds
		Then Tool Management Page: In section TOOLS_TABLE there is exactly <listed_product_quantity> ITEM_ROW elements
		And Tool Management Page: Section TOOLS_TABLE contains text <listed_product_id>
		
		# inventory key filter (criteria matching already listed product)
		When Tool Management Page: Click FILTER_INVENTORY_KEY
		Then General: Wait 1 second
		And Tool Management Page: In section FILTER_INVENTORY_KEY click element DROPDOWN_VALUE in position 3
		Then General: Wait 1 second
		Then Tool Management Page: In section TOOLS_TABLE there is exactly <listed_product_quantity> ITEM_ROW elements
		
		# org reference filter (criteria not matching any entry in user's tool-list)
		When Tool Management Page: Click FILTER_ORG_REFERENCE
		Then General: Wait 1 second
		And Tool Management Page: In section FILTER_ORG_REFERENCE click element DROPDOWN_VALUE in position 2
		Then General: Wait 1 second
		Then Tool Management Page: Section ALERT_MESSAGE contains text profile.tools.label.NoToolsResultsMessage
		
		# Reset filters button
		When Tool Management Page: In section SEARCH_FILTERS_SECTION click REMOVE_FILTERS
		And General: Wait 2 seconds
		Then Tool Management Page: In section TOOLS_TABLE there is exactly NUMBER_OF_ALL_ITEMS ITEM_ROW elements
		
		# Dates filters
		When Tool Management Page: In section SEARCH_FILTERS_SECTION click START_DATE_PICKER
		When Tool Management Page: Press ENTER on a keyboard
		Then General: Wait 1 second
		When Tool Management Page: In section SEARCH_FILTERS_SECTION click END_DATE_PICKER
		When Tool Management Page: Press ENTER on a keyboard
		Then General: Wait 1 second
		Then Tool Management Page: Section ALERT_MESSAGE contains text profile.tools.label.NoToolsResultsMessage
		When Tool Management Page: In section SEARCH_FILTERS_SECTION click REMOVE_FILTERS
		Then General: Wait 1 second
		Then Tool Management Page: In section TOOLS_TABLE there is exactly NUMBER_OF_ALL_ITEMS ITEM_ROW elements

		
	Examples:
    |	email_address			|	password			|	user_name		|	account_number	|	listed_product_id	|	listed_product_quantity	|
    |	US_fleet_email			|	US_fleet_password	|	US_fleet_name	|	US_fleet_id		|	1092				|	1						|

    

    Scenario Outline: Tool Management - Reorder tools for non-fleet user
		
		#Enter the page
		Given General: open webshop for United States
		And Webshop Main Page: If section I_UNDERSTAND_COOKIES is visible click I_UNDERSTAND_BUTTON
		And Webshop Main Page: If section ONE_MORE_THING_BANNER is visible click DO_NOT_ASK_AGAIN_BUTTON
		And Webshop Main Page: If section DO_YOU_NEED_HELP is visible click DONT_ASK_ME_AGAIN_BUTTON
		When Webshop Main Page: In section HEADER element LOG_IN_OR_REGISTER_BUTTON is visible
	    Then Webshop Main Page: In section HEADER click LOG_IN_OR_REGISTER_BUTTON
	    And Webshop Main Page: Section LOG_IN_OR_REGISTER is visible
	    
	    #1-Fill out login
	    When Webshop Main Page: Section LOG_IN_OR_REGISTER contains text LOG IN
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER element LOG_IN_BUTTON is enabled
	    Then Webshop Main Page: In section LOG_IN_OR_REGISTER in field EMAIL_ADDRESS_TEXTFIELD type in <email_address>
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER in field PASSWORD_TEXTFIELD type in <password>
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER element LOG_IN_BUTTON is enabled
	    Then Webshop Main Page: In section LOG_IN_OR_REGISTER click LOG_IN_BUTTON

	    And Webshop Main Page: Section HEADER contains text <user_name>
	    And Webshop Main Page: Section HEADER contains text <account_number> 
		
		When Webshop Main Page: Click REORDER_TOOLS
		And General: Wait 3 seconds
		
		Then Tool Management Page: Section TOOLS_TABLE is visible
		Then Tool Management Page: Section SEARCH_FILTERS_SECTION is visible
		
		# Filters not available for non-fleet user
		When Tool Management Page: In section SEARCH_FILTERS_SECTION element FILTER_ONLY_PURCHASED_LABEL is not visible
		When Tool Management Page: In section SEARCH_FILTERS_SECTION element FILTER_ALL_TOOLS_LABEL is not visible
		When Tool Management Page: In section SEARCH_FILTERS_SECTION element FILTER_ONLY_FLEET_LABEL is not visible
		When Tool Management Page: In section SEARCH_FILTERS_SECTION element FILTER_ORG_REFERENCE is not visible
		When Tool Management Page: In section SEARCH_FILTERS_SECTION element FILTER_INVENTORY_KEY is not visible
		When Tool Management Page: In section SEARCH_FILTERS_SECTION element START_DATE_PICKER is not visible
		When Tool Management Page: In section SEARCH_FILTERS_SECTION element END_DATE_PICKER is not visible
		
		# only non-fleet links visible in navigation bar
		When Tool Management Page: Click TOOL_MANAGEMENT_BUTTON
		Then Tool Management Page: Section TOOL_MANAGEMENT_LINKS not contains text navigation.account.label.reportLostOrStolen
		Then Tool Management Page: Section TOOL_MANAGEMENT_LINKS not contains text navigation.account.label.reorderLabels
		Then Tool Management Page: Element TOOL_MANAGEMENT_LINKS contains text navigation.account.label.reorderTools
		Then Tool Management Page: Element TOOL_MANAGEMENT_LINKS contains text navigation.account.label.repairTools
		
		# edit columns - only non-fleet related columns available
		When Tool Management Page: Click EDIT_COLUMNS_BUTTON
		Then Tool Management Page: Section EDIT_COLUMNS_OVERLAY not contains text profile.tools.label.serialLabel
		Then Tool Management Page: Section EDIT_COLUMNS_OVERLAY not contains text profile.tools.label.orgRefLabel
		Then Tool Management Page: Section EDIT_COLUMNS_OVERLAY not contains text profile.tools.label.inventoryKeyLabel
		Then Tool Management Page: Section EDIT_COLUMNS_OVERLAY not contains text profile.tools.label.endDateLabel
		Then Tool Management Page: Section EDIT_COLUMNS_OVERLAY contains text profile.tools.label.lastRepairLabel
		Then Tool Management Page: Section EDIT_COLUMNS_OVERLAY contains text profile.tools.label.purchaseDateLabel
		Then Tool Management Page: Section EDIT_COLUMNS_OVERLAY contains text profile.tools.label.noCostPeriodLabel
		
		
	Examples:
    |	email_address			|	password			|	user_name		|	account_number	|
    |	US_user5_email			|	US_user5_password	|	US_user5_name	|	US_user5_id		|