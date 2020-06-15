package com.hilti.tahilti.pages.WebshopPages;

import org.openqa.selenium.By;

import com.hilti.utils.*;

public class ToolManagementPage extends Page{

	public enum FieldName implements Storable {
		
		TOOLS_TABLE,
		COLUMN_NAME, //in section TOOLS_TABLE
		VISIBLE_COLUMN, //in section TOOLS_TABLE
		NOT_VISIBLE_COLUMN, //in section TOOLS_TABLE
		HEADING_ROW,
		OPTIONAL_COLUMN, //in section TOOLS_TABLE
		SHOW_ALL_COLUMNS_BUTTON,
		EDIT_COLUMNS_BUTTON,
		EDIT_COLUMNS_OVERLAY,
		COLUMN_VISIBILITY_CHECKBOX,
		FLEET_TOOLS_LIST_DOWNLOAD_LINK,
		REORDER_LABELS_BUTTON,
		REPORT_LOST_STOLEN_BUTTON,
		TABLE_ITEM_CHECKBOX_LABEL, //in TOOLS_TABLE 
		REORDER_LABELS_FORM,
		ORG_REFERENCE_TEXTFIELD, //in REORDER_LABELS_FORM
		
		INVENTORY_KEY_TEXTFIELD, //in REORDER_LABELS_FORM
		CHOOSE_DELIVERY_ADDRESS, //in REORDER_LABELS_FORM
		SEARCH_ADDRESS_FIELD, //in REORDER_LABELS_FORM
		
		ORG_REFERENCE_VALUE, //in TOOLS_TABLE
		INV_NUMBER_VALUE, //in TOOLS_TABLE
		SUBMIT_LABEL_REQUEST, //in REORDER_LABELS_FORM
		MESSAGE,
		ADDITIONAL_INFO, //in REORDER_LABELS_FORM
		FIRST_AVAILABLE_ADDRESS,
		FIRST_AVAILABLE_CONTACT,
		SEARCH_CONTACT_FIELD, //in REORDER_LABELS_FORM
		CHOOSE_DELIVERY_CONTACT, //in REORDER_LABELS_FORM
		BACK_TO_TOOLLIST_BUTTON,
		DELIVERY_ADDRESS_INFO_ICON,
		DELIVERY_ADDRESS_INFO_POPUP,
		CLOSE_POPUP,
		LIST_OF_ALL_FLEET_TOOLS,
		
		
		LOST_RADIO,
		STOLEN_RADIO,
		REPLACEMENT_YES_RADIO,
		REPLACEMENT_NO_RADIO,
		POLICE_REPORT_NUMBER,
		POLICE_REMARK_TEXTFIELD,
		SUBMIT_LOST_STOLEN_BUTTON,
		
		ORG_REFERENCE_LOST_STOLEN,
		INVENTORY_KEY_LOST_STOLEN,
		ORG_REFERENCE_REPAIR,
		INVENTORY_KEY_REPAIR,
		REPORT_LOST_STOLEN_FORM,
		LOST_RADIO_LABEL,
		STOLEN_RADIO_LABEL,
		REPLACEMENT_YES_RADIO_LABEL,
		REPLACEMENT_NO_RADIO_LABEL,
		LOST_STOLEN_MESSAGE,
		PRODUCT_REPORT,

		REPAIR_BUTTON,
		REPAIR_FORM,

