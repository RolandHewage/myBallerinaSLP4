import ballerina/io;
import ballerina/http;
import ballerina/stringutils;

http:Client clientEndpoint = new("https://api.chucknorris.io/jokes/");

// This function performs a `get` request to the Chuck Norris API and returns a random joke 
// with the name replaced by the provided name or an error if the API invocation fails.
function getRandomJoke(string name) returns string|error {
    http:Response|error result = clientEndpoint->get("/random");
    http:Response response = <http:Response>result;
    if(response.statusCode == http:STATUS_OK) {
        json payload = <json>response.getJsonPayload();
        json joke = <json>payload.value;
        string replacedText = stringutils:replace(joke.toJsonString(), "Chuck Norris", name);
        return replacedText;
    } else {
        error err = error("error occurred while sending GET request");
        io:println(err.message(),
        ", status code: ",response.statusCode,
        ", reason: ", response.getJsonPayload());
        return err;
    }
}
