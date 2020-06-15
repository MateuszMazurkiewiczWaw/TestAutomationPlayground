package com.hilti.tahilti.pages.WebshopPages;
import org.openqa.selenium.By;
import com.hilti.utils.*;



public class HiltiCenterDetailsPage extends Page{

	public enum FieldName implements Storable {
		
		HILTI_CENTER_EMAIL, // in section HILTI_CENTER_DETAILS
		HILTI_CENTER_PHONE, // in section HILTI_CENTER_DETAILS
		HILTI_CENTER_DETAILS,
		NEARBY_HILTI_CENTERS, 
		NEARBY_CENTER_LINK, // in section NEARBY_HILTI_CENTERS
		HILTI_CENTER_NAME,
		GO_TO_HILTI_CENTER_SEARCH
		
	}
	
	public HiltiCenterDetailsPage(){
		
		addField(FieldName.HILTI_CENTER_EMAIL, new Field(FieldType.LINK, By.xpath(".//a[contains(@href,'mailto:')]"))); 
		addField(FieldName.HILTI_CENTER_PHONE, new Field(FieldType.LINK, By.xpath(".//a[contains(@href,'tel:')]")));
		addField(FieldName.NEARBY_HILTI_CENTERS, new Field(FieldType.DIV, By.xpath("//div[@class='m-staticmap-nearbycenter']")));
		addField(FieldName.HILTI_CENTER_DETAILS, new Field(FieldType.DIV, By.xpath("//div[@class='m-staticmap-centerdetails a-map-details']")));
		addField(FieldName.NEARBY_CENTER_LINK, new Field(FieldType.LINK, By.xpath(".//a[contains(@class,'a-address-link')]")));
		addField(FieldName.HILTI_CENTER_NAME, new Field(FieldType.TEXT, By.xpath("//h1[@class='a-heading-h1 hidden-xs']")));
		addField(FieldName.GO_TO_HILTI_CENTER_SEARCH, new Field(FieldType.LINK, By.xpath("//span[contains(@class,'a-address-link')]"))); 
		
		
	}
}