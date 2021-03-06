// This is an empty Ballerina object autogenerated to represent the `java.util.Collection` Java class.
//
// If you need the implementation of this class generated, please use the following command.
//
// $ ballerina bindgen [(-cp|--classpath) <classpath>...] [(-o|--output) <output>] (<class-name>...)
//
// E.g. $ ballerina bindgen java.util.Collection


import ballerina/java;

# Ballerina object mapping for Java interface `java.util.Collection`.
#
# + _Collection - The field that represents this Ballerina object, which is used for Java subtyping.
# + _Iterable - The field that represents the superclass object `Iterable`.
# + _Object - The field that represents the superclass object `Object`.
@java:Binding {
    'class: "java.util.Collection"
}
class Collection {

    *java:JObject;

    CollectionT _Collection = CollectionT;
    IterableT _Iterable = IterableT;
    ObjectT _Object = ObjectT;

    # The init function of the Ballerina object mapping `java.util.Collection` Java class.
    #
    # + obj - The `handle` value containing the Java reference of the object.
    function init(handle obj) {
        self.jObj = obj;
    }

    # The function to retrieve the string value of a Ballerina object mapping a Java class.
    #
    # + return - The `string` form of the object instance.
    function toString() returns string {
        return java:jObjToString(self.jObj);
    }
}


