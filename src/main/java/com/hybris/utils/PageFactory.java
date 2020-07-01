package com.hybris.utils;


import java.util.HashMap;
import java.util.Map;

/**
 * This class maps Page objects to their names to avoid multiple Page initiations throughout test scenarios.
 * @author Mateusz Mazurkiewicz
 * @see Page
 * @see HashMap
 */
public class PageFactory {
	/**
	 * HashMap containing Page objects and their class names.
	 * @see PageFactory#getPage(Class)
	 */
	private static final Map<String, Page> pages = new HashMap<>();

	/**
	 * Returns a Page object of the given class. If the page object was not initialized yet, initializes it and puts into {@link PageFactory#pages}.
	 * @param tClass	class of the desired Page
	 * @param <T>		class descriptor
	 * @return a Page object of the given page class
	 * @see Class#newInstance()
	 */
	public static  <T extends Page>T getPage(Class<T> tClass) {
	    
		Page page = pages.get(tClass.getName())
				;
		if (page == null) {
			try {

			    page = tClass.newInstance();
			    pages.put(tClass.getName(), page);
				
			} catch (InstantiationException | IllegalAccessException e) {
				e.printStackTrace();
			}
		}
		page.waitForPage();

		return (T) page;
	}


}
