@Sprint6 
Feature: HOL-20201 and HOL-20185 and HOL-20193 - Repair Tool List

  Scenario Outline: Repair Tool List
		
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
		
		When Webshop Main Page: Click REPAIR_TOOLS
		And General: Wait 3 seconds
		
		# Check initial state of table (HOL-23037)
		Then Tool Management Page: Section TOOLS_TABLE is visible
		And Tool Management Page: Section TOOLS_TABLE contains text profile.tools.label.fleetCombo
		And Tool Management Page: Section TOOLS_TABLE contains text profile.tools.label.fleetType
		And Tool Management Page: In section TOOLS_TABLE there is exactly 15 VISIBLE_COLUMN elements
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
		And Tool Management Page: In section TOOLS_TABLE element HEADING_ROW contains text profile.tools.label.lastRepairLabel
		And Tool Management Page: In section TOOLS_TABLE element HEADING_ROW contains text profile.tools.label.purchaseDateLabel	
		And Tool Management Page: In section TOOLS_TABLE element HEADING_ROW contains text profile.tools.label.noCostPeriodLabel
		And Tool Management Page: In section TOOLS_TABLE element HEADING_ROW contains text profile.tools.label.theftCoverageLabel
		And Tool Management Page: In section TOOLS_TABLE element HEADING_ROW contains text profile.tools.label.durationLabel
		And Tool Management Page: In section TOOLS_TABLE element HEADING_ROW contains text profile.tools.label.contractTypeLabel
			
		# EDIT COLUMNS button (HOL-23037)
		When Tool Management Page: Click EDIT_COLUMNS_BUTTON
		And General: Wait 5 seconds
		Then Tool Management Page: In section EDIT_COLUMNS_OVERLAY there is exactly 9 COLUMN_VISIBILITY_CHECKBOX elements	
		When Tool Management Page: In section EDIT_COLUMNS_OVERLAY click element COLUMN_VISIBILITY_CHECKBOX in position 1
		Then Tool Management Page: In section TOOLS_TABLE there is exactly 1 NOT_VISIBLE_COLUMN elements
			
		# Repair Button activation 
		When Tool Management Page: Element REPAIR_BUTTON is disabled
		When Tool Management Page: In section TOOLS_TABLE click element TABLE_ITEM_CHECKBOX_LABEL in position 1
		Then General: Wait 1 second
		Then Tool Management Page: Element REPAIR_BUTTON is enabled
		
		# report lost/stolen form
		When Tool Management Page: Click REPAIR_BUTTON
		Then General: Wait 7 second
		Then Tool Management Page: Element ORG_REFERENCE_REPAIR contains remembered value INITIAL_ORG_REFERENCE
		Then Tool Management Page: Element INVENTORY_KEY_REPAIR contains remembered value INITIAL_INVENTORY_KEY				
		
		# elements visibility on repair form 
		Then Tool Management Page: In section REPAIR_REQUEST_FORM element REPAIR_RADIO_LABEL is visible
		Then Tool Management Page: In section REPAIR_REQUEST_FORM element CALIBRATION_RADIO_LABEL is visible
		Then Tool Management Page: In section REPAIR_REQUEST_FORM element TOOL_IN_CASE_RADIO_LABEL is visible
		Then Tool Management Page: In section REPAIR_REQUEST_FORM element TOOL_NOT_IN_CASE_RADIO_LABEL is visible
				
		Then Tool Management Page: In section REPAIR_REQUEST_FORM element TOOL_IN_CASE_INFO_ICON is visible
		Then Tool Management Page: In section REPAIR_REQUEST_FORM element REPAIR_DESCRIPTION is visible
		Then Tool Management Page: In section REPAIR_REQUEST_FORM element REPAIR_CHECKBOX_1 is visible
		Then Tool Management Page: In section REPAIR_REQUEST_FORM element REPAIR_CHECKBOX_2 is visible
		Then Tool Management Page: In section REPAIR_REQUEST_FORM element REPAIR_CHECKBOX_3 is visible
		Then Tool Management Page: In section REPAIR_REQUEST_FORM element REPAIR_CHECKBOX_4 is visible
		Then Tool Management Page: In section REPAIR_REQUEST_FORM element REPAIR_CHECKBOX_5 is visible
		Then Tool Management Page: In section REPAIR_REQUEST_FORM element REPAIR_CHECKBOX_6 is visible
		Then Tool Management Page: In section REPAIR_REQUEST_FORM element COSTS_INFO_ICON is visible
		Then Tool Management Page: In section REPAIR_REQUEST_FORM element REPAIR_COST_SECTION contains text account.toolManagementRequestRepairForm.placeholder.noCost
		Then Tool Management Page: In section REPAIR_REQUEST_FORM element SEND_REPAIR_REQUEST_BUTTON is visible
		Then Tool Management Page: In section REPAIR_REQUEST_FORM element REPAIR_ORDER_INFORMATION is visible
		Then Tool Management Page: In section REPAIR_ORDER_INFORMATION element PURCHASE_ORDER_NUMBER is visible
		Then Tool Management Page: In section REPAIR_ORDER_INFORMATION element NUMBER_OF_PACKAGES is visible
		Then Tool Management Page: In section REPAIR_ORDER_INFORMATION element ADDITIONAL_INFORMATION is visible
		Then Tool Management Page: In section REPAIR_ORDER_INFORMATION element YOUR_TOOL_PICKUP_ADDRESS is visible
		Then Tool Management Page: In section REPAIR_ORDER_INFORMATION element YOUR_TOOL_PICKUP_CONTACT is visible
		Then Tool Management Page: In section REPAIR_ORDER_INFORMATION element YOUR_DELIVERY_ADDRESS is visible
		Then Tool Management Page: In section REPAIR_ORDER_INFORMATION element YOUR_DELIVERY_CONTACT is visible
		Then Tool Management Page: Section REPAIR_HEADER contains text account.toolManagementRequestRepairForm.label.text
		Then Tool Management Page: Section REPAIR_HEADER contains text account.toolManagementRequestRepairForm.label.header

		# cost info icon
		When Tool Management Page: In section REPAIR_COST_SECTION click INFO_ICON		
		And General: Wait 1 second
		Then Tool Management Page: Element COSTS_INFO_OVERLAY contains text account.toolManagementRequestRepairForm.label.form.costsTooltip
		Then Tool Management Page: In section COSTS_INFO_OVERLAY click CLOSE
		
		# pickup address info icon
		When Tool Management Page: In section YOUR_TOOL_PICKUP_ADDRESS click INFO_ICON 
		And General: Wait 1 second
		Then Tool Management Page: Element PICKUP_ADDRESS_INFO_OVERLAY contains text account.toolManagementRepairForm.tooltip.contact
		Then Tool Management Page: In section PICKUP_ADDRESS_INFO_OVERLAY click CLOSE
		
		# delivery info icon	
		When Tool Management Page: In section YOUR_DELIVERY_ADDRESS click INFO_ICON 
		And General: Wait 1 second
		Then Tool Management Page: Element DELIVERY_ADDRESS_INFO_OVERLAY contains text account.toolManagementRepairForm.tooltip.delivery
		Then Tool Management Page: In section DELIVERY_ADDRESS_INFO_OVERLAY click CLOSE
		
		# fill all fields and submit successful repair request
		When Tool Management Page: In element REPAIR_DESCRIPTION type in 100 random characters
		And Tool Management Page: In section REPAIR_ORDER_INFORMATION in field PURCHASE_ORDER_NUMBER type in 1234567890
		And Tool Management Page: In section REPAIR_ORDER_INFORMATION in field NUMBER_OF_PACKAGES type in 5
		And Tool Management Page: In section REPAIR_ORDER_INFORMATION in field ADDITIONAL_INFORMATION type in 1234567890 qwertyuiopasdfghjkl
		And Tool Management Page: Check REPAIR_CHECKBOX_1
		And Tool Management Page: Click SEND_REPAIR_REQUEST_BUTTON
		And General: Wait 5 seconds
		Then Tool Management Page: Element REPAIR_SUCCESSS_MESSAGE contains text account.toolManagementRequestRepairForm.label.successMessageHeadline
		
		# another report - purchased product
		When Tool Management Page: In section TOOLS_TABLE click element TABLE_ITEM_CHECKBOX_LABEL in position 3
		Then General: Wait 1 second
		When Tool Management Page: Click REPAIR_BUTTON
		And General: Wait 5 seconds

		# submit failing request without giving max cost of repair (purchased product) 
		When Tool Management Page: In section REPAIR_ORDER_INFORMATION in field PURCHASE_ORDER_NUMBER type in 1234567890
		When Tool Management Page: In section REPAIR_COST_SECTION click DROPDOWN_LIST
		Then General: Wait 1 second
		And Tool Management Page: In section REPAIR_COST_SECTION click element DROPDOWN_VALUE in position 3
		And Tool Management Page: Click SEND_REPAIR_REQUEST_BUTTON
		And General: Wait 3 seconds
		Then Tool Management Page: Element REPAIR_ERROR_MESSAGE contains text account.toolManagementRequestRepairForm.message.error.invalidCostLimit
		Then Tool Management Page: Element REPAIR_COST_SECTION contains text common.message.error.required
		And General: Wait 1 seconds
		
		# fill cost limit and retry to send request - successful
		And Tool Management Page: In section REPAIR_COST_SECTION in field REPAIR_WHEN_BELOW_LIMIT type in 100
		And Tool Management Page: Click SEND_REPAIR_REQUEST_BUTTON
		And General: Wait 5 seconds
		Then Tool Management Page: Element REPAIR_SUCCESSS_MESSAGE contains text account.toolManagementRequestRepairForm.label.successMessageHeadline
		
		# repair multiple items and combo item and change addresses/contacts
		When Tool Management Page: In section TOOLS_TABLE click element TABLE_ITEM_CHECKBOX_LABEL in position 4
		When Tool Management Page: In section TOOLS_TABLE click element TABLE_ITEM_CHECKBOX_LABEL in position 6		
		When Tool Management Page: Click REPAIR_BUTTON
		And General: Wait 5 seconds
		Then Tool Management Page: In section TOOL_REPAIR_REQUEST there is exactly 2 REPAIR_REQUEST_FORM elements
		When Tool Management Page: Click CALIBRATION_RADIO_LABEL
		When Tool Management Page: Click TOOL_IN_CASE_RADIO_LABEL
		When Tool Management Page: Click TOOL_NOT_IN_CASE_RADIO_LABEL
		When Tool Management Page: In section REPAIR_ORDER_INFORMATION in field PURCHASE_ORDER_NUMBER type in 1234567890
		#change pickup address
		When Tool Management Page: In section YOUR_TOOL_PICKUP_ADDRESS click DROPDOWN_LIST
		Then General: Wait 1 second
		And Tool Management Page: In section YOUR_TOOL_PICKUP_ADDRESS click element DROPDOWN_VALUE in position 1
		#change pickup contact
		When Tool Management Page: In section YOUR_TOOL_PICKUP_CONTACT click DROPDOWN_LIST
		Then General: Wait 1 second
		And Tool Management Page: In section YOUR_TOOL_PICKUP_CONTACT click element DROPDOWN_VALUE in position 1
		#change delivery address
		When Tool Management Page: In section YOUR_DELIVERY_ADDRESS click DROPDOWN_LIST
		Then General: Wait 1 second
		And Tool Management Page: In section YOUR_DELIVERY_ADDRESS click element DROPDOWN_VALUE in position 1
		#change delivery contact
		When Tool Management Page: In section YOUR_DELIVERY_CONTACT click DROPDOWN_LIST
		Then General: Wait 1 second
		And Tool Management Page: In section YOUR_DELIVERY_CONTACT click element DROPDOWN_VALUE in position 1
		#select some chceckboxes
		Then Tool Management Page: In section REPAIR_REQUEST_FORM click REPAIR_CHECKBOX_1
		Then Tool Management Page: In section REPAIR_REQUEST_FORM click REPAIR_CHECKBOX_3
		#sumbit request
		And Tool Management Page: Click SEND_REPAIR_REQUEST_BUTTON
		And General: Wait 5 seconds
		Then Tool Management Page: Element REPAIR_SUCCESSS_MESSAGE contains text account.toolManagementRequestRepairForm.label.successMessageHeadline

		# user wants to go back to tool list 
		When Tool Management Page: In section TOOLS_TABLE click element TABLE_ITEM_CHECKBOX_LABEL in position 1
		Then General: Wait 1 second
		When Tool Management Page: Click REPAIR_BUTTON
		And General: Wait 5 seconds
		When Tool Management Page: Click BACK_TO_TOOLLIST_BUTTON
		And General: Wait 2 seconds
		Then Tool Management Page: Section TOOLS_TABLE is visible


	Examples:
    |	email_address			|	password			|	user_name		|	account_number	|
     |	US_fleet_email			|	US_fleet_password	|	US_fleet_name	|	US_fleet_id		|
      
     

       Scenario Outline: Tool Management - Repair Tool list filtering
		
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
		
		When Webshop Main Page: Click REPAIR_TOOLS
		And General: Wait 3 seconds
		
		Then Tool Management Page: Section TOOLS_TABLE is visible
		Then Tool Management Page: In section TOOLS_TABLE remember number of ITEM_ROW elements as NUMBER_OF_ALL_ITEMS
		
		# testing purchased only filter
		When Tool Management Page: In section SEARCH_FILTERS_SECTION click FILTER_ONLY_PURCHASED_LABEL
		And General: Wait 3 seconds
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
		Then Tool Management Page: Section ALERT_MESSAGE contains text profile.tools.label.noResultsMessage
		
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
		Then Tool Management Page: Section ALERT_MESSAGE contains text profile.tools.label.noResultsMessage
		When Tool Management Page: In section SEARCH_FILTERS_SECTION click REMOVE_FILTERS
		Then General: Wait 1 second
		Then Tool Management Page: In section TOOLS_TABLE there is exactly NUMBER_OF_ALL_ITEMS ITEM_ROW elements

		
	Examples:
    |	email_address			|	password			|	user_name		|	account_number	|	listed_product_id	|	listed_product_quantity	|
    |	US_fleet_email			|	US_fleet_password	|	US_fleet_name	|	US_fleet_id		|	1092				|	1						|