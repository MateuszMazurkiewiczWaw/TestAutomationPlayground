package com.hilti.tahilti.pages.WebshopPages;

import org.openqa.selenium.By;

import com.hilti.utils.*;

public class WebshopErrorPage extends Page{

	public enum FieldName implements Storable {	
		WHOLE_SITE_CONTENT, //section
		HOMEPAGE_LINK,
		CONTACT_US_LINK
	}
	
	public WebshopErrorPage(){	
		addField(FieldName.HOMEPAGE_LINK, new Field(FieldType.LINK, By.xpath("//a[@href='/' and contains(.,'homepage')]")));		
		addField(FieldName.WHOLE_SITE_CONTENT, new Field(FieldType.DIV, By.tagName("body")));
		addField(FieldName.CONTACT_US_LINK, new Field(FieldType.LINK, By.xpath("//a[@data-trigger='#contact_overlay']/span")));		

	}
}