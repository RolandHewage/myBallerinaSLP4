package com.roland.samples.servicebus.connection;

import org.ballerinalang.jvm.api.values.BError;
import org.ballerinalang.jvm.runtime.AsyncFunctionCallback;

import java.util.concurrent.CountDownLatch;

public class RabbitMQResourceCallback extends AsyncFunctionCallback {
    private CountDownLatch countDownLatch;
    private String queueName;
    private int size;

    RabbitMQResourceCallback(CountDownLatch countDownLatch, String queueName, int size) {
        this.countDownLatch = countDownLatch;
        this.queueName = queueName;
        this.size = size;
    }

    @Override
    public void notifySuccess() {
        System.out.println("Lalith1");
        countDownLatch.countDown();
    }

    @Override
    public void notifyFailure(BError error) {
        countDownLatch.countDown();
    }
}
