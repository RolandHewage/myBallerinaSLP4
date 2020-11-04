
import ballerina/java;

# Ballerina object mapping for Java class `com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder`.
#
# + _ConnectionStringBuilder - The field that represents this Ballerina object, which is used for Java subtyping.
# + _Object - The field that represents the superclass object `Object`.
@java:Binding {
    'class: "com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder"
}
class ConnectionStringBuilder {

    *java:JObject;

    ConnectionStringBuilderT _ConnectionStringBuilder = ConnectionStringBuilderT;
    ObjectT _Object = ObjectT;

    # The init function of the Ballerina object mapping `com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder` Java class.
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

    # The function that maps to the `equals` method of `com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + return - The `boolean` value returning from the Java mapping.
    function 'equals(Object arg0) returns boolean {
        boolean externalObj = com_microsoft_azure_servicebus_primitives_ConnectionStringBuilder_equals(self.jObj, arg0.jObj);
        return externalObj;
    }

    # The function that maps to the `getClass` method of `com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder`.
    # 
    # + return - The `Class` value returning from the Java mapping.
    function getClass() returns Class {
        handle externalObj = com_microsoft_azure_servicebus_primitives_ConnectionStringBuilder_getClass(self.jObj);
        Class obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `getEndpoint` method of `com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder`.
    # 
    # + return - The `URI` value returning from the Java mapping.
    function getEndpoint() returns URI {
        handle externalObj = com_microsoft_azure_servicebus_primitives_ConnectionStringBuilder_getEndpoint(self.jObj);
        URI obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `getEntityPath` method of `com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder`.
    # 
    # + return - The `string?` value returning from the Java mapping.
    function getEntityPath() returns string? {
        handle externalObj = com_microsoft_azure_servicebus_primitives_ConnectionStringBuilder_getEntityPath(self.jObj);
        return java:toString(externalObj);
    }

    # The function that maps to the `getOperationTimeout` method of `com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder`.
    # 
    # + return - The `Duration` value returning from the Java mapping.
    function getOperationTimeout() returns Duration {
        handle externalObj = com_microsoft_azure_servicebus_primitives_ConnectionStringBuilder_getOperationTimeout(self.jObj);
        Duration obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `getRetryPolicy` method of `com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder`.
    # 
    # + return - The `RetryPolicy` value returning from the Java mapping.
    function getRetryPolicy() returns RetryPolicy {
        handle externalObj = com_microsoft_azure_servicebus_primitives_ConnectionStringBuilder_getRetryPolicy(self.jObj);
        RetryPolicy obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `getSasKey` method of `com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder`.
    # 
    # + return - The `string?` value returning from the Java mapping.
    function getSasKey() returns string? {
        handle externalObj = com_microsoft_azure_servicebus_primitives_ConnectionStringBuilder_getSasKey(self.jObj);
        return java:toString(externalObj);
    }

    # The function that maps to the `getSasKeyName` method of `com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder`.
    # 
    # + return - The `string?` value returning from the Java mapping.
    function getSasKeyName() returns string? {
        handle externalObj = com_microsoft_azure_servicebus_primitives_ConnectionStringBuilder_getSasKeyName(self.jObj);
        return java:toString(externalObj);
    }

    # The function that maps to the `getSharedAccessSignatureToken` method of `com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder`.
    # 
    # + return - The `string?` value returning from the Java mapping.
    function getSharedAccessSignatureToken() returns string? {
        handle externalObj = com_microsoft_azure_servicebus_primitives_ConnectionStringBuilder_getSharedAccessSignatureToken(self.jObj);
        return java:toString(externalObj);
    }

    # The function that maps to the `hashCode` method of `com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder`.
    # 
    # + return - The `int` value returning from the Java mapping.
    function hashCode() returns int {
        int externalObj = com_microsoft_azure_servicebus_primitives_ConnectionStringBuilder_hashCode(self.jObj);
        return externalObj;
    }

    # The function that maps to the `notify` method of `com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder`.
    function notify() {
        () obj = com_microsoft_azure_servicebus_primitives_ConnectionStringBuilder_notify(self.jObj);
    }

    # The function that maps to the `notifyAll` method of `com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder`.
    function notifyAll() {
        () obj = com_microsoft_azure_servicebus_primitives_ConnectionStringBuilder_notifyAll(self.jObj);
    }

    # The function that maps to the `setOperationTimeout` method of `com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder`.
    #
    # + arg0 - The `Duration` value required to map with the Java method parameter.
    function setOperationTimeout(Duration arg0) {
        () obj = com_microsoft_azure_servicebus_primitives_ConnectionStringBuilder_setOperationTimeout(self.jObj, arg0.jObj);
    }

    # The function that maps to the `setRetryPolicy` method of `com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder`.
    #
    # + arg0 - The `RetryPolicy` value required to map with the Java method parameter.
    function setRetryPolicy(RetryPolicy arg0) {
        () obj = com_microsoft_azure_servicebus_primitives_ConnectionStringBuilder_setRetryPolicy(self.jObj, arg0.jObj);
    }

    # The function that maps to the `toLoggableString` method of `com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder`.
    # 
    # + return - The `string?` value returning from the Java mapping.
    function toLoggableString() returns string? {
        handle externalObj = com_microsoft_azure_servicebus_primitives_ConnectionStringBuilder_toLoggableString(self.jObj);
        return java:toString(externalObj);
    }

    # The function that maps to the `wait` method of `com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder`.
    # 
    # + return - The `error?` value returning from the Java mapping.
    function 'wait() returns error? {
        error|() obj = com_microsoft_azure_servicebus_primitives_ConnectionStringBuilder_wait(self.jObj);
        if (obj is error) {
            InterruptedException e = InterruptedException(INTERRUPTEDEXCEPTION, message = obj.message(), cause = obj);
            return e;
        }
    }

    # The function that maps to the `wait` method of `com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder`.
    #
    # + arg0 - The `int` value required to map with the Java method parameter.
    # + return - The `error?` value returning from the Java mapping.
    function 'wait2(int arg0) returns error? {
        error|() obj = com_microsoft_azure_servicebus_primitives_ConnectionStringBuilder_wait2(self.jObj, arg0);
        if (obj is error) {
            InterruptedException e = InterruptedException(INTERRUPTEDEXCEPTION, message = obj.message(), cause = obj);
            return e;
        }
    }

    # The function that maps to the `wait` method of `com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder`.
    #
    # + arg0 - The `int` value required to map with the Java method parameter.
    # + arg1 - The `int` value required to map with the Java method parameter.
    # + return - The `error?` value returning from the Java mapping.
    function 'wait3(int arg0, int arg1) returns error? {
        error|() obj = com_microsoft_azure_servicebus_primitives_ConnectionStringBuilder_wait3(self.jObj, arg0, arg1);
        if (obj is error) {
            InterruptedException e = InterruptedException(INTERRUPTEDEXCEPTION, message = obj.message(), cause = obj);
            return e;
        }
    }
}

