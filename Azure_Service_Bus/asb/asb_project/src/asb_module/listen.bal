import ballerina/lang.'object as lang;
import ballerina/java;

public class Listener {

    *lang:Listener;

    handle asbConnection;

    private string connectionString;
    private string entityPath;

    public function init(ConnectionConfiguration connectionConfiguration){
        self.connectionString = connectionConfiguration.connectionString;
        self.entityPath = connectionConfiguration.entityPath;
        self.asbConnection = <handle> createConnection(java:fromString(self.connectionString),java:fromString(self.entityPath));
    }

    // # Attaches the service to the `rabbitmq:Listener` endpoint.
    // #
    // # + s - Type descriptor of the service
    // # + name - Name of the service
    // # + return - `()` or else a `rabbitmq:Error` upon failure to register the service
    public isolated function __attach(service s, string? name = ()) returns error? {
        
    }

    # Starts consuming the messages on all the attached services.
    #
    # + return - `()` or else a `rabbitmq:Error` upon failure to start
    public isolated function __start() returns error? {
        
    }

    # Stops consuming messages and detaches the service from the `rabbitmq:Listener` endpoint.
    #
    # + s - Type descriptor of the service
    # + return - `()` or else  a `rabbitmq:Error` upon failure to detach the service
    public isolated function __detach(service s) returns error? {
        
    }

    # Stops consuming messages through all consumer services by terminating the connection and all its channels.
    #
    # + return - `()` or else  a `rabbitmq:Error` upon failure to close the `ChannelListener`
    public isolated function __gracefulStop() returns error? {
        
    }

    # Stops consuming messages through all the consumer services and terminates the connection
    # with the server.
    #
    # + return - `()` or else  a `rabbitmq:Error` upon failure to close ChannelListener.
    public isolated function __immediateStop() returns error? {
        
    }
    
}

isolated function createReceiveConnection(handle connectionString, handle entityPath) returns handle|error? = @java:Method {
    name: "createReceiverConnection",
    'class: "com.roland.samples.servicebus.connection.ConUtils"
} external;
