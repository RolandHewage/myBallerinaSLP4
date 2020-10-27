// import ballerina/config;
import ballerina/http;
import ballerina/log;
import ballerina/oauth2;

oauth2:OutboundOAuth2Provider oauth2Provider3 = new ({
    accessToken: "eyJraWQiOiJScUlmZ2xuQVNHZkNMSVhTTEdOV0t6Q0R5WHMtZ0RNNWVmdDc4eV9uU21nIiwiYWxnIjoiUlMyNTYifQ.eyJ2ZXIiOjEsImp0aSI6IkFULm9JdkFoNE5rMjdwNG1WcTh2ZGRGTUVKeGdPQXRsTEpQQ204Q2h0bk9ybWciLCJpc3MiOiJodHRwczovL2Rldi04NTU4ODIyLm9rdGEuY29tL29hdXRoMi9kZWZhdWx0IiwiYXVkIjoiYXBpOi8vZGVmYXVsdCIsImlhdCI6MTYwMzc3MzAxNSwiZXhwIjoxNjAzNzc2NjE1LCJjaWQiOiIwb2FmZm1oajZPR0RGeFhtZTVkNSIsInVpZCI6IjAwdWZnb2xldTA1bHJ6dlVFNWQ1Iiwic2NwIjpbIm9wZW5pZCJdLCJzdWIiOiJyb2xhbmQuaGV3YWdlQGdtYWlsLmNvbSJ9.YTqNMM8kDg7JsQurck73HrMZ9MpeCp7exjesnmGHIEHSggLz-DniC6RuCr8bi1XUwbR5WitHaCsPL1BRaP4bBAqtKbezGp_L0YBeZByrxis9RBPZUVwlQggoA1L57KP6xP5QbDvekUtlVpBLxlFFflq2CrxonpRvGSgIRp05tzV5_Lv-flEyF-PEY3b2oYzik_3eJvcDp3U7X6zRDMqf4gVpvBIY4L72reGyto7RBaG4SKpVEfxziUe1bhOKc2lr4y15wL4Gr010SOXPPQXsbyu_UNl8E2y1sZffz4Y-tNIBxWMbLdwSdVuJQmzQOmlBlOGnp7P0jE3YbcwMCmB5gw",
    refreshConfig: {
        clientId: "0oaffmhj6OGDFxXme5d5",
        clientSecret:
                "OJtQTk90BgSwIx9uIAazPg-8-TOWngi1u0b2UQ2m",
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