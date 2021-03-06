// This is an empty Ballerina object autogenerated to represent the `org.apache.qpid.proton.engine.Receiver` Java class.
//
// If you need the implementation of this class generated, please use the following command.
//
// $ ballerina bindgen [(-cp|--classpath) <classpath>...] [(-o|--output) <output>] (<class-name>...)
//
// E.g. $ ballerina bindgen org.apache.qpid.proton.engine.Receiver


import ballerina/java;

# Ballerina object mapping for Java interface `org.apache.qpid.proton.engine.Receiver`.
#
# + _Receiver - The field that represents this Ballerina object, which is used for Java subtyping.
# + _Endpoint - The field that represents the superclass object `Endpoint`.
# + _Extendable - The field that represents the superclass object `Extendable`.
# + _Object - The field that represents the superclass object `Object`.
# + _Link - The field that represents the superclass object `Link`.
@java:Binding {
    'class: "org.apache.qpid.proton.engine.Receiver"
}
class Receiver {

    *java:JObject;

    ReceiverT _Receiver = ReceiverT;
    EndpointT _Endpoint = EndpointT;
    ExtendableT _Extendable = ExtendableT;
    ObjectT _Object = ObjectT;
    LinkT _Link = LinkT;

    # The init function of the Ballerina object mapping `org.apache.qpid.proton.engine.Receiver` Java class.
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


