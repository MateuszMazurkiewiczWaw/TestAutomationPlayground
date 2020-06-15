package com.hilti.tahilti.pages.WebshopPages;

import org.openqa.selenium.By;

import com.hilti.utils.*;

public class EditorialPage extends Page{

	public enum FieldName implements Storable {
		
		PAGE_HEADER,
	}
	
	
	public EditorialPage(){
		
		addField(FieldName.PAGE_HEADER, new Field(FieldType.TEXT, By.xpath("//h1")));
		
	}
}