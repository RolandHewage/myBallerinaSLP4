import ballerina/java;

# Represent the JMS queue
public class Queue {

    // Add a reference to the `Destination` object type.
    *Destination;

    # Initialized a `Queue` object.
    #
    # + handle - The java reference to the jms text message.
    function init(handle queue) {
        self.jmsDestination = queue;
    }

    # Get the JMS queue
    #
    # + return - Returns the java reference to the jms queue
    function getJmsDestination() returns handle {
        return self.jmsDestination;
    }

    # Gets the name of this queue.
    #
    # + return - Returns the string value or an error if it fails.
    public function getQueueName() returns string | error? {
        handle|error val = getQueueName(self.jmsDestination);
        if (val is handle) {
            return java:toString(val);
        } else {
            return val;
        }
    }

}

function getQueueName(handle destination) returns handle | error = @java:Method {
    'class: "javax.jms.Queue"
} external;