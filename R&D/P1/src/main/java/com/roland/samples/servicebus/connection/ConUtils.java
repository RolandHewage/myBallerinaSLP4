package com.roland.samples.servicebus.connection;

import com.microsoft.azure.servicebus.*;
import com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder;

import java.time.Duration;
import java.util.UUID;
import java.util.logging.Logger;

import static java.nio.charset.StandardCharsets.UTF_8;

public class ConUtils {

    private static final Logger LOG = Logger.getLogger(AsbConnectionUtils.class.getName());

    private String connectionString;

    public ConUtils() {
    }

    public ConUtils(String connectionString) {
        this.connectionString = connectionString;
    }

    public static void send(String connectionString, String entityPath) throws Exception {
        IMessageSender sender = ClientFactory.createMessageSenderFromConnectionStringBuilder(new ConnectionStringBuilder(connectionString, entityPath));

        String messageId = UUID.randomUUID().toString();
        // Send messages to queue
        System.out.printf("\tSending messages to %s ...\n", sender.getEntityPath());
        IMessage message = new Message();
        message.setMessageId(messageId);
        message.setTimeToLive(Duration.ofMinutes(1));
//        message.setBody(body);
        sender.send(message);
        System.out.printf("\t=> Sent a message with messageId %s\n", message.getMessageId());

        sender.close();
    }

    public static void receive(String connectionString, String entityPath) throws Exception {
        IMessageReceiver receiver = ClientFactory.createMessageReceiverFromConnectionStringBuilder(new ConnectionStringBuilder(connectionString, entityPath), ReceiveMode.PEEKLOCK);

        // receive messages from queue
        String receivedMessageId = "";

        System.out.printf("\n\tWaiting up to 5 seconds for messages from %s ...\n", receiver.getEntityPath());
        while (true) {
            IMessage receivedMessage = receiver.receive(Duration.ofSeconds(5));

            if (receivedMessage == null) {
                break;
            }
            System.out.printf("\t<= Received a message with messageId %s\n", receivedMessage.getMessageId());
            System.out.printf("\t<= Received a message with messageBody %s\n", new String(receivedMessage.getBody(), UTF_8));
            receiver.complete(receivedMessage.getLockToken());
            if (receivedMessageId.contentEquals(receivedMessage.getMessageId())) {
                throw new Exception("Received a duplicate message!");
            }
            receivedMessageId = receivedMessage.getMessageId();
        }
        System.out.printf("\tDone receiving messages from %s\n", receiver.getEntityPath());

        receiver.close();
    }

}
