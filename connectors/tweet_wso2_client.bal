import ballerina/io;
import wso2/twitter;

twitter:TwitterConfiguration twitterConfig = {
   clientId: "<clientId>",
   clientSecret: "<clientSecret>",
   accessToken: "<accessToken>",
   accessTokenSecret: "<accessTokenSecret>"
};

twitter:Client twitterClient = new(twitterConfig);

public function main() {
   var resp = twitterClient->tweet(“Hello from Ballerina!”);
}
