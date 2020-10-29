import ballerina/io;
import ballerina/test;
// import ballerina/config;
//import ballerina/log;

TwilioConfiguration config = {
        accountSId: "<account SID>",
        authToken: "<auth Token>"
        // accountSId: config:getAsString("app.auth.ACCOUNT_SID"),
        // authToken: config:getAsString("app.authAUTH_TOKEN")
};

@test:Config{}
function testGetAccountDetails(){

    TwilioClient twilioClient = new(config);

    io:println("\n ---------------------------------------------------------------------------");

    json|error result = twilioClient.getAccountDetails();

    if result is json{
            io:println(result);
            //test:assertEquals(result,51.51);

    }else{
        test:assertFail(result.message());
    }
}