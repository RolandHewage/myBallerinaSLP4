//package com.roland.samples.servicebus.connection;
//
//import org.ballerinalang.jvm.api.values.BObject;
//
//import java.io.IOException;
//import java.util.ArrayList;
//
//public class ListenerUtils {
//
//    private static Runtime runtime;
//
//    private static boolean started = false;
//    private static ArrayList<BObject> services = new ArrayList<>();
//    private static ArrayList<BObject> startedServices = new ArrayList<>();
//
//    public static void init(BObject listenerBObject) {
//        listenerBObject.addNativeData(RabbitMQConstants.CONSUMER_SERVICES, services);
//        listenerBObject.addNativeData(RabbitMQConstants.STARTED_SERVICES, startedServices);
//    }
//
//    public static Object registerListener(BObject listenerBObject, BObject service) {
//        runtime = Runtime.getRuntime();
//        if (service == null) {
//            return null;
//        }
//        if (isStarted()) {
//            services =
//                    (ArrayList<BObject>) listenerBObject.getNativeData(RabbitMQConstants.CONSUMER_SERVICES);
//            startReceivingMessages(service,  listenerBObject);
//        }
//        services.add(service);
//        return null;
//    }
//
//    private static boolean isStarted() {
//        return started;
//    }
//
//    private static void startReceivingMessages(BObject service, BObject listener) {
//        MessageDispatcher messageDispatcher =
//                new MessageDispatcher(service, runtime);
//        messageDispatcher.receiveMessages(listener);
//
//    }
//
////    public static Object registerListener(BObject listenerBObject, BObject service) {
////        runtime = Runtime.getRuntime();
////        Channel channel = (Channel) listenerBObject.getNativeData(RabbitMQConstants.CHANNEL_NATIVE_OBJECT);
////        if (service == null) {
////            return null;
////        }
////        try {
////            declareQueueIfNotExists(service, channel);
////        } catch (IOException e) {
////            RabbitMQMetricsUtil.reportError(channel, RabbitMQObservabilityConstants.ERROR_TYPE_REGISTER);
////            return RabbitMQUtils.returnErrorValue("I/O Error occurred while declaring the queue: " +
////                    e.getMessage());
////        }
////        if (isStarted()) {
////            BObject channelObject = (BObject) listenerBObject.get(RabbitMQConstants.CHANNEL_REFERENCE);
////            services =
////                    (ArrayList<BObject>) listenerBObject.getNativeData(RabbitMQConstants.CONSUMER_SERVICES);
////            startReceivingMessages(service, channel, listenerBObject, channelObject);
////        }
////        services.add(service);
////        return null;
////    }
//}
