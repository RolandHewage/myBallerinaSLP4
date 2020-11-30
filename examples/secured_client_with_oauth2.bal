// import ballerina/config;
import ballerina/http;
import ballerina/log;
import ballerina/oauth2;

oauth2:OutboundOAuth2Provider oauth2Provider3 = new ({
    accessToken: "<access_token>",
    refreshConfig: {
        clientId: "<client_id>",
        clientSecret:
                "<client_secret>",
        refreshToken: "<Refresh token for the refresh token server>",
        refreshUrl: "<Refresh token URL for the refresh token server>",
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
http:BearerAuthHandler oauth2Handler3 = new (oauth2Provider3);

http:Client clientEP3 = new ("https://dev-8558822.okta.com/oauth2/default", {
    auth: {
        authHandler: oauth2Handler3
    },
    secureSocket: {
        trustStore: {
            path: "/usr/lib/ballerina/distributions/ballerina-slp4/bre/security/ballerinaTruststore.p12",
            password: "ballerina"
        }
    }
});


public function main() {
    var response = clientEP3->get("/v1/userinfo");
    if (response is http:Response) {
        // var result = response.getTextPayload();
        var result = response.getJsonPayload();
        log:printInfo(
                    (result is error) ? "Failed to retrieve payload." : result);
    } else {
        log:printError("Failed to call the endpoint.", response);
    }
}