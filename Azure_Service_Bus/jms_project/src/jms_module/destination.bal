import ballerina/java;

# Represent the JMS destination
public type Destination abstract object {

    handle jmsDestination;

    function getJmsDestination() returns handle;

};

function getDestination(handle jmsDestination) returns Destination | error {
    handle jmsDestinationType = getDestinationType(jmsDestination);
    string? destinationType = java:toString(jmsDestinationType);
    match destinationType {
        "queue" => {
            return new Queue(jmsDestination);
        }
        "topic" => {
            return new Topic(jmsDestination);
        }
        "temporaryQueue" => {
            return new TemporaryQueue(jmsDestination);
        }
        "temporaryTopic" => {
            return new TemporaryTopic(jmsDestination);
        }
    }
    JmsError err = JmsError("Invalid destination type");
    return err;
}

function getDestinationType(handle destination) returns handle = @java:Method {
    class: "org.ballerinalang.java.jms.JmsDestinationUtils"
} external;
