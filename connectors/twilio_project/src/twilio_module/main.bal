import ballerina/http;
import ballerina/io;
import ballerina/auth;

public class TwilioClient{
    public string accountSId;
    public string authToken;
    public http:Client basicClient;   

    function init(TwilioConfiguration tConf){
        self.accountSId = tConf.accountSId;
        self.authToken = tConf.authToken;

        auth:OutboundBasicAuthProvider outboundBasicAuthProvider = new({
            username: tConf.accountSId,
            password: tConf.authToken
        });  

        http:BasicAuthHandler outboundBasicAuthHandler = new (outboundBasicAuthProvider);  

        self.basicClient = new("https://api.twilio.com/2010-04-01", {
            auth: {
                authHandler: outboundBasicAuthHandler
            },
            secureSocket: {
                trustStore: {
                    path: "/usr/lib/ballerina/distributions/ballerina-slp4/bre/security/ballerinaTruststore.p12",
                    password: "ballerina"
                }
            }
        });
    }   

    public function getAccountDetails() returns @tainted json|error{
        http:Response? result = new;

        result = <http:Response> self.basicClient->get(string `/Accounts/${self.accountSId}.json`);

        if (result is http:Response) {
            if (result.statusCode == http:STATUS_OK) {

                json payload = <json>result.getJsonPayload();
            
                return payload;

            } else {
                error err = error("error occurred while sending GET request");
                io:println(err.message(),", status code: ", result.statusCode,", reason: ", result);
                return err;
            }
        }else{

            error err = error("no parameters are provided");
            return err;
        }

        // var response = httpEndpoint->get("/hello/sayHello");
        // if (response is http:Response) {
        //     var result = response.getTextPayload();
        //     log:printInfo((result is error) ?
        //         "Failed to retrieve payload." : result);
        // } else {
        //     log:printError("Failed to call the endpoint.", <error>response);
        // }        
    }      
}

public type TwilioConfiguration record {
    string accountSId;
    string authToken;
};
