import ballerina/io;
import ballerina/http;
import ballerina/config;
import ballerina/runtime;

function main(string... args) {
    testNoAuth();
    testBasicAuth();
    testOAuth2();
    testJWTAuth();
}

//*********************************************************************************************************************

endpoint http:Client noAuthClient {
    url: "https://www.example.org/api/v1"
};

public function testNoAuth() {
    string requestPath = "/employees";
    var response = noAuthClient->get(requestPath);
    io:println(response);
}

//*********************************************************************************************************************

endpoint http:Client basicAuthClient {
    url: "https://www.example.org/api/v1",
    auth: {
        scheme: http:BASIC_AUTH,
        username: "admin",
        password: "123"
    }
};

public function testBasicAuth() {
    string requestPath = "/employees";
    var response = basicAuthClient->get(requestPath);
    io:println(response);
}

//*********************************************************************************************************************

endpoint http:Client oauth2Client {
    url: "https://www.example.org/api/v1",
    auth: {
        scheme: http:OAUTH2,
        accessToken: "<access_token>",
        clientId: "<client_id>",
        clientSecret: "<client_secret>",
        refreshToken: "<refresh_token>",
        refreshUrl: "https://www.example.com/oauth2/v3/token"
    }
};

public function testOAuth2() {
    string requestPath = "/employees";
    var response = oauth2Client->get(requestPath);
    io:println(response);
}

//*********************************************************************************************************************

endpoint http:Client jwtClient {
    url: "https://www.example.org/api/v1",
    auth: {
        scheme: http:JWT_AUTH
    }
};

public function testJWTAuth() {
    setJwtTokenToAuthContext();
    string requestPath = "/employees";
    var response = jwtClient->get(requestPath);
    io:println(response);
}

function setJwtTokenToAuthContext () {
    string token = "<jwt_token>";
    runtime:getInvocationContext().authContext.scheme = "jwt";
    runtime:getInvocationContext().authContext.authToken = token;
}