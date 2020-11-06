// This is an empty Ballerina object autogenerated to represent the `org.apache.qpid.proton.amqp.Symbol` Java class.
//
// If you need the implementation of this class generated, please use the following command.
//
// $ ballerina bindgen [(-cp|--classpath) <classpath>...] [(-o|--output) <output>] (<class-name>...)
//
// E.g. $ ballerina bindgen org.apache.qpid.proton.amqp.Symbol


import ballerina/java;

# Ballerina object mapping for Java class `org.apache.qpid.proton.amqp.Symbol`.
#
# + _Symbol - The field that represents this Ballerina object, which is used for Java subtyping.
# + _Comparable - The field that represents the superclass object `Comparable`.
# + _CharSequence - The field that represents the superclass object `CharSequence`.
# + _Object - The field that represents the superclass object `Object`.
@java:Binding {
    'class: "org.apache.qpid.proton.amqp.Symbol"
}
class Symbol {

    *java:JObject;

    SymbolT _Symbol = SymbolT;
    ComparableT _Comparable = ComparableT;
    CharSequenceT _CharSequence = CharSequenceT;
    ObjectT _Object = ObjectT;

    # The init function of the Ballerina object mapping `org.apache.qpid.proton.amqp.Symbol` Java class.
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

