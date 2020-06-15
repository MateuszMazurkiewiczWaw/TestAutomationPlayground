@Sprint4
Feature: HOL-20553 Check out: Fleet labeling

   Scenario Outline: Check out: Fleet labeling verification
		#PLAIN LOG IN
	    Given General: open webshop for United States
	    And Webshop Main Page: If section I_UNDERSTAND_COOKIES is visible click I_UNDERSTAND_BUTTON
	    And Webshop Main Page: If section ONE_MORE_THING_BANNER is visible click DO_NOT_ASK_AGAIN_BUTTON
	    And Webshop Main Page: If section DO_YOU_NEED_HELP is visible click DONT_ASK_ME_AGAIN_BUTTON
	    When Webshop Main Page: In section HEADER element LOG_IN_OR_REGISTER_BUTTON is visible
	    Then Webshop Main Page: In section HEADER click LOG_IN_OR_REGISTER_BUTTON
	    And Webshop Main Page: Section LOG_IN_OR_REGISTER is visible
	    #1-Fill out login
	    Then Webshop Main Page: In section LOG_IN_OR_REGISTER in field EMAIL_ADDRESS_TEXTFIELD type in <email_address>
		And Webshop Main Page: In section LOG_IN_OR_REGISTER in field PASSWORD_TEXTFIELD type in <password>
	   	Then Webshop Main Page: In section LOG_IN_OR_REGISTER click LOG_IN_BUTTON
	   	
	    And Webshop Main Page: Section HEADER contains text <user_name> 
	    And Webshop Main Page: Section HEADER contains text <user_id> 
	    
	    When Webshop Main Page: In section HEADER click SHOPPING_CART_BUTTON
	    And Webshop Main Page: The SHOPPING_CART contains 0 items
	 	Then Cart Page: Section QUICK_ITEM_ENTRY is visible

	 	And Cart Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <fleet_product_id>#<fleet_product_quantity>
	 	And Cart Page: Click ADD_TO_CART_BUTTON

	 	And Webshop Main Page: The SHOPPING_CART contains <fleet_product_quantity> items
	 	And Cart Page: Section FLEET_PRODUCTS_TABLE is visible
	 	And Cart Page: In section SHOPPING_CART_HEADER click CHECK_OUT_BUTTON
	 	And General: Wait 1 second
	 	
		When Checkout Delivery Page: In section DELIVERY_ADDRESS_FORM click CONTINUE_BUTTON
		Then Checkout Billing Page: Section BILLING_INFORMATION_FORM is visible
		And Checkout Billing Page: In section BILLING_INFORMATION_FORM in field PURCHASE_ORDER_NUMBER_TEXTFIELD type in Project_X
		
		When Checkout Billing Page: In section BILLING_INFORMATION_FORM click CONTINUE_BUTTON
		Then Checkout Fleet Labelling Page: Section FLEET_LABELLING_FORM is visible
		And Checkout Fleet Labelling Page: Section FLEET_LABELLING_FORM contains text checkout.fleetLabeling.label.infoTitle
		And Checkout Fleet Labelling Page: Section FLEET_LABELLING_FORM contains text checkout.fleetLabeling.label.infoText
		And Checkout Fleet Labelling Page: Element CONTINUE_BUTTON is enabled
		And Checkout Fleet Labelling Page: Every attribute placeholder of element ORG_REFERENCE_TEXTFIELD contains value 18
		And Checkout Fleet Labelling Page: Every attribute placeholder of element INVENTORY_KEY_TEXTFIELD contains value 18
		
		When Checkout Fleet Labelling Page: In section FLEET_LABELING_TABLE_HEADER click ORG_REFERENCE_INFO_BUTTON
		Then Checkout Fleet Labelling Page: ORG_REFERENCE_INFO_POPUP is visible
		And Checkout Fleet Labelling Page: Section ORG_REFERENCE_INFO_POPUP contains text checkout.fleetLabeling.label.organizationReferenceTooltip
		
		When Checkout Fleet Labelling Page: In section FLEET_LABELING_TABLE_HEADER click INVENTORY_KEY_INFO_BUTTON
		Then Checkout Fleet Labelling Page: INVENTORY_KEY_INFO_POPUP is visible
		And Checkout Fleet Labelling Page: Section INVENTORY_KEY_INFO_POPUP contains text checkout.fleetLabeling.label.inventoryKeyTooltip
		
		And Checkout Fleet Labelling Page: Section FLEET_LABELING_TABLE contains text <fleet_product_id>		
		And Checkout Fleet Labelling Page: FLEET_LABELING_TABLE has <fleet_product_quantity> rows
		And Checkout Fleet Labelling Page: Fill out FLEET_LABELING_TABLE with random 18 characters labels
		And Checkout Fleet Labelling Page: Element CONTINUE_BUTTON is enabled
		
		When Checkout Fleet Labelling Page: Click BACK_TO_PREVIOUS_STEP_LINK
		Then Checkout Billing Page: Section BILLING_INFORMATION_FORM is visible
		
		When Checkout Billing Page: In section BILLING_INFORMATION_FORM click CONTINUE_BUTTON
		Then Checkout Fleet Labelling Page: Section FLEET_LABELLING_FORM is visible
		And Checkout Fleet Labelling Page: Section FLEET_LABELING_TABLE contains text <fleet_product_id>
		And Checkout Fleet Labelling Page: FLEET_LABELING_TABLE has <fleet_product_quantity> rows
		And Checkout Fleet Labelling Page: Fill out FLEET_LABELING_TABLE with random 18 characters labels
		And Checkout Fleet Labelling Page: In section FLEET_LABELLING_FORM click CONTINUE_BUTTON
		
		Then Checkout Order Summary Page: Section CHECKOUT_FORM is visible
		And Checkout Order Summary Page: Section CHECKOUT_FORM contains text checkout.summary.label.headline
		
	Examples:
      |	email_address		|	password			|	user_name		|	user_id		|	fleet_product_id	|	fleet_product_quantity	|
      |	US_fleet_email		|	US_fleet_password	|	US_fleet_name	|	US_fleet_id	|	US_fleet_product1	|	5						|
      
	