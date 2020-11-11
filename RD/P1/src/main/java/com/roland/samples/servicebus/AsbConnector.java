package com.roland.samples.servicebus;

import com.roland.samples.servicebus.connection.AsbConnectionUtils;

import java.util.logging.Logger;

public class AsbConnector {

    private static final Logger LOG = Logger.getLogger(AsbConnector.class.getName());

    private AsbConnectionUtils connectionManagement;

    public AsbConnector(AsbConnectionUtils connectionManagement) {
        this.connectionManagement = connectionManagement;
    }

    //    public void listenQueue(String queue, SourceCallback callback) throws Exception {
//        connectionManagement.runQueueListener(queue, callback);
//    }

    public void addMessage(String queue, String message) throws Exception {
        LOG.info("Sending new message to the queue: " + queue);
        connectionManagement.addMessageToQueue(queue, message);
    }

    public void acknowledgeMessage(String message) throws Exception {
        // Method template for acknowledgeMessage operation
    }

    public void onStart() {
        LOG.info("AsbConnector onStart called.");
    }

    public void onStop() {
        LOG.info("AsbConnector onStop called.");
    }

    public AsbConnectionUtils getConnectionManagement() {
        return connectionManagement;
    }

    public void setConnectionManagement(
            AsbConnectionUtils connectionManagement) {
        this.connectionManagement = connectionManagement;
    }
}
