package com.hybris.utils;

import static com.hybris.utils.Tools.glueString;

import java.util.HashMap;

import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

/**
 * This class contains methods used to parse xml NodeLists into Map objects. Used for Page and Field mappers.
 * @author Mateusz Mazurkiewicz
 * @see PageMapper
 * @see HashMap
 * @see XmlParser
 */
public class MapCreator {
    private static final String PAGE_FILE_LOCATION = "src/main/resources/PageMapper.xml";
    private static final String FIELD_FILE_LOCATION = "src/main/resources/FieldMapper.xml";
    public static HashMap<String, String> pageMap = getPageMap();
    public static HashMap<String, String> fieldMap = getFieldMap();

    /**
     * Returns a Map matching Page names used in Cucumber steps to Page class names.
     * @return a HashMap object containing Page map
     */
    public static HashMap<String, String> getPageMap() {
        NodeList nodeList = XmlParser.parseXmlWithPages(PAGE_FILE_LOCATION);
        HashMap<String, String> nMap = new HashMap<>();

        for (int temp = 0; temp < nodeList.getLength(); temp++) {

            Node nNode = nodeList.item(temp);

            if (nNode.getNodeType() == Node.ELEMENT_NODE) {
                Element eElement = (Element) nNode;

                for (int i = 0; i < nNode.getChildNodes().getLength(); i++) {
                    Node kNode = nNode.getChildNodes().item(i);
                    if (kNode.getNodeType() == Node.ELEMENT_NODE) {
                        Element nElement = (Element) kNode;

                        nMap.put(nElement.getElementsByTagName("name").item(0).getTextContent(),
                                glueString(eElement.getAttribute("id"), "." + nElement.getElementsByTagName("class").item(0).getTextContent()));
                    }
                }
            }
        }
        return nMap;
    }

    /**
     * Returns a Map matching field names to time delays required to interact with them.
     * @return a HashMap object containing the Field-Time map
     */
    public static HashMap<String, String> getFieldMap() {
        NodeList nodeList = XmlParser.parseXmlWithFields(FIELD_FILE_LOCATION);
        HashMap<String, String> nMap = new HashMap<>();

        for (int temp = 0; temp < nodeList.getLength(); temp++) {

            Node nNode = nodeList.item(temp);

            if (nNode.getNodeType() == Node.ELEMENT_NODE) {
                Element eElement = (Element) nNode;

                nMap.put(eElement.getElementsByTagName("field").item(0).getTextContent(),eElement.getElementsByTagName("time").item(0).getTextContent());
            }
        }

        return nMap;
    }

}
