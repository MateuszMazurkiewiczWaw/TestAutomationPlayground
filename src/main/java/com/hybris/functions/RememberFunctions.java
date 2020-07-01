package com.hybris.functions;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import com.hybris.utils.Buffer;
import com.hybris.utils.Page;
import com.hybris.utils.Tools;
import com.hybris.utils.WebDriverProvider;

import org.openqa.selenium.WebDriver;

import static com.hybris.utils.Buffer.set;
import static com.hybris.utils.PageMapper.getRequiredPage;
import static com.hybris.utils.Tools.getNumberFromAmount;

import java.util.List;

/**
 *  Class contains basic methods used in steps related to saving values or sets of values into Buffer.
 *  Hybris recommended version 5.5
 *  TA-CORE
 *  @author Mateusz Mazurkiewicz
 *  @version 1.0
 *  @see Buffer
 */
public class RememberFunctions {

    /**
     * Gets value from the field on specified position and remembers it in the Buffer under given key. Remembers the position number under "PositionNumber" key.
     * @param pageName          name of the page containing the fields
     * @param position          position of the field
     * @param fieldName         name of the field
     * @param rememberAsName    Buffer key to remember the value
     * @see Buffer
     * @see Page#getFieldValuesInSpecifiedPositionNumber(int, String)
     */
    public static void rememberValueAtSpecificPosition(String pageName, int position, String fieldName, String rememberAsName) {
        String productName = getRequiredPage(pageName).getFieldValuesInSpecifiedPositionNumber(position, fieldName);
        Buffer.set(rememberAsName, productName);
        set("PositionNumber", Integer.toString(position));
    }

    /**
     * Gets value from the specified field and remembers it in the Buffer under given key. If the field is not displayed, remembers null value.
     * @param pageName      name of the page containing the field
     * @param fieldName     name of the field
     * @param rememberAs    Buffer key to remember the value
     * @see Buffer
     * @see Page#getFieldValue(String)
     */
    public static void rememberField(String pageName, String fieldName, String rememberAs) {
        if (getRequiredPage(pageName).isDisplayed(fieldName)) {

            set(rememberAs, getRequiredPage(pageName).getFieldValue(fieldName));
        } else {

            set(rememberAs, null);
        }
    }

    /**
     * Extracts numeric value from the specified field and remembers it in the Buffer under given key. If the field is not displayed, remembers null value.
     * @param pageName      name of the page containing the field
     * @param fieldName     name of the field
     * @param rememberAs    Buffer key to remember the value
     * @see Buffer
     * @see Tools#getNumberFromAmount(String)
     */
    public static void rememberDigits(String pageName, String fieldName, String rememberAs) {

        if (getRequiredPage(pageName).isDisplayed(fieldName)) {

            set(rememberAs, (getNumberFromAmount(getRequiredPage(pageName).getFieldValue(fieldName))).toString().replaceAll("\\.", ","));
        } else {

            set(rememberAs, null);
        }
    }

    /**
     * Gets a list of values from specified fields and remembers it in the Buffer under given key (remembers the list as String of values divided by semicolons "val1; val2; val3").
     * @param pageName          name of the page containing the field
     * @param ListName          name of the list of fields
     * @param rememberAsName    Buffer key to remember the value list
     * @see Buffer
     * @see WebDriver#findElements(By)
     */
    public static void rememberList(String pageName,String ListName,String rememberAsName) {

        List<WebElement> lis = WebDriverProvider.driver().findElements(getRequiredPage(pageName).getField(ListName).getLocator());
        String rememberedValue = "";
        int i = 0;
        for(WebElement item : lis)
        {
            i++;
            rememberedValue = rememberedValue + item.getAttribute("Value");
            if( i < lis.size())
            {
                rememberedValue = rememberedValue+";";
            }
        }
        set(rememberAsName,rememberedValue);
    }


}
