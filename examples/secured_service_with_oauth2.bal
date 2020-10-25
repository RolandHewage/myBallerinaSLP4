import ballerina/http;
import ballerina/config;
import ballerina/log;
import ballerina/oauth2;

oauth2:InboundOAuth2Provider oauth2Provider = new ({
    url: "https://localhost:9095/oauth2/token/introspect"
});

http:BearerAuthHandler oauth2Handler = new (oauth2Provider);

listener http:Listener ep = new (9090,{
    auth: {
        authHandlers: [oauth2Handler]
    },
    secureSocket: {
        keyStore: {
            path: config:getAsString("b7a.home") +
                  "/bre/security/ballerinaTruststore.p12",
            password: "ballerina"
        }
    }
});

service hello on ep {
    resource function sayHello(http:Caller caller, http:Request req) {
        error? result = caller->respond("Hello, World!!!");
        if(result is error){
            log:printError("Error in responding to caller", result);
        }
    }
}