package org.ballerinalang.java.jms;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.jms.ExceptionListener;
import javax.jms.JMSException;

/**
 * Logging exception listener class for JMS {@link javax.jms.Connection}.
 */
public class LoggingExceptionListener implements ExceptionListener {
    private static final Logger LOGGER = LoggerFactory.getLogger(LoggingExceptionListener.class);

    @Override
    public void onException(JMSException exception) {
        LOGGER.error("Connection exception received.", exception);
    }
}
