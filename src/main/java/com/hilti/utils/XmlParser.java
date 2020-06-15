package com.hilti.utils;

import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import java.io.File;
import java.io.IOException;

/**
 * Contains methods used for parsing XML files into {@link NodeList} objects.
 * Specifically used for PageMapper and FieldMapper files.
 * @author Mateusz Mazurkiewicz
 * @see MapCreator
 */
public class XmlParser {

    /**
     * Parses an XML file from the selected location and gets its "pages" nodes.
     * @param fileLocation location of the xml file
     * @return a NodeList of page nodes
     * @see DocumentBuilder
     * @see Document#getElementsByTagName(String)
     */
    static NodeList parseXmlWithLoginData(String fileLocation) {
        NodeList nodes = null;
        try {
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            Document document = builder.parse(new File(fileLocation));
            document.getDocumentElement().normalize();
            nodes = document.getElementsByTagName("pages");
        } catch (ParserConfigurationException e) {
            Log.logError("There was a problem with XML Parser configuration.");
            e.printStackTrace();
        } catch (SAXException e) {
            Log.logError("There was a problem with XML syntax: "+fileLocation);
            e.printStackTrace();
        } catch (IOException e) {
            Log.logError("There was a problem reading file: "+fileLocation);
            e.printStackTrace();
        }
        return nodes;
    }

	 /**
     * Parses an XML file from the selected location and gets its "package" nodes.
     * @param fileLocation  location of the xml file
     * @return a NodeList of package nodes
     * @see DocumentBuilder
     * @see Document#getElementsByTagName(String)
     */
    public static NodeList parseXmlWithPages(String fileLocation){
        NodeList nList = null;
        try {
            File xmlFile = new File(fileLocation);
            DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
            Document doc = dBuilder.parse(xmlFile);
            doc.getDocumentElement().normalize();
            nList = doc.getElementsByTagName("package");
        }  catch (Exception e) {
            Log.logError("File " + fileLocation + " not parsing correctly");
            e.printStackTrace();
            }
        return nList;
    }

    /**
     * Parses an XML file from the selected location and gets its "fields" nodes.
     * @param fileLocation  location of the xml file
     * @return a NodeList of fields nodes
     * @see DocumentBuilder
     * @see Document#getElementsByTagName(String)
     */
    public static NodeList parseXmlWithFields(String fileLocation){
        NodeList nList = null;
        try {
            File xmlFile = new File(fileLocation);
            DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
            Document doc = dBuilder.parse(xmlFile);
            doc.getDocumentElement().normalize();
            nList = doc.getElementsByTagName("fields");
        }  catch (Exception e) {
            Log.logError("File " + fileLocation + "not parsing correctly");
            e.printStackTrace();
        }
        return nList;
    }
    
    /**
     * Parses an XML file from the selected location and gets its "machine" nodes.
     * @param fileLocation  location of the xml file
     * @return a NodeList of machine nodes
     * @see DocumentBuilder
     * @see Document#getElementsByTagName(String)
     */
    public static NodeList parseXmlWithMachines(String fileLocation){
        NodeList nList = null;
        try {
            File xmlFile = new File(fileLocation);
            DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
            Document doc = dBuilder.parse(xmlFile);
            doc.getDocumentElement().normalize();
            nList = doc.getElementsByTagName("machine");
        }  catch (Exception e) {
            Log.logError("File " + fileLocation + "not parsing correctly");
            e.printStackTrace();
        }
        return nList;
    }

}
