import ballerina/http;
import ballerina/io;

public class WeatherClient{

    public string apiKey;
    public string baseUrl;
    public http:Client basicClient;

    function init(OpenMapApiConfiguration opConf){
        self.apiKey  = opConf.apiKey;
        self.baseUrl = opConf.baseUrl;

        self.basicClient = new (self.baseUrl, {
            secureSocket: {
                trustStore: {
                    path: "/usr/lib/ballerina/distributions/ballerina-slp4/bre/security/ballerinaTruststore.p12",
                    password: "ballerina"
                }
            }
            });
    }

    public function getByCityName(string? cityname,string? stateCode,string? countryCode) returns  @tainted json|error{

        http:Response? result = new;

        if cityname is string && stateCode is string && countryCode is string{

            result = <http:Response>self.basicClient->get(string `?q=${cityname},${stateCode},${countryCode}&appid=${self.apiKey}`);

        }else if cityname is string && stateCode is string{

            result = <http:Response>self.basicClient->get(string `?q=${cityname},${stateCode}&appid=${self.apiKey}`);

        }else if cityname is string{
        
            result = <http:Response>self.basicClient->get(string `?q=${cityname}&appid=${self.apiKey}`);
        }else{
            
            result = ();
        }
        
        if result is http:Response{
            if (result.statusCode == http:STATUS_OK) {

            json payload = <json>result.getJsonPayload();
            json lat = <json>payload.coord.lat;
            
            return lat;

            } else {
            error err = error("error occurred while sending GET request");
            io:println(err.message(),
             ", status code: ", result.statusCode,
             ", reason: ", result);
            return err;
            }
        }else{

            error err = error("no parameters are provided");
            return err;
        }
         
        
    }

    //By city ID 
    public function whedataOLCID(string cityid) returns @tainted json|error{

    var result = self.basicClient->get(string `?q=${cityid}&appid=${self.apiKey}`);

        http:Response response = <http:Response>result;
            if (response.statusCode == http:STATUS_OK) {

                json payload = <json>response.getJsonPayload();
                json lat = <json>payload.coord.lat;
                
                return lat;

            } else {
                error err = error("error occurred while sending GET request");
                io:println(err.message(),
                ", status code: ", response.statusCode,
                ", reason: ", response);
                return err;
            }
                    
    }

    //By geographic coordinates 
    public function whedataOLCOOD(string lat,string lon) returns @tainted json|error{

        var response = self.basicClient->get(string `?lat=${lat}&lon=${lon}&appid=${self.apiKey}`);

        http:Response coordresponse = <http:Response>response;
            if (coordresponse.statusCode == http:STATUS_OK) {

                json payload = <json>coordresponse.getJsonPayload();
                json lati = <json>payload.coord.lat;
                
                return lati;

            } else {
                error err = error("error occurred while sending GET request");
                io:println(err.message(),
                ", status code: ", coordresponse.statusCode,
                ", reason: ", coordresponse);
                return err;
            }
    }

    //By ZIP code 

    public function whedataOLZIP(string lat,string lon) returns @tainted json|error{

        var response = self.basicClient->get(string `?lat=${lat}&lon=${lon}&appid=${self.apiKey}`);

        http:Response zipresponse = <http:Response>response;
            if (zipresponse.statusCode == http:STATUS_OK) {

                json payload = <json>zipresponse.getJsonPayload();
                json lati = <json>payload.coord.lat;
                
                return lati;

            } else {
                error err = error("error occurred while sending GET request");
                io:println(err.message(),
                ", status code: ", zipresponse.statusCode,
                ", reason: ", zipresponse);
                return err;
            }
    }

    
}

public type OpenMapApiConfiguration record {
    string baseUrl;
    string apiKey;
    boolean secureSocket?;
};