import ballerina/io;
import ballerina/log;
import ballerina/java.jms;

public function main() {
    io:println("rol");
    jms:Connection connection = check jms:createConnection({
                      initialContextFactory: "org.apache.qpid.jms.jndi.JmsInitialContextFactory",
                      providerUrl: "amqps://roland1.servicebus.windows.net?amqp.idleTimeout=120000&amqp.traceFrames=true",
                      username: "<username>",
                      password: "<password>"
                    });
    jms:Session session = check connection->createSession({acknowledgementMode: "AUTO_ACKNOWLEDGE"});
    jms:Destination queue = check session->createQueue("roland1queue");
    jms:MessageProducer producer = check session.createProducer(queue);
    jms:MessageConsumer consumer = check session->createConsumer(queue);

    jms:TextMessage msg = check session.createTextMessage("Hello Ballerina!");

    check producer->send(msg);

    jms:Message? response = check consumer->receive(3000);
    if (response is jms:TextMessage) {
        var val = response.getText();
        if (val is string) {
            log:printInfo("Message received: " + val);
        } else {
            log:printInfo("Message received without text");
        }
    } else {
        log:printInfo("Message received.");
    }
}
