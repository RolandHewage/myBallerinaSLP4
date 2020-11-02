import ballerina/http;
import ballerina/io;

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
        self.httpRequest.setHeader("Content-Type","application/atom+xmapplication/atom+xml;type=entry;char");
        self.httpRequest.setHeader("BrokerProperties",string `{"Label":"M1","State":"Active","TimeToLive":10}`);
        self.httpRequest.setHeader("Priority","High");
        self.httpRequest.setHeader("Customer","12345,ABC");
        self.httpRequest.setPayload("This is a message one.");

    } 

    public remote function sendToQueue() returns @tainted json|error{

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
}
