package com.roland.samples.servicebus.connection;

import com.microsoft.azure.servicebus.*;
import com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder;
import com.microsoft.azure.servicebus.primitives.ServiceBusException;

import java.util.logging.Logger;

public class AsbConnectionUtils {

    private static final Logger LOG = Logger.getLogger(AsbConnectionUtils.class.getName());

    private String serviceBusName;

    private QueueClient receiveClient;
    private QueueClient addClient;
    private String connectionId;
    private String accessKeyName;
    private String accessKey;

    public void connect(String accessKeyName, String accessKey) {
        LOG.info("AsbConnectionUtils: Connecting...");
        this.accessKeyName = accessKeyName;
        this.accessKey = accessKey;
        connectionId = serviceBusName + "-" + accessKeyName;
        LOG.info("AsbConnectionUtils: Connected...");
    }

    public void disconnect() {
        if (receiveClient != null) {
            try {
                receiveClient.close();
            } catch (ServiceBusException e) {
                e.printStackTrace();
            }
        }
        if (addClient != null) {
            try {
                addClient.close();
            } catch (ServiceBusException e) {
                e.printStackTrace();
            }
        }
        receiveClient = null;
        addClient = null;
    }

    public boolean validateConnection() {
        return  receiveClient != null;
    }

    public String getConnectionId() {
        return connectionId;
    }

    public void runQueueListener(String queueName) {
        ConnectionStringBuilder csb = new ConnectionStringBuilder(serviceBusName, queueName, accessKeyName, accessKey);
        try {
            receiveClient = new QueueClient(csb, ReceiveMode.PEEKLOCK);
//            registerReceiver(receiveClient, callback);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void addMessageToQueue(String queueName, String message) {
        ConnectionStringBuilder csb = new ConnectionStringBuilder(serviceBusName, queueName, accessKeyName, accessKey);
        try {
            addClient = new QueueClient(csb, ReceiveMode.PEEKLOCK);
            LOG.info("Adding new message to the queue: " + queueName + " - message: " + message);
            addClient.send(new Message(message));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

//    private void registerReceiver(QueueClient receiveClient,
//                                  final SourceCallback callback) throws ServiceBusException, InterruptedException {
//        receiveClient.registerMessageHandler(new IMessageHandler() {
//                                                 @Override
//                                                 public CompletableFuture<Void> onMessageAsync(IMessage message) {
//                                                     try {
//                                                         callback.process(new String(message.getBody(), UTF_8));
//                                                     } catch (Exception e) {
//                                                         e.printStackTrace();
//                                                     }
//                                                     return CompletableFuture.completedFuture(null);
//                                                 }
//
//                                                 @Override
//                                                 public void notifyException(Throwable exception, ExceptionPhase phase) {
//
//                                                 }
//                                             },
//                new MessageHandlerOptions(1, true, Duration.ofMinutes(1)));
//    }

    public String getServiceBusName() {
        return serviceBusName;
    }

    public void setServiceBusName(String serviceBusName) {
        this.serviceBusName = serviceBusName;
    }

}

