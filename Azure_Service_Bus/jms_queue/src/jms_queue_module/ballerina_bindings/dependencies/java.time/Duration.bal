// This is an empty Ballerina object autogenerated to represent the `java.time.Duration` Java class.
//
// If you need the implementation of this class generated, please use the following command.
//
// $ ballerina bindgen [(-cp|--classpath) <classpath>...] [(-o|--output) <output>] (<class-name>...)
//
// E.g. $ ballerina bindgen java.time.Duration


import ballerina/java;

# Ballerina object mapping for Java class `java.time.Duration`.
#
# + _Duration - The field that represents this Ballerina object, which is used for Java subtyping.
# + _Comparable - The field that represents the superclass object `Comparable`.
# + _Serializable - The field that represents the superclass object `Serializable`.
# + _TemporalAmount - The field that represents the superclass object `TemporalAmount`.
# + _Object - The field that represents the superclass object `Object`.
@java:Binding {
    'class: "java.time.Duration"
}
class Duration {

    *java:JObject;

    DurationT _Duration = DurationT;
    ComparableT _Comparable = ComparableT;
    SerializableT _Serializable = SerializableT;
    TemporalAmountT _TemporalAmount = TemporalAmountT;
    ObjectT _Object = ObjectT;

    # The init function of the Ballerina object mapping `java.time.Duration` Java class.
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

