package com.hybris.utils;

import java.util.HashMap;
import java.util.Map;

/**
 * Class contains a buffer used for saving values during tests, along with methods to operate it.
 * @author Mateusz Mazurkiewicz
 * @see Map
 */
public class Buffer {

	private static final ThreadLocal<Map<String, String>> buffer = new ThreadLocal<Map<String, String>>() {
		@Override
		protected Map<String, String> initialValue() {
			return new HashMap<>();
		}
	};

	/**
	 * Returns the current buffer as Map.
	 * @return	the current buffer
	 */
	public static Map<String, String> get() {
		return buffer.get();
	}

	/**
	 * Initializes the buffer by clearing it and logs the action.
	 * @see Log
	 * @see Map
	 */
	public static void initialize() {
	    
		get().clear();
		Log.logInfo("Buffer.init");
	}

	/**
	 * Sets the specified value to a given key and logs the action.
	 * @param key	Map key
	 * @param value	value to be set
	 * @see Log
	 * @see Map
	 */
	public static void set(String key, String value) {
	    
		get().put(key, value);
		Log.logInfo(String.format("Buffer.set: %s=%s", key, value));
	}

	/**
	 * Returns the value set in the buffer under specified key. Logs the action.
	 * @param key	Map key
	 * @return	value set under specified key
	 * @see Log
	 * @see Map
	 */
	public static String get(String key) {
		Log.logInfo(String.format("Buffer.get: %s=%s", key, get().get(key)));
		return get().get(key);
	}

	/**
	 * Returns whether Buffer contains the specified key.
	 * @param key	checked Map key
	 * @return whether the buffer contains specified key
	 * @see Map
	 */
	public static boolean containsKey(String key) {
		return get().containsKey(key);
	}
}
