package com.roland.samples.servicebus.connection;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.microsoft.azure.servicebus.*;

import java.time.Duration;
import java.util.*;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import static java.nio.charset.StandardCharsets.UTF_8;

public class ConnectionUtils {

    static final Gson GSON = new Gson();

    public Message addMessageToQueue(String msg) {
        final String messageId = Integer.toString(0);
        Message message = new Message(msg);
        message.setContentType("application/json");
        message.setLabel("Scientist");
        message.setMessageId(messageId);
        message.setTimeToLive(Duration.ofMinutes(2));

        return message;
    }

    public CompletableFuture<Void> sendMessagesAsync(QueueClient sendClient, String s) {
//        List<HashMap<String, String>> data =
//                GSON.fromJson(
//                        "[" +
//                                "{'name' = 'Einstein', 'firstName' = 'Albert'}," +
//                                "{'name' = 'Heisenberg', 'firstName' = 'Werner'}," +
//                                "{'name' = 'Curie', 'firstName' = 'Marie'}," +
//                                "{'name' = 'Hawking', 'firstName' = 'Steven'}," +
//                                "{'name' = 'Newton', 'firstName' = 'Isaac'}," +
//                                "{'name' = 'Bohr', 'firstName' = 'Niels'}," +
//                                "{'name' = 'Faraday', 'firstName' = 'Michael'}," +
//                                "{'name' = 'Galilei', 'firstName' = 'Galileo'}," +
//                                "{'name' = 'Kepler', 'firstName' = 'Johannes'}," +
//                                "{'name' = 'Kopernikus', 'firstName' = 'Nikolaus'}" +
//                                "]",
//                        new TypeToken<List<HashMap<String, String>>>() {}.getType());

        List<CompletableFuture> tasks = new ArrayList<>();
//        for (int i = 0; i < data.size(); i++) {
//            final String messageId = Integer.toString(0);
//            Message message = new Message(GSON.toJson(data.get(i), Map.class).getBytes(UTF_8));
//            Message message = new Message("Roly "+messageId);
//            message.setContentType("application/json");
//            message.setLabel("Scientist");
//            message.setMessageId(messageId);
//            message.setTimeToLive(Duration.ofMinutes(2));
            Message message = addMessageToQueue(s);
            System.out.printf("\nMessage sending: Id = %s", message.getMessageId());
            tasks.add(
                    sendClient.sendAsync(message).thenRunAsync(() -> {
                        System.out.printf("\n\tMessage acknowledged: Id = %s", message.getMessageId());
                    }));
//        }
        return CompletableFuture.allOf(tasks.toArray(new CompletableFuture<?>[tasks.size()]));
    }

