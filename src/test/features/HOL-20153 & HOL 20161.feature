@Sprint6 
Feature: HOL-20153 & HOL-20161 - Reorder labels in Tool List

  Scenario Outline: Reorder labels in Tool List
		
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
		
		When Webshop Main Page: Click REORDER_LABELS
		And General: Wait 3 seconds
		
		# Check initial state of table (HOL-23037)
		Then Tool Management Page: Section TOOLS_TABLE is visible
		And Tool Management Page: Section TOOLS_TABLE contains text profile.tools.label.fleetCombo
		And Tool Management Page: Section TOOLS_TABLE contains text profile.tools.label.fleetType
		And Tool Management Page: In section TOOLS_TABLE there is exactly 13 VISIBLE_COLUMN elements
		And Tool Management Page: In section TOOLS_TABLE element HEADING_ROW contains text profile.tools.label.typeLabel
		And Tool Management Page: In section TOOLS_TABLE element HEADING_ROW contains text profile.tools.label.nameLabel
		And Tool Management Page: In section TOOLS_TABLE element HEADING_ROW contains text profile.tools.label.serialLabel
		And Tool Management Page: In section TOOLS_TABLE element HEADING_ROW contains text profile.tools.label.orgRefLabel
		And Tool Management Page: In section TOOLS_TABLE element HEADING_ROW contains text profile.tools.label.inventoryKeyLabel
		And Tool Management Page: In section TOOLS_TABLE element HEADING_ROW contains text profile.tools.label.endDateLabel
		
		# SHOW ALL COLUMNS button (HOL-23037)
		When Tool Management Page: Click SHOW_ALL_COLUMNS_BUTTON
		Then Tool Management Page: In section TOOLS_TABLE there is exactly 0 NOT_VISIBLE_COLUMN elements
		Then Tool Management Page: In TOOLS_TABLE in row 1 remember value of ORG_REFERENCE_VALUE as INITIAL_ORG_REFERENCE
		Then Tool Management Page: In TOOLS_TABLE in row 1 remember value of INV_NUMBER_VALUE as INITIAL_INVENTORY_KEY
			
		# EDIT COLUMNS button (HOL-23037)
		When Tool Management Page: Click EDIT_COLUMNS_BUTTON
		And General: Wait 5 seconds
		Then Tool Management Page: In section EDIT_COLUMNS_OVERLAY there is exactly 7 COLUMN_VISIBILITY_CHECKBOX elements	
		When Tool Management Page: In section EDIT_COLUMNS_OVERLAY click element COLUMN_VISIBILITY_CHECKBOX in position 1
		Then Tool Management Page: In section TOOLS_TABLE there is exactly 1 NOT_VISIBLE_COLUMN elements
		
		# CSV Download link (HOL-20153)
		Then Tool Management Page: FLEET_TOOLS_LIST_DOWNLOAD_LINK is visible
		
		# Reorder Button activation (HOL-20153)
		When Tool Management Page: Element REORDER_LABELS_BUTTON is disabled
		When Tool Management Page: In section TOOLS_TABLE click element TABLE_ITEM_CHECKBOX_LABEL in position 1
		Then General: Wait 1 second
		Then Tool Management Page: Element REORDER_LABELS_BUTTON is enabled
		
		# changing labels
		When Tool Management Page: Click REORDER_LABELS_BUTTON
		Then General: Wait 5 second
		Then Tool Management Page: In section REORDER_LABELS_FORM element ORG_REFERENCE_TEXTFIELD contains remembered value INITIAL_ORG_REFERENCE
		Then Tool Management Page: In section REORDER_LABELS_FORM element INVENTORY_KEY_TEXTFIELD contains remembered value INITIAL_INVENTORY_KEY				
		When Tool Management Page: In section REORDER_LABELS_FORM in field ORG_REFERENCE_TEXTFIELD type and remember 18_RANDOM_CHARACTERS as NEW_ORG_REFERENCE
		When Tool Management Page: In section REORDER_LABELS_FORM in field INVENTORY_KEY_TEXTFIELD type and remember 18_RANDOM_CHARACTERS as NEW_INVENTORY_KEY
		When Tool Management Page: In section REORDER_LABELS_FORM in field ADDITIONAL_INFO type in 1234567890qwertyuiopasdfghjklzxcvbnm 
		
		# user wants to change their delivery address
		When Tool Management Page: Click CHOOSE_DELIVERY_ADDRESS
		And Tool Management Page: In section REORDER_LABELS_FORM in field SEARCH_ADDRESS_FIELD type in bassin
		And Tool Management Page: Click FIRST_AVAILABLE_ADDRESS
		
		# user wants to change their delivery contact 
	 	When Tool Management Page: Click CHOOSE_DELIVERY_CONTACT
		And Tool Management Page: In section REORDER_LABELS_FORM in field SEARCH_CONTACT_FIELD type in tl
		And Tool Management Page: Click FIRST_AVAILABLE_CONTACT
		
		# submit label request
		Then Tool Management Page: In section REORDER_LABELS_FORM click SUBMIT_LABEL_REQUEST
		And General: Wait 3 seconds
		Then Tool Management Page: Element MESSAGE contains text account.toolManagementReorderLabelForm.label.successMessage

		# verify delivery address more info
		And Tool Management Page: Scroll to TOOLS_TABLE
		When Tool Management Page: In section TOOLS_TABLE click element TABLE_ITEM_CHECKBOX_LABEL in position 1
		Then Tool Management Page: Click REORDER_LABELS_BUTTON
		And General: Wait 5 seconds
		When Tool Management Page: Click DELIVERY_ADDRESS_INFO_ICON
		Then Tool Management Page: Element DELIVERY_ADDRESS_INFO_POPUP contains text account.toolManagementRepairForm.tooltip.delivery
		When Tool Management Page: Click CLOSE_POPUP
		
		# user wants to go back to tool list 
		When Tool Management Page: Click BACK_TO_TOOLLIST_BUTTON
		And General: Wait 2 seconds
		Then Tool Management Page: Section TOOLS_TABLE is visible
		Then Tool Management Page: LIST_OF_ALL_FLEET_TOOLS is visible
		

	 
	Examples:
    |	email_address			|	password			|	user_name		|	account_number	|
     |	US_fleet_email			|	US_fleet_password	|	US_fleet_name	|	US_fleet_id		|
     
     
     
     Scenario Outline: Tool Management - Reorder Labels list filtering
		
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
		
		When Webshop Main Page: Click REORDER_LABELS
		And General: Wait 3 seconds
		
		Then Tool Management Page: Section TOOLS_TABLE is visible
		Then Tool Management Page: In section TOOLS_TABLE remember number of ITEM_ROW elements as NUMBER_OF_ALL_ITEMS
		
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
