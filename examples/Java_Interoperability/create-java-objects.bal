import ballerina/io;
import ballerina/java;

function newArrayDeque() returns handle = @java:Constructor {
    'class: "java.util.ArrayDeque"
} external;

function newArrayDequeWithInitialCapacity(int numElements)
                                          returns handle = @java:Constructor {
    'class: "java.util.ArrayDeque",
    paramTypes: ["int"]
} external;

public function main() {

    var arrayDeque = newArrayDeque();
    io:println(arrayDeque);

    var arrayDequeWithCapacity = newArrayDequeWithInitialCapacity(10);
    io:println(arrayDequeWithCapacity);
}