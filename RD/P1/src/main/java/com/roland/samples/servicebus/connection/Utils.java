package com.roland.samples.servicebus.connection;

import com.microsoft.azure.servicebus.*;
import com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder;

import java.time.Duration;
import java.time.Instant;
import java.util.*;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.logging.Logger;

import static java.nio.charset.StandardCharsets.UTF_8;

public class Utils {

    private static final Logger LOG = Logger.getLogger(AsbConnectionUtils.class.getName());

    private String connectionString;

    public void connection(String connectionString){
        this.connectionString = connectionString;
    }

    public void sendMessage(String entityName, byte[] content, String contentType, String messageId, String to,
                            String replyTo, String replyToSessionId, String label, Instant scheduledEnqueueTimeUtc,
                            String sessionId, String correlationId, long sequenceNumber, UUID lockToken,
                            Map<String, String> properties, Duration timeToLive) throws Exception{

        QueueClient sendClient = new QueueClient(new ConnectionStringBuilder(this.connectionString, entityName), ReceiveMode.PEEKLOCK);
        List<CompletableFuture> tasks = new ArrayList<>();
        Message message = new Message();
        message.setBody(content);
        message.setContentType(contentType);
        message.setMessageId(messageId);
        message.setTo(to);
        message.setReplyTo(replyTo);
        message.setReplyToSessionId(replyToSessionId);
        message.setLabel(label);
        message.setScheduledEnqueueTimeUtc(scheduledEnqueueTimeUtc);
        message.setSessionId(sessionId);
        message.setCorrelationId(correlationId);
        message.setProperties(properties);
        message.setTimeToLive(timeToLive);
        System.out.printf("\nMessage sending: Id = %s", message.getMessageId());
        tasks.add(
                sendClient.sendAsync(message).thenRunAsync(() -> {
                    System.out.printf("\n\tMessage acknowledged: Id = %s", message.getMessageId());
                }));
        CompletableFuture.allOf(tasks.toArray(new CompletableFuture<?>[tasks.size()]))
                .thenRunAsync(() -> sendClient.closeAsync());
    }

//    public List<Message> getMessageFromQueue(String queueName, int maxMessageCount, String queueType, String sessionId) {
//        return;
//    }

//    public List<Message> getMessageFromTopicSubscription(String queueName, String subscriptionName, int maxMessageCount, String queueType, String sessionId) {
//        return;
//    }

    public void sendMessage1(String entityName, String content, String contentType, String messageId, String label) throws Exception{

        try {
            QueueClient sendClient = new QueueClient(new ConnectionStringBuilder(this.connectionString, entityName), ReceiveMode.PEEKLOCK);
            List<CompletableFuture> tasks = new ArrayList<>();
            Message message = new Message(content);
            message.setContentType(contentType);
            message.setMessageId(messageId);
            message.setLabel(label);
            message.setTimeToLive(Duration.ofMinutes(2));
            System.out.printf("\nMessage sending: Id = %s", message.getMessageId());
            tasks.add(
                    sendClient.sendAsync(message).thenRunAsync(() -> {
                        System.out.printf("\n\tMessage acknowledged: Id = %s", message.getMessageId());
                    }));
            CompletableFuture.allOf(tasks.toArray(new CompletableFuture<?>[tasks.size()]))
                    .thenRunAsync(() -> sendClient.closeAsync());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void registerReceiver1(String entityPath) throws Exception {

        QueueClient receiveClient = new QueueClient(new ConnectionStringBuilder(this.connectionString, entityPath), ReceiveMode.PEEKLOCK);
        ExecutorService executorService = Executors.newSingleThreadExecutor();

        // register the RegisterMessageHandler callback with executor service
        receiveClient.registerMessageHandler(new IMessageHandler() {
                                               // callback invoked when the message handler loop has obtained a message
                                               public CompletableFuture<Void> onMessageAsync(IMessage message) {
                                                   // receives message is passed to callback
                                                   if (message.getLabel() != null &&
                                                           message.getContentType() != null &&
                                                           message.getLabel().contentEquals("Scientist") &&
                                                           message.getContentType().contentEquals("application/json")) {

                                                       byte[] body = message.getBody();
                                                       String rol = new String(body, UTF_8);
//                                                       Map scientist = GSON.fromJson(new String(body, UTF_8), Map.class);

                                                       System.out.printf(
                                                               "\n\t\t\t\tMessage received: \n\t\t\t\t\t\tMessageId = %s, \n\t\t\t\t\t\tSequenceNumber = %s, \n\t\t\t\t\t\tEnqueuedTimeUtc = %s," +
                                                                       "\n\t\t\t\t\t\tExpiresAtUtc = %s, \n\t\t\t\t\t\tContentType = \"%s\",  \n\t\t\t\t\t\tContent: %s\n",
                                                               message.getMessageId(),
                                                               message.getSequenceNumber(),
                                                               message.getEnqueuedTimeUtc(),
                                                               message.getExpiresAtUtc(),
                                                               message.getContentType(),
                                                               rol != null ? rol : "");
                                                   }
                                                   return CompletableFuture.completedFuture(null);
                                               }

                                               // callback invoked when the message handler has an exception to report
                                               public void notifyException(Throwable throwable, ExceptionPhase exceptionPhase) {
                                                   System.out.printf(exceptionPhase + "-" + throwable.getMessage());
                                               }
                                           },
                // 1 concurrent call, messages are auto-completed, auto-renew duration
                new MessageHandlerOptions(1, true, Duration.ofMinutes(1)),
                executorService);

//        waitForEnter(10);
//
//        // shut down receiver to close the receive loop
//        receiveClient.close();
//        executorService.shutdown();

    }

    public void waitForEnter(int seconds) {
        ExecutorService executor = Executors.newCachedThreadPool();
        try {
            executor.invokeAny(Arrays.asList(() -> {
                System.in.read();
                return 0;
            }, () -> {
                Thread.sleep(seconds * 1000);
                return 0;
            }));
        } catch (Exception e) {
            // absorb
        }
    }

}
