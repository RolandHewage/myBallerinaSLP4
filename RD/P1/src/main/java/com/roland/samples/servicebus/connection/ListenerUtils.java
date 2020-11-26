package com.roland.samples.servicebus.connection;

import org.ballerinalang.jvm.api.BRuntime;
import org.ballerinalang.jvm.api.BStringUtils;
import org.ballerinalang.jvm.api.values.BError;
import org.ballerinalang.jvm.api.values.BMap;
import org.ballerinalang.jvm.api.values.BObject;
import org.ballerinalang.jvm.api.values.BString;
import org.ballerinalang.jvm.types.AnnotatableType;

import java.io.IOException;
import java.util.ArrayList;

public class ListenerUtils {

    private static BRuntime runtime;

    private static boolean started = false;
    private static ArrayList<BObject> services = new ArrayList<>();
    private static ArrayList<BObject> startedServices = new ArrayList<>();

    public static void init(BObject listenerBObject) {
        listenerBObject.addNativeData(RabbitMQConstants.CONSUMER_SERVICES, services);
        listenerBObject.addNativeData(RabbitMQConstants.STARTED_SERVICES, startedServices);
    }

    public static Object registerListener(BObject listenerBObject, BObject service) {
        runtime = BRuntime.getCurrentRuntime();
        if (service == null) {
            return null;
        }
        if (isStarted()) {
            services = (ArrayList<BObject>) listenerBObject.getNativeData(RabbitMQConstants.CONSUMER_SERVICES);
            startReceivingMessages(service,  listenerBObject);
        }
        services.add(service);
//        System.out.println(service.getType().getName());
        System.out.println(service.getType().getQualifiedName());
        System.out.println(services);
        return null;
    }

    private static boolean isStarted() {
        return started;
    }

    private static void startReceivingMessages(BObject service, BObject listener) {
        MessageDispatcher messageDispatcher =
                new MessageDispatcher(service, runtime);
        messageDispatcher.receiveMessages(listener);

    }

    public static Object start(BObject listenerBObject) {
        System.out.println("Roly1");
        runtime = BRuntime.getCurrentRuntime();
        @SuppressWarnings(RabbitMQConstants.UNCHECKED)
        ArrayList<BObject> services =
                (ArrayList<BObject>) listenerBObject.getNativeData(RabbitMQConstants.CONSUMER_SERVICES);
        @SuppressWarnings(RabbitMQConstants.UNCHECKED)
        ArrayList<BObject> startedServices =
                (ArrayList<BObject>) listenerBObject.getNativeData(RabbitMQConstants.STARTED_SERVICES);
        if (services == null || services.isEmpty()) {
            System.out.println("Roly1");
            return null;
        }
        for (BObject service : services) {
            if (startedServices == null || !startedServices.contains(service)) {
//                BMap serviceConfig = (BMap) ((AnnotatableType) service.getType())
//                        .getAnnotation(BStringUtils.fromString(RabbitMQConstants.PACKAGE_RABBITMQ_FQN + ":"
//                                + RabbitMQConstants.SERVICE_CONFIG));
//                @SuppressWarnings(RabbitMQConstants.UNCHECKED)
//                BMap<BString, Object> queueConfig =
//                        (BMap<BString, Object>) serviceConfig.getMapValue(RabbitMQConstants.ALIAS_QUEUE_CONFIG);
                MessageDispatcher messageDispatcher =
                        new MessageDispatcher(service, runtime);
                messageDispatcher.receiveMessages(listenerBObject);
                System.out.println("Ross1");
            }
        }
        started = true;
        System.out.println("Roland1");
        return null;
    }

    public static Object detach(BObject listenerBObject, BObject service) {
        @SuppressWarnings(RabbitMQConstants.UNCHECKED)
        ArrayList<BObject> startedServices =
                (ArrayList<BObject>) listenerBObject.getNativeData(RabbitMQConstants.STARTED_SERVICES);
        @SuppressWarnings(RabbitMQConstants.UNCHECKED)
        ArrayList<BObject> services =
                (ArrayList<BObject>) listenerBObject.getNativeData(RabbitMQConstants.CONSUMER_SERVICES);
        String serviceName = service.getType().getName();
        String queueName = (String) service.getNativeData(RabbitMQConstants.QUEUE_NAME.getValue());

        System.out.println("[ballerina/rabbitmq] Consumer service unsubscribed from the queue " + queueName);

        listenerBObject.addNativeData(RabbitMQConstants.CONSUMER_SERVICES,
                removeFromList(services, service));
        listenerBObject.addNativeData(RabbitMQConstants.STARTED_SERVICES,
                removeFromList(startedServices, service));
        return null;
    }

    /**
     * Removes a given element from the provided array list and returns the resulting list.
     *
     * @param arrayList   The original list
     * @param objectValue Element to be removed
     * @return Resulting list after removing the element
     */
    public static ArrayList<BObject> removeFromList(ArrayList<BObject> arrayList, BObject objectValue) {
        if (arrayList != null) {
            arrayList.remove(objectValue);
        }
        return arrayList;
    }


//    public static Object registerListener(BObject listenerBObject, BObject service) {
//        runtime = Runtime.getRuntime();
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
}
