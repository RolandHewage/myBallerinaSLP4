import ballerina/io;
import ballerina/lang.'float;
import ballerina/lang.'int;

public function main() {

    int i = 10;
    io:println(i);

    int|error i2 = 'int:fromString("100");
    if (i2 is int) {
        io:println(i2);
    }

    float f = 20.0;
    io:println(f);

    float f1 = 'float:fromBitsInt(i);
    float f2 = 22.0;
    float max = 'float:max(f1, f2);
    io:println("Max float: ", max);

    float nanVal = 0.0 / 0.0;
    io:println(nanVal.isNaN());

    float infiniteVal = 12.0 / 0.0;
    io:println(infiniteVal.isInfinite());

    float finiteVal = 6.0 / 3.0;
    io:println(finiteVal.isFinite());

    decimal d = 27.5;
    io:println(d);

    byte c = 23;
    io:println(c);

    string s = "Ballerina";
    io:println(s);

    boolean b = true;
    io:println(b);

    () n = ();
    io:println(n);

    json j = null;
    io:println(j);
}