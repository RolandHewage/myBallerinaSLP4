import ballerina/java;
import ballerina/observe;

observe:Gauge temporaryQueueGauge = new(ACTIVE_JMS_TEMPORARY_QUEUES);

# Represent the JMS temporary queue
public type TemporaryQueue object {

    // Add a reference to the `Destination` object type.
    *Destination;

    # Initialized a `TemporaryQueue` object.
    #
    # + handle - The java reference to the jms text message.
    function init(handle temporaryQueue) {
        registerAndIncrementGauge(temporaryQueueGauge);
        self.jmsDestination = temporaryQueue;
    }

    # Get the JMS temporary queue
    #
    # + return - Returns the java reference to the jms temporary queue
    function getJmsDestination() returns handle {
        return self.jmsDestination;
    }

    # Gets the name of this temporary queue.
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

    # Deletes this temporary queue.
    #
    # + return - Returns an error if it fails.
    public function delete() returns error? {
        decrementGauge(temporaryQueueGauge);
        return deleteTemporaryQueue(self.jmsDestination);
    }

};

function deleteTemporaryQueue(handle destination) returns error? = @java:Method {
    name: "delete",
    class: "javax.jms.TemporaryQueue"
} external;