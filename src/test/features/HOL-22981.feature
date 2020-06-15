@Sprint5
Feature: HOL-22981 Remaining Navigation Flyouts - Adobe Integration


  Scenario Outline: Remaining Navigation Flyouts - verification
		#TO-DO TODO
		#Once the US is fully delivered by Adobe, it's necessary  to uncomment all the lines which are commented out in this scenario
		Given General: open webshop for United States
		And Webshop Main Page: If section I_UNDERSTAND_COOKIES is visible click I_UNDERSTAND_BUTTON
		And Webshop Main Page: If section ONE_MORE_THING_BANNER is visible click DO_NOT_ASK_AGAIN_BUTTON
		And Webshop Main Page: If section DO_YOU_NEED_HELP is visible click DONT_ASK_ME_AGAIN_BUTTON
		
		When Webshop Main Page: In section MENU_BAR click element with text <flyout_name>
		Then Webshop Main Page: Section FLYOUT is visible
		And Webshop Main Page: In section FLYOUT element NAVIGATION_BREADCRUMB contains text <flyout_name>
		And Webshop Main Page: In section FLYOUT there are at least 1 FLYOUT_CATEGORY elements
		
		#And Webshop Main Page: In section FLYOUT there are at most 6 FLYOUT_CATEGORY elements
		
		And Webshop Main Page: Each FLYOUT_CATEGORY contains at least 1 FLYOUT_LINK
		
		#And Webshop Main Page: Each FLYOUT_CATEGORY contains at most 6 FLYOUT_LINK
		
		When Webshop Main Page: In section FLYOUT click CLOSE_FLYOUT_BUTTON
		And General: Wait 1 second
		Then Webshop Main Page: Section FLYOUT is not visible
				
		When Webshop Main Page: In section MENU_BAR click element with text <flyout_name>
		And Webshop Main Page: Remember value of FIRST_FLYOUT_LINK as CATEGORY_NAME
		And Webshop Main Page: Click FIRST_FLYOUT_LINK
		Then Editorial Page: Element PAGE_HEADER contains remembered value CATEGORY_NAME
		
		#When Webshop Main Page: In section MENU_BAR click element with text <flyout_newtab_name>
		#Then General: There are 2 tabs opened
		
		
	Examples:
		|	flyout_name		|	flyout_newtab_name		|
		|	Engineering		|	Career					|