# Constructor function to generate an object of type `ConnectionStringBuilder` representing the `com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder` Java class.
#
# + arg0 - The `string` value required to map with the Java constructor parameter.
# + return - The new `ConnectionStringBuilder` object generated.
function newConnectionStringBuilder1(string arg0) returns ConnectionStringBuilder {
    handle obj = com_microsoft_azure_servicebus_primitives_ConnectionStringBuilder_newConnectionStringBuilder1(java:fromString(arg0));
    ConnectionStringBuilder _connectionStringBuilder = new(obj);
    return _connectionStringBuilder;
}

# Constructor function to generate an object of type `ConnectionStringBuilder` representing the `com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder` Java class.
#
# + arg0 - The `string` value required to map with the Java constructor parameter.
# + arg1 - The `string` value required to map with the Java constructor parameter.
# + return - The new `ConnectionStringBuilder` object generated.
function newConnectionStringBuilder2(string arg0, string arg1) returns ConnectionStringBuilder {
    handle obj = com_microsoft_azure_servicebus_primitives_ConnectionStringBuilder_newConnectionStringBuilder2(java:fromString(arg0), java:fromString(arg1));
    ConnectionStringBuilder _connectionStringBuilder = new(obj);
    return _connectionStringBuilder;
}

# Constructor function to generate an object of type `ConnectionStringBuilder` representing the `com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder` Java class.
#
# + arg0 - The `string` value required to map with the Java constructor parameter.
# + arg1 - The `string` value required to map with the Java constructor parameter.
# + arg2 - The `string` value required to map with the Java constructor parameter.
# + return - The new `ConnectionStringBuilder` object generated.
function newConnectionStringBuilder3(string arg0, string arg1, string arg2) returns ConnectionStringBuilder {
    handle obj = com_microsoft_azure_servicebus_primitives_ConnectionStringBuilder_newConnectionStringBuilder3(java:fromString(arg0), java:fromString(arg1), java:fromString(arg2));
    ConnectionStringBuilder _connectionStringBuilder = new(obj);
    return _connectionStringBuilder;
}

