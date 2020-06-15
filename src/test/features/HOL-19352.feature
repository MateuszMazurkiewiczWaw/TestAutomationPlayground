@Sprint2
Feature: HOL-19352 Order History - Details

  Scenario Outline: Order History Details - reviewing and managing order details functionality
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
	    
	    #Reach order history table
	    And General: Wait 1 second
	    Then Webshop Main Page: Section HEADER contains text <user_name>
	    And Webshop Main Page: Section HEADER contains text <user_id> 
	        
		Then Webshop Main Page: Section YOUR_ORDERS is visible		
		When Webshop Main Page: In section YOUR_ORDERS click VIEW_YOUR_ORDER_LIST_LINK
		And Order History Page: ORDER_HISTORY_TABLE is visible
		
		Then Order History Page: Section ORDER_HISTORY is visible
		And Order History Page: Section ORDER_HISTORY contains text account.orderHistory.label.hint
		And  Order History Page: Section SHIPMENT_TRACKING is visible
		And Order History Page: Section SHIPMENT_TRACKING contains text account.orderHistory.label.shipmentTracking
		And Order History Page: REQUEST_COPY_OF_INVOICE_BUTTON is visible
		And Order History Page: Element REQUEST_COPY_OF_INVOICE_BUTTON is disabled
		And Order History Page: REORDER_BUTTON is visible
		And Order History Page: Element REORDER_BUTTON is disabled
		
		#sort to have completed order in first row
		When Order History Page: Click DELIVERY_STATUS_SORT_BUTTON
		And General: Wait 1 second
		
		And Order History Page: In ORDER_HISTORY_TABLE in row 1 remember value of ORDER_NUMBER_COLUMN as ORDER_NUMBER1
		And Order History Page: In ORDER_HISTORY_TABLE in row 1 remember value of TOTAL_PRICE_COLUMN as ORDER_TOTAL1
		Then Order History Page: In ORDER_HISTORY_TABLE in row 1 move cursor to element ORDER_NUMBER_COLUMN
		And Order History Page: In ORDER_HISTORY_TABLE in row 1 click DETAILS_BUTTON
		And General: Wait 1 second
		
		#Checking order details content:
		When Order Details Page: Section HILTI_ORDER_NUMBER contains remembered value ORDER_NUMBER1
		Then Order Details Page: Section HILTI_ORDER_NUMBER contains text account.orderHistoryDetails.label.orderDate
		And Order Details Page: Section HILTI_ORDER_NUMBER contains text account.orderHistoryDetails.label.orderFulfilmentStatus
		And Order Details Page: Section HILTI_ORDER_NUMBER contains text account.orderHistoryDetails.label.orderShippingStatus
		And Order Details Page: Section HILTI_ORDER_NUMBER contains text account.orderHistoryDetails.label.orderTotal
		
		#After discussion with Robert G. we agreed to not check order total price due to tax differences /5.09.2016
		#And Order Details Page: Section HILTI_ORDER_NUMBER contains remembered value ORDER_TOTAL1
		
		And Order Details Page: Section HILTI_ORDER_NUMBER contains text account.orderHistoryDetails.label.orderPoNumber
		And Order Details Page: Section HILTI_ORDER_NUMBER contains text account.orderHistoryDetails.label.orderPurchaser
		And Order Details Page: In section HILTI_ORDER_NUMBER element TRACK_SHIPMENT_BUTTON is enabled
		And Order Details Page: In section HILTI_ORDER_NUMBER element REQUEST_INVOICE_BUTTON is enabled
		When Order Details Page: Click REQUEST_INVOICE_BUTTON
		Then General: Wait 1 second
		
		#Depending on an env. Checking any message box
		And Order Details Page: MESSAGE_BOX is visible
		
		And Order Details Page: BACK_TO_ORDER_HISTORY_LINK is visible
		And Order Details Page: Section HILTI_ORDER_NUMBER contains text account.orderHistoryDetails.label.numberOfShipments
		And General: Scroll to the top
		And General: Wait 1 second
		And Order Details Page: In section HILTI_ORDER_NUMBER element ORDER_DETAILS_DELIVERY_ADDRESS_LINK is visible
		When Order Details Page: In section HILTI_ORDER_NUMBER click ORDER_DETAILS_DELIVERY_ADDRESS_LINK
		Then Order Details Page: Section ORDER_DETAILS_ADDRESS_POPUP is visible
		And Order Details Page: Section ORDER_DETAILS_ADDRESS_POPUP contains text account.orderHistoryDetails.label.deliveryAddressDetails
		And Order Details Page: In section ORDER_DETAILS_ADDRESS_POPUP click ORDER_DETAILS_ADDRESS_CLOSE_BUTTON
		
		And Order Details Page: ORDER_DETAILS_BILLING_INFORMATION_LINK is visible
		When Order Details Page: Click ORDER_DETAILS_BILLING_INFORMATION_LINK
		Then Order Details Page: Section ORDER_DETAILS_BILLING_INFORMATION_POPUP is visible
		#And Order Details Page: Section ORDER_DETAILS_BILLING_INFORMATION_POPUP contains text Payment method:
		And Order Details Page: In section ORDER_DETAILS_BILLING_INFORMATION_POPUP click ORDER_DETAILS_BILLING_CLOSE_BUTTON
		
		#Checking the table
		When Order Details Page: Section YOUR_PURCHASED_ITEMS is visible
		
		And Order Details Page: ORDER_DETAILS_TABLE is visible
		And Order Details Page: In section YOUR_PURCHASED_ITEMS element ORDER_DETAILS_REORDER_BUTTON is visible
		And Order Details Page: Element ORDER_DETAILS_REORDER_BUTTON is disabled
		And Order Details Page: In section ORDER_DETAILS_TABLE element SELECT_ALL_NONE_CHECKBOX is visible
		And Order Details Page: In section ORDER_DETAILS_TABLE click SELECT_ALL_NONE_CHECKBOX
		Then Order Details Page: Element ORDER_DETAILS_REORDER_BUTTON is enabled
		And Order Details Page: In section ORDER_DETAILS_TABLE click SELECT_ALL_NONE_CHECKBOX
		#And Order Details Page: Element ORDER_DETAILS_REORDER_BUTTON is disabled
		
		When Order Details Page: In ORDER_DETAILS_TABLE_CONTENT in row 1 check ITEM_PURCHASED_CHECKBOX
		Then Order Details Page: Element ORDER_DETAILS_REORDER_BUTTON is enabled
		And Webshop Main Page: The SHOPPING_CART contains 0 items
		And Order Details Page: Click ORDER_DETAILS_REORDER_BUTTON
		And Order Details Page: SUCCESS_MESSAGE_BOX is visible
		And Order Details Page: Element SUCCESS_MESSAGE_BOX contains text account.orderHistoryDetails.message.success.reorder
		And Webshop Main Page: The SHOPPING_CART contains more than 0 items
		And Order Details Page: In ORDER_DETAILS_TABLE_CONTENT in row 1 move cursor to element PRODUCT_DESCRIPTION_COLUMN
		And Order Details Page: In ORDER_DETAILS_TABLE_CONTENT row 1 contains text account.orderHistoryDetails.label.seeProductDetails
		
		When Order Details Page: Section ORDER_DETAILS_TABLE_CONTENT contains remembered value ORDER_TOTAL1
		
		#After discussion with Robert G. we agreed to not check order total price due to tax differences /5.09.2016
		#Then Order Details Page: In ORDER_DETAILS_TABLE element TOTAL_ORDER_SUM contains remembered value ORDER_TOTAL1
		
		And Order Details Page: Section ORDER_DETAILS_TABLE contains text account.orderHistoryDetails.label.subtotal
		And Order Details Page: Section ORDER_DETAILS_TABLE contains text account.orderHistoryDetails.label.shippingCharge
		And Order Details Page: Section ORDER_DETAILS_TABLE contains text account.orderHistoryDetails.label.vat
		And Order Details Page: Section TRACK_YOUR_SHIPMENTS_SEPERATELY is visible
		
		When Order Details Page: ORDER_HISTORY_EDIT_COLUMNS_BUTTON is not visible
		And Order Details Page: In ORDER_DETAILS_TABLE element ITEM_QUANTITY_COLUMN is visible
		And Order Details Page: In ORDER_DETAILS_TABLE element PRODUCT_DESCRIPTION_WHOLE_COLUMN is visible
		And Order Details Page: In ORDER_DETAILS_TABLE element CANCELLATION_REASON_COLUMN is visible
		And Order Details Page: In ORDER_DETAILS_TABLE element ORDER_FULFILLMENT_STATUS_COLUMN is visible
		And Order Details Page: In ORDER_DETAILS_TABLE element ITEM_STATUS_COLUMN is visible
		And Order Details Page: In ORDER_DETAILS_TABLE element ORDER_TOTAL_COLUMN is visible
		And General: Set browser window dimension to 550x850
		
		When Order Details Page: ORDER_HISTORY_EDIT_COLUMNS_BUTTON is visible
		Then Order Details Page: Click ORDER_HISTORY_EDIT_COLUMNS_BUTTON
		And Order Details Page: ORDER_HISTORY_EDIT_COLUMNS_MENU is visible
		And General: Wait 1 second
		When Order Details Page: In section ORDER_HISTORY_EDIT_COLUMNS_MENU check ITEM_STATUS_CHECKBOX
		Then Order Details Page: In ORDER_DETAILS_TABLE element ITEM_STATUS_COLUMN is visible
		
		When Order Details Page: In section ORDER_HISTORY_EDIT_COLUMNS_MENU check ITEM_QUANTITY_CHECKBOX
		Then Order Details Page: In ORDER_DETAILS_TABLE element ITEM_QUANTITY_COLUMN is visible
		
		When Order Details Page: In section ORDER_HISTORY_EDIT_COLUMNS_MENU uncheck ITEM_STATUS_CHECKBOX
		Then Order Details Page: In ORDER_DETAILS_TABLE element ITEM_STATUS_COLUMN is not visible
		
		When Order Details Page: In section ORDER_HISTORY_EDIT_COLUMNS_MENU uncheck ITEM_QUANTITY_CHECKBOX
		Then Order Details Page: In ORDER_DETAILS_TABLE element ITEM_QUANTITY_COLUMN is not visible
		
		When Order Details Page: In section ORDER_HISTORY_EDIT_COLUMNS_MENU click EDIT_COLUMNS_CLOSE_BUTTON
		Then Order Details Page: ORDER_HISTORY_EDIT_COLUMNS_MENU is not visible
		
		When Order Details Page: SHOW_ALL_COLUMNS_BUTTON is visible
		Then Order Details Page: Click SHOW_ALL_COLUMNS_BUTTON
		And Order Details Page: In ORDER_DETAILS_TABLE element ITEM_QUANTITY_COLUMN is visible
		And Order Details Page: In ORDER_DETAILS_TABLE element PRODUCT_DESCRIPTION_WHOLE_COLUMN is visible
		And Order Details Page: In ORDER_DETAILS_TABLE element CANCELLATION_REASON_COLUMN is visible
		And Order Details Page: In ORDER_DETAILS_TABLE element ORDER_FULFILLMENT_STATUS_COLUMN is visible
		And Order Details Page: In ORDER_DETAILS_TABLE element ITEM_STATUS_COLUMN is visible
		And Order Details Page: In ORDER_DETAILS_TABLE element ORDER_TOTAL_COLUMN is visible

		
	Examples:
      	|	email_address	|	password			|	user_name		|	user_id		|
		|	US_user_email	|	US_user_password	|	US_user_name	|	US_user_id	|   
