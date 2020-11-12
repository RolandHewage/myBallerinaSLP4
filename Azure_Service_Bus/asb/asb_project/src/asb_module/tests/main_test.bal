import ballerina/io;
import ballerina/test;

// Connection Configuration
string connectionString = "Endpoint=sb://roland1.servicebus.windows.net/;SharedAccessKeyName=RootManageSharedAccessKey;SharedAccessKey=OckfvtMMw6GHIftqU0Jj0A0jy0uIUjufhV5dCToiGJk=";
string content = "This is My Message Body"; 
string queuePath = "roland1queue";
string topicPath = "roland1topic";
string subscriptionPath1 = "roland1topic/subscriptions/roland1subscription1";
string subscriptionPath2 = "roland1topic/subscriptions/roland1subscription2";
string subscriptionPath3 = "roland1topic/subscriptions/roland1subscription3";
int maxMessageCount = 3;

# Before Suite Function
@test:BeforeSuite
function beforeSuiteFunc() {
    io:println("I'm the before suite function!");
}

@test:Config{}
function testPublishAndSubscribe() {
    TestClient testClient = new();
    var s1 = testClient.sendToTopic(connectionString,topicPath,content);
    var r1 = testClient.readFromSubscription(connectionString,subscriptionPath1);
    var r2 = testClient.readFromSubscription(connectionString,subscriptionPath2);
    var r3 = testClient.readFromSubscription(connectionString,subscriptionPath3);
}

@test:Config{}
function testSendAndReceive() {
    TestClient testClient = new();
    var s2 = testClient.sendToQueue(connectionString,queuePath,content);
    var r4 = testClient.readFromQueue(connectionString,queuePath);
}

@test:Config{}
function testPublishAndSubscribeBatch() {
    TestClient testClient = new();
    var s3 = testClient.sendBatchToTopic(connectionString,topicPath,content,maxMessageCount);
    var r5 = testClient.readBatchFromSubscription(connectionString,subscriptionPath1,maxMessageCount);
    var r6 = testClient.readBatchFromSubscription(connectionString,subscriptionPath2,maxMessageCount);
    var r7 = testClient.readBatchFromSubscription(connectionString,subscriptionPath3,maxMessageCount);
}

@test:Config{}
function testSendAndReceiveBatch() {
    TestClient testClient = new();
    var s4 = testClient.sendBatchToQueue(connectionString,queuePath,content, maxMessageCount);
    var r8 = testClient.readBatchFromQueue(connectionString,queuePath, maxMessageCount);
}

@test:Config{}
function testCompleteAllFromSubscription() {
    TestClient testClient = new();
    var s5 = testClient.sendToTopic(connectionString,topicPath,content);
    var r9 = testClient.completeFromSubscription(connectionString,subscriptionPath1);
    var r10 = testClient.completeFromSubscription(connectionString,subscriptionPath2);
    var r11 = testClient.completeFromSubscription(connectionString,subscriptionPath3);
}

@test:Config{}
function testCompleteAllFromQueue() {
    TestClient testClient = new();
    var s6 = testClient.sendToQueue(connectionString,queuePath,content);
    var r12 = testClient.completeFromQueue(connectionString,queuePath);
}

@test:Config{}
function testCompleteOneFromSubscription() {
    TestClient testClient = new();
    var s7 = testClient.sendToTopic(connectionString,topicPath,content);
    var r13 = testClient.completeMessageFromSubscription(connectionString,subscriptionPath1);
    var r14 = testClient.completeMessageFromSubscription(connectionString,subscriptionPath2);
    var r15 = testClient.completeMessageFromSubscription(connectionString,subscriptionPath3);
    var r16 = testClient.completeMessageFromSubscription(connectionString,subscriptionPath1);
    var r17 = testClient.completeMessageFromSubscription(connectionString,subscriptionPath2);
    var r18 = testClient.completeMessageFromSubscription(connectionString,subscriptionPath3);
}

@test:Config{}
function testCompleteOneFromQueue() {
    TestClient testClient = new();
    var s8 = testClient.sendToQueue(connectionString,queuePath,content);
    var r19 = testClient.completeMessageFromQueue(connectionString,queuePath);
    var r20 = testClient.completeMessageFromQueue(connectionString,queuePath);
}

@test:Config{}
function testAbandonFromSubscription() {
    TestClient testClient = new();
    var s9 = testClient.sendToTopic(connectionString,topicPath,content);
    var r21 = testClient.abandonFromSubscription(connectionString,subscriptionPath1);
    var r22 = testClient.abandonFromSubscription(connectionString,subscriptionPath2);
    var r23 = testClient.abandonFromSubscription(connectionString,subscriptionPath3);
    var r24 = testClient.completeFromSubscription(connectionString,subscriptionPath1);
    var r25 = testClient.completeFromSubscription(connectionString,subscriptionPath2);
    var r26 = testClient.completeFromSubscription(connectionString,subscriptionPath3);
}

@test:Config{}
function testAbandonFromQueue() {
    TestClient testClient = new();
    var s10 = testClient.sendToQueue(connectionString,queuePath,content);
    var r27 = testClient.abandonFromQueue(connectionString,queuePath);
    var r28 = testClient.completeFromQueue(connectionString,queuePath);
}

@test:Config{}
function testAutoForward() {
    TestClient testClient = new();
    var s11 = testClient.sendToQueue(connectionString,queuePath,content);
    var s12 = testClient.sendToTopic(connectionString,topicPath,content);
    var r29 = testClient.completeFromQueue(connectionString,queuePath);
}

# Before test function
function beforeFunc() {
    io:println("I'm the before function!");
    // TestClient we = new();
}

# Test function
@test:Config {
    before: "beforeFunc",
    after: "afterFunc"
}
function testFunction() {
    io:println("I'm in test function!");
    test:assertTrue(true, msg = "Failed!");
}

# After test function
function afterFunc() {
    io:println("I'm the after function!");
}

# After Suite Function
@test:AfterSuite {}
function afterSuiteFunc() {
    io:println("I'm the after suite function!");
}
