package com.roland.samples.servicebus.connection;

import com.google.gson.JsonParser;
import com.microsoft.azure.servicebus.ClientFactory;
import com.microsoft.azure.servicebus.IMessage;
import com.microsoft.azure.servicebus.IMessageReceiver;
import com.microsoft.azure.servicebus.ReceiveMode;
import com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder;
import org.ballerinalang.jvm.XMLFactory;
import org.ballerinalang.jvm.api.BStringUtils;
import org.ballerinalang.jvm.api.BValueCreator;
import org.ballerinalang.jvm.api.values.BArray;
import org.ballerinalang.jvm.api.values.BError;
import org.ballerinalang.jvm.api.values.BObject;
import org.ballerinalang.jvm.scheduling.StrandMetadata;
import org.ballerinalang.jvm.types.BType;
import org.ballerinalang.jvm.types.TypeTags;
import org.ballerinalang.model.types.Type;
import org.ballerinalang.jvm.types.AttachedFunction;
import org.ballerinalang.jvm.runtime.AsyncFunctionCallback;
import org.ballerinalang.jvm.api.BRuntime;
import org.ballerinalang.jvm.JSONUtils;


import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.time.Duration;
import java.util.ArrayList;
import java.util.concurrent.CountDownLatch;

import static com.roland.samples.servicebus.connection.RabbitMQConstants.*;
import static java.nio.charset.StandardCharsets.UTF_8;

public class MessageDispatcher {
    private String consumerTag;
    private BObject service;
    private String queueName;
    private BRuntime runtime;
    private static final StrandMetadata ON_MESSAGE_METADATA = new StrandMetadata(ORG_NAME, RABBITMQ,
            RABBITMQ_VERSION, FUNC_ON_MESSAGE);

    public MessageDispatcher(BObject service, BRuntime runtime) {
        this.service = service;
        this.queueName = "roland1queue";
        this.consumerTag = service.getType().getName();
        this.runtime = runtime;
        System.out.println("Roland1");
    }

    public void receiveMessages(BObject listener) {
        String connectionString = "Endpoint=sb://roland1.servicebus.windows.net/;SharedAccessKeyName=RootManageSharedAccessKey;SharedAccessKey=OckfvtMMw6GHIftqU0Jj0A0jy0uIUjufhV5dCToiGJk=";
        String entityPath = "roland1queue";
        System.out.println("[ballerina/rabbitmq] Consumer service started for queue " + queueName);
        try{
            IMessageReceiver receiver = ClientFactory.createMessageReceiverFromConnectionStringBuilder(new ConnectionStringBuilder(connectionString, entityPath), ReceiveMode.PEEKLOCK);
            String receivedMessageId = "";

            System.out.printf("\n\tWaiting up to 5 seconds for messages from %s ...\n", receiver.getEntityPath());
            while (true) {
                IMessage receivedMessage = receiver.receive(Duration.ofSeconds(5));

                if (receivedMessage == null) {
                    break;
                }
                System.out.printf("\t<= Received a message with messageId %s\n", receivedMessage.getMessageId());
                System.out.printf("\t<= Received a message with messageBody %s\n", new String(receivedMessage.getBody(), UTF_8));
                handleDispatch(receivedMessage.getBody());
                receiver.complete(receivedMessage.getLockToken());
                if (receivedMessageId.contentEquals(receivedMessage.getMessageId())) {
                    throw new Exception("Received a duplicate message!");
                }
                receivedMessageId = receivedMessage.getMessageId();
            }
            System.out.printf("\tDone receiving messages from %s\n", receiver.getEntityPath());
        } catch (Exception e) {

        }
//        DefaultConsumer consumer = new DefaultConsumer(channel) {
//            @Override
//            public void handleDelivery(String consumerTag,
//                                       Envelope envelope,
//                                       AMQP.BasicProperties properties,
//                                       byte[] body) {
//                handleDispatch(receivedMessage.getMessageId()));
//            }
//        };
        ArrayList<BObject> startedServices =
                (ArrayList<BObject>) listener.getNativeData(RabbitMQConstants.STARTED_SERVICES);
        startedServices.add(service);
        service.addNativeData(RabbitMQConstants.QUEUE_NAME.getValue(), queueName);
    }

