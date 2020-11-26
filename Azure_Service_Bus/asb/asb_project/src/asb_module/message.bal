import ballerina/java;

public client class Message {
    private byte[] messageContent = [];

    public isolated function getTextContent() returns @tainted string|Error {
        return nativeGetTextContent(self.messageContent);
   }
}

isolated function nativeGetTextContent(byte[] messageContent) returns string|Error =
@java:Method {
    name: "getTextContent",
    'class: "com.roland.samples.servicebus.connection.MessageUtils"
} external;