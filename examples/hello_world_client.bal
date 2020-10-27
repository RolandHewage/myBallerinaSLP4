import ballerina/http;
import ballerina/io;

public function main() returns @tainted error?{
    http:Client clientEP = new ("http://www.mocky.io");
    http:Response resp = check clientEP->get("/v2/5ae082123200006b00510c3d/");
    // http:Client clientEP = new ("https://dev-8558822.okta.com/oauth2/default");
    // http:Response resp = check clientEP->get("/v1/userinfo");
    string payload = check resp.getTextPayload();
    io:println(payload);
}