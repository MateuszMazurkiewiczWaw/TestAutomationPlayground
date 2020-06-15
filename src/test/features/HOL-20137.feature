@Sprint4
Feature: HOL-20137 My Company List - Details

  Scenario Outline: My Company Lists Details - general and non-fleet user requirements
		#Enter the page
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
		
		When Webshop Main Page: Section ACCOUNT_DASHBOARD is visible
		And Webshop Main Page: Section ACCOUNT_DASHBOARD contains text <user_name>
		Then Webshop Main Page: In section YOUR_FAVORITE_LISTS click GO_TO_COMPANY_LISTS_LINK
		
		And My Company Lists Page: Section COMPANY_LIST is visible
		
		# creating new Company List
		When My Company Lists Page: In section COMPANY_LIST element NEW_LIST_NAME_TEXTFIELD contains text account.companyLists.label.listName
		And General: Wait 1 second
		And My Company Lists Page: In element NEW_LIST_NAME_TEXTFIELD type in and remember 20 random characters as RANDOM_LIST1
		And My Company Lists Page: In section COMPANY_LIST click CREATE_NEW_COMPANY_LIST_BUTTON
		When My Company Lists Page: Element MESSAGE_BOX contains text account.companyLists.message.createCompanyListSuccessMessage
		And General: Wait 3 seconds
		Then My Company Lists Page: In COMPANY_LIST_TABLE row 1 contains remembered value RANDOM_LIST1
		And My Company Lists Page: Close MESSAGE_BOX
		And My Company Lists Page: In COMPANY_LIST_TABLE remember row number of row which contains text RANDOM_LIST1 as ROW_NUMBER
		
		And General: Wait 2 seconds
		When My Company Lists Page: In COMPANY_LIST_TABLE in row ROW_NUMBER move cursor to element LIST_NAME_COLUMN
		And General: Wait 1 second
		And My Company Lists Page: In COMPANY_LIST_TABLE in row ROW_NUMBER click GO_TO_LIST_LINK
		
		Then My Company Lists Details Page: Element LIST_NAME contains remembered value RANDOM_LIST1 
		And My Company Lists Details Page: In section COMPANY_LIST_PRODUCTS_TABLE element ADD_TO_CART_BUTTON is disabled
		And My Company Lists Details Page: In section COMPANY_LIST_PRODUCTS_TABLE element ADD_TO_CART_BUTTON contains text 0/0
		And My Company Lists Details Page: In section COMPANY_LIST_PRODUCTS_TABLE element REMOVE_FROM_LIST_BUTTON is disabled
		And My Company Lists Details Page: In section COMPANY_LIST_PRODUCTS_TABLE element REMOVE_FROM_LIST_BUTTON contains text 0/0
		And My Company Lists Details Page: COMPANY_LIST_PRODUCTS_TABLE has 0 rows
		And My Company Lists Details Page: Every attribute placeholder of element QUICK_ITEM_ENTRY_TEXTFIELD contains value account.favouriteListsDetails.quickEntry.addProduct.placeholder.addProduct
		
		# add items to list	
		When My Company Lists Details Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <US_fleet_product>#10
		Then My Company Lists Details Page: In section QUICK_ITEM_ENTRY element QIE_FIELD_TIP is visible
		When General: Press ENTER on a keyboard
		And My Company Lists Details Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <US_standard_product>#3
		And General: Press ENTER on a keyboard
		And My Company Lists Details Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <US_software_product>
		And My Company Lists Details Page: Click outside of element QUICK_ITEM_ENTRY
		And General: Wait 1 second
		Then My Company Lists Details Page: QIE_FIELD_TIP is not visible
		And My Company Lists Details Page: Click ADD_TO_LIST_BUTTON
		And General: Wait 5 seconds
		
		Then My Company Lists Details Page: In section QUICK_ITEM_ENTRY element MESSAGE_SUCCESS is visible
		And My Company Lists Details Page: In section QUICK_ITEM_ENTRY element MESSAGE_SUCCESS contains text account.favouriteListsDetails.quickEntry.success.message.label
		And My Company Lists Details Page: COMPANY_LIST_PRODUCTS_TABLE has 3 rows
			
		# check if items are displayed in the same sequence as entered into the QIE field
		Then My Company Lists Details Page: In COMPANY_LIST_PRODUCTS_TABLE in row 1 PRODUCT_ID_IN_ROW contains remebered value <US_fleet_product>	
		Then My Company Lists Details Page: In COMPANY_LIST_PRODUCTS_TABLE in row 2 PRODUCT_ID_IN_ROW contains remebered value <US_standard_product>	
		Then My Company Lists Details Page: In COMPANY_LIST_PRODUCTS_TABLE in row 3 PRODUCT_ID_IN_ROW contains remebered value <US_software_product>	
		
		# verify columns/content of the table
		Then My Company Lists Details Page: In section COMPANY_LIST_PRODUCTS_TABLE element PRODUCT_IMAGE_IN_ROW is visible
		Then My Company Lists Details Page: In COMPANY_LIST_PRODUCTS_TABLE in row 1 PRODUCT_IMAGE_IN_ROW is visible
		Then My Company Lists Details Page: In section COMPANY_LIST_PRODUCTS_TABLE element PACKAGE_QUANTITY_COLUMN is visible
		Then My Company Lists Details Page: In section COMPANY_LIST_PRODUCTS_TABLE element PRICE_COLUMN is visible
		 		
		# verify "see product detail" on mouseover
		When My Company Lists Details Page: In COMPANY_LIST_PRODUCTS_TABLE in row 1 move cursor to element PRODUCT_IMAGE_IN_ROW	
		Then My Company Lists Details Page: In COMPANY_LIST_PRODUCTS_TABLE in row 1 SEE_PRODUCT_DETAILS_IN_ROW is visible
		
		# on click, the user is redirected to the respective item page.
		When My Company Lists Details Page: In COMPANY_LIST_PRODUCTS_TABLE in row 1 click SEE_PRODUCT_DETAILS_IN_ROW
		Then Item Page: BASIC_INFORMATION is visible
		Then General: Go back
			
		# verify add/remove buttons initial state		
		And My Company Lists Details Page: In section COMPANY_LIST_PRODUCTS_TABLE element ADD_TO_CART_BUTTON contains text 0/3
		And My Company Lists Details Page: In section COMPANY_LIST_PRODUCTS_TABLE element REMOVE_FROM_LIST_BUTTON contains text 0/3
		
		# verify list's sticky row
		When General: Scroll to the bottom
		Then My Company Lists Details Page: LIST_STICKY_ROW is visible

		# update and save item quantity
		When My Company Lists Details Page: SAVE_BUTTON_INACTIVE is visible
		When My Company Lists Details Page: In COMPANY_LIST_PRODUCTS_TABLE in row 1 in element PRODUCT_QUANTITY type in value <updated_product_quantity>
		Then My Company Lists Details Page: SAVE_BUTTON_INACTIVE is not visible
		And My Company Lists Details Page: Click SAVE_BUTTON
		And General: Wait 3 seconds
		And My Company Lists Details Page: In COMPANY_LIST_PRODUCTS_TABLE in row 1 PRODUCT_QUANTITY contains remebered value <updated_product_quantity>
		
		# remove item from the list - button in row
		When My Company Lists Details Page: In COMPANY_LIST_PRODUCTS_TABLE in row 2 REMOVE_FROM_LIST is visible
		And My Company Lists Details Page: In COMPANY_LIST_PRODUCTS_TABLE in row 2 click REMOVE_FROM_LIST
		Then My Company Lists Details Page: In section COMPANY_LIST_PRODUCTS_TABLE element ADD_TO_CART_BUTTON contains text 0/2
		And My Company Lists Details Page: In section COMPANY_LIST_PRODUCTS_TABLE element REMOVE_FROM_LIST_BUTTON contains text 0/2
		And My Company Lists Details Page: COMPANY_LIST_PRODUCTS_TABLE has 2 rows
		And My Company Lists Details Page: Section COMPANY_LIST_PRODUCTS_TABLE not contains text <US_standard_product>
		
		# see fleet management price (non-fleet user)
		When My Company Lists Details Page: In COMPANY_LIST_PRODUCTS_TABLE in row 1 SEE_FLEET_MANAGEMENT_PRICE is visible
		And My Company Lists Details Page: In COMPANY_LIST_PRODUCTS_TABLE in row 1 click SEE_FLEET_MANAGEMENT_PRICE
		Then My Company Lists Details Page: Section SEE_FLEET_MANAGEMENT_PRICE_TIP is visible
		When My Company Lists Details Page: In section SEE_FLEET_MANAGEMENT_PRICE_TIP click CLOSE_TIP
		And General: Wait 2 seconds
		Then My Company Lists Details Page: Section SEE_FLEET_MANAGEMENT_PRICE_TIP is not visible
		
		# verify select all/none checkbox (visible only when resolution W >= 1440)
		When My Company Lists Details Page: In section COMPANY_LIST_PRODUCTS_TABLE element SELECT_ALL_NONE_CHECKBOX is unchecked
		When My Company Lists Details Page: In section COMPANY_LIST_PRODUCTS_TABLE click SELECT_ALL_NONE_CHECKBOX
		Then My Company Lists Details Page: In section COMPANY_LIST_PRODUCTS_TABLE all elements PRODUCT_CHECKBOX are checked
		And My Company Lists Details Page: In section COMPANY_LIST_PRODUCTS_TABLE element ADD_TO_CART_BUTTON contains text 2/2
		And My Company Lists Details Page: In section COMPANY_LIST_PRODUCTS_TABLE element REMOVE_FROM_LIST_BUTTON contains text 2/2
		
		# add selected products to cart
		When My Company Lists Details Page: In section COMPANY_LIST_PRODUCTS_TABLE click ADD_TO_CART_BUTTON
		And General: Wait 2 seconds
				
		# verify cart contents
		When Webshop Main Page: In section HEADER click SHOPPING_CART_BUTTON
		And General: Wait 2 seconds
		Then Cart Page: Section STANDARD_PRODUCTS_TABLE_CONTENT contains text <US_fleet_product>
		And Cart Page: Section SOFTWARE_PRODUCTS_TABLE_CONTENT contains text <US_software_product>
		And Cart Page: In section SOFTWARE_PRODUCTS_TABLE_CONTENT element TABLE_AMOUNT_TEXTFIELD has value 1
		And Cart Page: In section STANDARD_PRODUCTS_TABLE_CONTENT element TABLE_AMOUNT_TEXTFIELD has value 5
		
		# go back
		When General: Go back
		And General: Wait 2 seconds
		Then My Company Lists Details Page: In section COMPANY_LIST_PRODUCTS_TABLE element ADD_TO_CART_BUTTON contains text 2/2
		And My Company Lists Details Page: In section COMPANY_LIST_PRODUCTS_TABLE element REMOVE_FROM_LIST_BUTTON contains text 2/2
		
		# remove selected items from the list
		And My Company Lists Details Page: In section COMPANY_LIST_PRODUCTS_TABLE click REMOVE_FROM_LIST_BUTTON
		And General: Wait 2 seconds   
		Then My Company Lists Details Page: In section COMPANY_LIST_PRODUCTS_TABLE element ADD_TO_CART_BUTTON contains text 0/0
		And My Company Lists Details Page: In section COMPANY_LIST_PRODUCTS_TABLE element REMOVE_FROM_LIST_BUTTON contains text 0/0
		And My Company Lists Details Page: COMPANY_LIST_PRODUCTS_TABLE has 0 rows
		
		
	Examples:
      |	email_address		|	password			|	user_name		|	user_id		|	US_standard_product		|	US_fleet_product	|	US_software_product		|	updated_product_quantity	|
      |	US_user2_email		|	US_user2_password	|	US_user2_name	|	US_user2_id	|	US_standard_product1	|	US_fleet_product1	|	US_software_product1	|	5							|

  Scenario Outline: My Company Lists Details - presentation of fleet items for fleet user
		#Enter the page
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
		
		When Webshop Main Page: Section ACCOUNT_DASHBOARD is visible
		And Webshop Main Page: Section ACCOUNT_DASHBOARD contains text <user_name>
		Then Webshop Main Page: In section YOUR_FAVORITE_LISTS click GO_TO_COMPANY_LISTS_LINK
		
		And My Company Lists Page: Section COMPANY_LIST is visible
		
		# creating new Company List
		When My Company Lists Page: In section COMPANY_LIST element NEW_LIST_NAME_TEXTFIELD contains text account.companyLists.label.listName
		And My Company Lists Page: In element NEW_LIST_NAME_TEXTFIELD type in and remember 20 random characters as RANDOM_LIST1
		And My Company Lists Page: In section COMPANY_LIST click CREATE_NEW_COMPANY_LIST_BUTTON
		When My Company Lists Page: Element MESSAGE_BOX contains text account.companyLists.message.createCompanyListSuccessMessage
		And General: Wait 3 seconds
		Then My Company Lists Page: In COMPANY_LIST_TABLE row 1 contains remembered value RANDOM_LIST1
		And My Company Lists Page: Close MESSAGE_BOX
		
		And My Company Lists Page: In COMPANY_LIST_TABLE remember row number of row which contains text RANDOM_LIST1 as ROW_NUMBER
		
		And General: Wait 2 second
		When My Company Lists Page: In COMPANY_LIST_TABLE in row ROW_NUMBER move cursor to element LIST_NAME_COLUMN
		And General: Wait 1 second
		And My Company Lists Page: In COMPANY_LIST_TABLE in row ROW_NUMBER click GO_TO_LIST_LINK
		
		Then My Company Lists Details Page: Element LIST_NAME contains remembered value RANDOM_LIST1 
		And My Company Lists Details Page: In section COMPANY_LIST_PRODUCTS_TABLE element ADD_TO_CART_BUTTON is disabled
		And My Company Lists Details Page: In section COMPANY_LIST_PRODUCTS_TABLE element ADD_TO_CART_BUTTON contains text 0/0
		And My Company Lists Details Page: In section COMPANY_LIST_PRODUCTS_TABLE element REMOVE_FROM_LIST_BUTTON is disabled
		And My Company Lists Details Page: In section COMPANY_LIST_PRODUCTS_TABLE element REMOVE_FROM_LIST_BUTTON contains text 0/0
		And My Company Lists Details Page: COMPANY_LIST_PRODUCTS_TABLE has 0 rows
		And My Company Lists Details Page: Every attribute placeholder of element QUICK_ITEM_ENTRY_TEXTFIELD contains value account.favouriteListsDetails.quickEntry.addProduct.placeholder.addProduct
		
		# add fleet item to list	
		When My Company Lists Details Page: In section QUICK_ITEM_ENTRY in field QUICK_ITEM_ENTRY_TEXTFIELD type in <US_fleet_product>
		And My Company Lists Details Page: Click ADD_TO_LIST_BUTTON
		And General: Wait 8 seconds
		Then My Company Lists Details Page: COMPANY_LIST_PRODUCTS_TABLE has 1 row
		And My Company Lists Details Page: In COMPANY_LIST_PRODUCTS_TABLE in row 1 PRODUCT_ID_IN_ROW contains remebered value <US_fleet_product>		
		When My Company Lists Details Page: In COMPANY_LIST_PRODUCTS_TABLE in row 1 FLEET_RADIOBUTTON is visible
		
		#verify add to cart button (in row)
		And My Company Lists Details Page: In COMPANY_LIST_PRODUCTS_TABLE in row 1 click ADD_TO_CART_ROW_BUTTON
		And General: Wait 2 seconds
		When Webshop Main Page: In section HEADER click SHOPPING_CART_BUTTON
		And General: Wait 2 seconds
		Then Cart Page: Section FLEET_PRODUCTS_TABLE_CONTENT contains text <US_fleet_product>
		And Cart Page: In section FLEET_PRODUCTS_TABLE_CONTENT element TABLE_AMOUNT_TEXTFIELD has value 1

			
	Examples:
      |	email_address		|	password			|	user_name		|	user_id		|	US_fleet_product	|
      |	US_fleet_email		|	US_fleet_password	|	US_fleet_name	|	US_fleet_id	|	US_fleet_product1	|
      