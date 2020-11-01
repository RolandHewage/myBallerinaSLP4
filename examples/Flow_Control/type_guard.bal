import ballerina/io;

public function main() {

    string|int|boolean value = 10;

    if (value is string) {

        string str = value;
        io:println("value is a string: ", str);
    } else if (value is int) {

        io:println("value is an int: ", value);
        io:println("value + 1: ", addOneToInt(value));

        value = "Hello World";

        if (value is int) {

            int i = value;
            io:println("- value is an int: ", i);
        } else {

            string|boolean sb = value;
            io:println("- value is string|boolean: ", sb);
        }
    } else {

        if (value) {
            io:println("s is 'true'");
        }
    }
}

function addOneToInt(int i) returns int {
    return i + 1;
}