import ballerina/http;
import ballerina/io;

public class WeatherClient{

    private string apiKey;
    private string baseUrl;
    private http:Client basicClient;

    function init(OpenMapApiConfiguration opConf) {
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

    public function getByCityName(string cityName, string? stateCode, string? countryCode) returns @tainted json|error {

        http:Response? result = new;

        if stateCode is string && countryCode is string {

            result = <http:Response>self.basicClient->get(string `?q=${cityName},${stateCode},${countryCode}&appid=${self.apiKey}`);

        }else if stateCode is string {

            result = <http:Response>self.basicClient->get(string `?q=${cityName},${stateCode}&appid=${self.apiKey}`);

        }else {
        
            result = <http:Response>self.basicClient->get(string `?q=${cityName}&appid=${self.apiKey}`);
        }
        
        if result is http:Response{
            if (result.statusCode == http:STATUS_OK) {

                json payload = <json>result.getJsonPayload();
                json[] j = <json[]>payload.weather;
                // io:println(payload);
                json|error weatherData = j[0].description;
                // io:println(lat);
            
                return weatherData;

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

    public function getByCityId(string cityId) returns @tainted json|error{

    var result = self.basicClient->get(string `?q=${cityId}&appid=${self.apiKey}`);

        http:Response response = <http:Response>result;
            if (response.statusCode == http:STATUS_OK) {

                json payload = <json>response.getJsonPayload();
                json[] j = <json[]>payload.weather;
                json|error weatherData = j[0].description;
                
                return weatherData;

            } else {
                error err = error("error occurred while sending GET request");
                io:println(err.message(),
                ", status code: ", response.statusCode,
                ", reason: ", response);
                return err;
            }
                    
    }
 
    public function getByCoord(string lat,string lon) returns @tainted json|error{

        var response = self.basicClient->get(string `?lat=${lat}&lon=${lon}&appid=${self.apiKey}`);

        http:Response coordresponse = <http:Response>response;
            if (coordresponse.statusCode == http:STATUS_OK) {

                json payload = <json>coordresponse.getJsonPayload();
                json[] j = <json[]>payload.weather;
                json|error weatherData = j[0].description;
                
                return weatherData;

            } else {
                error err = error("error occurred while sending GET request");
                io:println(err.message(),
                ", status code: ", coordresponse.statusCode,
                ", reason: ", coordresponse);
                return err;
            }
    }

    public function getByZipCode(string lat,string lon) returns @tainted json|error{

        var response = self.basicClient->get(string `?lat=${lat}&lon=${lon}&appid=${self.apiKey}`);

        http:Response zipresponse = <http:Response>response;
            if (zipresponse.statusCode == http:STATUS_OK) {

                json payload = <json>zipresponse.getJsonPayload();
                json[] j = <json[]>payload.weather;
                json|error weatherData = j[0].description;
                
                return weatherData;

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