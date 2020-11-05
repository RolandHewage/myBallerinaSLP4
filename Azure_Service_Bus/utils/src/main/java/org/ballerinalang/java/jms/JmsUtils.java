package org.ballerinalang.java.jms;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Utility class for JMS related common operations.
 */
public class JmsUtils {

    private static final Logger LOGGER = LoggerFactory.getLogger(JmsUtils.class);

    /**
     * Utility class cannot be instantiated.
     */
    private JmsUtils() {
    }

    /**
     * Check given string is not null or empty after trimming
     * @param str String value
     * @return true/false based on the input
     */
    static boolean notNullOrEmptyAfterTrim(String str) {
        return !(str == null || str.trim().isEmpty());
    }
}

