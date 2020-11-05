package org.ballerinalang.java.jms;

import org.ballerinalang.jvm.util.exceptions.BallerinaException;
import org.ballerinalang.jvm.values.api.BValueCreator;
import org.ballerinalang.jvm.values.api.BArray;

import javax.jms.BytesMessage;
import javax.jms.JMSException;

/**
 * Representation of {@link javax.jms.BytesMessage} with utility methods to invoke as inter-op functions.
 */
public class JmsBytesMessageUtils {

    /**
     * Reads a byte array from the bytes message stream.
     *
     * @param message {@link javax.jms.BytesMessage} object
     * @return Total number of bytes read into the buffer, or -1 if there is no more data
     * @throws BallerinaException throw a RuntimeException in an error situation
     */
    //TODO: Fix this workaround when Ballerina lang support to return primitive array and error as a union type
    public static BArray readJavaBytes(BytesMessage message) {
        try {
            int bodyLength = (int)message.getBodyLength();
            byte[] bytes = new byte[bodyLength];
            message.readBytes(bytes);
            return BValueCreator.createArrayValue(bytes);
        } catch (JMSException e) {
            throw new BallerinaException("Error occurred while reading bytes message.", e);
        }
    }

    /**
     * Reads a portion of the bytes message stream.
     *
     * @param message {@link javax.jms.BytesMessage} object
     * @param length Number of bytes to read
     * @return Total number of bytes read into the buffer, or -1 if there is no more data
     * @throws BallerinaException throw a RuntimeException in an error situation
     */
    //TODO: Fix this workaround when Ballerina lang support to return primitive array and error as a union type
    public static BArray readPortionOfJavaBytes(BytesMessage message, int length) {
        try {
            long bodyLength = message.getBodyLength();
            if (length > bodyLength) {
                throw new BallerinaException("Length should be less than or equal to the message's body length.");
            }
            byte[] bytes = new byte[length];
            message.readBytes(bytes, length);
            return BValueCreator.createArrayValue(bytes);
        } catch (JMSException e) {
            throw new BallerinaException("Error occurred while reading portion of the bytes message.", e);
        }
    }

    /**
     * Writes a byte array to the bytes message stream.
     *
     * @param message {@link javax.jms.BytesMessage} object
     * @param value byte[] array as ballerina {@link BArray}
     * @throws BallerinaJmsException in an error situation
     */
    public static void writeBytes(BytesMessage message, BArray value) throws BallerinaJmsException {
        try {
            byte[] bytes = value.getBytes();
            message.writeBytes(bytes);
        } catch (JMSException e) {
            throw new BallerinaJmsException("Error occurred while writing the bytes message.", e);
        }
    }

    /**
     * Writes a portion of a byte array to the bytes message stream.
     *
     * @param message {@link javax.jms.BytesMessage} object
     * @param value byte[] array as ballerina {@link BArray}
     * @param offset Initial offset within the byte array
     * @param length Number of bytes to use
     * @throws BallerinaJmsException in an error situation
     */
    public static void writePortionOfBytes(BytesMessage message, BArray value, int offset, int length)
            throws BallerinaJmsException {
        try {
            byte[] bytes = value.getBytes();
            message.writeBytes(bytes, offset, length);
        } catch (JMSException e) {
            throw new BallerinaJmsException("Error occurred while reading bytes.", e);
        }
    }
}
