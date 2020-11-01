import ballerina/io;

type Humanities record {|
    int history;
    int geography;
|};

public function main() {

    map<string> m;

    string city = "Colombo";
    string country = "Sri Lanka";
    string codeLiteral = "code";

    map<string> addrMap = {

        line1: "No. 20",
        line2: "Palm Grove",

        city: "Colombo 03",

        country,

        [codeLiteral]: "00300"
    };
    io:println(addrMap);

    string? countryValue = addrMap["country"];

    if (countryValue is string) {
        io:println(countryValue);
    } else {
        io:println("key 'country' not found");
    }

    string line2Value = addrMap.get("line2");
    io:println(line2Value);

    boolean hasPostalCode = addrMap.hasKey("postalCode");
    io:println(hasPostalCode);

    addrMap["postalCode"] = "00300";
    io:println(addrMap);

    io:println(addrMap.keys());

    io:println(addrMap.length());

    string removedElement = addrMap.remove("code");
    io:println(addrMap);

    addrMap.forEach(function (string value) {
        io:println(value);
    });

    map<int> marks = {sam: 50, jon: 60};

    map<int> modifiedMarks = marks.entries().map(function ([string, int] pair)
        returns int {
            var [name, score] = pair;
            io:println(io:sprintf("%s scored: %d", name, score));
            return score + 10;
        }
    );
    io:println(modifiedMarks);

    Humanities humanitiesMarks = {history: 80, geography: 75};

    map<int> allMarks = {physics: 100, ...humanitiesMarks, chemistry: 75};
    io:println(allMarks);
}