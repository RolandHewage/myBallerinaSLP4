//package com.roland.samples.servicebus.connection;
//
//import org.ballerinalang.jvm.api.values.BObject;
//
//import java.io.IOException;
//import java.nio.channels.Channel;
//
//public class ListenerUtils {
//    public static Object registerListener(BObject listenerBObject, BObject service) {
//        runtime = Runtime.getCurrentRuntime();
//        Channel channel = (Channel) listenerBObject.getNativeData(RabbitMQConstants.CHANNEL_NATIVE_OBJECT);
//        if (service == null) {
//            return null;
//        }
//        try {
//            declareQueueIfNotExists(service, channel);
//        } catch (IOException e) {
//            RabbitMQMetricsUtil.reportError(channel, RabbitMQObservabilityConstants.ERROR_TYPE_REGISTER);
//            return RabbitMQUtils.returnErrorValue("I/O Error occurred while declaring the queue: " +
//                    e.getMessage());
//        }
//        if (isStarted()) {
//            BObject channelObject = (BObject) listenerBObject.get(RabbitMQConstants.CHANNEL_REFERENCE);
//            services =
//                    (ArrayList<BObject>) listenerBObject.getNativeData(RabbitMQConstants.CONSUMER_SERVICES);
//            startReceivingMessages(service, channel, listenerBObject, channelObject);
//        }
//        services.add(service);
//        return null;
//    }
//}
