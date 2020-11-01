import ballerina/io;

public function main() {

    int[5] intArray = [0, 1, 2, 3, 4];

    foreach var counter in intArray {

        match counter {
            0 => {
                io:println("value is: 0");
            }
            1 => {
                io:println("value is: 1");
            }
            2 => {
                io:println("value is: 2");
            }
            3 => {
                io:println("value is: 3");
            }
            4 => {
                io:println("value is: 4");
            }
            5 => {
                io:println("value is: 5");
            }
        }
    }

    string[] animals = ["Cat", "Canine", "Mouse", "Horse"];

    foreach string animal in animals {

        match animal {
            "Mouse" => {
                io:println("Mouse");
            }
            "Dog"|"Canine" => {
                io:println("Dog");
            }
            "Cat"|"Feline" => {
                io:println("Cat");
            }

            _ => {
                io:println("Match All");
            }
        }
    }
}