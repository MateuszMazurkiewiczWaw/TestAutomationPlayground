@Sprint2
Feature: HOL-22750 Cart Messages - Quick Item Entry

  Scenario Outline: Cart Messages verification
		#Enter the page
		Given General: open webshop for United States
		And Webshop Main Page: If section I_UNDERSTAND_COOKIES is visible click I_UNDERSTAND_BUTTON
		And Webshop Main Page: If section ONE_MORE_THING_BANNER is visible click DO_NOT_ASK_AGAIN_BUTTON
	    And Webshop Main Page: If section DO_YOU_NEED_HELP is visible click DONT_ASK_ME_AGAIN_BUTTON
	    
	    #Adding the items - Successfully
	 	When Webshop Main Page: In section HEADER click SHOPPING_CART_BUTTON
	 	Then Cart Page: Section QUICK_ITEM_ENTRY is visible
	 	And Cart Page: Section QUICK_ITEM_ENTRY contains text quickorder.label.title
	 	And Cart Page: Section QUICK_ITEM_ENTRY contains text quickorder.label.description
	 	
	 	When Cart Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <item_number_valid>#<item_quantity1>
	 	Then Cart Page: Click ADD_TO_CART_BUTTON
	 	And Cart Page: The SHOPPING_CART contains <item_quantity1> items
	 	And Cart Page: SUCCESS_MESSAGE_BOX is visible
	 	And Cart Page: Element SUCCESS_MESSAGE_BOX contains text <item_quantity1>
	 	And Cart Page: Element SUCCESS_MESSAGE_BOX contains text quickorder.message.success.productAdded
	 	
	 	#Adding the item - Unsuccessfully
	 	And Cart Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <item_number_invalid>
	 	And Cart Page: Click ADD_TO_CART_BUTTON
	 	And Cart Page: ERROR_MESSAGE_BOX is visible
	 	And Cart Page: Element ERROR_MESSAGE_BOX contains text quickorder.message.error.productNotFound
	 	And Cart Page: Element ERROR_MESSAGE_BOX contains text quickorder.message.error.contactUsLinkText
	 	And Cart Page: Element QUICK_ITEM_ENTRY_TEXTFIELD contains text <item_number_invalid>
	 	
	 	Then Cart Page: In section ERROR_MESSAGE_BOX click PLEASE_CONTACT_US_IF_YOU_NEED_ASSISTANCE_LINK
	 	And Webshop Main Page: Section CONTACT_US is visible
		And Webshop Main Page: In section CONTACT_US element CALL_US is visible
		And Webshop Main Page: In section CONTACT_US element CALL_US contains text contact.label.callUsText
		And Webshop Main Page: In section CONTACT_US click CLOSE_CHAT_BUTTON
		And General: Wait 1 second
	 	
	 	#One item successfully added, one not
	 	When Cart Page: In section QUICK_ITEM_ENTRY clear value of QUICK_ITEM_ENTRY_TEXTFIELD
	 	And Cart Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <item_number_valid>#<item_quantity1>
	 	Then Cart Page: Press ENTER on a keyboard
	 	And Cart Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <item_number_invalid>
	 	And Cart Page: Click ADD_TO_CART_BUTTON
		And Cart Page: The SHOPPING_CART contains <item_quantity> items
	 	And Cart Page: SUCCESS_MESSAGE_BOX is visible
	 	And Cart Page: Element SUCCESS_MESSAGE_BOX contains text <item_quantity1>
	 	And Cart Page: Element SUCCESS_MESSAGE_BOX contains text quickorder.message.success.productAdded
	 	And Cart Page: ERROR_MESSAGE_BOX is visible
	 	And Cart Page: Element ERROR_MESSAGE_BOX contains text quickorder.message.error.productNotFound
	 	And Cart Page: Element ERROR_MESSAGE_BOX contains text quickorder.message.error.contactUsLinkText
	 	And Cart Page: Element QUICK_ITEM_ENTRY_TEXTFIELD contains text <item_number_invalid>
		
	Examples:
      |	item_number_valid		|	item_quantity		|	item_quantity1	|	item_number_invalid	|
      |	US_standard_product1	|	10					|	5				|	555666222#1			|