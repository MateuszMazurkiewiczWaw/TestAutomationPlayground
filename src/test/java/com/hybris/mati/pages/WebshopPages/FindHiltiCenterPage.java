package com.hybris.mati.pages.WebshopPages;
import org.openqa.selenium.By;
import com.hybris.utils.*;



public class FindhybrisCenterPage extends Page{

	public enum FieldName implements Storable {
		
		FIND_hybris_CENTER_INPUT,
		FIND_hybris_CENTER_TEXTFIELD,
		SEARCH_hybris_CENTER_BUTTON,
		USE_MY_LOCATION_BUTTON,
		MAP_WRAPPER,
		SUGGESTED_hybris_CENTERS, //in section MAP_WRAPPER
		MAP_LOADING_INDICATOR,
		LOCATION_ERROR_MESSAGE
		
		
	}
	
	public FindhybrisCenterPage(){
		
		addField(FieldName.FIND_hybris_CENTER_INPUT, new Field(FieldType.TEXT, By.xpath("//div[@data-map-id='findahybriscenter']")));
		addField(FieldName.FIND_hybris_CENTER_TEXTFIELD, new Field(FieldType.TEXT, By.id("findahybriscenter_input")));
		addField(FieldName.SEARCH_hybris_CENTER_BUTTON, new Field(FieldType.BUTTON, By.id("findahybriscenter_submit")));
		addField(FieldName.USE_MY_LOCATION_BUTTON, new Field(FieldType.BUTTON, By.id("findahybriscenter_map-current")));
		addField(FieldName.SUGGESTED_hybris_CENTERS, new Field(FieldType.DIV, By.xpath(".//li[contains(@class,'js-map-hover-relatedmarker')]")));
		addField(FieldName.MAP_WRAPPER, new Field(FieldType.DIV, By.xpath("//div[@class='m-map-wrapper']")));
		addField(FieldName.MAP_LOADING_INDICATOR, new Field(FieldType.DIV, By.xpath("//div[@id='findahybriscenter' and(contains(@class, 'is-loading'))]")));
		addField(FieldName.LOCATION_ERROR_MESSAGE, new Field(FieldType.DIV, By.xpath("//div[contains(@class, 'm-message--error') and not(contains(@class, 'is-hidden'))]")));
	}
}