		IN_ROW_REORDER_BUTTON,
		PRODUCT_NO_LONGER_AVAILABLE,
		COMBO_MAINROW,
		COMBO_SUBITEM_ROW,
		SEE_DETAILS_LINK,
		PRODUCT_IMAGE,
		REPAIR_RADIO_LABEL, 
		CALIBRATION_RADIO_LABEL, 
		TOOL_IN_CASE_RADIO_LABEL, 
		TOOL_NOT_IN_CASE_RADIO_LABEL, 
		TOOL_IN_CASE_INFO_ICON, 
		REPAIR_DESCRIPTION, 
		REPAIR_CHECKBOX_1, 
		REPAIR_CHECKBOX_2, 
		REPAIR_CHECKBOX_3, 
		REPAIR_CHECKBOX_4, 
		REPAIR_CHECKBOX_5, 
		REPAIR_CHECKBOX_6, 
		COSTS_INFO_ICON, 
		REPAIR_COST_SECTION, 
		INFO_ICON, 
		SEND_REPAIR_REQUEST_BUTTON, 
		REPAIR_ORDER_INFORMATION, 
		PURCHASE_ORDER_NUMBER, //in  REPAIR_ORDER_INFORMATION
		NUMBER_OF_PACKAGES, //in  REPAIR_ORDER_INFORMATION
		ADDITIONAL_INFORMATION, //in  REPAIR_ORDER_INFORMATION
		YOUR_TOOL_PICKUP_ADDRESS, 
		YOUR_TOOL_PICKUP_CONTACT, 
		YOUR_DELIVERY_ADDRESS, 
		YOUR_DELIVERY_CONTACT, 
		DROPDOWN_LIST, 	// in YOUR_TOOL_PICKUP_ADDRESS/YOUR_TOOL_PICKUP_CONTACT/YOUR_DELIVERY_ADDRESS/YOUR_DELIVERY_CONTACT
		CURRENTLY_SELECTED_VALUE, 	// in YOUR_TOOL_PICKUP_ADDRESS/YOUR_TOOL_PICKUP_CONTACT/YOUR_DELIVERY_ADDRESS/YOUR_DELIVERY_CONTACT
		REPAIR_REQUEST_FORM, 
		DROPDOWN_VALUE, 
		REPAIR_HEADER,
		
		COSTS_INFO_OVERLAY,
		CLOSE,
		PICKUP_ADDRESS_INFO_OVERLAY,
		DELIVERY_ADDRESS_INFO_OVERLAY,
		REPAIR_SUCCESSS_MESSAGE,
		REPAIR_ERROR_MESSAGE,
		REPAIR_WHEN_BELOW_LIMIT, //in section REPAIR_COST_SECTION
		TOOL_REPAIR_REQUEST,

		ITEM_ROW, //in TOOLS_TABLE
		
		SEARCH_FILTERS_SECTION,
		SEARCH_BUTTON,
		SEARCH_TEXTFIELD,
		FILTER_ALL_TOOLS_LABEL,
		FILTER_ALL_TOOLS_RADIO,
		FILTER_ONLY_FLEET_LABEL,
		FILTER_ONLY_FLEET_RADIO,
		FILTER_ONLY_PURCHASED_LABEL,
		FILTER_ONLY_PURCHASED_RADIO,

		FILTER_INVENTORY_KEY,
		FILTER_ORG_REFERENCE,
		ALERT_MESSAGE,
		REMOVE_FILTERS,
		START_DATE_PICKER,
		END_DATE_PICKER,
		TOOL_MANAGEMENT_LINKS,
		TOOL_MANAGEMENT_BUTTON

		
	}
	
