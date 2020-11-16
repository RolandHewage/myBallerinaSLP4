// import ballerina/lang.'object as lang;
import ballerina/java;
import ballerina/io;

public class Listener {
    // *lang:Listener;

    // private Channel amqpChannel;

    # Initializes a Listener object with the given `rabbitmq:Connection` object or connection configurations.
    # Creates a `rabbitmq:Connection` object if only the connection configuration is given. Sets the global QoS settings,
    # which will be applied to the entire `rabbitmq:Channel`.
    #
    # + connectionOrConnectionConfig - A `rabbitmq:Connection` object or the connection configurations.
    public function init(ConnectionConfiguration connectionOrConnectionConfig) {
        // self.amqpChannel = new Channel(connectionOrConnectionConfig);
        // externInit(self, self.amqpChannel.getChannel());
        handle|error? m = createReceiverConnection(java:fromString(connectionOrConnectionConfig.connectionString),java:fromString(connectionOrConnectionConfig.entityPath));
        if(m is handle) {
            var l = receiveConnection(m,java:fromString(connectionOrConnectionConfig.connectionString),java:fromString(connectionOrConnectionConfig.entityPath));
            var n = closeReceiverConnection(m);
            io:println(n);
        }

    }

    // # Attaches the service to the `rabbitmq:Listener` endpoint.
    // #
    // # + s - Type descriptor of the service
    // # + name - Name of the service
    // # + return - `()` or else a `rabbitmq:Error` upon failure to register the service
    // public isolated function __attach(service s, string? name = ()) returns error? {
    //     return registerListener(self, s);
    // }

    // # Starts consuming the messages on all the attached services.
    // #
    // # + return - `()` or else a `rabbitmq:Error` upon failure to start
    // public isolated function __start() returns error? {
    //     return 'start(self);
    // }

    // # Stops consuming messages and detaches the service from the `rabbitmq:Listener` endpoint.
    // #
    // # + s - Type descriptor of the service
    // # + return - `()` or else  a `rabbitmq:Error` upon failure to detach the service
    // public isolated function __detach(service s) returns error? {
    //     return detach(self, s);
    // }

    // # Stops consuming messages through all consumer services by terminating the connection and all its channels.
    // #
    // # + return - `()` or else  a `rabbitmq:Error` upon failure to close the `ChannelListener`
    // public isolated function __gracefulStop() returns error? {
    //     return stop(self);
    // }

    // # Stops consuming messages through all the consumer services and terminates the connection
    // # with the server.
    // #
    // # + return - `()` or else  a `rabbitmq:Error` upon failure to close ChannelListener.
    // public isolated function __immediateStop() returns error? {
    //     return abortConnection(self);
    // }
}  

public type ConnectionConfiguration record {|
    string connectionString;
    string entityPath;
|};

// public type ConnectionConfiguration record {|
//     string host;
//     int port = 5672;
//     string? username = ();
//     string? password = ();
//     int? connectionTimeoutInMillis = ();
//     int? handshakeTimeoutMillis = ();
//     int? shutdownTimeoutInMillis = ();
//     int? heartbeatInSeconds = ();
//     SecureSocket? secureSocket = ();
// |};

// # Configurations for facilitating secure connections.
// #
// # + trustStore - Configurations associated with the TrustStore
// # + keyStore - Configurations associated with the KeyStore
// # + tlsVersion - TLS version
// # + verifyHostname - True if hostname verification should be enabled
// public type SecureSocket record {|
//     crypto:TrustStore? trustStore = ();
//     crypto:KeyStore? keyStore = ();
//     string tlsVersion = "TLS";
//     boolean verifyHostname = true;
// |};

function createReceiverConnection(handle connectionString, handle entityPath) returns handle|error? = @java:Method {
    name: "createReceiverConnection",
    'class: "com.roland.samples.servicebus.connection.ConUtils"
} external;

function closeReceiverConnection(handle imessageSender) returns error? = @java:Method {
    name: "closeRecieverConnection",
    'class: "com.roland.samples.servicebus.connection.ConUtils"
} external;

function receiveConnection (handle imessageSender, handle connectionString, handle entityPath) returns error? = @java:Method {
    name: "receiveConnection",
    'class: "com.roland.samples.servicebus.connection.ConUtils"
} external;

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
