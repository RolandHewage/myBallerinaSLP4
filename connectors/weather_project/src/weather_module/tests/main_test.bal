import ballerina/io;
import ballerina/test;

@test:Config{}
function testCallByCityName(){
    OpenMapApiConfiguration config = {
        baseUrl: "https://api.openweathermap.org/data/2.5/weather",
        apiKey:"2d88e6c364d13c39ad27627e65b93402",
        secureSocket: true
    };

    WeatherClient weatherClient = new(config);

    io:println("\n ---------------------------------------------------------------------------");

    json|error result = weatherClient.whedataOLCN("London",(),"uk");

    if result is json{
            io:println(result);

    }else{
        test:assertFail(result.message());
    }
}