# Constructor function to generate an object of type `ConnectionStringBuilder` representing the `com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder` Java class.
#
# + arg0 - The `string` value required to map with the Java constructor parameter.
# + arg1 - The `string` value required to map with the Java constructor parameter.
# + arg2 - The `string` value required to map with the Java constructor parameter.
# + arg3 - The `string` value required to map with the Java constructor parameter.
# + return - The new `ConnectionStringBuilder` object generated.
function newConnectionStringBuilder4(string arg0, string arg1, string arg2, string arg3) returns ConnectionStringBuilder {
    handle obj = com_microsoft_azure_servicebus_primitives_ConnectionStringBuilder_newConnectionStringBuilder4(java:fromString(arg0), java:fromString(arg1), java:fromString(arg2), java:fromString(arg3));
    ConnectionStringBuilder _connectionStringBuilder = new(obj);
    return _connectionStringBuilder;
}

# Constructor function to generate an object of type `ConnectionStringBuilder` representing the `com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder` Java class.
#
# + arg0 - The `URI` value required to map with the Java constructor parameter.
# + arg1 - The `string` value required to map with the Java constructor parameter.
# + arg2 - The `string` value required to map with the Java constructor parameter.
# + return - The new `ConnectionStringBuilder` object generated.
function newConnectionStringBuilder5(URI arg0, string arg1, string arg2) returns ConnectionStringBuilder {
    handle obj = com_microsoft_azure_servicebus_primitives_ConnectionStringBuilder_newConnectionStringBuilder5(arg0.jObj, java:fromString(arg1), java:fromString(arg2));
    ConnectionStringBuilder _connectionStringBuilder = new(obj);
    return _connectionStringBuilder;
}

# Constructor function to generate an object of type `ConnectionStringBuilder` representing the `com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder` Java class.
#
# + arg0 - The `URI` value required to map with the Java constructor parameter.
# + arg1 - The `string` value required to map with the Java constructor parameter.
# + arg2 - The `string` value required to map with the Java constructor parameter.
# + arg3 - The `string` value required to map with the Java constructor parameter.
# + return - The new `ConnectionStringBuilder` object generated.
function newConnectionStringBuilder6(URI arg0, string arg1, string arg2, string arg3) returns ConnectionStringBuilder {
    handle obj = com_microsoft_azure_servicebus_primitives_ConnectionStringBuilder_newConnectionStringBuilder6(arg0.jObj, java:fromString(arg1), java:fromString(arg2), java:fromString(arg3));
    ConnectionStringBuilder _connectionStringBuilder = new(obj);
    return _connectionStringBuilder;
}

# The function that retrieves the value of the public field DefaultOperationTimeout.
#
# + return - The `Duration` value of the field.
function ConnectionStringBuilder_getDefaultOperationTimeout() returns Duration {
    
    Duration obj = new(com_microsoft_azure_servicebus_primitives_ConnectionStringBuilder_getDefaultOperationTimeout());
    return obj;
}

// External interop functions for mapping public constructors.

function com_microsoft_azure_servicebus_primitives_ConnectionStringBuilder_newConnectionStringBuilder1(handle arg0) returns handle = @java:Constructor {
    'class: "com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder",
    paramTypes: ["java.lang.String"]
} external;

function com_microsoft_azure_servicebus_primitives_ConnectionStringBuilder_newConnectionStringBuilder2(handle arg0, handle arg1) returns handle = @java:Constructor {
    'class: "com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder",
    paramTypes: ["java.lang.String", "java.lang.String"]
} external;

function com_microsoft_azure_servicebus_primitives_ConnectionStringBuilder_newConnectionStringBuilder3(handle arg0, handle arg1, handle arg2) returns handle = @java:Constructor {
    'class: "com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder",
    paramTypes: ["java.lang.String", "java.lang.String", "java.lang.String"]
} external;

function com_microsoft_azure_servicebus_primitives_ConnectionStringBuilder_newConnectionStringBuilder4(handle arg0, handle arg1, handle arg2, handle arg3) returns handle = @java:Constructor {
    'class: "com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder",
    paramTypes: ["java.lang.String", "java.lang.String", "java.lang.String", "java.lang.String"]
} external;

function com_microsoft_azure_servicebus_primitives_ConnectionStringBuilder_newConnectionStringBuilder5(handle arg0, handle arg1, handle arg2) returns handle = @java:Constructor {
    'class: "com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder",
    paramTypes: ["java.net.URI", "java.lang.String", "java.lang.String"]
} external;

function com_microsoft_azure_servicebus_primitives_ConnectionStringBuilder_newConnectionStringBuilder6(handle arg0, handle arg1, handle arg2, handle arg3) returns handle = @java:Constructor {
    'class: "com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder",
    paramTypes: ["java.net.URI", "java.lang.String", "java.lang.String", "java.lang.String"]
} external;

