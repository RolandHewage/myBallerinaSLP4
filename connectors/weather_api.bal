import ballerina/http;
import ballerina/io;

public function main() returns @tainted error?{
    http:Client clientEP = new ("http://api.openweathermap.org/data");
    http:Response resp = check clientEP->get("/2.5/weather?q=London,uk&APPID=2d88e6c364d13c39ad27627e65b93402");
    string payload = check resp.getTextPayload();
    io:println(payload);
}