	public ToolManagementPage(){
		
		//addField(FieldName.TOOLS_TABLE, new Field(FieldType.DIV, By.xpath("//table[contains(@class,'m-table table m-table--toolmanagement  js-showmore-items-wrapper') and not(contains(@class,'clone'))]")));
		addField(FieldName.TOOLS_TABLE, new Field(FieldType.DIV, By.xpath("//table[contains(@class,'m-table--toolmanagement') and not(contains(@class,'clone'))]")));
		addField(FieldName.COLUMN_NAME, new Field(FieldType.DIV, By.xpath(".//th[contains(@id,'-col-')]")));
		addField(FieldName.VISIBLE_COLUMN, new Field(FieldType.DIV, By.xpath(".//th[contains(@id,'-col-') and not(@style='display: none;')]")));
		addField(FieldName.HEADING_ROW, new Field(FieldType.DIV, By.xpath(".//th[contains(@id,'-col-') and not(@style='display: none;')]/parent::tr")));
		addField(FieldName.NOT_VISIBLE_COLUMN, new Field(FieldType.DIV, By.xpath(".//th[contains(@id,'-col-') and (@style='display: none;')]")));
		addField(FieldName.OPTIONAL_COLUMN, new Field(FieldType.DIV, By.xpath(".//th[@style='display: table-cell;']")));
		addField(FieldName.SHOW_ALL_COLUMNS_BUTTON, new Field(FieldType.BUTTON, By.xpath("//button[@class='btn a-button-tertiary a-button--medium']")));

		addField(FieldName.EDIT_COLUMNS_BUTTON, new Field(FieldType.BUTTON, By.xpath("//button[@class='btn btn-default dropdown-toggle']")));
		addField(FieldName.EDIT_COLUMNS_OVERLAY, new Field(FieldType.SECTION, By.xpath("//ul[@class='dropdown-menu is-shown']")));
		addField(FieldName.COLUMN_VISIBILITY_CHECKBOX, new Field(FieldType.CHECKBOX, By.xpath(".//label")));
		addField(FieldName.FLEET_TOOLS_LIST_DOWNLOAD_LINK, new Field(FieldType.LINK, By.xpath("//span[@class='a-icon a-icon-download']")));
		addField(FieldName.REORDER_LABELS_BUTTON, new Field(FieldType.LINK, By.xpath("//button[@data-track-label='ReorderLabelsOpen']")));
		addField(FieldName.REPORT_LOST_STOLEN_BUTTON, new Field(FieldType.LINK, By.xpath("//button[@data-track-label='RepairLostStolenOpen']")));
		addField(FieldName.TABLE_ITEM_CHECKBOX_LABEL, new Field(FieldType.LINK, By.xpath(".//label[contains(@for,'tool')]")));
		addField(FieldName.REORDER_LABELS_FORM, new Field(FieldType.SECTION, By.xpath("//form[@id='toolsReorderLabelsForm']")));
		addField(FieldName.ORG_REFERENCE_TEXTFIELD, new Field(FieldType.TEXT, By.xpath(".//input[contains(@id,'labelData.orgRef')]")));
		addField(FieldName.INVENTORY_KEY_TEXTFIELD, new Field(FieldType.TEXT, By.xpath(".//input[contains(@id,'labelData.invNum')]")));
		addField(FieldName.CHOOSE_DELIVERY_ADDRESS, new Field(FieldType.SECTION, By.xpath(".//div[contains(@id,'_address_sapId_chosen')]")));
		addField(FieldName.SEARCH_ADDRESS_FIELD, new Field(FieldType.TEXT, By.xpath("(.//div[@class='chosen-search'])[1]//input")));
		addField(FieldName.ORG_REFERENCE_VALUE, new Field(FieldType.DIV, By.xpath(".//td[contains(@data-columns,'col-5')]")));
		addField(FieldName.INV_NUMBER_VALUE, new Field(FieldType.DIV, By.xpath(".//td[contains(@data-columns,'col-6')]")));
		addField(FieldName.SUBMIT_LABEL_REQUEST, new Field(FieldType.BUTTON, By.xpath(".//button[contains(@class,'js-toolmanagement-submit')]")));
		addField(FieldName.MESSAGE, new Field(FieldType.DIV, By.id("sendReorderLabelsRequestMessage")));
		addField(FieldName.ADDITIONAL_INFO, new Field(FieldType.TEXT, By.id("toolsData.additionalInfo")));
		// old version addField(FieldName.FIRST_AVAILABLE_ADDRESS, new Field(FieldType.TEXT, By.xpath("(//span[@id='toolsData.shipTo.address.sapId-field']//div[contains(@class,'chosen-container')]//li[@class='active-result'])[1]")));
		addField(FieldName.FIRST_AVAILABLE_ADDRESS, new Field(FieldType.TEXT, By.xpath("(//span[contains(@id,'address.sapId-field')]//div[contains(@class,'chosen-container')]//li[@class='active-result'])[1]")));
		addField(FieldName.FIRST_AVAILABLE_CONTACT, new Field(FieldType.TEXT, By.xpath("(//span[@id='toolsData.deliveryContact.sapNumber-field']//div[contains(@class,'chosen-container')]//li[@class='active-result'])[1]")));
		addField(FieldName.SEARCH_CONTACT_FIELD, new Field(FieldType.TEXT, By.xpath("(.//div[@class='chosen-search'])[2]//input")));
		addField(FieldName.CHOOSE_DELIVERY_CONTACT, new Field(FieldType.SECTION, By.xpath(".//div[@id='toolsData_deliveryContact_sapNumber_chosen']")));
		addField(FieldName.BACK_TO_TOOLLIST_BUTTON, new Field(FieldType.BUTTON, By.xpath("//a[@class='a-link a-link--back']")));
		addField(FieldName.DELIVERY_ADDRESS_INFO_ICON, new Field(FieldType.BUTTON, By.xpath("//a[@class='a-icon-info-after tooltipstered']")));
		addField(FieldName.DELIVERY_ADDRESS_INFO_POPUP, new Field(FieldType.TEXT, By.xpath("//div[@class='tooltipster-content']")));
		addField(FieldName.CLOSE_POPUP, new Field(FieldType.TEXT, By.xpath("//span[@class='a-tooltip-closer']")));
		addField(FieldName.LIST_OF_ALL_FLEET_TOOLS, new Field(FieldType.TEXT, By.xpath("//a[@class='a-link a-link--large a-link-download '] ")));
		
		addField(FieldName.LOST_RADIO, new Field(FieldType.RADIO, By.xpath(".//div[contains(@id,'lost')]/input")));
		addField(FieldName.STOLEN_RADIO, new Field(FieldType.RADIO, By.xpath(".//div[contains(@id,'stolen')]/input")));
		addField(FieldName.REPLACEMENT_YES_RADIO, new Field(FieldType.RADIO, By.xpath(".//div[contains(@id,'replacement-cb-yes')]/input")));
		addField(FieldName.REPLACEMENT_NO_RADIO, new Field(FieldType.RADIO, By.xpath(".//div[contains(@id,'replacement-cb-no')]/input")));
		addField(FieldName.POLICE_REPORT_NUMBER, new Field(FieldType.TEXT, By.xpath("//input[@id='toolsData.lostEntries[0].policeReportNumber']")));
		addField(FieldName.POLICE_REMARK_TEXTFIELD, new Field(FieldType.TEXT, By.xpath("//textarea[@id='toolsData.lostEntries[0].policeRemark']")));
		addField(FieldName.SUBMIT_LOST_STOLEN_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//button[@data-track-label='ReportLostStolenSubmit']")));
		
		addField(FieldName.ORG_REFERENCE_LOST_STOLEN, new Field(FieldType.TEXT, By.xpath("//table[@class='m-table table m-table--repair-forms']//td[4]")));
		addField(FieldName.INVENTORY_KEY_LOST_STOLEN, new Field(FieldType.TEXT, By.xpath("//table[@class='m-table table m-table--repair-forms']//td[5]")));
		addField(FieldName.ORG_REFERENCE_REPAIR, new Field(FieldType.TEXT, By.xpath("//table[@class='m-table table m-table--repair-forms']//td[5]")));
		addField(FieldName.INVENTORY_KEY_REPAIR, new Field(FieldType.TEXT, By.xpath("//table[@class='m-table table m-table--repair-forms']//td[6]")));
		addField(FieldName.REPORT_LOST_STOLEN_FORM, new Field(FieldType.SECTION, By.xpath("//form[@id='toolsLostStolenForm']")));
		addField(FieldName.LOST_RADIO_LABEL, new Field(FieldType.RADIO, By.xpath(".//div[contains(@id,'lost')]/label")));
		addField(FieldName.STOLEN_RADIO_LABEL, new Field(FieldType.RADIO, By.xpath(".//div[contains(@id,'stolen')]/label")));
		addField(FieldName.REPLACEMENT_YES_RADIO_LABEL, new Field(FieldType.RADIO, By.xpath(".//div[contains(@id,'replacement-cb-yes')]/label")));
		addField(FieldName.REPLACEMENT_NO_RADIO_LABEL, new Field(FieldType.RADIO, By.xpath(".//div[contains(@id,'replacement-cb-no')]/label")));
		addField(FieldName.LOST_STOLEN_MESSAGE, new Field(FieldType.DIV, By.xpath("//div[contains(@class,'m-message m-message--centered')]")));
		addField(FieldName.PRODUCT_REPORT, new Field(FieldType.SECTION, By.xpath("//div[@class='o-toolmanagement-forms-block']")));

		addField(FieldName.REPAIR_BUTTON, new Field(FieldType.LINK, By.xpath("//button[@data-track-label='RepairFormOpen']")));
		addField(FieldName.REPAIR_FORM, new Field(FieldType.SECTION, By.xpath("//form[@id='toolsLostStolenForm']")));		
		addField(FieldName.TOOL_REPAIR_REQUEST, new Field(FieldType.SECTION, By.id("toolsRepairForm")));		
		
		
		addField(FieldName.IN_ROW_REORDER_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//form[@id='toolManagementReorder']/button")));
		addField(FieldName.PRODUCT_NO_LONGER_AVAILABLE, new Field(FieldType.TEXT, By.xpath(".//div[text()='" + Tools.getEnvironmentTestData("profile.tools.label.productNotAvailable") + "']"))); 
		addField(FieldName.COMBO_MAINROW, new Field(FieldType.DIV, By.xpath(".//tr[@class='tr-combo-mainrow']"))); 
		addField(FieldName.COMBO_SUBITEM_ROW, new Field(FieldType.DIV, By.xpath("(.//tr[@class='tr-combo--subitem'])[1]"))); 
		addField(FieldName.SEE_DETAILS_LINK, new Field(FieldType.BUTTON, By.xpath(".//a[@data-hoverlink='productdetails']")));
		addField(FieldName.PRODUCT_IMAGE, new Field(FieldType.BUTTON, By.xpath(".//figure/picture/img")));
		
		addField(FieldName.REPAIR_RADIO_LABEL, new Field(FieldType.RADIO, By.xpath("//label[@for='toolsData.repairEntries[0].calibrationNeeded']")));
		addField(FieldName.CALIBRATION_RADIO_LABEL, new Field(FieldType.RADIO, By.xpath("//label[@for='0radiobutton_2']")));
		addField(FieldName.TOOL_IN_CASE_RADIO_LABEL, new Field(FieldType.RADIO, By.xpath("//label[@for='toolsData.repairEntries[0].toolInCase']")));
		addField(FieldName.TOOL_NOT_IN_CASE_RADIO_LABEL, new Field(FieldType.RADIO, By.xpath("//label[@for='0radiobutton_4']")));
		addField(FieldName.TOOL_IN_CASE_INFO_ICON, new Field(FieldType.BUTTON, By.xpath("//span[@class='m-repair-form-subtitle']//a[@class='a-icon-info-after tooltipstered']")));
		addField(FieldName.REPAIR_DESCRIPTION, new Field(FieldType.TEXT, By.xpath("//textarea[@id='toolsData.repairEntries[0].info']")));
		addField(FieldName.REPAIR_CHECKBOX_1, new Field(FieldType.CHECKBOX, By.xpath("//label[@for='toolsData.repairEntries[0].selectedRepairCheckboxes[CHECKBOX_01]']")));
		addField(FieldName.REPAIR_CHECKBOX_2, new Field(FieldType.CHECKBOX, By.xpath("//label[@for='toolsData.repairEntries[0].selectedRepairCheckboxes[CHECKBOX_02]']")));
		addField(FieldName.REPAIR_CHECKBOX_3, new Field(FieldType.CHECKBOX, By.xpath("//label[@for='toolsData.repairEntries[0].selectedRepairCheckboxes[CHECKBOX_03]']")));
		addField(FieldName.REPAIR_CHECKBOX_4, new Field(FieldType.CHECKBOX, By.xpath("//label[@for='toolsData.repairEntries[0].selectedRepairCheckboxes[CHECKBOX_04]']")));
		addField(FieldName.REPAIR_CHECKBOX_5, new Field(FieldType.CHECKBOX, By.xpath("//label[@for='toolsData.repairEntries[0].selectedRepairCheckboxes[CHECKBOX_05]']")));
		addField(FieldName.REPAIR_CHECKBOX_6, new Field(FieldType.CHECKBOX, By.xpath("//label[@for='toolsData.repairEntries[0].selectedRepairCheckboxes[CHECKBOX_06]']")));
		addField(FieldName.COSTS_INFO_ICON, new Field(FieldType.BUTTON, By.xpath("//div[@class='full-width']/a[contains(@class,'icon')]")));
		addField(FieldName.REPAIR_COST_SECTION, new Field(FieldType.SECTION, By.xpath("//div[@class='full-width']")));
		addField(FieldName.INFO_ICON, new Field(FieldType.BUTTON, By.xpath(".//a[contains(@class,'icon')]")));
		addField(FieldName.SEND_REPAIR_REQUEST_BUTTON, new Field(FieldType.BUTTON, By.xpath("//button[@id='submitRequestRepairForm']")));
		addField(FieldName.REPAIR_ORDER_INFORMATION, new Field(FieldType.SECTION, By.xpath("//div[@class='m-repair-form-orderinfo-wrap']")));
		addField(FieldName.PURCHASE_ORDER_NUMBER, new Field(FieldType.TEXT, By.xpath(".//input[@id='toolsData.countrySpecificFields[PURCHASE_ORDER_NUMBER]']")));
		addField(FieldName.NUMBER_OF_PACKAGES, new Field(FieldType.TEXT, By.xpath(".//textarea[@id='toolsData.additionalInfo']")));
		addField(FieldName.ADDITIONAL_INFORMATION, new Field(FieldType.TEXT, By.xpath(".//input[@id='toolsData.countrySpecificFields[NUMBER_OF_PACKAGES]']")));
		addField(FieldName.YOUR_TOOL_PICKUP_ADDRESS, new Field(FieldType.TEXT, By.xpath("//div[@class='m-repair-form-infoblock js-infoblock'][1]")));
		addField(FieldName.YOUR_TOOL_PICKUP_CONTACT, new Field(FieldType.TEXT, By.xpath("//div[@class='m-repair-form-infoblock js-infoblock'][2]")));
		addField(FieldName.YOUR_DELIVERY_ADDRESS, new Field(FieldType.TEXT, By.xpath("//div[@class='m-repair-form-infoblock js-infoblock'][3]")));
		addField(FieldName.YOUR_DELIVERY_CONTACT, new Field(FieldType.TEXT, By.xpath("//div[@class='m-repair-form-infoblock js-infoblock'][4]")));
		addField(FieldName.DROPDOWN_LIST, new Field(FieldType.BUTTON, By.xpath(".//a[@class='chosen-single chosen-default']/parent::div")));
		addField(FieldName.CURRENTLY_SELECTED_VALUE, new Field(FieldType.BUTTON, By.xpath(".//div[@class='js-adress-replacement']")));
		addField(FieldName.REPAIR_REQUEST_FORM, new Field(FieldType.SECTION, By.xpath("//div[@class='o-toolmanagement-forms-block']")));
		addField(FieldName.DROPDOWN_VALUE, new Field(FieldType.TEXT, By.xpath(".//li")));
		addField(FieldName.REPAIR_HEADER, new Field(FieldType.SECTION, By.xpath("//div[@class='o-toolmanagement-forms-head']")));
		addField(FieldName.COSTS_INFO_OVERLAY, new Field(FieldType.TEXT, By.xpath("//div[contains(@id,'tooltipster-')]/div/div")));
		addField(FieldName.CLOSE, new Field(FieldType.BUTTON, By.xpath(".//span[@class='a-tooltip-closer']")));
		addField(FieldName.PICKUP_ADDRESS_INFO_OVERLAY, new Field(FieldType.TEXT, By.xpath("//div[contains(@id,'tooltipster-')]/div/div")));
		addField(FieldName.DELIVERY_ADDRESS_INFO_OVERLAY, new Field(FieldType.TEXT, By.xpath("//div[contains(@id,'tooltipster-')]/div/div")));
		addField(FieldName.REPAIR_SUCCESSS_MESSAGE, new Field(FieldType.SECTION, By.xpath("//div[@id='sendRepairRequestSuccessMessage']")));
		addField(FieldName.REPAIR_ERROR_MESSAGE, new Field(FieldType.SECTION, By.xpath("//div[@id='errorMessage0']")));
		addField(FieldName.REPAIR_WHEN_BELOW_LIMIT, new Field(FieldType.TEXT, By.xpath(".//input[@id='toolsData.repairEntries[0].costLimit']")));


		addField(FieldName.ITEM_ROW, new Field(FieldType.SECTION, By.xpath(".//tr[starts-with(@class,'tr') and not(contains(@class,'hide'))]")));
		addField(FieldName.SEARCH_FILTERS_SECTION, new Field(FieldType.SECTION, By.xpath("//div[contains(@class,'js-filterbar-layout-col')][1]")));
		addField(FieldName.SEARCH_BUTTON, new Field(FieldType.BUTTON, By.xpath(".//button[@id='filterbar_search_submit']/span")));
		addField(FieldName.SEARCH_TEXTFIELD, new Field(FieldType.TEXT, By.xpath(".//input[@id='filterbar_search_input']")));
		addField(FieldName.FILTER_ALL_TOOLS_LABEL, new Field(FieldType.RADIO, By.xpath(".//label[@for='repairlist_filterbar_radiofilter_1']")));
		addField(FieldName.FILTER_ALL_TOOLS_RADIO, new Field(FieldType.RADIO, By.xpath(".//input[@id='repairlist_filterbar_radiofilter_1']")));
		addField(FieldName.FILTER_ONLY_FLEET_LABEL, new Field(FieldType.RADIO, By.xpath(".//label[@for='repairlist_filterbar_radiofilter_2']")));
		addField(FieldName.FILTER_ONLY_FLEET_RADIO, new Field(FieldType.RADIO, By.xpath(".//input[@id='repairlist_filterbar_radiofilter_2']")));
		addField(FieldName.FILTER_ONLY_PURCHASED_LABEL, new Field(FieldType.RADIO, By.xpath(".//label[@for='repairlist_filterbar_radiofilter_3']")));
		addField(FieldName.FILTER_ONLY_PURCHASED_RADIO, new Field(FieldType.RADIO, By.xpath(".//input[@id='repairlist_filterbar_radiofilter_3']")));

		addField(FieldName.FILTER_INVENTORY_KEY, new Field(FieldType.SECTION, By.xpath("//span[@id='repairlist_filterbar_inventory_number-field']//ancestor::div[@class='m-filterbar2-col']")));
		addField(FieldName.FILTER_ORG_REFERENCE, new Field(FieldType.SECTION, By.xpath("//span[@id='repairlist_filterbar_org_reference-field']//ancestor::div[@class='m-filterbar2-col']")));
		
		addField(FieldName.ALERT_MESSAGE, new Field(FieldType.SECTION, By.xpath("//div[@class='js-message-container']")));
		addField(FieldName.REMOVE_FILTERS, new Field(FieldType.BUTTON, By.xpath(".//span[contains(@class,'m-filterbar2-reset')]")));
		addField(FieldName.START_DATE_PICKER, new Field(FieldType.SECTION, By.xpath("//div[@class='m-date-range-field a-input-datepicker'][1]")));
		addField(FieldName.END_DATE_PICKER, new Field(FieldType.SECTION, By.xpath("//div[@class='m-date-range-field a-input-datepicker'][2]")));
		addField(FieldName.TOOL_MANAGEMENT_LINKS, new Field(FieldType.SECTION, By.xpath("//span[text()='" + Tools.getEnvironmentTestData("navigation.account.label.toolmanagement") + "']//ancestor::li/span[2]")));
		addField(FieldName.TOOL_MANAGEMENT_BUTTON, new Field(FieldType.BUTTON, By.xpath("//span[text()='" + Tools.getEnvironmentTestData("navigation.account.label.toolmanagement") + "']")));
		
	}
}