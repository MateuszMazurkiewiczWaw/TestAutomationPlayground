package com.hybris.mati.pages.WebshopPages;
import org.openqa.selenium.By;
import com.hybris.utils.*;



public class hybrisCenterDetailsPage extends Page{

	public enum FieldName implements Storable {
		
		hybris_CENTER_EMAIL, // in section hybris_CENTER_DETAILS
		hybris_CENTER_PHONE, // in section hybris_CENTER_DETAILS
		hybris_CENTER_DETAILS,
		NEARBY_hybris_CENTERS,
		NEARBY_CENTER_LINK, // in section NEARBY_hybris_CENTERS
		hybris_CENTER_NAME,
		GO_TO_hybris_CENTER_SEARCH
		
	}
	
	public hybrisCenterDetailsPage(){
		
		addField(FieldName.hybris_CENTER_EMAIL, new Field(FieldType.LINK, By.xpath(".//a[contains(@href,'mailto:')]")));
		addField(FieldName.hybris_CENTER_PHONE, new Field(FieldType.LINK, By.xpath(".//a[contains(@href,'tel:')]")));
		addField(FieldName.NEARBY_hybris_CENTERS, new Field(FieldType.DIV, By.xpath("//div[@class='m-staticmap-nearbycenter']")));
		addField(FieldName.hybris_CENTER_DETAILS, new Field(FieldType.DIV, By.xpath("//div[@class='m-staticmap-centerdetails a-map-details']")));
		addField(FieldName.NEARBY_CENTER_LINK, new Field(FieldType.LINK, By.xpath(".//a[contains(@class,'a-address-link')]")));
		addField(FieldName.hybris_CENTER_NAME, new Field(FieldType.TEXT, By.xpath("//h1[@class='a-heading-h1 hidden-xs']")));
		addField(FieldName.GO_TO_hybris_CENTER_SEARCH, new Field(FieldType.LINK, By.xpath("//span[contains(@class,'a-address-link')]")));
		
		
	}
}