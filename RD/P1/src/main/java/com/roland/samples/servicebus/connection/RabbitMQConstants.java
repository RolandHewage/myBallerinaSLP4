package com.roland.samples.servicebus.connection;

import org.ballerinalang.jvm.api.values.BString;
import org.ballerinalang.jvm.api.BStringUtils;
import org.ballerinalang.jvm.types.BPackage;

public class RabbitMQConstants {

    public static final String ORG_NAME = "roland";
    static final String RABBITMQ = "asb_module";
    static final String RABBITMQ_VERSION = "0.1.0";
    public static final BPackage PACKAGE_ID_RABBITMQ =
            new BPackage(ORG_NAME, "rabbitmq", RABBITMQ_VERSION);

    // Channel listener constant fields
    public static final String CONSUMER_SERVICES = "consumer_services";
    public static final String STARTED_SERVICES = "started_services";
    public static final String FUNC_ON_MESSAGE = "onMessage";

    public static final String MESSAGE_OBJECT = "Message";
    public static final BString MESSAGE_CONTENT = BStringUtils.fromString("messageContent");

    public static final BString QUEUE_NAME = BStringUtils.fromString("queueName");
}
