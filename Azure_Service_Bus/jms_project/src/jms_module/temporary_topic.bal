import ballerina/java;
import ballerina/observe;

observe:Gauge temporaryTopicGauge = new(ACTIVE_JMS_TEMPORARY_TOPICS);

# Represent the JMS temporary topic
public class TemporaryTopic {

    // Add a reference to the `Destination` object type.
    *Destination;

    # Initialized a `TemporaryTopic` object.
    #
    # + handle - The java reference to the jms text message.
    function init(handle temporaryTopic) {
        registerAndIncrementGauge(temporaryTopicGauge);
        self.jmsDestination = temporaryTopic;
    }

    # Get the JMS temporary topic
    #
    # + return - Returns the java reference to the jms temporary topic
    function getJmsDestination() returns handle {
        return self.jmsDestination;
    }

    # Gets the name of this temporary topic.
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

    # Deletes this temporary topic.
    #
    # + return - Returns an error if it fails.
    public function delete() returns error? {
        decrementGauge(temporaryTopicGauge);
        return deleteTemporaryTopic(self.jmsDestination);
    }

}

function deleteTemporaryTopic(handle destination) returns error? = @java:Method {
    name: "delete",
    'class: "javax.jms.TemporaryTopic"
} external;