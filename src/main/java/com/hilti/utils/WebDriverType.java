package com.hilti.utils;

import static org.apache.commons.lang3.StringUtils.EMPTY;

/**
 * The enumeration containing supported browser locations (IE, CHROME, FIREFOX).
 * @author Mateusz Mazurkiewicz
 * @see WebDriverProvider
 */
public enum WebDriverType {

    IE("//src//test//resources//drivers//IEDriverServer.exe"),
    CHROME_WIN("src//test//resources//drivers//ChromeDriverWin.exe"),
    CHROME_MAC("src//test//resources//drivers//ChromeDriverMac"),
    FIREFOX(EMPTY),
    OPERA("src//test//resources//drivers//operadriver.exe"),
    SAFARI(EMPTY);


    /**
     * Location of selected driver
     */
    private String driverLocation;

    /**
     * Enum constructor, sets the {@link WebDriverType#driverLocation} to the chosen location.
     * @param driverLocation    chosen driver location
     */
    WebDriverType(String driverLocation) {
	
	this.driverLocation =driverLocation;
    }

    /**
     * Returns the current driver's location.
     * @return the driver's location
     */
    public String getDriverLocation() {
        return driverLocation;
    }
}
