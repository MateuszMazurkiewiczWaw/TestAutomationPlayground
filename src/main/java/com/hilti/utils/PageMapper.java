package com.hilti.utils;

import static com.hilti.utils.MapCreator.pageMap;
import static org.apache.commons.lang3.StringUtils.EMPTY;


/**
 * This maps page names used in test Cucumber features to matching {@link Page} objects. Contains
 * @author Mateusz Mazurkiewicz
 * @see PageFactory
 */
public class PageMapper {

    static String page = EMPTY;
    static boolean samepage;

    /**
     * Returns a Page object matching the given page name.
     * @param pageName      name of the page
     * @return the Page object for given page name
     * @see PageFactory#getPage(Class)
     * @see MapCreator#getPageMap()
     */
    public static Page getRequiredPage(String pageName) {
        samepage = true;
        if (page.equals(pageName)) {
            Log.logInfo("Required page: " + pageName);
            page = pageName;
            samepage = false;
        }
        Class pageClass = null;

        for (String key : pageMap.keySet()) {
            if (key.equals(pageName)) {
                try {
                    pageClass = Class.forName(pageMap.get(key));
                    if (!samepage)
                        Log.logInfo("Return Class: " + pageClass.getName()+".class");

                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                }
                break;
            }
        }
        return PageFactory.getPage(pageClass);
    }
}