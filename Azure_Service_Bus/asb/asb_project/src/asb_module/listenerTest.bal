// import ballerina/lang.'object as lang;
// // import ballerina/java;

// public class Listener {

//     *lang:Listener;


//     private Channel amqpChannel;

//     public isolated function init(ConnectionConfiguration|Connection connectionOrConnectionConfig,
//     int? prefetchCount = (), int? prefetchSize = ()) {
//         self.amqpChannel = new Channel(connectionOrConnectionConfig);
//         var result = self.setQosSettings(prefetchCount, prefetchSize);
//         externInit(self, self.amqpChannel.getChannel());
//         if (result is error) {
//             panic result;
//         }
//     }

//     # Attaches the service to the `rabbitmq:Listener` endpoint.
//     #
//     # + s - Type descriptor of the service
//     # + name - Name of the service
//     # + return - `()` or else a `rabbitmq:Error` upon failure to register the service
//     public isolated function __attach(service s, string? name = ()) returns error? {
//         return registerListener(self, s);
//     }

//     # Starts consuming the messages on all the attached services.
//     #
//     # + return - `()` or else a `rabbitmq:Error` upon failure to start
//     public isolated function __start() returns error? {
//         return 'start(self);
//     }

//     # Stops consuming messages and detaches the service from the `rabbitmq:Listener` endpoint.
//     #
//     # + s - Type descriptor of the service
//     # + return - `()` or else  a `rabbitmq:Error` upon failure to detach the service
//     public isolated function __detach(service s) returns error? {
//         return detach(self, s);
//     }

//     # Stops consuming messages through all consumer services by terminating the connection and all its channels.
//     #
//     # + return - `()` or else  a `rabbitmq:Error` upon failure to close the `ChannelListener`
//     public isolated function __gracefulStop() returns error? {
//         return stop(self);
//     }

//     # Stops consuming messages through all the consumer services and terminates the connection
//     # with the server.
//     #
//     # + return - `()` or else  a `rabbitmq:Error` upon failure to close ChannelListener.
//     public isolated function __immediateStop() returns error? {
//         return abortConnection(self);
//     }
// }

// # Configurations required to create a subscription.
// #
// # + queueConfig - Configurations of the queue to be subscribed
// # + ackMode - Type of the acknowledgement mode
// # + prefetchCount - Maximum number of messages that the server will deliver and 0 if unlimited.
// #                   Unless explicitly given, this value is 10 by default.
// # + prefetchSize - Maximum amount of content (measured in octets) that the server will deliver and 0 if unlimited
// public type RabbitMQServiceConfig record {|
//     QueueConfiguration queueConfig;
//     AcknowledgementMode ackMode = AUTO_ACK;
//     int prefetchCount?;
//     int prefetchSize?;
// |};

// # The annotation, which is used to configure the subscription.
// public annotation RabbitMQServiceConfig ServiceConfig on service;

// isolated function externInit(Listener lis, handle amqpChannel) =
// @java:Method {
//     name: "init",
//     'class: "org.ballerinalang.messaging.rabbitmq.util.ListenerUtils"
// } external;

// isolated function registerListener(Listener lis, service serviceType) returns Error? =
// @java:Method {
//     'class: "org.ballerinalang.messaging.rabbitmq.util.ListenerUtils"
// } external;

// isolated function 'start(Listener lis) returns Error? =
// @java:Method {
//     'class: "org.ballerinalang.messaging.rabbitmq.util.ListenerUtils"
// } external;

// isolated function detach(Listener lis, service serviceType) returns Error? =
// @java:Method {
//     'class: "org.ballerinalang.messaging.rabbitmq.util.ListenerUtils"
// } external;

// isolated function stop(Listener lis) returns Error? =
// @java:Method {
//     'class: "org.ballerinalang.messaging.rabbitmq.util.ListenerUtils"
// } external;

// isolated function abortConnection(Listener lis) returns Error? =
// @java:Method {
//     'class: "org.ballerinalang.messaging.rabbitmq.util.ListenerUtils"
// } external;

// isolated function nativeSetQosSettings(int? prefetchCount, int? prefetchSize, Listener lis) returns Error? =
// @java:Method {
//     name: "setQosSettings",
//     'class: "org.ballerinalang.messaging.rabbitmq.util.ListenerUtils"
// } external;
