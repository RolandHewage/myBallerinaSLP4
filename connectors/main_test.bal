import ballerina/io;
import ballerina/test;
//import ballerina/config;
//import ballerina/log;

@test:Config{}
function testCallByCityName(){
    OpenMapApiConfiguration config = {
        baseUrl: "https://api.openweathermap.org/data/2.5/weather",
        apiKey:"0e125d94e62e966bae52906bfc11efea",
        secureSocket: true
    };

    OMClient openMapClient = new(config);

    io:println("\n ---------------------------------------------------------------------------");

    json|error result = openMapClient.whedataOLCN("London",(),"uk");

    if result is json{
            io:println(result);
            //test:assertEquals(result,51.51);

    }else{
        test:assertFail(result.message());
    }


}