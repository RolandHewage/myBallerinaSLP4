import ballerina/io;
import ballerina/test;

@test:Config{}
function testGetByCityName(){
    OpenMapApiConfiguration config = {
        baseUrl: "https://api.openweathermap.org/data/2.5/weather",
        apiKey:"<api_key>",
        secureSocket: true
    };

    WeatherClient weatherClient = new(config);

    io:println("\n ---------------------------------------------------------------------------");

    json|error result = weatherClient.getByCityName("London",(),("uk"));

    if result is json{
        io:println(result);

    }else{
        test:assertFail(result.message());
    }
}

@test:Config{}
function testGetByCityId(){
    OpenMapApiConfiguration config = {
        baseUrl: "https://api.openweathermap.org/data/2.5/weather",
        apiKey:"<api_key>",
        secureSocket: true
    };

    WeatherClient weatherClient = new(config);

    io:println("\n ---------------------------------------------------------------------------");

    json|error result = weatherClient.getByCityId("80000");

    if result is json{
        io:println(result);

    }else{
        test:assertFail(result.message());
    }
}

@test:Config{}
function testGetByCoord(){
    OpenMapApiConfiguration config = {
        baseUrl: "https://api.openweathermap.org/data/2.5/weather",
        apiKey:"<api_key>",
        secureSocket: true
    };

    WeatherClient weatherClient = new(config);

    io:println("\n ---------------------------------------------------------------------------");

    json|error result = weatherClient.getByCoord("51","51");

    if result is json{
        io:println(result);

    }else{
        test:assertFail(result.message());
    }
}

@test:Config{}
function testGetByZipCode(){
    OpenMapApiConfiguration config = {
        baseUrl: "https://api.openweathermap.org/data/2.5/weather",
        apiKey:"<api_key>",
        secureSocket: true
    };

    WeatherClient weatherClient = new(config);

    io:println("\n ---------------------------------------------------------------------------");

    json|error result = weatherClient.getByZipCode("99501");

    if result is json{
        io:println(result);

    }else{
        test:assertFail(result.message());
    }
}