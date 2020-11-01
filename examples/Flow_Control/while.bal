import ballerina/io;
import ballerina/lang.'int as ints;

public function main() {
    int i = 0;

    while (i < 3) {
        io:println(i);
        i = i + 1;
    }

    while (true) {
        string input = io:readln("Enter age: (q to exit): ");
        if (input == "q") {

            break;
        }
        var value = ints:fromString(input);
        int age;
        if (value is int) {
            age = value;
        } else {
            io:println("Invalid value, try again.");

            continue;
        }
        string name = io:readln("Enter name: ");
        io:println(name + ((age >= 18) ? " can" : " cannot") + " vote!");
    }

}