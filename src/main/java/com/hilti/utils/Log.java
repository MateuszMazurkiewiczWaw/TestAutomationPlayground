package com.hilti.utils;


import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * This class controls the project's loggers (status and console).
 * @author Mateusz Mazurkiewicz
 * @see Logger
 */
public class Log {
    
	private static final Logger statusLog = LogManager.getLogger("STATUS");
	private static final Logger consoleLog = LogManager.getLogger("Console");

	/**
	 * Logs info whether the test scenario passed or failed.
	 * @param scenarioName	name of the scenario
	 * @param status		status "passed" or other (other will be logged as "failed")
	 * @see Logger#info(String)
	 */
	public static void logStatus(String scenarioName, String status) {
	    
		status = status.equals("passed") ? status : "failed";
		statusLog.info(scenarioName + ";" + status);
	}

	/**
	 * Logs the specified message as info log.
	 * @param info	message to be logged
	 * @see Logger#info(String)
	 */
	public static void logInfo(String info) {
		consoleLog.info(info);
	}

	/**
	 * Logs the specified message as error log.
	 * @param errorMessage	message(error) to be logged
	 * @see Logger#error(String)
	 */
	public static void logError(String errorMessage) {
		consoleLog.error(errorMessage);
	}
}
