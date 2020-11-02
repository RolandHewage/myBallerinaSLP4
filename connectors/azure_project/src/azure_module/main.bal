import ballerina/http;
import ballerina/io;
import ballerina/mime;
import ballerina/log;

public client class AzureServiceBusClient{

    private http:Client httpClient;
    private http:Request httpRequest;   

    function init(){

        self.httpClient = new("https://roland1.servicebus.windows.net/roland1queue", {
            secureSocket: {
                trustStore: {
                    path: "/usr/lib/ballerina/distributions/ballerina-slp4/bre/security/ballerinaTruststore.p12",
                    password: "ballerina"
                }
            }
        });

        self.httpRequest = new;
        self.httpRequest.setHeader("Authorization","SharedAccessSignature sr=https%3A%2F%2Froland1.servicebus.windows.net%2Froland1queue%2Fmessages&sig=CZr3FKSSMAgwWccOTAqKgu3f5OrYHej8zlgTA1wiR%2BY%3D&se=1604894207&skn=RootManageSharedAccessKey");

    } 

    public remote function sendToQueue() returns @tainted json|error{

        self.httpRequest.setHeader("Content-Type","application/atom+xmapplication/atom+xml;type=entry;char");
        self.httpRequest.setHeader("BrokerProperties",string `{"Label":"M1","State":"Active","TimeToLive":10}`);
        self.httpRequest.setHeader("Priority","High");
        self.httpRequest.setHeader("Customer","12345,ABC");
        self.httpRequest.setPayload("This is a message one.");

        var result = self.httpClient->post(string `/messages`,self.httpRequest);

        if result is http:Response{
            if (result.statusCode == 201) {

                // json payload = <json>result.getJsonPayload();
                json payload = {"me":"wow"};
            
                return payload;

            } else {
                error err = error("error occurred while sending POST request");
                io:println(err.message(),", status code: ", result.statusCode,", reason: ", result);
                return err;
            }
        }else{

            error err = error("no parameters are provided");
            return err;
        }
    }

    public remote function sendBatchToQueue() returns @tainted json|error{

        json j = [  
                    {  
                        Body:"This is the first message",  
                        BrokerProperties:{Label:"M1",TimeToLiveTimeSpan:"0.00:00:40"}  
                    },  
                    {  
                        Body:"This is the second message",  
                        BrokerProperties:{Label:"M2"},  
                        UserProperties:{Priority:"Low"}  
                    },  
                    {  
                        Body:"This is the third message",  
                        BrokerProperties:{Label:"M3"},  
                        UserProperties:{Priority:"Medium",Customer:"ABC"}  
                    }  
                ]; 

        self.httpRequest.setHeader("Content-Type","application/vnd.api+json");
        // self.httpRequest.setPayload(json `[{"Body":"This is the first message","BrokerProperties":{"Label":"M1","TimeToLiveTimeSpan":"0.00:00:40"}},{"Body":"This is the second message","BrokerProperties":{"Label":"M2"},"UserProperties":{"Priority":"Low"}},{"Body":"This is the third message","BrokerProperties":{"Label":"M3"},"UserProperties":{"Priority":"Medium","Customer":"ABC"}}]`);
        self.httpRequest.setPayload(j);

        var result = self.httpClient->post(string `/messages`,self.httpRequest);

        if result is http:Response{
            if (result.statusCode == 201) {


                json payload = {"me":"wow"};
            
                return payload;

            } else {
                error err = error("error occurred while sending POST request");
                io:println(err.message(),", status code: ", result.statusCode,", reason: ", result);
                return err;
            }
        }else{

            error err = error("no parameters are provided");
            return err;
        }
    }    
    
    public remote function receiveAndDeleteFromQueue() returns @tainted json|error{

        var result = self.httpClient->delete(string `/messages/head`,self.httpRequest);

        if result is http:Response{
            if (result.statusCode == 204) {

                // json payload = <json>result.getJsonPayload();
                json payload = {"me":"wow"};
            
                return payload;
            } else if (result.statusCode == 200){
                json payload = <json>result.getJsonPayload();
                return payload;
            } else {
                error err = error("error occurred while sending POST request");
                io:println(err.message(),", status code: ", result.statusCode,", reason: ", result);
                return err;
            }
        }else{

            error err = error("no parameters are provided");
            return err;
        }
    }            
}

public function handleResponse(http:Response|error response) {
    if (response is http:Response) {

        if (response.hasHeader("content-type")) {
            string baseType = getBaseType(response.getContentType());
            if (mime:TEXT_PLAIN == baseType) {
                var payload = response.getTextPayload();
                if (payload is string) {
                    log:printInfo("Text data: " + payload);
                } else {
                    log:printError("Error in parsing text data", payload);
                }
            } else if (mime:APPLICATION_XML == baseType) {
                var payload = response.getXmlPayload();
                if (payload is xml) {
                    string strValue = io:sprintf("%s", payload);
                    log:printInfo("Xml data: " + strValue);
                } else {
                    log:printError("Error in parsing xml data", payload);
                }
            } else if (mime:APPLICATION_JSON == baseType) {
                var payload = response.getJsonPayload();
                if (payload is json) {
                    log:printInfo("Json data: " + payload.toJsonString());
                } else {
                    log:printError("Error in parsing json data", payload);
                }
            } else if (mime:APPLICATION_OCTET_STREAM == baseType) {
                var payload = response.getTextPayload();
                if (payload is string) {
                    log:printInfo("Response contains binary data: " + payload);
                } else {
                    log:printError("Error in parsing binary data", payload);
                }
            } else if (mime:MULTIPART_FORM_DATA == baseType) {
                log:printInfo("Response contains body parts: ");
                var payload = response.getBodyParts();
                if (payload is mime:Entity[]) {
                    handleBodyParts(payload);
                } else {
                    log:printError("Error in parsing multipart data", payload);
                }
            } else if (mime:IMAGE_PNG == baseType) {
                log:printInfo("Response contains an image");
            }
        } else {
            log:printInfo("Entity body is not available");
        }
    } else {
        error err = <error>response;
        log:printError(err.message(), err);
    }
}

public function getBaseType(string contentType) returns string {
    var result = mime:getMediaType(contentType);
    if (result is mime:MediaType) {
        return result.getBaseType();
    } else {
        panic result;
    }
}

public function handleBodyParts(mime:Entity[] bodyParts) {
    foreach var bodyPart in bodyParts {
        string baseType = getBaseType(bodyPart.getContentType());
        if (mime:APPLICATION_JSON == baseType) {
            var payload = bodyPart.getJson();
            if (payload is json) {
                log:printInfo("Json Part: " + payload.toJsonString());
            } else {
                log:printError(payload.message(), payload);
            }
        }
        if (mime:TEXT_PLAIN == baseType) {
                var payload = bodyPart.getText();
            if (payload is string) {
                log:printInfo("Text Part: " + payload);
            } else {
                log:printError(payload.message(), payload);
            }
        }
    }
}
