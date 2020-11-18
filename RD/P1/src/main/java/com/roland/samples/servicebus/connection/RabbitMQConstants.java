package com.roland.samples.servicebus.connection;

import org.ballerinalang.jvm.api.values.BString;
import org.ballerinalang.jvm.api.BStringUtils;

public class RabbitMQConstants {
    // Channel listener constant fields
    public static final String CONSUMER_SERVICES = "consumer_services";
    public static final String STARTED_SERVICES = "started_services";
    public static final String FUNC_ON_MESSAGE = "onMessage";

    public static final BString QUEUE_NAME = BStringUtils.fromString("queueName");
}
