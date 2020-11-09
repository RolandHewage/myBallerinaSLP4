package com.roland.samples.servicebus;

import com.microsoft.azure.servicebus.*;
import com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder;
import com.roland.samples.servicebus.connection.ConnectionUtils;

import java.util.concurrent.CancellationException;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class Main {

    private static final String connectionString = "Endpoint=sb://roland1.servicebus.windows.net/;SharedAccessKeyName=RootManageSharedAccessKey;SharedAccessKey=OckfvtMMw6GHIftqU0Jj0A0jy0uIUjufhV5dCToiGJk=";
    private static final String entityPath = "roland1queue";

    public static void main(String[] args) throws Exception {

        ConnectionUtils connectionUtils = new ConnectionUtils();
//
//        // Create a QueueClient instance for receiving using the connection string builder
//        // We set the receive mode to "PeekLock", meaning the message is delivered
//        // under a lock and must be acknowledged ("completed") to be removed from the queue
//        QueueClient receiveClient = new QueueClient(new ConnectionStringBuilder(connectionString, entityPath), ReceiveMode.PEEKLOCK);
//        // We are using single thread executor as we are only processing one message at a time
//        ExecutorService executorService = Executors.newSingleThreadExecutor();
//        connectionUtils.registerReceiver(receiveClient, executorService);
//
//        // Create a QueueClient instance for sending and then asynchronously send messages.
//        // Close the sender once the send operation is complete.
//        QueueClient sendClient = new QueueClient(new ConnectionStringBuilder(connectionString, entityPath), ReceiveMode.PEEKLOCK);
//        connectionUtils.sendMessagesAsync(sendClient, "Roly").thenRunAsync(() -> sendClient.closeAsync());
//
//        // wait for ENTER or 10 seconds elapsing
//        connectionUtils.waitForEnter(10);
//
//        // shut down receiver to close the receive loop
//        receiveClient.close();
//        executorService.shutdown();
//
//        System.exit(0);





//        QueueClient sendClient;
//        IMessageReceiver receiver;
//        CompletableFuture receiveTask;
//
//        // Create a QueueClient instance using the connection string builder
//        // We set the receive mode to "PeekLock", meaning the message is delivered
//        // under a lock and must be acknowledged ("completed") to be removed from the queue
//
//        sendClient = new QueueClient(new ConnectionStringBuilder(connectionString, "roland1queue"), ReceiveMode.PEEKLOCK);
//        connectionUtils.sendMessagesAsync(sendClient,"Roland").thenRunAsync(() -> sendClient.closeAsync());
//
//
//        receiver = ClientFactory.createMessageReceiverFromConnectionStringBuilder(
//                new ConnectionStringBuilder(connectionString, "roland1queue"), ReceiveMode.PEEKLOCK);
//        receiveTask = connectionUtils.receiveMessagesAsync(receiver);
//
//        connectionUtils.waitForEnter(10);
//
//        receiveTask.cancel(true);
//        receiver.close();
//
//        CompletableFuture.allOf( receiveTask.exceptionally(t -> { if (t instanceof CancellationException) { return null; } throw new RuntimeException((Throwable) t); })).join();
//
//        System.exit(0);




        TopicClient sendClient;
        SubscriptionClient subscription1Client;
        SubscriptionClient subscription2Client;
        SubscriptionClient subscription3Client;

        // Create a QueueClient instance using the connection string builder
        // We set the receive mode to "PeekLock", meaning the message is delivered
        // under a lock and must be acknowledged ("completed") to be removed from the queue
        subscription1Client = new SubscriptionClient(new ConnectionStringBuilder(connectionString, "roland1topic/subscriptions/roland1subscription1"), ReceiveMode.PEEKLOCK);
        subscription2Client = new SubscriptionClient(new ConnectionStringBuilder(connectionString, "roland1topic/subscriptions/roland1subscription2"), ReceiveMode.PEEKLOCK);
        subscription3Client = new SubscriptionClient(new ConnectionStringBuilder(connectionString, "roland1topic/subscriptions/roland1subscription3"), ReceiveMode.PEEKLOCK);

        ExecutorService executorService = Executors.newCachedThreadPool();
        connectionUtils.registerMessageHandlerOnClient(subscription1Client, executorService);
        connectionUtils.registerMessageHandlerOnClient(subscription2Client, executorService);
        connectionUtils.registerMessageHandlerOnClient(subscription3Client, executorService);

        sendClient = new TopicClient(new ConnectionStringBuilder(connectionString, "roland1topic"));
        connectionUtils.sendMessagesAsyncT(sendClient).thenRunAsync(() -> sendClient.closeAsync());

        // wait for ENTER or 10 seconds elapsing
        connectionUtils.waitForEnter(10);

        CompletableFuture.allOf(
                subscription1Client.closeAsync(),
                subscription2Client.closeAsync(),
                subscription3Client.closeAsync()).join();

        executorService.shutdown();

        System.exit(0);
    }
}
