import ballerina/java;
import ballerina/observe;

# JMS Message Producer client object to send messages to both queues and topics.
#
public type MessageProducer client object {

    private handle jmsProducer = JAVA_NULL;

    # Initialize the Message Producer client object
    #
    # + jmsProducer - reference to java MessageProducer object
    public function init(handle jmsProducer) returns error? {
        self.jmsProducer = jmsProducer;
    }

    # Sends a message to the JMS provider
    #
    # + message - Message to be sent to the JMS provider
    # + return - Error if unable to send the message to the queue
    public remote function send(Message message) returns error? {
        registerAndIncrementCounter(new observe:Counter(TOTAL_JMS_MESSAGES_SENT));
        return send(self.jmsProducer, message.getJmsMessage());
    }

    # Sends a message to a given destination of the JMS provider
    #
    # + destination - Destination used for the message sender
    # + message - Message to be sent to the JMS provider
    # + return - Error if sending to the given destination fails
    public remote function sendTo(Destination destination, Message message) returns error? {
        return sendToDestination(self.jmsProducer, destination.getJmsDestination(), message.getJmsMessage());
    }
};

function send(handle messageProducer, handle message) returns error? = @java:Method {
    name: "send",
    paramTypes: ["javax.jms.Message"],
    class: "javax.jms.MessageProducer"
} external;

function sendToDestination(handle messageProducer, handle destination, handle message) returns error? = @java:Method {
    name: "send",
    paramTypes: ["javax.jms.Destination", "javax.jms.Message"],
    class: "javax.jms.MessageProducer"
} external;
