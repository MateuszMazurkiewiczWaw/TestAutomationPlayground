@Sprint3
Feature: HOL-20545 Standard Check out: Delivery information

    Scenario Outline: Standard Check out: Delivery information
		
		#Get to the Check In STEP-2 section.
	    #1-Fill out login
	    Given General: open webshop for United States
		And Webshop Main Page: If section I_UNDERSTAND_COOKIES is visible click I_UNDERSTAND_BUTTON
		And Webshop Main Page: If section ONE_MORE_THING_BANNER is visible click DO_NOT_ASK_AGAIN_BUTTON
		And Webshop Main Page: If section DO_YOU_NEED_HELP is visible click DONT_ASK_ME_AGAIN_BUTTON
		When Webshop Main Page: In section HEADER element LOG_IN_OR_REGISTER_BUTTON is visible
	    Then Webshop Main Page: In section HEADER click LOG_IN_OR_REGISTER_BUTTON
	    And Webshop Main Page: Section LOG_IN_OR_REGISTER is visible
	    #1-Fill out login
	    When Webshop Main Page: Section LOG_IN_OR_REGISTER contains text common.login.label.header
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER element LOG_IN_BUTTON is enabled
	    Then Webshop Main Page: In section LOG_IN_OR_REGISTER in field EMAIL_ADDRESS_TEXTFIELD type in <email_address>
	   	And Webshop Main Page: In section LOG_IN_OR_REGISTER in field PASSWORD_TEXTFIELD type in <password>
	    And Webshop Main Page: In section LOG_IN_OR_REGISTER element LOG_IN_BUTTON is enabled
	    Then Webshop Main Page: In section LOG_IN_OR_REGISTER click LOG_IN_BUTTON
	   
	    And Webshop Main Page: Section HEADER contains text <user_name>
	    And Webshop Main Page: Section HEADER contains text <user_id>
	    
		When Webshop Main Page: In section HEADER element SHOPPING_CART_BUTTON is visible
	    Then Webshop Main Page: In section HEADER click SHOPPING_CART_BUTTON
	    Then Cart Page: Section QUICK_ITEM_ENTRY is visible
		And Cart Page: In section SHOPPING_CART_HEADER element CONTINUE_SHOPPING_LINK is visible
	 	And Cart Page: In section QUICK_ITEM_ENTRY element QUICK_ITEM_ENTRY_TEXTFIELD is visible
	 	And Cart Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <STANDARD_PRODUCT1>
	 	And Cart Page: Press ENTER on a keyboard
	 	And Cart Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <STANDARD_PRODUCT2>
	 	And Cart Page: Click ADD_TO_CART_BUTTON

		Then Cart Page: Section STANDARD_PRODUCTS_TABLE is visible
		And Webshop Main Page: The SHOPPING_CART contains <summed_up_quantity> items
	 	And Cart Page: In section SHOPPING_CART_HEADER click CHECK_OUT_BUTTON   
	 	And General: Wait 3 seconds		
	 	Then Checkout Delivery Page: Section DELIVERY_ADDRESS_FORM is visible
	 	
	 	#Check back to previous step button
		When Checkout Delivery Page: In section DELIVERY_ADDRESS_FORM click BACK_TO_PREVIOUS_STEP_BUTTON
		Then Cart Page: Section SHOPPING_CART_HEADER is visible
		When Cart Page: In section SHOPPING_CART_HEADER click CHECK_OUT_BUTTON
		And General: Wait 3 seconds	
		Then Checkout Delivery Page: Section DELIVERY_ADDRESS_FORM is visible
		
		#Delivery information form
   		#Check Delivery address part (1)
		When Checkout Delivery Page: In section DELIVERY_ADDRESS_FORM click TAX_EXEMPT_BUTTON
		And Checkout Delivery Page: Section TAX_EXEMPT_POPUP is visible
		And Checkout Delivery Page: Section TAX_EXEMPT_POPUP contains text checkout.delivery.label.taxExemptTooltip
		When Checkout Delivery Page: In section DELIVERY_ADDRESS_FORM click TAX_EXEMPT_BUTTON
		And General: Wait 1 second
		And Checkout Delivery Page: Section TAX_EXEMPT_POPUP is not visible
		When Checkout Delivery Page: In section DELIVERY_ADDRESS_FORM element ADDRESS_RADIOBUTTON in position 1 is selected
		
		#Click Change Delivery address button
		Then Checkout Delivery Page: In section DELIVERY_ADDRESS_FORM click CHANGE_DELIVERY_ADDRESS_BUTTON
		And Checkout Delivery Page: CHANGE_DELIVERY_ADDRESS_POPUP is visible
		And Checkout Delivery Page: Element CHANGE_DELIVERY_ADDRESS_POPUP contains text checkout.deliveryAddressOverlay.label.title
		And Checkout Delivery Page: Close CHANGE_DELIVERY_ADDRESS_POPUP
		And General: Wait 1 second
		Then Checkout Delivery Page: CHANGE_DELIVERY_ADDRESS_POPUP is not visible
		
		#Click Ship to a hybris Center button
		Then Checkout Delivery Page: In section DELIVERY_ADDRESS_FORM click SHIP_TO_A_hybris_CENTER_RADIOBUTTON
		And Checkout Delivery Page: STORELOCATOR_POPUP is visible
		And Checkout Delivery Page: Element STORELOCATOR_POPUP contains text storelocator.label.title
		And Checkout Delivery Page: Close STORELOCATOR_POPUP
		And General: Wait 1 second
		Then Checkout Delivery Page: STORELOCATOR_POPUP is not visible
		
		#Check out the presence of CHANGE_DELIVERY CONTACT button
		When Checkout Delivery Page: In section DELIVERY_ADDRESS_FORM click CHANGE_DELIVERY_CONTACT_BUTTON
		And Checkout Delivery Page: CHANGE_DELIVERY_CONTACT_POPUP is visible
		And Checkout Delivery Page: Element CHANGE_DELIVERY_CONTACT_POPUP contains text checkout.deliveryContactOverlay.label.title
		And Checkout Delivery Page: Close CHANGE_DELIVERY_CONTACT_POPUP
		And General: Wait 1 second
		Then Checkout Delivery Page: CHANGE_DELIVERY_CONTACT_POPUP is not visible
		
		#Check on Carrier Instructions
		When Checkout Delivery Page: In section DELIVERY_ADDRESS_FORM element CARRIER_INSTRUCTIONS_TEXTFIELD is visible
		Then Checkout Delivery Page: In element CARRIER_INSTRUCTIONS_TEXTFIELD type in 85 random characters
		And Checkout Delivery Page: Section DELIVERY_ADDRESS_FORM contains text checkout.delivery.label.carrierHint
		And Checkout Delivery Page: Section DELIVERY_ADDRESS_FORM contains text checkout.delivery.label.carrierCopy
		
		#Check the Shipping Method part (2)
		When Checkout Delivery Page: In section DELIVERY_ADDRESS_FORM element DELIVERY_RADIOBUTTON in position 1 is selected
		Then Checkout Delivery Page: In section STANDARD_DELIVERY element DATE_PICKER is visible
		And Checkout Delivery Page: In section STANDARD_DELIVERY element DELIVERY_SHIPPING_PRICE is visible
		#And Checkout Delivery Page: Section STANDARD_DELIVERY contains text checkout.pickupLocation.label.standardDelivery
		And Checkout Delivery Page: Section STANDARD_DELIVERY contains text checkout.delivery.label.datepickerHint
		
		When Checkout Delivery Page: In section DELIVERY_ADDRESS_FORM click COURIER_NEXT_DAY_BY_NOON_DELIVERY	
		Then Checkout Delivery Page: In section DELIVERY_ADDRESS_FORM element DELIVERY_RADIOBUTTON in position 3 is selected	
		Then Checkout Delivery Page: In section COURIER_NEXT_DAY_BY_NOON_DELIVERY element DATE_PICKER is visible
		And General: Wait 1 second
		And Checkout Delivery Page: In section COURIER_NEXT_DAY_BY_NOON_DELIVERY click DATE_PICKER
		Then Checkout Delivery Page: In section COURIER_NEXT_DAY_BY_NOON_DELIVERY element CALENDAR_POPUP is visible
		
		#Adding Later delivery date-To be added
		Then Checkout Delivery Page: In section COURIER_NEXT_DAY_BY_NOON_DELIVERY click CALENDAR_POPUP_CLOSE_BUTTON
		When Checkout Delivery Page: Section DELIVERY_ADDRESS_FORM contains element REQUEST_SINGLE_SHIPMENT_CHECKBOX
		And Checkout Delivery Page: Section DELIVERY_ADDRESS_FORM contains text checkout.delivery.label.singleDeliveryHint
		Then Checkout Delivery Page: In section DELIVERY_ADDRESS_FORM click REQUEST_SINGLE_SHIPMENT_CHECKBOX
		And Checkout Delivery Page: Section DELIVERY_ADDRESS_FORM contains text checkout.delivery.label.shippingWeightNote
		And Checkout Delivery Page: Section DELIVERY_ADDRESS_FORM contains text checkout.delivery.label.shippingNote
		When Checkout Delivery Page: Click INFORMATION_BUTTON
		And Checkout Delivery Page: Section INFORMATION_POPUP is visible
		And Checkout Delivery Page: Section INFORMATION_POPUP contains text checkout.delivery.label.shippingTooltipContent
		
		#Check Continue Button
		And Checkout Delivery Page: In section DELIVERY_ADDRESS_FORM click CONTINUE_BUTTON
		Then Checkout Billing Page: Section BILLING_INFORMATION_FORM is visible

		Examples:
      |	STANDARD_PRODUCT1		|	STANDARD_PRODUCT2		|	summed_up_quantity	|	email_address		|	password			|	user_name		|	user_id		|
      |	US_standard_product1	|	US_standard_product2	|	6					|	US_user2_email		|	US_user2_password	|	US_user2_name	|	US_user2_id	| 