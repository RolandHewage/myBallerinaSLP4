import ballerina/io;
import ballerina/test;

AzureServiceBusConfiguration config = {
    serviceNamespace: "roland1",
    queueOrTopicPath: "roland1queue"
};

@test:Config{}
function testSendToQueue(){

    AzureServiceBusClient azureServiceBusClient = new(config);

    io:println("\n ---------------------------------------------------------------------------");

    string msg = "This is a message one.";
    json|error result = azureServiceBusClient->sendToQueue(msg);

    if result is json{
            io:println(result);
            //test:assertEquals(result,51.51);

    }else{
        test:assertFail(result.message());
    }
}

// @test:Config{}
// function testSendBatchToQueue(){

//     AzureServiceBusClient azureServiceBusClient = new(config);

//     io:println("\n ---------------------------------------------------------------------------");

//     json|error result = azureServiceBusClient->sendBatchToQueue();

//     if result is json{
//             io:println(result);
//             //test:assertEquals(result,51.51);

//     }else{
//         test:assertFail(result.message());
//     }
// }

// @test:Config{}
// function testReceiveAndDeleteFromQueue(){

//     AzureServiceBusClient azureServiceBusClient = new(config);

//     io:println("\n ---------------------------------------------------------------------------");

//     json|error result = azureServiceBusClient->receiveAndDeleteFromQueue();

//     if result is json{
//             io:println(result);
//             //test:assertEquals(result,51.51);

//     }else{
//         test:assertFail(result.message());
//     }
// }
