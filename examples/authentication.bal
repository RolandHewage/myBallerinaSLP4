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
        accessToken: "yf29.PlrfBb0gtDFXsbnE_LcDCG-Dz3djEp05zM9y-IPR8CsZz90XwOEyrhqeXPPYxubY9RHMIFzoV2",
        clientId: "50332352747-270vchcnbhbl4gfn1v91hl0fru.apps.example.org",
        clientSecret: "PrfEadE4s2SDG4hJ",
        refreshToken: "5/lk-u0Ywefgh52-v0_OLOkDhlsA9xIadf4qqD3TMQvc",
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
    string token = "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJiYWxsZXJ" +
        "pbmEiLCJpc3MiOiJiYWxsZXJpbmEiLCJleHAiOjI4MTg0MTUwMTksImlhdCI6MTUyND" +
        "U3NTAxOSwianRpIjoiZjVhZGVkNTA1ODVjNDZmMmI4Y2EyMzNkMGMyYTNjOWQiLCJhdW" +
        "QiOlsiYmFsbGVyaW5hIiwiYmFsbGVyaW5hLm9yZyIsImJhbGxlcmluYS5pbyJdLCJzY" +
        "29wZSI6ImhlbGxvIn0.bNoqz9_DzgeKSK6ru3DnKL7NiNbY32ksXPYrh6Jp0_O3ST7W" +
        "fXMs9WVkx6Q2TiYukMAGrnMUFrJnrJvZwC3glAmRBrl4BYCbQ0c5mCbgM9qhhCjC1tB" +
        "A50rjtLAtRW-JTRpCKS0B9_EmlVKfvXPKDLIpM5hnfhOin1R3lJCPspJ2ey_Ho6fDhs" +
        "KE3DZgssvgPgI9PBItnkipQ3CqqXWhV-RFBkVBEGPDYXTUVGbXhdNOBSwKw5ZoVJrCU" +
        "iNG5XD0K4sgN9udVTi3EMKNMnVQaq399k6RYPAy3vIhByS6QZtRjOG8X93WJw-9GLiH" +
        "vcabuid80lnrs2-mAEcstgiHVw";
    runtime:getInvocationContext().authContext.scheme = "jwt";
    runtime:getInvocationContext().authContext.authToken = token;
}