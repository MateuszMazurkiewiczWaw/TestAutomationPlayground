@Sprint6
Feature: HOL-23033 Add to cart / Go to cart - animation after adding item-s to the Shopping Cart

  Scenario Outline: Animation after adding item-s to the Shopping Cart - verification
		#Enter the page
		Given General: open webshop for United States
		And Webshop Main Page: If section I_UNDERSTAND_COOKIES is visible click I_UNDERSTAND_BUTTON
		And Webshop Main Page: If section ONE_MORE_THING_BANNER is visible click DO_NOT_ASK_AGAIN_BUTTON
		And Webshop Main Page: If section DO_YOU_NEED_HELP is visible click DONT_ASK_ME_AGAIN_BUTTON
		
		When Webshop Main Page: In element QUICK_ITEM_ENTRY_TEXTFIELD type in value <product1>
		And General: Wait 2 seconds
		And Webshop Main Page: Click ADD_TO_CART_BUTTON
		Then Webshop Main Page: SHOPPING_CART_ANIMATION_POPUP is visible
		And Webshop Main Page: Section SHOPPING_CART_ANIMATION_POPUP contains text custom.addToCartLayer.label.addedToCart
		And Webshop Main Page: Section SHOPPING_CART_ANIMATION_POPUP contains text <product1_name>
		And Webshop Main Page: Section SHOPPING_CART_ANIMATION_POPUP contains text 5
		And Webshop Main Page: The SHOPPING_CART contains <summed_up_quantity> items
		
		When General: Wait 8 seconds
		Then Webshop Main Page: SHOPPING_CART_ANIMATION_POPUP is not visible
		
		When Webshop Main Page: In element QUICK_ITEM_ENTRY_TEXTFIELD type in value <product1>#3
		And General: Wait 2 seconds
		And Webshop Main Page: Click ADD_TO_CART_BUTTON
		And General: Wait 5 seconds
		Then Webshop Main Page: SHOPPING_CART_ANIMATION_POPUP is visible
		
		#Simulate cursor move
		And Webshop Main Page: In section SHOPPING_CART_ANIMATION_POPUP move cursor to element GO_TO_SHOPPING_CART_BUTTON
		And Webshop Main Page: Click SHOPPING_CART_ANIMATION_POPUP
		
		When General: Wait 10 seconds
		Then Webshop Main Page: SHOPPING_CART_ANIMATION_POPUP is visible
		And Webshop Main Page: Section SHOPPING_CART_ANIMATION_POPUP contains text custom.addToCartLayer.label.addedToCart
		And Webshop Main Page: Section SHOPPING_CART_ANIMATION_POPUP contains text <product1_name>
		And Webshop Main Page: Section SHOPPING_CART_ANIMATION_POPUP contains text 5
		And Webshop Main Page: The SHOPPING_CART contains <summed_up_quantity2> items
		Then Webshop Main Page: In section SHOPPING_CART_ANIMATION_POPUP click CLOSE_SHOPPING_CART_ANIMATION_POPUP_BUTTON
		And Webshop Main Page: SHOPPING_CART_ANIMATION_POPUP is not visible
		
		When Webshop Main Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <product1>#3
		And General: Press ENTER on a keyboard
		And Webshop Main Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <product2>#10
		And General: Press ENTER on a keyboard
		And Webshop Main Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <product3>#20		
		And Webshop Main Page: Click ADD_TO_CART_BUTTON
		
		Then Webshop Main Page: SHOPPING_CART_ANIMATION_POPUP is visible
	    And Webshop Main Page: Section SHOPPING_CART_ANIMATION_POPUP contains text custom.addToCartLayer.label.addedToCart
		And Webshop Main Page: Section SHOPPING_CART_ANIMATION_POPUP contains text 35
		And Webshop Main Page: The SHOPPING_CART contains <summed_up_quantity3> items
		
		When Webshop Main Page: In section SHOPPING_CART_ANIMATION_POPUP click GO_TO_SHOPPING_CART_BUTTON
		And Webshop Main Page: The SHOPPING_CART contains <summed_up_quantity3> items
		Then Cart Page: Section STANDARD_PRODUCTS_TABLE is visible	 	
	    And Cart Page: Section STANDARD_PRODUCTS_TABLE contains text <product1>
	    And Cart Page: Section STANDARD_PRODUCTS_TABLE contains text <product1_name>
	    And Cart Page: In section STANDARD_PRODUCTS_TABLE element TABLE_AMOUNT_TEXTFIELD on position 1 contains text or value 15
	    And Cart Page: Section STANDARD_PRODUCTS_TABLE contains text <product2> 
	    And Cart Page: In section STANDARD_PRODUCTS_TABLE element TABLE_AMOUNT_TEXTFIELD on position 2 contains text or value 10
	    
	    And Cart Page: Section SOFTWARE_PRODUCTS_TABLE is visible
	    And Cart Page: Section SOFTWARE_PRODUCTS_TABLE contains text <product3> 
	    And Cart Page: In section SOFTWARE_PRODUCTS_TABLE element TABLE_AMOUNT_TEXTFIELD on position 1 contains text or value 20
	    
	    When Cart Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <product1>
	    And Cart Page: Click ADD_TO_CART_BUTTON
	    And General: Wait 3 seconds
	    And Webshop Main Page: SHOPPING_CART_ANIMATION_POPUP is not visible
	    And Webshop Main Page: The SHOPPING_CART contains <summed_up_quantity4> items
	    
	Examples:
      |	product1				|	product1_name				|	product2				|	product3				|	summed_up_quantity	|	summed_up_quantity2	|	summed_up_quantity3	|	summed_up_quantity4	|
      |	US_standard_product1	|	BU EXTENSION ASSEMBLY 12	|	US_standard_product2	|	US_software_product1	|	5					|	10					|	45					|	50					|