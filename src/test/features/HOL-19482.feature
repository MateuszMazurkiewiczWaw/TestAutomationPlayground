@Sprint1
Feature: HOL-19482 404 page

   Scenario: 404 page - verification 
		Given General: open incorrect_webshop_address for United States
		And Webshop Main Page: If section I_UNDERSTAND_COOKIES is visible click I_UNDERSTAND_BUTTON
		And Webshop Main Page: If section ONE_MORE_THING_BANNER is visible click DO_NOT_ASK_AGAIN_BUTTON
		And Webshop Main Page: If section DO_YOU_NEED_HELP is visible click DONT_ASK_ME_AGAIN_BUTTON
		When Webshop Error Page: contains text notfound.label.header
		When Webshop Error Page: contains text notfound.label.pageNotFound
		And Webshop Error Page: contains text notfound.label.startBrowsing
		And Webshop Error Page: contains text notfound.label.homepage
		And Webshop Error Page: HOMEPAGE_LINK is visible
		And Webshop Error Page: CONTACT_US_LINK is visible
		When Webshop Error Page: Click CONTACT_US_LINK
		Then Webshop Main Page: Section CONTACT_US is visible
		And Webshop Main Page: In section CONTACT_US element CALL_US is visible
		And Webshop Main Page: In section CONTACT_US element CALL_US contains text contact.label.callUsText
		And Webshop Main Page: In section CONTACT_US click CLOSE_CHAT_BUTTON
		And General: Wait 1 second
		
		Then Webshop Error Page: Click HOMEPAGE_LINK
		When Webshop Main Page: not contains text notfound.label.header
		When Webshop Main Page: not contains text notfound.label.pageNotFound