import ballerina/http;
import ballerina/oauth2;
//import ballerina/config;
import ballerina/log;
//import ballerina/io;


oauth2:OutboundOAuth2Provider oauth2ProviderDirect = new ({
    accessToken: "<access_token>",
    refreshConfig: {
        clientId: "<client_id>",
        clientSecret:"<client_secret>",
        refreshToken: "",
        refreshUrl: "",
        clientConfig: {
            secureSocket: {
                trustStore: {
                    path: "/usr/lib/ballerina/distributions/ballerina-slp4/bre/security/ballerinaTruststore.p12",
                    password: "ballerina"
                }
            }
        }
    }
    
});

http:BearerAuthHandler oauth2HandlerDirect = new (oauth2ProviderDirect);

http:Client clientDirect = new ("https://graph.facebook.com", {
    auth: {
        authHandler: oauth2HandlerDirect
    },
     secureSocket: {
        trustStore: {
            path: "/usr/lib/ballerina/distributions/ballerina-slp4/bre/security/ballerinaTruststore.p12",
            password: "ballerina"
        }
    }
});




public function main() {
//Direct
    var responseDirect = clientDirect->get("/me");
    if (responseDirect is http:Response) {

        var resultDirect = responseDirect.getTextPayload();

        log:printInfo((resultDirect is error) ? "Failed to retrieve payload." : resultDirect);

    } else {
        log:printError("Failed to call the endpoint.", responseDirect);
    }
}