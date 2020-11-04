// This is an empty Ballerina object autogenerated to represent the `org.apache.commons.cli.Option` Java class.
//
// If you need the implementation of this class generated, please use the following command.
//
// $ ballerina bindgen [(-cp|--classpath) <classpath>...] [(-o|--output) <output>] (<class-name>...)
//
// E.g. $ ballerina bindgen org.apache.commons.cli.Option


import ballerina/java;

# Ballerina object mapping for Java class `org.apache.commons.cli.Option`.
#
# + _Option - The field that represents this Ballerina object, which is used for Java subtyping.
# + _Serializable - The field that represents the superclass object `Serializable`.
# + _Cloneable - The field that represents the superclass object `Cloneable`.
# + _Object - The field that represents the superclass object `Object`.
@java:Binding {
    'class: "org.apache.commons.cli.Option"
}
class Option {

    *java:JObject;

    OptionT _Option = OptionT;
    SerializableT _Serializable = SerializableT;
    CloneableT _Cloneable = CloneableT;
    ObjectT _Object = ObjectT;

    # The init function of the Ballerina object mapping `org.apache.commons.cli.Option` Java class.
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


