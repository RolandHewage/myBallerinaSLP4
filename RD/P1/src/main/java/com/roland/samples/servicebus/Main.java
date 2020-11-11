package com.roland.samples.servicebus;

import com.microsoft.azure.servicebus.*;
import com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder;
import com.roland.samples.servicebus.connection.ConUtils;
import com.roland.samples.servicebus.connection.ConnectionUtils;
import com.roland.samples.servicebus.connection.Utils;

import java.time.Duration;
import java.util.concurrent.CancellationException;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class Main {

    private static final String connectionString = "Endpoint=sb://roland1.servicebus.windows.net/;SharedAccessKeyName=RootManageSharedAccessKey;SharedAccessKey=OckfvtMMw6GHIftqU0Jj0A0jy0uIUjufhV5dCToiGJk=";
    private static final String entityPath = "roland1queue";

    public static void main(String[] args) throws Exception {

//        ConnectionUtils connectionUtils = new ConnectionUtils();
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



//        // Basic send and receive message functionality to Azure service bus queue
//        ConUtils conUtils = new ConUtils();
//        String inputString = "roland";
//        byte[] byteArray = inputString.getBytes();
//        conUtils.send(connectionString,entityPath, inputString);
//        conUtils.receive(connectionString,entityPath);
//        System.exit(0);

//        // Basic publish and subscribe message functionality to Azure service bus topis and subscriptions
//        ConUtils conUtils = new ConUtils();
//        String inputString = "roland";
//        byte[] byteArray = inputString.getBytes();
//        conUtils.send(connectionString,"roland1topic", inputString);
//        conUtils.receive(connectionString,"roland1topic/subscriptions/roland1subscription1");
//        conUtils.receive(connectionString,"roland1topic/subscriptions/roland1subscription2");
//        conUtils.receive(connectionString,"roland1topic/subscriptions/roland1subscription3");
//        System.exit(0);

//        // Basic send and receive batch of messages functionality to Azure service bus queue
//        ConUtils conUtils = new ConUtils();
//        String inputString = "roland";
//        conUtils.sendBatch(connectionString,entityPath, inputString, 4);
//        conUtils.receiveBatch(connectionString,entityPath, 4);
//        System.exit(0);

//        // Basic publish and subscribe batch of messages functionality to Azure service bus topis and subscriptions
//        ConUtils conUtils = new ConUtils();
//        String inputString = "roland";
//        byte[] byteArray = inputString.getBytes();
//        conUtils.sendBatch(connectionString,"roland1topic", inputString, 3);
//        conUtils.receiveBatch(connectionString,"roland1topic/subscriptions/roland1subscription1", 3);
//        conUtils.receiveBatch(connectionString,"roland1topic/subscriptions/roland1subscription2", 3);
//        conUtils.receiveBatch(connectionString,"roland1topic/subscriptions/roland1subscription3", 3);
//        System.exit(0);

//        // Basic complete messages & delete based on messageLockToken functionality to Azure service bus queue
//        ConUtils conUtils = new ConUtils();
//        String inputString = "roland";
//        conUtils.send(connectionString,entityPath, inputString);
//        conUtils.complete(connectionString,entityPath);
//        System.exit(0);

//        // Basic complete messages & delete based on messageLockToken functionality to Azure service bus subscriptions
//        ConUtils conUtils = new ConUtils();
//        String inputString = "roland";
//        conUtils.send(connectionString,"roland1topic", inputString);
//        conUtils.complete(connectionString,"roland1topic/subscriptions/roland1subscription1");
//        conUtils.complete(connectionString,"roland1topic/subscriptions/roland1subscription2");
//        conUtils.complete(connectionString,"roland1topic/subscriptions/roland1subscription3");
//        System.exit(0);

//        // Basic complete single message & delete based on messageLockToken functionality to Azure service bus queue
//        ConUtils conUtils = new ConUtils();
//        String inputString = "roland";
//        conUtils.send(connectionString,entityPath, inputString);
//        conUtils.completeMessage(connectionString,entityPath);
//        conUtils.completeMessage(connectionString,entityPath);
//        System.exit(0);

        // Basic complete single messages & delete based on messageLockToken functionality to Azure service bus subscriptions
        ConUtils conUtils = new ConUtils();
        String inputString = "roland";
        conUtils.send(connectionString,"roland1topic", inputString);
        conUtils.completeMessage(connectionString,"roland1topic/subscriptions/roland1subscription1");
        conUtils.completeMessage(connectionString,"roland1topic/subscriptions/roland1subscription2");
        conUtils.completeMessage(connectionString,"roland1topic/subscriptions/roland1subscription3");
        conUtils.completeMessage(connectionString,"roland1topic/subscriptions/roland1subscription1");
        conUtils.completeMessage(connectionString,"roland1topic/subscriptions/roland1subscription2");
        conUtils.completeMessage(connectionString,"roland1topic/subscriptions/roland1subscription3");
        System.exit(0);



        // Rest of the Functions
//        // Basic abandon messages & make available again for processing based on messageLockToken functionality to
//        // Azure service bus queue
//        ConUtils conUtils = new ConUtils();
//        String inputString = "roland";
//        conUtils.send(connectionString,entityPath, inputString);
//        conUtils.abandon(connectionString,entityPath);
//        conUtils.complete(connectionString,entityPath);
//        System.exit(0);

//        // Basic abandon messages & abandon messages & make available again for processing  based on
//        // messageLockToken functionality to Azure service bus subscriptions
//        ConUtils conUtils = new ConUtils();
//        String inputString = "roland";
//        conUtils.send(connectionString,"roland1topic", inputString);
//        conUtils.abandon(connectionString,"roland1topic/subscriptions/roland1subscription1");
//        conUtils.abandon(connectionString,"roland1topic/subscriptions/roland1subscription2");
//        conUtils.abandon(connectionString,"roland1topic/subscriptions/roland1subscription3");
//        conUtils.complete(connectionString,"roland1topic/subscriptions/roland1subscription1");
//        conUtils.complete(connectionString,"roland1topic/subscriptions/roland1subscription2");
//        conUtils.complete(connectionString,"roland1topic/subscriptions/roland1subscription3");
//        System.exit(0);






//        Utils utils = new Utils();
//        utils.connection(connectionString);
//        utils.registerReceiver1("roland1queue");
//        utils.sendMessage1("roland1queue","Roly", "application/json", "1", "Scientist");
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




//        TopicClient sendClient;
//        SubscriptionClient subscription1Client;
//        SubscriptionClient subscription2Client;
//        SubscriptionClient subscription3Client;
//
//        // Create a QueueClient instance using the connection string builder
//        // We set the receive mode to "PeekLock", meaning the message is delivered
//        // under a lock and must be acknowledged ("completed") to be removed from the queue
//        subscription1Client = new SubscriptionClient(new ConnectionStringBuilder(connectionString, "roland1topic/subscriptions/roland1subscription1"), ReceiveMode.PEEKLOCK);
//        subscription2Client = new SubscriptionClient(new ConnectionStringBuilder(connectionString, "roland1topic/subscriptions/roland1subscription2"), ReceiveMode.PEEKLOCK);
//        subscription3Client = new SubscriptionClient(new ConnectionStringBuilder(connectionString, "roland1topic/subscriptions/roland1subscription3"), ReceiveMode.PEEKLOCK);
//
//        ExecutorService executorService = Executors.newCachedThreadPool();
//        connectionUtils.registerMessageHandlerOnClient(subscription1Client, executorService);
//        connectionUtils.registerMessageHandlerOnClient(subscription2Client, executorService);
//        connectionUtils.registerMessageHandlerOnClient(subscription3Client, executorService);
//
//        sendClient = new TopicClient(new ConnectionStringBuilder(connectionString, "roland1topic"));
//        connectionUtils.sendMessagesAsyncT(sendClient).thenRunAsync(() -> sendClient.closeAsync());
//
//        // wait for ENTER or 10 seconds elapsing
//        connectionUtils.waitForEnter(10);
//
//        CompletableFuture.allOf(
//                subscription1Client.closeAsync(),
//                subscription2Client.closeAsync(),
//                subscription3Client.closeAsync()).join();
//
//        executorService.shutdown();
//
//        System.exit(0);



//        connectionUtils.send(connectionString);
//        connectionUtils.receive(connectionString);
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
//        sendClient = new QueueClient(
//                new ConnectionStringBuilder(connectionString, "roland1queue"), ReceiveMode.PEEKLOCK);
//        connectionUtils.sendMessagesAsyncM(sendClient).thenRunAsync(() -> sendClient.closeAsync());
//
//
//        receiver = ClientFactory.createMessageReceiverFromConnectionStringBuilder(
//                new ConnectionStringBuilder(connectionString, "roland1queue"), ReceiveMode.PEEKLOCK);
//        receiveTask = connectionUtils.peekMessagesAsync(receiver);
//
//        // wait for ENTER or 10 seconds elapsing
//        connectionUtils.waitForEnter(10);
//
//        receiveTask.cancel(true);
//
//        CompletableFuture.allOf(
//                receiveTask.exceptionally(t -> {if (t instanceof CancellationException) { return null;  } throw new RuntimeException((Throwable) t); }),
//                receiver.closeAsync()).join();
//
//        System.exit(0);




//        IMessageSender topicSender;
//        IMessageSender queueSender;
//        IMessageReceiver targetQueueReceiver;
//
//        System.out.printf("\nSending messages\n");
//        topicSender = ClientFactory.createMessageSenderFromConnectionStringBuilder(
//                new ConnectionStringBuilder(connectionString, "roland1topic"));
//        topicSender.send(connectionUtils.createMessage("M1"));
//
//        queueSender = ClientFactory.createMessageSenderFromConnectionStringBuilder(
//                new ConnectionStringBuilder(connectionString, "roland1queue"));
//        queueSender.send(connectionUtils.createMessage("M2"));
//
//        System.out.printf("\nReceiving messages\n");
//        targetQueueReceiver = ClientFactory.createMessageReceiverFromConnectionStringBuilder(
//                new ConnectionStringBuilder(connectionString, "roland1queue"), ReceiveMode.PEEKLOCK);
//        for (int i = 0; i < 2; i++)
//        {
//            IMessage message = targetQueueReceiver.receive(Duration.ofSeconds(10));
//            if (message != null)
//            {
//                connectionUtils.printReceivedMessage(message);
//                targetQueueReceiver.complete(message.getLockToken());
//            }
//            else
//            {
//                throw new Exception("Expected message not receive\n");
//            }
//        }
//        targetQueueReceiver.close();
//
//        System.exit(0);




//        CompletableFuture<Void> receiveTask;
//        CompletableFuture<Void> fixUpTask;
//        IMessageSender sendClient;
//
//        sendClient = ClientFactory.createMessageSenderFromConnectionStringBuilder(new ConnectionStringBuilder(connectionString, "roland1queue"));
//
//        // max delivery-count scenario
//        connectionUtils.sendMessagesAsyncD(sendClient, 1).join();
//        connectionUtils.exceedMaxDelivery(connectionString, "roland1queue").join();
//
//        // fix-up scenario
//        connectionUtils.sendMessagesAsyncD(sendClient, Integer.MAX_VALUE);
//        ExecutorService executorService = Executors.newCachedThreadPool();
//        receiveTask = connectionUtils.receiveMessagesAsyncD(connectionString, "roland1queue", executorService);
//        fixUpTask = connectionUtils.PickUpAndFixDeadletters(connectionString, "roland1queue", sendClient, executorService);
//
//
//        // wait for ENTER or 10 seconds elapsing
//        connectionUtils.waitForEnter(10);
//
//        receiveTask.cancel(true);
//        fixUpTask.cancel(true);
//
//        CompletableFuture.allOf(
//                sendClient.closeAsync(),
//                receiveTask.exceptionally(t -> {if (t instanceof CancellationException) {return null;} throw new RuntimeException((Throwable) t);}),
//                fixUpTask.exceptionally(t -> {if (t instanceof CancellationException) {return null;} throw new RuntimeException((Throwable) t);})
//        ).join();
//
//        executorService.shutdown();
//
//        System.exit(0);
//
    }
}
