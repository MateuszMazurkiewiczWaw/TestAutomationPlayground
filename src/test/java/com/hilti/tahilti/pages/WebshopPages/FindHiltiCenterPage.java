package com.hilti.tahilti.pages.WebshopPages;
import org.openqa.selenium.By;
import com.hilti.utils.*;



public class FindHiltiCenterPage extends Page{

	public enum FieldName implements Storable {
		
		FIND_HILTI_CENTER_INPUT,
		FIND_HILTI_CENTER_TEXTFIELD,
		SEARCH_HILTI_CENTER_BUTTON,
		USE_MY_LOCATION_BUTTON,
		MAP_WRAPPER,
		SUGGESTED_HILTI_CENTERS, //in section MAP_WRAPPER
		MAP_LOADING_INDICATOR,
		LOCATION_ERROR_MESSAGE
		
		
	}
	
	public FindHiltiCenterPage(){
		
		addField(FieldName.FIND_HILTI_CENTER_INPUT, new Field(FieldType.TEXT, By.xpath("//div[@data-map-id='findahilticenter']")));
		addField(FieldName.FIND_HILTI_CENTER_TEXTFIELD, new Field(FieldType.TEXT, By.id("findahilticenter_input")));
		addField(FieldName.SEARCH_HILTI_CENTER_BUTTON, new Field(FieldType.BUTTON, By.id("findahilticenter_submit")));
		addField(FieldName.USE_MY_LOCATION_BUTTON, new Field(FieldType.BUTTON, By.id("findahilticenter_map-current")));
		addField(FieldName.SUGGESTED_HILTI_CENTERS, new Field(FieldType.DIV, By.xpath(".//li[contains(@class,'js-map-hover-relatedmarker')]")));
		addField(FieldName.MAP_WRAPPER, new Field(FieldType.DIV, By.xpath("//div[@class='m-map-wrapper']")));
		addField(FieldName.MAP_LOADING_INDICATOR, new Field(FieldType.DIV, By.xpath("//div[@id='findahilticenter' and(contains(@class, 'is-loading'))]")));
		addField(FieldName.LOCATION_ERROR_MESSAGE, new Field(FieldType.DIV, By.xpath("//div[contains(@class, 'm-message--error') and not(contains(@class, 'is-hidden'))]")));
	}
}