import ballerina/io;

public function main() {
    any message = "Hello, world!";

    boolean isString = message is string;
    io:println("Is 'message' a string? ", isString);

    if (message is int) {
        io:println("'message' is an int with value: ", message);
    } else if (message is string) {
        io:println("'message' is a string with value: ", message);
    } else {
        io:println("'message' is not an int or string, and has the value: ",
                    message);
    }

    Student alex = { name: "Alex" };
    Student|Person|Vehicle entity = alex;

    if (entity is Student) {
        io:println("entity is a student");
    } else {
        io:println("entity is not a student");
    }

    if (entity is Person) {
        io:println("entity is a person");
    } else {
        io:println("entity is not a person");
    }

    if (entity is Vehicle) {
        io:println("entity is a vehicle");
    } else {
        io:println("entity is not a vehicle");
    }

    boolean isStudent = createEntity("student") is Student;
    io:println("Did createEntity(\"student\") return a student? ", isStudent);
    isStudent = createEntity("vehicle") is Student;
    io:println("Did createEntity(\"vehicle\") return a student? ", isStudent);
}

type Person record {
    string name;
};

type Student record {
    string name;
    int age = 0;
};

type Vehicle record {
    string brand;
};

function createEntity(string entityType) returns any {
    if (entityType == "student") {
        return <Student> { name: "Alex" };
    } else if (entityType == "vehicle") {
        return <Vehicle> { brand: "Honda" };
    }
    return "invalid type";
}