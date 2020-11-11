package com.roland.samples.servicebus.connection;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.microsoft.azure.servicebus.*;
import com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder;
import com.microsoft.azure.servicebus.primitives.ServiceBusException;

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

    public void send(String connectionString) throws Exception {
        IMessageSender sender = ClientFactory.createMessageSenderFromConnectionStringBuilder(new ConnectionStringBuilder(connectionString, "roland1queue"));

        String messageId = UUID.randomUUID().toString();
        // Send messages to queue
        System.out.printf("\tSending messages to %s ...\n", sender.getEntityPath());
        IMessage message = new Message();
        message.setMessageId(messageId);
        message.setTimeToLive(Duration.ofMinutes(1));
        sender.send(message);
        System.out.printf("\t=> Sent a message with messageId %s\n", message.getMessageId());

        IMessage message2 = new Message();
        message2.setMessageId(messageId);
        message2.setTimeToLive(Duration.ofMinutes(1));
        sender.send(message2);
        System.out.printf("\t=> Sent a duplicate message with messageId %s\n", message.getMessageId());
        sender.close();
    }

    public void receive(String connectionString) throws Exception {
        IMessageReceiver receiver = ClientFactory.createMessageReceiverFromConnectionStringBuilder(new ConnectionStringBuilder(connectionString, "roland1queue"), ReceiveMode.PEEKLOCK);

        // receive messages from queue
        String receivedMessageId = "";

        System.out.printf("\n\tWaiting up to 5 seconds for messages from %s ...\n", receiver.getEntityPath());
        while (true) {
            IMessage receivedMessage = receiver.receive(Duration.ofSeconds(5));

            if (receivedMessage == null) {
                break;
            }
            System.out.printf("\t<= Received a message with messageId %s\n", receivedMessage.getMessageId());
            receiver.complete(receivedMessage.getLockToken());
            if (receivedMessageId.contentEquals(receivedMessage.getMessageId())) {
                throw new Exception("Received a duplicate message!");
            }
            receivedMessageId = receivedMessage.getMessageId();
        }
        System.out.printf("\tDone receiving messages from %s\n", receiver.getEntityPath());

        receiver.close();
    }

    public CompletableFuture<Void> sendMessagesAsyncM(QueueClient sendClient) {

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

            tasks.add(
                    sendClient.sendAsync(message).thenRunAsync(() -> {
                        System.out.printf("Message sent: Id = %s\n", message.getMessageId());
                    }));
        }
        return CompletableFuture.allOf(tasks.toArray(new CompletableFuture<?>[tasks.size()]));
    }

    public CompletableFuture peekMessagesAsync(IMessageReceiver receiver) {

        CompletableFuture currentTask = new CompletableFuture();
        try {
            CompletableFuture.runAsync(() -> {
                while (!currentTask.isCancelled()) {
                    try {
                        IMessage message = receiver.peek();
                        if (message != null) {
                            // receives message is passed to callback
                            if (message.getLabel() != null &&
                                    message.getContentType() != null &&
                                    message.getLabel().contentEquals("Scientist") &&
                                    message.getContentType().contentEquals("application/json")) {

                                byte[] body = message.getBody();
                                Map scientist = GSON.fromJson(new String(body, UTF_8), Map.class);

                                System.out.printf(
                                        "\n\t\t\t\tMessage received: \n\t\t\t\t\t\tMessageId = %s, \n\t\t\t\t\t\tSequenceNumber = %s, \n\t\t\t\t\t\tEnqueuedTimeUtc = %s," +
                                                "\n\t\t\t\t\t\tExpiresAtUtc = %s, \n\t\t\t\t\t\tContentType = \"%s\",  \n\t\t\t\t\t\tContent: [ firstName = %s, name = %s ]\n",
                                        message.getMessageId(),
                                        message.getSequenceNumber(),
                                        message.getEnqueuedTimeUtc(),
                                        message.getExpiresAtUtc(),
                                        message.getContentType(),
                                        scientist != null ? scientist.get("firstName") : "",
                                        scientist != null ? scientist.get("name") : "");
                            } else {
                                currentTask.complete(null);
                            }
                        }
                    } catch (Exception e) {
                        currentTask.completeExceptionally(e);
                    }
                }
                if (!currentTask.isCancelled()) {
                    currentTask.complete(null);
                }
            });
            return currentTask;
        } catch (Exception e) {
            currentTask.completeExceptionally(e);
        }
        return currentTask;
    }

    public void printReceivedMessage(IMessage receivedMessage) {
        System.out.printf("Received message:\n" + "\tLabel:\t%s\n" + "\tBody:\t%s\n",
                receivedMessage.getLabel(), new String(receivedMessage.getBody(), UTF_8));
        if (receivedMessage.getProperties() != null)
            for (String p : receivedMessage.getProperties().keySet()) {
                System.out.printf("\tProperty:\t%s = %s\n", p, receivedMessage.getProperties().get(p));
            }
    }

    // Create a new Service Bus message.
    public IMessage createMessage(String label)
    {
        // Create a Service Bus message.
        IMessage msg = new Message(("This is the body of message \"" + label + "\".").getBytes(UTF_8));
        msg.setProperties(new HashMap<String, String>(){{
            put("Priority", "1");
            put("Importance", "High");
        }});
        msg.setLabel(label);
        msg.setTimeToLive(Duration.ofSeconds(90));
        return msg;
    }

    public CompletableFuture<Void> sendMessagesAsyncD(IMessageSender sendClient, int maxMessages) {
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
        for (int i = 0; i < Math.min(data.size(), maxMessages); i++) {
            final String messageId = Integer.toString(i);
            Message message = new Message(GSON.toJson(data.get(i), Map.class).getBytes(UTF_8));
            message.setContentType("application/json");
            message.setLabel(i % 2 == 0 ? "Scientist" : "Physicist");
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

    public CompletableFuture<Void> exceedMaxDelivery(String connectionString, String queueName) throws Exception {
        IMessageReceiver receiver = ClientFactory.createMessageReceiverFromConnectionStringBuilder(new ConnectionStringBuilder(connectionString, "roland1queue"), ReceiveMode.PEEKLOCK);

        while (true) {
            IMessage msg = receiver.receive(Duration.ofSeconds(2));
            if (msg != null) {
                System.out.printf("Picked up message; DeliveryCount %d\n", msg.getDeliveryCount());
                receiver.abandon(msg.getLockToken());
            } else {
                break;
            }
        }
        receiver.close();

        IMessageReceiver deadletterReceiver = ClientFactory.createMessageReceiverFromConnectionStringBuilder(new ConnectionStringBuilder(connectionString, "roland1queue/$deadletterqueue"), ReceiveMode.PEEKLOCK);
        while (true) {
            IMessage msg = deadletterReceiver.receive(Duration.ofSeconds(2));
            if (msg != null) {
                System.out.printf("\nDeadletter message:\n");
                if (msg.getProperties() != null) {
                    for (String prop : msg.getProperties().keySet()) {
                        System.out.printf("\t%s=%s\n", prop, msg.getProperties().get(prop));
                    }
                }
                deadletterReceiver.complete(msg.getLockToken());
            } else {
                break;
            }
        }
        deadletterReceiver.close();
        return CompletableFuture.completedFuture(null);
    }

    public CompletableFuture receiveMessagesAsyncD(String connectionString, String queueName, ExecutorService executorService) throws Exception {

        CompletableFuture running = new CompletableFuture();
        QueueClient receiver = new QueueClient(new ConnectionStringBuilder(connectionString, "roland1queue"), ReceiveMode.PEEKLOCK);

        running.whenComplete((r, t) -> {
            try {
                receiver.close();
            } catch (ServiceBusException e) {
                System.out.printf(e.getMessage());
            }
        });


        // register the RegisterMessageHandler callback
        receiver.registerMessageHandler(
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
                                    "\n\t\t\t\tMessage received: \n\t\t\t\t\t\tMessageId = %s, \n\t\t\t\t\t\tSequenceNumber = %s, \n\t\t\t\t\t\tEnqueuedTimeUtc = %s," +
                                            "\n\t\t\t\t\t\tExpiresAtUtc = %s, \n\t\t\t\t\t\tContentType = \"%s\",  \n\t\t\t\t\t\tContent: [ firstName = %s, name = %s ]\n",
                                    message.getMessageId(),
                                    message.getSequenceNumber(),
                                    message.getEnqueuedTimeUtc(),
                                    message.getExpiresAtUtc(),
                                    message.getContentType(),
                                    scientist != null ? scientist.get("firstName") : "",
                                    scientist != null ? scientist.get("name") : "");
                        } else {
                            return receiver.deadLetterAsync(message.getLockToken());
                        }
                        return receiver.completeAsync(message.getLockToken());
                    }

                    // callback invoked when the message handler has an exception to report
                    public void notifyException(Throwable throwable, ExceptionPhase exceptionPhase) {
                        System.out.printf(exceptionPhase + "-" + throwable.getMessage());
                    }
                },
                // 1 concurrent call, messages are auto-completed, auto-renew duration
                new MessageHandlerOptions(1, false, Duration.ofMinutes(1)),
                executorService);

        return running;
    }

    public CompletableFuture PickUpAndFixDeadletters(String connectionString, String queueName, IMessageSender resubmitSender, ExecutorService executorService) throws Exception {
        CompletableFuture running = new CompletableFuture();
        QueueClient receiver = new QueueClient(new ConnectionStringBuilder(connectionString, "roland1queue/$deadletterqueue"), ReceiveMode.PEEKLOCK);

        running.whenComplete((r, t) -> {
            try {
                receiver.close();
            } catch (ServiceBusException e) {
                System.out.printf(e.getMessage());
            }
        });

        // register the RegisterMessageHandler callback
        receiver.registerMessageHandler(
                new IMessageHandler() {
                    // callback invoked when the message handler loop has obtained a message
                    public CompletableFuture<Void> onMessageAsync(IMessage message) {
                        try {
                            IMessage resubmitMessage = new Message(message.getBody());
                            if (message.getLabel() != null && message.getLabel().contentEquals("Physicist")) {
                                System.out.printf(
                                        "\n\t\tFixing: \n\t\t\tMessageId = %s, \n\t\t\tSequenceNumber = %s, \n\t\t\tLabel = %s\n",
                                        message.getMessageId(),
                                        message.getSequenceNumber(),
                                        message.getLabel());
                                resubmitMessage.setMessageId(message.getMessageId());
                                resubmitMessage.setLabel("Scientist");
                                resubmitMessage.setContentType(message.getContentType());
                                resubmitMessage.setTimeToLive(Duration.ofMinutes(2));
                                resubmitSender.send(resubmitMessage);
                            }
                            return receiver.completeAsync(message.getLockToken());
                        } catch (Exception e) {
                            CompletableFuture failure = new CompletableFuture();
                            failure.completeExceptionally(e);
                            return failure;
                        }
                    }

                    // callback invoked when the message handler has an exception to report
                    public void notifyException(Throwable throwable, ExceptionPhase exceptionPhase) {
                        System.out.printf(exceptionPhase + "-" + throwable.getMessage());
                    }
                },
                // 1 concurrent call, messages are auto-completed, auto-renew duration
                new MessageHandlerOptions(1, false, Duration.ofMinutes(1)),
                executorService);

        return running;
    }

}
