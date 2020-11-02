import ballerina/io;
import ballerina/test;

// @test:Config{}
// function testSendToQueue(){

//     AzureServiceBusClient azureServiceBusClient = new();

//     io:println("\n ---------------------------------------------------------------------------");

//     json|error result = azureServiceBusClient->sendToQueue();

//     if result is json{
//             io:println(result);
//             //test:assertEquals(result,51.51);

//     }else{
//         test:assertFail(result.message());
//     }
// }

// @test:Config{}
// function testSendBatchToQueue(){

//     AzureServiceBusClient azureServiceBusClient = new();

//     io:println("\n ---------------------------------------------------------------------------");

//     json|error result = azureServiceBusClient->sendBatchToQueue();

//     if result is json{
//             io:println(result);
//             //test:assertEquals(result,51.51);

//     }else{
//         test:assertFail(result.message());
//     }
// }

@test:Config{}
function testReceiveAndDeleteFromQueue(){

    AzureServiceBusClient azureServiceBusClient = new();

    io:println("\n ---------------------------------------------------------------------------");

    json|error result = azureServiceBusClient->receiveAndDeleteFromQueue();

    if result is json{
            io:println(result);
            //test:assertEquals(result,51.51);

    }else{
        test:assertFail(result.message());
    }
}
