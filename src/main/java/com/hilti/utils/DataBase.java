package com.hilti.utils;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

/**
 * Contains database related methods.
 * @author Mateusz Mazurkiewicz
 */
public class DataBase {
	
	private static Connection connection;
	
	public static void establishConnection(String dataBase){		
		String hostName = getDatabaseProperty(dataBase, "host_name");
		String portNumber = getDatabaseProperty(dataBase, "port_number");
		String database = getDatabaseProperty(dataBase, "database_name");
		String userName = getDatabaseProperty(dataBase, "user_name");
		String password = getDatabaseProperty(dataBase, "password");
		
	      try {
	         Class.forName("oracle.jdbc.OracleDriver");
	         connection = DriverManager.getConnection("jdbc:oracle:thin:@" + hostName + ":" + portNumber + "/" + database, userName, password);
	         Log.logInfo("Connection to database " + dataBase + " has been established.");
	      } catch (Exception e) {
	         e.printStackTrace();
	         Log.logError("There was a problem with establishing connection to a database.");
	      }	      
	}
	
	public static void executeVoidQuery(String dataBase, String query){		
		establishConnection(dataBase);		
		try {
			Statement statement = connection.createStatement();
			statement.execute(query);	
			connection.close();
			Log.logInfo("Executed query: " + query);			
		} catch (SQLException e) {
			e.printStackTrace();
			Log.logError("Problem with executing query in database.");
		}		
	}
	
	public static String getSingleObjectFromQuery(String dataBase, String query, String column){		
		ResultSet results;
		String result = null;	
		establishConnection(dataBase);		
		try {
			Statement statement = connection.createStatement();
			results = statement.executeQuery(query);
			while (results.next()){
				result = results.getString(column);
			}	
			connection.close();
			Log.logInfo("Executed query: " + query);			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			Log.logError("Problem with extracting data from database.");
		}	
		return result;
	}
	
	
	// Tools		
	private static String getDatabaseProperty(String dataBase, String propertyName){
		Properties properties = new Properties();
		InputStream inputStream = null;
			if (dataBase.equals("opl")){			
				inputStream = Configuration.class.getClassLoader().getResourceAsStream("opl_database.properties");
			} else if (dataBase.equals("fix")){
				inputStream = Configuration.class.getClassLoader().getResourceAsStream("fix_database.properties");
			}
	
		try {
			properties.load(inputStream);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return properties.getProperty(propertyName);		
	}

}
