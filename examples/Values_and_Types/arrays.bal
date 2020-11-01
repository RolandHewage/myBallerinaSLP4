import ballerina/io;
import ballerina/lang.array;

public function main() {

    int[] a = [];
    io:println(a.length());

    int[] b = [1, 2, 3, 4, 5, 6, 7, 8];
    io:println(b[0]);
    io:println(b.length());

    int[] bReveresed = b.reverse();
    io:println("Reversed: ", bReveresed);

    io:println("Before pop: ", b);
    int poppedValue = b.pop();
    io:println("Popped value: ", poppedValue);
    io:println("After pop: ", b);

    int[] doubled = b.map(function (int value) returns int {
            return value * 2;
        });
    io:println("Doubled: ", doubled);

    int[] sortedArray = b.sort(array:DESCENDING, isolated function (int value)
    returns string[] {
            if (value < 5) {
                return ["A",value.toString()];
            } else {
                return ["B",value.toString()];
            }
        });
    io:println("Sorted Array: ", sortedArray);

    b[999] = 23;
    io:println(b[999]);
    io:println(b.length());

    int[][] iarray = [[1, 2, 3], [10, 20, 30], [5, 6, 7]];
    io:println(iarray.length());
    io:println(iarray[0].length());

    iarray = [];

    int[] d = [9];
    iarray[0] = d;

    io:println(iarray[0][0]);

    int[5] e = [1, 2, 3, 4, 5];
    io:println(e.length());

    int[*] g = [1, 2, 3, 4];
    io:println(g.length());
}