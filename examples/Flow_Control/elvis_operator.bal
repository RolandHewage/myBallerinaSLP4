import ballerina/io;

public function main() {
    string? input = ();

    string name = input is () ? "John Doe" : input;
    io:println("Name: ", name);

    name = input ?: "John Doe";
    io:println("Name: " + name);

    input = "Bill Lambert";
    name = input ?: "John Doe";
    io:println("Name: " + name);
}
