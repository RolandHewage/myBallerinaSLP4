
import ballerina/java;

# Ballerina object mapping for Java interface `java.util.function.Function`.
#
# + _Function - The field that represents this Ballerina object, which is used for Java subtyping.
# + _Object - The field that represents the superclass object `Object`.
@java:Binding {
    'class: "java.util.function.Function"
}
class Function {

    *java:JObject;

    FunctionT _Function = FunctionT;
    ObjectT _Object = ObjectT;

    # The init function of the Ballerina object mapping `java.util.function.Function` Java class.
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

    # The function that maps to the `andThen` method of `java.util.function.Function`.
    #
    # + arg0 - The `Function` value required to map with the Java method parameter.
    # + return - The `Function` value returning from the Java mapping.
    function andThen(Function arg0) returns Function {
        handle externalObj = java_util_function_Function_andThen(self.jObj, arg0.jObj);
        Function obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `apply` method of `java.util.function.Function`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + return - The `Object` value returning from the Java mapping.
    function apply(Object arg0) returns Object {
        handle externalObj = java_util_function_Function_apply(self.jObj, arg0.jObj);
        Object obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `compose` method of `java.util.function.Function`.
    #
    # + arg0 - The `Function` value required to map with the Java method parameter.
    # + return - The `Function` value returning from the Java mapping.
    function compose(Function arg0) returns Function {
        handle externalObj = java_util_function_Function_compose(self.jObj, arg0.jObj);
        Function obj = new(externalObj);
        return obj;
    }
}

# The function that maps to the `identity` method of `java.util.function.Function`.
# 
# + return - The `Function` value returning from the Java mapping.
function Function_identity() returns Function {
    handle externalObj = java_util_function_Function_identity();
    Function obj = new(externalObj);
    return obj;
}

// External interop functions for mapping public methods.

function java_util_function_Function_andThen(handle receiver, handle arg0) returns handle = @java:Method {
    name: "andThen",
    'class: "java.util.function.Function",
    paramTypes: ["java.util.function.Function"]
} external;

function java_util_function_Function_apply(handle receiver, handle arg0) returns handle = @java:Method {
    name: "apply",
    'class: "java.util.function.Function",
    paramTypes: ["java.lang.Object"]
} external;

function java_util_function_Function_compose(handle receiver, handle arg0) returns handle = @java:Method {
    name: "compose",
    'class: "java.util.function.Function",
    paramTypes: ["java.util.function.Function"]
} external;

function java_util_function_Function_identity() returns handle = @java:Method {
    name: "identity",
    'class: "java.util.function.Function",
    paramTypes: []
} external;


