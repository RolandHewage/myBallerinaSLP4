import ballerina/io;
import ballerina/test;

@test:Config{}
function testSendToQueue(){

    AzureServiceBusClient azureServiceBusClient = new();

    io:println("\n ---------------------------------------------------------------------------");

    json|error result = azureServiceBusClient->sendToQueue();

    if result is json{
            io:println(result);
            //test:assertEquals(result,51.51);

    }else{
        test:assertFail(result.message());
    }
}