    public void registerReceiver(QueueClient queueClient, ExecutorService executorService) throws Exception {


        // register the RegisterMessageHandler callback with executor service
        queueClient.registerMessageHandler(new IMessageHandler() {
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

    public CompletableFuture receiveMessagesAsync(IMessageReceiver receiver) {

        CompletableFuture currentTask = new CompletableFuture();

        try {
            CompletableFuture.runAsync(() -> {
                while (!currentTask.isCancelled()) {
                    try {
                        IMessage message = receiver.receive(Duration.ofSeconds(60));
                        if (message != null) {
                            // receives message is passed to callback
                            if (message.getLabel() != null &&
                                    message.getContentType() != null &&
                                    message.getLabel().contentEquals("Scientist") &&
                                    message.getContentType().contentEquals("application/json")) {

                                byte[] body = message.getBody();
                                String rol = new String(body, UTF_8);
//                                Map scientist = GSON.fromJson(new String(body, UTF_8), Map.class);

                                System.out.printf(
                                        "\n\t\t\t\tMessage received: \n\t\t\t\t\t\tMessageId = %s, \n\t\t\t\t\t\tSequenceNumber = %s, \n\t\t\t\t\t\tEnqueuedTimeUtc = %s," +
                                                "\n\t\t\t\t\t\tExpiresAtUtc = %s, \n\t\t\t\t\t\tContentType = \"%s\",  \n\t\t\t\t\t\tContent: %s\n",
                                        message.getMessageId(),
                                        message.getSequenceNumber(),
                                        message.getEnqueuedTimeUtc(),
                                        message.getExpiresAtUtc(),
                                        message.getContentType(),
//                                        scientist != null ? scientist.get("firstName") : "",
                                        rol != null ? rol : "");
                            }
                            receiver.completeAsync(message.getLockToken());
                        }
                    } catch (Exception e) {
                        currentTask.completeExceptionally(e);
                    }
                }
                currentTask.complete(null);
            });
            return currentTask;
        } catch (Exception e) {
            currentTask.completeExceptionally(e);
        }
        return currentTask;
    }

    public CompletableFuture<Void> sendMessagesAsyncT(TopicClient sendClient) {
        List<HashMap<String, String>> data =
                GSON.fromJson(
                        "[" +
                                "{'name' = 'Einstein', 'firstName' = 'Albert'}," +
                                "{'name' = 'Heisenberg', 'firstName' = 'Werner'}," +
                                "{'name' = 'Curie', 'firstName' = 'Marie'}," +
                                "{'name' = 'Hawking', 'firstName' = 'Steven'}," +
                                "{'name' = 'Newton', 'firstName' = 'Isaac'}," +
                                "{'name' = 'Bohr', 'firstName' = 'Niels'}," +
                                "{'name' = 'Faraday', 'firstName' = 'Michael'}," +
                                "{'name' = 'Galilei', 'firstName' = 'Galileo'}," +
                                "{'name' = 'Kepler', 'firstName' = 'Johannes'}," +
                                "{'name' = 'Kopernikus', 'firstName' = 'Nikolaus'}" +
                                "]",
                        new TypeToken<List<HashMap<String, String>>>() {
                        }.getType());

        List<CompletableFuture> tasks = new ArrayList<>();
        for (int i = 0; i < data.size(); i++) {
            final String messageId = Integer.toString(i);
            Message message = new Message(GSON.toJson(data.get(i), Map.class).getBytes(UTF_8));
            message.setContentType("application/json");
            message.setLabel("Scientist");
            message.setMessageId(messageId);
            message.setTimeToLive(Duration.ofMinutes(2));
            System.out.printf("Message sending: Id = %s\n", message.getMessageId());
            tasks.add(
                    sendClient.sendAsync(message).thenRunAsync(() -> {
                        System.out.printf("\tMessage acknowledged: Id = %s\n", message.getMessageId());
                    }));
        }
        return CompletableFuture.allOf(tasks.toArray(new CompletableFuture<?>[tasks.size()]));
    }

    public void registerMessageHandlerOnClient(SubscriptionClient receiveClient, ExecutorService executorService) throws Exception {

        // register the RegisterMessageHandler callback
        receiveClient.registerMessageHandler(
                new IMessageHandler() {
                    // callback invoked when the message handler loop has obtained a message
                    public CompletableFuture<Void> onMessageAsync(IMessage message) {
                        // receives message is passed to callback
                        if (message.getLabel() != null &&
                                message.getContentType() != null &&
                                message.getLabel().contentEquals("Scientist") &&
                                message.getContentType().contentEquals("application/json")) {

                            byte[] body = message.getBody();
                            Map scientist = GSON.fromJson(new String(body, UTF_8), Map.class);

                            System.out.printf(
                                    "\n\t\t\t\t%s Message received: \n\t\t\t\t\t\tMessageId = %s, \n\t\t\t\t\t\tSequenceNumber = %s, \n\t\t\t\t\t\tEnqueuedTimeUtc = %s," +
                                            "\n\t\t\t\t\t\tExpiresAtUtc = %s, \n\t\t\t\t\t\tContentType = \"%s\",  \n\t\t\t\t\t\tContent: [ firstName = %s, name = %s ]\n",
                                    receiveClient.getEntityPath(),
                                    message.getMessageId(),
                                    message.getSequenceNumber(),
                                    message.getEnqueuedTimeUtc(),
                                    message.getExpiresAtUtc(),
                                    message.getContentType(),
                                    scientist != null ? scientist.get("firstName") : "",
                                    scientist != null ? scientist.get("name") : "");
                        }
                        return receiveClient.completeAsync(message.getLockToken());
                    }

                    // callback invoked when the message handler has an exception to report
                    public void notifyException(Throwable throwable, ExceptionPhase exceptionPhase) {
                        System.out.printf(exceptionPhase + "-" + throwable.getMessage());
                    }
                },
                // 1 concurrent call, messages are auto-completed, auto-renew duration
                new MessageHandlerOptions(1, false, Duration.ofMinutes(1)),
                executorService);

    }
}
