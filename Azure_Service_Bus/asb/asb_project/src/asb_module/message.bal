import ballerina/java;

public class Message {
    private byte[] messageContent = [];
    private byte[] lady2 = [];
    private  string lady = "lady";
    // private byte[] lady1 = lady.toBytes();

    public isolated function getTextContent() returns @tainted string|Error {
        return nativeGetTextContent(self.messageContent);
    }

    public isolated function getLady() returns string|Error {
        return self.lady;
    }

    public isolated function getLady2() returns byte[]|Error {
        return self.messageContent;
    }
}

isolated function nativeGetTextContent(byte[] messageContent) returns string|Error =
@java:Method {
    name: "getTextContent",
    'class: "com.roland.samples.servicebus.connection.MessageUtils"
} external;