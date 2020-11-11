import ballerina/java;
import ballerina/io;

function newMessage() returns handle = @java:Constructor {
    'class: "com.microsoft.azure.servicebus.Message"
} external;

function newConnectionStringBuilder(handle connectionString) returns handle = @java:Constructor {
    'class: "com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder",
    paramTypes: ["java.lang.String"]
} external;

function newConUtils() returns handle = @java:Constructor {
    'class: "com.roland.samples.servicebus.connection.ConUtils"
} external;

function send(handle connectionString, handle entityPath) returns error? = @java:Method {
    'class: "com.roland.samples.servicebus.connection.ConUtils"
} external;

function receive(handle connectionString, handle entityPath) returns error? = @java:Method {
    'class: "com.roland.samples.servicebus.connection.ConUtils",
    name: "receive"
} external;



// function newQueueClient(handle amqpConnectionStringBuilder, handle receiveMode) returns handle = @java:Constructor {
//     'class: "com.microsoft.azure.servicebus.QueueClient",
//     paramTypes: ["com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder","com.microsoft.azure.servicebus.ReceiveMode"]
// } external;

// function getSharedAccessSignatureToken() returns string = @java:Method {
//     'class: "com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder"
// } external;

public class TestClient{
    function init(){
        var arrayDeque = newMessage();
        io:println(arrayDeque);

        var csb = newConnectionStringBuilder(java:fromString("Endpoint=sb://roland1.servicebus.windows.net/;SharedAccessKeyName=RootManageSharedAccessKey;SharedAccessKey=OckfvtMMw6GHIftqU0Jj0A0jy0uIUjufhV5dCToiGJk="));
        io:println(arrayDeque);      

        // var b = getSharedAccessSignatureToken();  
        // io:println(b);

        var cu = newConUtils();
        io:println(cu);

        string s = "roland";
        byte[] bArray = s.toBytes();
        io:println(bArray);
        var c = send(java:fromString("Endpoint=sb://roland1.servicebus.windows.net/;SharedAccessKeyName=RootManageSharedAccessKey;SharedAccessKey=OckfvtMMw6GHIftqU0Jj0A0jy0uIUjufhV5dCToiGJk="),java:fromString("roland1queue"));
        io:println(c);
        var d = receive(java:fromString("Endpoint=sb://roland1.servicebus.windows.net/;SharedAccessKeyName=RootManageSharedAccessKey;SharedAccessKey=OckfvtMMw6GHIftqU0Jj0A0jy0uIUjufhV5dCToiGJk="),java:fromString("roland1queue"));
        io:println(d);
    }
}

// public function main() {

//     var arrayDeque = newMessage();
//     io:println(arrayDeque);

// }