import ballerina/io;
import ballerina/http;

public function main() {
   http:Client twitter = new("https://api.twitter.com/1.1/");
   http:Request tweet = new;
   tweet.setHeader("authorization", buildOAuthHeader());
   var resp = twitter->post("/statuses/update.json?status=hello", tweet);
}

function buildOAuthHeader() returns string {
   string header = "OAuth ";
   header += appendProtocolParam("oauth_consumer_key", "oauth_customer_key");
   header += appendProtocolParam("oauth_nonce", "generated_oauth_nonce");
   header += appendProtocolParam("oauth_signature", "generated_oauth_signature");
   header += appendProtocolParam("oauth_signature_method", "HMAC-SHA1");
   header += appendProtocolParam("oauth_timestamp", "generated_timestamp");
   header += appendProtocolParam("oauth_token", "oauth_token");
   header += appendProtocolParam("oauth_version", "1.0", sep = "");
   return header;
}

function appendProtocolParam(string key, string value, string sep = ", ") returns string {
   return io:sprintf("%s=\"%s\"%s", key, value, sep);
}
