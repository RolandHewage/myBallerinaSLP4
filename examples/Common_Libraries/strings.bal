import ballerina/io;
import ballerina/lang.'string;

public function main() {

    string statement = "Lion in Town. Catch the Lion";

    string s1 = statement.toUpperAscii();
    io:println("ToUpper: ", s1);

    string s2 = statement.toLowerAscii();
    io:println("ToLower: ", s2);

    string s3 = statement.substring(0, 4);
    io:println("SubString: ", s3);

    int? index = statement.indexOf("on");
    if (index is int) {
        io:println("IndexOf: ", index);
    }

    int length = statement.length();
    io:println("Length: ", length);

    string hello = "Hello";
    string ballerina = "Ballerina!";

    string s4 = hello.concat(" ", ballerina);
    io:println("Concat: ", s4);

    string s5 = ",".'join(hello, ballerina);
    io:println("Join: ", s5);

    byte[] bArray = hello.toBytes();

    string|error s6 = 'string:fromBytes(bArray);
    if (s6 is string) {
        io:println("From bytes: ", s6);
    }

    string toTrim = "  Ballerina Programming Language  ";
    string s7 = toTrim.trim();
    io:println("Trim: ", s7);

    boolean hasSuffix = statement.endsWith("Lion");
    io:println("HasSuffix: ", hasSuffix);

    boolean hasPrefix = statement.startsWith("Lion");
    io:println("HasPrefix: ", hasPrefix);

    string name = "Sam";
    int marks = 90;
    string[] subjects = ["English", "Science"];
    float average = 71.5;
    string s8 = io:sprintf("%s scored %d for %s and has an average of %.2f.",
     name, marks, subjects[0], average);
    io:println("Sprintf: ", s8);
}