    private void handleDispatch(byte[] message) {
        System.out.println("panda1");
        AttachedFunction[] attachedFunctions = service.getType().getAttachedFunctions();
        System.out.println(attachedFunctions[0].getName());
        AttachedFunction onMessageFunction;
        if (FUNC_ON_MESSAGE.equals(attachedFunctions[0].getName())) {
            onMessageFunction = attachedFunctions[0];
        } else if (FUNC_ON_MESSAGE.equals(attachedFunctions[1].getName())) {
            onMessageFunction = attachedFunctions[1];
        } else {
            return;
        }
        BType[] paramTypes = onMessageFunction.getParameterType();
        int paramSize = paramTypes.length;
        System.out.println("panda2"+paramSize);
        if (paramSize > 1) {
            dispatchMessageWithDataBinding(message, onMessageFunction);
        } else {
            dispatchMessage(message);
        }
    }

    private void dispatchMessage(byte[] message) {
        CountDownLatch countDownLatch = new CountDownLatch(1);
        try {
            System.out.println("panda3");
            AsyncFunctionCallback callback = new RabbitMQResourceCallback(countDownLatch, queueName,
                    message.length);
            System.out.println("panda3");
            BObject messageBObject = getMessageBObject(message);
            System.out.println("panda3");
            executeResourceOnMessage(callback, messageBObject);
            countDownLatch.await();
        } catch (InterruptedException e) {

        } catch (BError exception) {

        }
        System.out.println("Kasun");
    }

    private void dispatchMessageWithDataBinding(byte[] message, AttachedFunction onMessage) {
        BType[] paramTypes = onMessage.getParameterType();
        try {
            Object forContent = getMessageContentForType(message, paramTypes[1]);
            BObject messageBObject = getMessageBObject(message);
            CountDownLatch countDownLatch = new CountDownLatch(1);
            AsyncFunctionCallback callback = new RabbitMQResourceCallback(countDownLatch, queueName,
                    message.length);
            executeResourceOnMessage(callback, messageBObject,
                    true, forContent, true);
            countDownLatch.await();
        } catch (BError | UnsupportedEncodingException exception) {

        } catch (InterruptedException e) {

        }
    }

    private BObject getMessageBObject(byte[] message)  {

//            String s = new String(message, UTF_8);
//            System.out.println(s);
        System.out.printf("\t<= Received a message with messageBody %s\n", new String(message, UTF_8));


        BObject messageBObject = BValueCreator.createObjectValue(RabbitMQConstants.PACKAGE_ID_RABBITMQ,
                RabbitMQConstants.MESSAGE_OBJECT);
        messageBObject.set(RabbitMQConstants.MESSAGE_CONTENT, BValueCreator.createArrayValue(message));
        System.out.println("panna2");

        return messageBObject;
    }

    private Object getMessageContentForType(byte[] message, BType dataType) throws UnsupportedEncodingException {
        int dataTypeTag = dataType.getTag();
        switch (dataTypeTag) {
            case TypeTags.STRING_TAG:
                return BStringUtils.fromString(new String(message, StandardCharsets.UTF_8.name()));
            case TypeTags.JSON_TAG:
                return JsonParser.parseString(new String(message, StandardCharsets.UTF_8.name()));
            case TypeTags.XML_TAG:
                return XMLFactory.parse(new String(message, StandardCharsets.UTF_8.name()));
            case TypeTags.FLOAT_TAG:
                return Float.parseFloat(new String(message, StandardCharsets.UTF_8.name()));
            case TypeTags.INT_TAG:
                return Integer.parseInt(new String(message, StandardCharsets.UTF_8.name()));
//            case TypeTags.RECORD_TYPE_TAG:
//                return JSONUtils.convertJSONToRecord(JsonParser.parseString(new String(message,
//                                StandardCharsets.UTF_8.name())),
//                        (StructureType) dataType);
            case TypeTags.ARRAY_TAG:
                if (((BArray) dataType).getElementType().getTag() == TypeTags.BYTE_TAG) {
                    return message;
                } else {

                }
            default:
                return "";
        }
    }

    private void executeResourceOnMessage(AsyncFunctionCallback callback, Object... args) {
        executeResource(RabbitMQConstants.FUNC_ON_MESSAGE, callback, ON_MESSAGE_METADATA, args);
    }

    private void executeResource(String function, AsyncFunctionCallback callback, StrandMetadata metaData,
                                 Object... args) {
        System.out.println("Mama1");
        runtime.invokeMethodAsync(service, function, null, metaData, callback, args);
    }

}
