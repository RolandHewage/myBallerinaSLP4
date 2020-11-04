import ballerina/java;

# Represent the JMS topic
public type Topic object {

    // Add a reference to the `Destination` object type.
    *Destination;

    # Initialized a `Topic` object.
    #
    # + handle - The java reference to the jms text message.
    function init(handle topic) {
        self.jmsDestination = topic;
    }

    # Get the JMS topic
    #
    # + return - Returns the java reference to the jms topic
    function getJmsDestination() returns handle {
        return self.jmsDestination;
    }

    # Gets the name of this topic.
    #
    # + return - Returns the string value or an error if it fails.
    public function getTopicName() returns string | error? {
        handle|error val = getTopicName(self.jmsDestination);
        if (val is handle) {
            return java:toString(val);
        } else {
            return val;
        }
    }

};

function getTopicName(handle destination) returns handle | error = @java:Method {
    class: "javax.jms.Topic"
} external;