package com.roland.samples.servicebus.connection;

import org.apache.commons.lang3.StringUtils;
import org.ballerinalang.jvm.JSONParser;
import org.ballerinalang.jvm.XMLFactory;
import org.ballerinalang.jvm.values.ArrayValue;

import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;

public class MessageUtils {

    public static Object getTextContent(ArrayValue messageContent, byte[] data) {
        byte[] messageCont = messageContent.getBytes();
        try {
            return new String(messageCont, StandardCharsets.UTF_8.name());
        } catch (UnsupportedEncodingException exception) {
            return "";
        }
    }

    public static Object getFloatContent(ArrayValue messageContent) {
        try {
            return Double.parseDouble(new String(messageContent.getBytes(), StandardCharsets.UTF_8.name()));
        } catch (UnsupportedEncodingException exception) {
            return "";
        }
    }

    public static Object getIntContent(ArrayValue messageContent) {
        try {
            return Integer.parseInt(new String(messageContent.getBytes(), StandardCharsets.UTF_8.name()));
        } catch (UnsupportedEncodingException exception) {
            return "";
        }
    }

    public static Object getJSONContent(ArrayValue messageContent) {
        try {
            Object json = JSONParser.parse(new String(messageContent.getBytes(), StandardCharsets.UTF_8.name()));
            if (json instanceof String) {
                return (String) json;
            }
            return json;
        } catch (UnsupportedEncodingException exception) {
            return "";
        }
    }

    public static Object getXMLContent(ArrayValue messageContent) {
        try {
            return XMLFactory.parse(new String(messageContent.getBytes(), StandardCharsets.UTF_8.name()));
        } catch (UnsupportedEncodingException exception) {
            return "";
        }
    }

}
