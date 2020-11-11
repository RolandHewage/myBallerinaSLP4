import ballerina/java;
import ballerina/io;

public class TestClient{
    function init(){
        var arrayDeque = newMessage();
        io:println(arrayDeque);

        var csb = newConnectionStringBuilder(java:fromString("Endpoint=sb://roland1.servicebus.windows.net/;SharedAccessKeyName=RootManageSharedAccessKey;SharedAccessKey=OckfvtMMw6GHIftqU0Jj0A0jy0uIUjufhV5dCToiGJk="));
        io:println(arrayDeque);      

        // var b = getSharedAccessSignatureToken();  
        // io:println(b);

        // var cu = newConUtils();
        // io:println(cu);

        // string s = "text";
        // byte[] bArray = s.toBytes();
        // io:println(bArray);


        // Connection Configuration
        string connectionString = "Endpoint=sb://roland1.servicebus.windows.net/;SharedAccessKeyName=RootManageSharedAccessKey;SharedAccessKey=OckfvtMMw6GHIftqU0Jj0A0jy0uIUjufhV5dCToiGJk=";
        string content = "This is My Message Body"; 
        string queuePath = "roland1queue";
        string topicPath = "roland1topic";
        string subscriptionPath1 = "roland1topic/subscriptions/roland1subscription1";
        string subscriptionPath2 = "roland1topic/subscriptions/roland1subscription2";
        string subscriptionPath3 = "roland1topic/subscriptions/roland1subscription3";


        // publish and subscribe messages to topics and subscriptions
        var s1 = send(java:fromString(connectionString),java:fromString(topicPath),java:fromString(content));
        var r1 = receive(java:fromString(connectionString),java:fromString(subscriptionPath1));
        var r2 = receive(java:fromString(connectionString),java:fromString(subscriptionPath2));
        var r3 = receive(java:fromString(connectionString),java:fromString(subscriptionPath3));

        // send and receive message to and from queue
        var s2 = send(java:fromString(connectionString),java:fromString(queuePath),java:fromString(content));
        var r4 = receive(java:fromString(connectionString),java:fromString(queuePath));


    }

    public function sendToQueue(string connectionString, string queuePath, string content) returns error? {
        var s = send(java:fromString(connectionString),java:fromString(queuePath),java:fromString(content));
    }

    public function readFromQueue(string connectionString, string queuePath) returns error? {
        var r = receive(java:fromString(connectionString),java:fromString(queuePath));
    }

    public function sendToTopic(string connectionString, string topicPath, string content) returns error? {
        var s = send(java:fromString(connectionString),java:fromString(topicPath),java:fromString(content));
    }

    public function readFromSubscription(string connectionString, string subscriptionPath) returns error? {
        var r = receive(java:fromString(connectionString),java:fromString(subscriptionPath));
    }

}


function newConUtils() returns handle = @java:Constructor {
    'class: "com.roland.samples.servicebus.connection.ConUtils"
} external;

function send(handle connectionString, handle entityPath, handle content) returns error? = @java:Method {
    'class: "com.roland.samples.servicebus.connection.ConUtils"
} external;

function receive(handle connectionString, handle entityPath) returns error? = @java:Method {
    'class: "com.roland.samples.servicebus.connection.ConUtils",
    name: "receive"
} external;



// Testing 
function newMessage() returns handle = @java:Constructor {
    'class: "com.microsoft.azure.servicebus.Message"
} external;

function newConnectionStringBuilder(handle connectionString) returns handle = @java:Constructor {
    'class: "com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder",
    paramTypes: ["java.lang.String"]
} external;

// function newQueueClient(handle amqpConnectionStringBuilder, handle receiveMode) returns handle = @java:Constructor {
//     'class: "com.microsoft.azure.servicebus.QueueClient",
//     paramTypes: ["com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder","com.microsoft.azure.servicebus.ReceiveMode"]
// } external;

// function getSharedAccessSignatureToken() returns string = @java:Method {
//     'class: "com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder"
// } external;