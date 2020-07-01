package com.hybris.mati.pages.WebshopPages;

import org.openqa.selenium.By;

import com.hybris.utils.*;

public class EditorialPage extends Page{

	public enum FieldName implements Storable {
		
		PAGE_HEADER,
	}
	
	
	public EditorialPage(){
		
		addField(FieldName.PAGE_HEADER, new Field(FieldType.TEXT, By.xpath("//h1")));
		
	}
}