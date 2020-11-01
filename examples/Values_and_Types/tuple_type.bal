import ballerina/io;

public function main() {

    [int, string] a = [10, "John"];
    io:println(a);

    int aint;
    string astr;

    [aint, astr] = a;
    io:println(aint);
    io:println(astr);

    var [aint1, astr1] = a;

    var [q, r] = divideBy10(6);
    io:println("06/10: ", "quotient=", q, " remainder=", r);

    var [q1, _] = divideBy10(57);
    io:println("57/10: ", "quotient=", q1);

    [int, int] returnValue = divideBy10(9);

    var [_, r1] = returnValue;
    io:println("09/10: ", "remainder=", r1);
}

function divideBy10(int d) returns ([int, int]) {
    int q = d / 10;
    int r = d % 10;
    return [q, r];
}