// This is an empty Ballerina object autogenerated to represent the `java.util.ResourceBundle` Java class.
//
// If you need the implementation of this class generated, please use the following command.
//
// $ ballerina bindgen [(-cp|--classpath) <classpath>...] [(-o|--output) <output>] (<class-name>...)
//
// E.g. $ ballerina bindgen java.util.ResourceBundle


import ballerina/java;

# Ballerina object mapping for Java abstract class `java.util.ResourceBundle`.
#
# + _ResourceBundle - The field that represents this Ballerina object, which is used for Java subtyping.
# + _Object - The field that represents the superclass object `Object`.
@java:Binding {
    'class: "java.util.ResourceBundle"
}
class ResourceBundle {

    *java:JObject;

    ResourceBundleT _ResourceBundle = ResourceBundleT;
    ObjectT _Object = ObjectT;

    # The init function of the Ballerina object mapping `java.util.ResourceBundle` Java class.
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


