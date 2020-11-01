import ballerina/io;

public function main() {
    io:println("Iterating a string array:- ");
    string[] fruits = ["apple", "banana", "cherry"];

    foreach var fruit in fruits {
        io:println("Fruit: ", fruit);
    }

    io:println("\nIterating a map:- ");
    map<string> countryCapitals = { "USA": "Washington, D.C.",
                                    "Sri Lanka": "Colombo",
                                    "England": "London" };

    foreach var capital in countryCapitals {
        io:println("Capital: ", capital);
    }

    foreach var [country, capital] in countryCapitals.entries() {
        io:println("Country: ", country, ", Capital: ", capital);
    }

    io:println("\nIterating a JSON object:- ");
    json apple = { name: "apple", colors: ["red", "green"], price: 5 };

    map<json> mapValue = <map<json>> apple;
    foreach var [key, value] in mapValue.entries() {
        io:println("Key: ", key, " Value: ", value);
    }

    io:println("\nIterating a JSON array:- ");

    json[] colors = <json[]> apple.colors;
    foreach var color in colors {
        io:println("Color: ", color);
    }

    io:println("\nIterating an XML:- ");
    xml books = xml `<books>
                       <book>
                           <name>Sherlock Holmes</name>
                           <author>Sir Arthur Conan Doyle</author>
                       </book>
                       <book>
                           <name>Harry Potter</name>
                           <author>J.K. Rowling</author>
                       </book>
                     </books>`;

    foreach var book in books/<*> {
        io:println("Book: \t\t\t", book);
    }

    io:println("\nIterating a table:- ");

    EmployeeTable employeeTab = table [
        {id: 1, name: "John", salary: 300.50},
        {id: 2, name: "Bella", salary: 500.50},
        {id: 3, name: "Peter", salary: 750.0}
    ];

    foreach var employee in employeeTab {
        io:println("Employee: ", employee);
    }

    io:println("\nIterating a closed integer range:- ");
    int endValue = 10;
    int sum = 0;

    foreach var i in 1...endValue {
        sum = sum + i;
    }
    io:println("Summation from 1 to ", endValue, " is ", sum);

    io:println("\nIterating a half open integer range:- ");
    sum = 0;

    foreach var i in 1..< endValue {
        sum = sum + i;
    }
    io:println("Summation from 1 to ", endValue," (exclusive) is ", sum);
}

type Employee record {
    readonly int id;
    string name;
    float salary;
};

type EmployeeTable table<Employee> key(id);