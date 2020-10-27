import ballerina/config;
import ballerina/http;

listener http:Listener oauth2Server = new(9095, {
    secureSocket: {
        keyStore: {
            path: config:getAsString("b7a.home") +
                  "/bre/security/ballerinaTruststore.p12",
            password: "ballerina"
        }
    }
});

service oauth2 on oauth2Server {

    @http:ResourceConfig {
        methods: ["POST"],
        path: "/token/introspect"
    }
    // This introspect the access token against the access token store, 
    // which holds the issued access tokens.
    resource function introspect(http:Caller caller, http:Request req) {
        http:Response res = new;
        var authorizationHeader = trap req.getHeader("Authorization");
        if (authorizationHeader is string) {
            // Validate the received authorization header and 
            // prepare the introspection response. 
            // (Refer: https://tools.ietf.org/html/rfc7662#section-2.2)
            res.setPayload("valid_client");
        } else {
            // Invalid client. 
            // (Refer: https://tools.ietf.org/html/rfc6749#section-5.2)
            res.statusCode = 401;
            res.setPayload("invalid_client");
        }
        checkpanic caller->respond(res);
    }
}
