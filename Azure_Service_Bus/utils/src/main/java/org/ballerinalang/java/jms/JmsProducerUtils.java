package org.ballerinalang.java.jms;

import javax.jms.Destination;
import javax.jms.JMSException;
import javax.jms.MessageProducer;
import javax.jms.Session;

/**
 * Representation of {@link javax.jms.MessageProducer} with utility methods to invoke as inter-op functions.
 */
public class JmsProducerUtils {

    private JmsProducerUtils() {}

    /**
     * Creates a MessageProducer to send messages to the specified destination.
     *
     * @param session {@link javax.jms.Session} object
     * @param destination {@link javax.jms.Destination} object
     * @return  {@link javax.jms.MessageProducer} object
     * @throws BallerinaJmsException in an error situation
     */
    public static MessageProducer createJmsProducer(Session session, Destination destination)
            throws BallerinaJmsException {
        try {
            return session.createProducer(destination);
        } catch (JMSException e) {
            throw new BallerinaJmsException("Error creating queue sender.", e);
        }
    }
}
