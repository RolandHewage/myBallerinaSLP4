import ballerina/io;

public function main() {
    int a = 10;
    int b = 0;

    if (a == 10) {
        io:println("a == 10");
    }

    if (a < b) {
        io:println("a < b");
    } else {
        io:println("a >= b");
    }

    if (b < 0) {
        io:println("b < 0");
    } else if (b > 0) {
        io:println("b > 0");
    } else {
        io:println("b == 0");
    }
}