// External interop functions for mapping public methods.

function com_microsoft_azure_servicebus_primitives_ConnectionStringBuilder_equals(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "equals",
    'class: "com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder",
    paramTypes: ["java.lang.Object"]
} external;

function com_microsoft_azure_servicebus_primitives_ConnectionStringBuilder_getClass(handle receiver) returns handle = @java:Method {
    name: "getClass",
    'class: "com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder",
    paramTypes: []
} external;

function com_microsoft_azure_servicebus_primitives_ConnectionStringBuilder_getEndpoint(handle receiver) returns handle = @java:Method {
    name: "getEndpoint",
    'class: "com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder",
    paramTypes: []
} external;

function com_microsoft_azure_servicebus_primitives_ConnectionStringBuilder_getEntityPath(handle receiver) returns handle = @java:Method {
    name: "getEntityPath",
    'class: "com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder",
    paramTypes: []
} external;

function com_microsoft_azure_servicebus_primitives_ConnectionStringBuilder_getOperationTimeout(handle receiver) returns handle = @java:Method {
    name: "getOperationTimeout",
    'class: "com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder",
    paramTypes: []
} external;

function com_microsoft_azure_servicebus_primitives_ConnectionStringBuilder_getRetryPolicy(handle receiver) returns handle = @java:Method {
    name: "getRetryPolicy",
    'class: "com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder",
    paramTypes: []
} external;

function com_microsoft_azure_servicebus_primitives_ConnectionStringBuilder_getSasKey(handle receiver) returns handle = @java:Method {
    name: "getSasKey",
    'class: "com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder",
    paramTypes: []
} external;

function com_microsoft_azure_servicebus_primitives_ConnectionStringBuilder_getSasKeyName(handle receiver) returns handle = @java:Method {
    name: "getSasKeyName",
    'class: "com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder",
    paramTypes: []
} external;

function com_microsoft_azure_servicebus_primitives_ConnectionStringBuilder_getSharedAccessSignatureToken(handle receiver) returns handle = @java:Method {
    name: "getSharedAccessSignatureToken",
    'class: "com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder",
    paramTypes: []
} external;

function com_microsoft_azure_servicebus_primitives_ConnectionStringBuilder_hashCode(handle receiver) returns int = @java:Method {
    name: "hashCode",
    'class: "com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder",
    paramTypes: []
} external;

function com_microsoft_azure_servicebus_primitives_ConnectionStringBuilder_notify(handle receiver) = @java:Method {
    name: "notify",
    'class: "com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder",
    paramTypes: []
} external;

function com_microsoft_azure_servicebus_primitives_ConnectionStringBuilder_notifyAll(handle receiver) = @java:Method {
    name: "notifyAll",
    'class: "com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder",
    paramTypes: []
} external;

function com_microsoft_azure_servicebus_primitives_ConnectionStringBuilder_setOperationTimeout(handle receiver, handle arg0) = @java:Method {
    name: "setOperationTimeout",
    'class: "com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder",
    paramTypes: ["java.time.Duration"]
} external;

function com_microsoft_azure_servicebus_primitives_ConnectionStringBuilder_setRetryPolicy(handle receiver, handle arg0) = @java:Method {
    name: "setRetryPolicy",
    'class: "com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder",
    paramTypes: ["com.microsoft.azure.servicebus.primitives.RetryPolicy"]
} external;

function com_microsoft_azure_servicebus_primitives_ConnectionStringBuilder_toLoggableString(handle receiver) returns handle = @java:Method {
    name: "toLoggableString",
    'class: "com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder",
    paramTypes: []
} external;

function com_microsoft_azure_servicebus_primitives_ConnectionStringBuilder_wait(handle receiver) returns error? = @java:Method {
    name: "wait",
    'class: "com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder",
    paramTypes: []
} external;

function com_microsoft_azure_servicebus_primitives_ConnectionStringBuilder_wait2(handle receiver, int arg0) returns error? = @java:Method {
    name: "wait",
    'class: "com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder",
    paramTypes: ["long"]
} external;

function com_microsoft_azure_servicebus_primitives_ConnectionStringBuilder_wait3(handle receiver, int arg0, int arg1) returns error? = @java:Method {
    name: "wait",
    'class: "com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder",
    paramTypes: ["long", "int"]
} external;

// External interop functions for mapping public fields.

function com_microsoft_azure_servicebus_primitives_ConnectionStringBuilder_getDefaultOperationTimeout() returns handle = @java:FieldGet {
    name: "DefaultOperationTimeout",
    'class: "com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder"
} external;


