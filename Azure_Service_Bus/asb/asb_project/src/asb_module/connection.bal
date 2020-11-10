import ballerina/java;
import ballerina/io;

function newMessage() returns handle = @java:Constructor {
    'class: "com.microsoft.azure.servicebus.Message"
} external;

function newConnectionStringBuilder(handle connectionString) returns handle = @java:Constructor {
    'class: "com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder",
    paramTypes: ["java.lang.String"]
} external;

function newQueueClient(handle amqpConnectionStringBuilder, handle receiveMode) returns handle = @java:Constructor {
    'class: "com.microsoft.azure.servicebus.QueueClient",
    paramTypes: ["com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder","com.microsoft.azure.servicebus.ReceiveMode"]
} external;

function getSharedAccessSignatureToken() returns string = @java:Method {
    'class: "com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder"
} external;

public class TestClient{
    function init(){
        var arrayDeque = newMessage();
        io:println(arrayDeque);

        var csb = newConnectionStringBuilder(java:fromString("Endpoint=sb://roland1.servicebus.windows.net/;SharedAccessKeyName=RootManageSharedAccessKey;SharedAccessKey=OckfvtMMw6GHIftqU0Jj0A0jy0uIUjufhV5dCToiGJk="));
        io:println(arrayDeque);      

        var b = getSharedAccessSignatureToken();  
        io:println(b);

    }
}

// public function main() {

//     var arrayDeque = newMessage();
//     io:println(arrayDeque);

// }