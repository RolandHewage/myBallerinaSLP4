//package com.roland.samples.servicebus.connection;
//
//import com.microsoft.azure.servicebus.ClientFactory;
//import com.microsoft.azure.servicebus.IMessage;
//import com.microsoft.azure.servicebus.IMessageReceiver;
//import com.microsoft.azure.servicebus.ReceiveMode;
//import com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder;
//import org.ballerinalang.jvm.api.values.BObject;
//import org.ballerinalang.model.types.Type;
//
//import java.time.Duration;
//import java.util.ArrayList;
//
//import static com.roland.samples.servicebus.connection.RabbitMQConstants.FUNC_ON_MESSAGE;
//import static java.nio.charset.StandardCharsets.UTF_8;
//
//public class MessageDispatcher {
//    private String consumerTag;
//    private BObject service;
//    private String queueName;
//    private Runtime runtime;
//    public MessageDispatcher(BObject service, Runtime runtime) {
//        this.service = service;
//        this.queueName = "roland1queue";
//        this.consumerTag = service.getType().getName();
//        this.runtime = runtime;
//    }
//
//    public void receiveMessages(BObject listener) {
//        String connectionString = "Endpoint=sb://roland1.servicebus.windows.net/;SharedAccessKeyName=RootManageSharedAccessKey;SharedAccessKey=OckfvtMMw6GHIftqU0Jj0A0jy0uIUjufhV5dCToiGJk=";
//        String entityPath = "roland1queue";
//        System.out.println("[ballerina/rabbitmq] Consumer service started for queue " + queueName);
//        try{
//            IMessageReceiver receiver = ClientFactory.createMessageReceiverFromConnectionStringBuilder(new ConnectionStringBuilder(connectionString, entityPath), ReceiveMode.PEEKLOCK);
//            String receivedMessageId = "";
//
//            System.out.printf("\n\tWaiting up to 5 seconds for messages from %s ...\n", receiver.getEntityPath());
//            while (true) {
//                IMessage receivedMessage = receiver.receive(Duration.ofSeconds(5));
//
//                if (receivedMessage == null) {
//                    break;
//                }
//                System.out.printf("\t<= Received a message with messageId %s\n", receivedMessage.getMessageId());
//                System.out.printf("\t<= Received a message with messageBody %s\n", new String(receivedMessage.getBody(), UTF_8));
//                receiver.complete(receivedMessage.getLockToken());
//                if (receivedMessageId.contentEquals(receivedMessage.getMessageId())) {
//                    throw new Exception("Received a duplicate message!");
//                }
//                receivedMessageId = receivedMessage.getMessageId();
//            }
//            System.out.printf("\tDone receiving messages from %s\n", receiver.getEntityPath());
//        } catch (Exception e) {
//
//        }
//        DefaultConsumer consumer = new DefaultConsumer(channel) {
//            @Override
//            public void handleDelivery(String consumerTag,
//                                       Envelope envelope,
//                                       AMQP.BasicProperties properties,
//                                       byte[] body) {
//                handleDispatch(body, envelope.getDeliveryTag(), properties);
//            }
//        };
//        ArrayList<BObject> startedServices =
//                (ArrayList<BObject>) listener.getNativeData(RabbitMQConstants.STARTED_SERVICES);
//        startedServices.add(service);
//        service.addNativeData(RabbitMQConstants.QUEUE_NAME.getValue(), queueName);
//    }
//
//    private void handleDispatch(byte[] message, long deliveryTag, AMQP.BasicProperties properties) {
//        AttachedFunctionType[] attachedFunctions = service.getType().getAttachedFunctions();
//        AttachedFunctionType onMessageFunction;
//        if (FUNC_ON_MESSAGE.equals(attachedFunctions[0].getName())) {
//            onMessageFunction = attachedFunctions[0];
//        } else if (FUNC_ON_MESSAGE.equals(attachedFunctions[1].getName())) {
//            onMessageFunction = attachedFunctions[1];
//        } else {
//            return;
//        }
//        Type[] paramTypes = onMessageFunction.getParameterTypes();
//        int paramSize = paramTypes.length;
//        if (paramSize > 1) {
//            dispatchMessageWithDataBinding(message, deliveryTag, onMessageFunction, properties);
//        } else {
//            dispatchMessage(message, deliveryTag, properties);
//        }
//    }
//
//    private void executeResource(String function, Callback callback, StrandMetadata metaData,
//                                 Object... args) {
//        runtime.invokeMethodAsync(service, function, null, metaData, callback, args);
//    }
//
//}
