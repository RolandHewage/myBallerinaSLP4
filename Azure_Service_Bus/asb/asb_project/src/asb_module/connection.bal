import ballerina/java;

public class Connection{

    handle asbConnection;

    private string connectionString;
    private string entityPath;

    public isolated function init(ConnectionConfiguration connectionConfiguration) {
        self.connectionString = connectionConfiguration.connectionString;
        self.entityPath = connectionConfiguration.entityPath;
        self.asbConnection = <handle> createConnection(java:fromString(self.connectionString),java:fromString(self.entityPath));
    }

    public isolated function closeConnection() returns error? {
        return closeConnection(self.asbConnection);
    }

    public isolated function receiveFromConnection() returns error? {
        return receiveFromConnection(self.asbConnection);
    }

}

isolated function createConnection(handle connectionString, handle entityPath) returns handle|error? = @java:Method {
    name: "createReceiverConnection",
    'class: "com.roland.samples.servicebus.connection.ConUtils"
} external;

isolated function closeConnection(handle imessageSender) returns error? = @java:Method {
    name: "closeReceiverConnection",
    'class: "com.roland.samples.servicebus.connection.ConUtils"
} external;

isolated function receiveFromConnection(handle imessageSender) returns error? = @java:Method {
    name: "receiveConnection",
    'class: "com.roland.samples.servicebus.connection.ConUtils"
} external;