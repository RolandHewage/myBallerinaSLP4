
import ballerina/java;
import ballerina/java.arrays as jarrays;

# Ballerina object mapping for Java class `org.apache.commons.cli.CommandLine`.
#
# + _CommandLine - The field that represents this Ballerina object, which is used for Java subtyping.
# + _Serializable - The field that represents the superclass object `Serializable`.
# + _Object - The field that represents the superclass object `Object`.
@java:Binding {
    'class: "org.apache.commons.cli.CommandLine"
}
class CommandLine {

    *java:JObject;

    CommandLineT _CommandLine = CommandLineT;
    SerializableT _Serializable = SerializableT;
    ObjectT _Object = ObjectT;

    # The init function of the Ballerina object mapping `org.apache.commons.cli.CommandLine` Java class.
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

    # The function that maps to the `equals` method of `org.apache.commons.cli.CommandLine`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + return - The `boolean` value returning from the Java mapping.
    function 'equals(Object arg0) returns boolean {
        boolean externalObj = org_apache_commons_cli_CommandLine_equals(self.jObj, arg0.jObj);
        return externalObj;
    }

    # The function that maps to the `getArgList` method of `org.apache.commons.cli.CommandLine`.
    # 
    # + return - The `List` value returning from the Java mapping.
    function getArgList() returns List {
        handle externalObj = org_apache_commons_cli_CommandLine_getArgList(self.jObj);
        List obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `getArgs` method of `org.apache.commons.cli.CommandLine`.
    # 
    # + return - The `string[]|error` value returning from the Java mapping.
    function getArgs() returns string[]|error {
        handle externalObj = org_apache_commons_cli_CommandLine_getArgs(self.jObj);
        return <string[]>check jarrays:fromHandle(externalObj, "string");
    }

    # The function that maps to the `getClass` method of `org.apache.commons.cli.CommandLine`.
    # 
    # + return - The `Class` value returning from the Java mapping.
    function getClass() returns Class {
        handle externalObj = org_apache_commons_cli_CommandLine_getClass(self.jObj);
        Class obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `getOptionObject` method of `org.apache.commons.cli.CommandLine`.
    #
    # + arg0 - The `int` value required to map with the Java method parameter.
    # + return - The `Object` value returning from the Java mapping.
    function getOptionObject(int arg0) returns Object {
        handle externalObj = org_apache_commons_cli_CommandLine_getOptionObject(self.jObj, arg0);
        Object obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `getOptionObject` method of `org.apache.commons.cli.CommandLine`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `Object` value returning from the Java mapping.
    function getOptionObject2(string arg0) returns Object {
        handle externalObj = org_apache_commons_cli_CommandLine_getOptionObject2(self.jObj, java:fromString(arg0));
        Object obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `getOptionProperties` method of `org.apache.commons.cli.CommandLine`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `Properties` value returning from the Java mapping.
    function getOptionProperties(string arg0) returns Properties {
        handle externalObj = org_apache_commons_cli_CommandLine_getOptionProperties(self.jObj, java:fromString(arg0));
        Properties obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `getOptionValue` method of `org.apache.commons.cli.CommandLine`.
    #
    # + arg0 - The `int` value required to map with the Java method parameter.
    # + return - The `string?` value returning from the Java mapping.
    function getOptionValue(int arg0) returns string? {
        handle externalObj = org_apache_commons_cli_CommandLine_getOptionValue(self.jObj, arg0);
        return java:toString(externalObj);
    }

    # The function that maps to the `getOptionValue` method of `org.apache.commons.cli.CommandLine`.
    #
    # + arg0 - The `int` value required to map with the Java method parameter.
    # + arg1 - The `string` value required to map with the Java method parameter.
    # + return - The `string?` value returning from the Java mapping.
    function getOptionValue2(int arg0, string arg1) returns string? {
        handle externalObj = org_apache_commons_cli_CommandLine_getOptionValue2(self.jObj, arg0, java:fromString(arg1));
        return java:toString(externalObj);
    }

    # The function that maps to the `getOptionValue` method of `org.apache.commons.cli.CommandLine`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `string?` value returning from the Java mapping.
    function getOptionValue3(string arg0) returns string? {
        handle externalObj = org_apache_commons_cli_CommandLine_getOptionValue3(self.jObj, java:fromString(arg0));
        return java:toString(externalObj);
    }

    # The function that maps to the `getOptionValue` method of `org.apache.commons.cli.CommandLine`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + arg1 - The `string` value required to map with the Java method parameter.
    # + return - The `string?` value returning from the Java mapping.
    function getOptionValue4(string arg0, string arg1) returns string? {
        handle externalObj = org_apache_commons_cli_CommandLine_getOptionValue4(self.jObj, java:fromString(arg0), java:fromString(arg1));
        return java:toString(externalObj);
    }

    # The function that maps to the `getOptionValues` method of `org.apache.commons.cli.CommandLine`.
    #
    # + arg0 - The `int` value required to map with the Java method parameter.
    # + return - The `string[]|error` value returning from the Java mapping.
    function getOptionValues(int arg0) returns string[]|error {
        handle externalObj = org_apache_commons_cli_CommandLine_getOptionValues(self.jObj, arg0);
        return <string[]>check jarrays:fromHandle(externalObj, "string");
    }

    # The function that maps to the `getOptionValues` method of `org.apache.commons.cli.CommandLine`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `string[]|error` value returning from the Java mapping.
    function getOptionValues2(string arg0) returns string[]|error {
        handle externalObj = org_apache_commons_cli_CommandLine_getOptionValues2(self.jObj, java:fromString(arg0));
        return <string[]>check jarrays:fromHandle(externalObj, "string");
    }

    # The function that maps to the `getOptions` method of `org.apache.commons.cli.CommandLine`.
    # 
    # + return - The `Option[]|error` value returning from the Java mapping.
    function getOptions() returns Option[]|error {
        handle externalObj = org_apache_commons_cli_CommandLine_getOptions(self.jObj);
        Option[] obj = [];
        handle[] anyObj = <handle[]>check jarrays:fromHandle(externalObj, "handle");
        int count = anyObj.length();
        foreach int i in 0 ... count-1 {
            Option element = new(anyObj[i]);
            obj[i] = element;
        }
        return obj;
    }

    # The function that maps to the `getParsedOptionValue` method of `org.apache.commons.cli.CommandLine`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `Object|ParseException` value returning from the Java mapping.
    function getParsedOptionValue(string arg0) returns Object|ParseException {
        handle|error externalObj = org_apache_commons_cli_CommandLine_getParsedOptionValue(self.jObj, java:fromString(arg0));
        if (externalObj is error) {
            ParseException e = ParseException(PARSEEXCEPTION, message = externalObj.message(), cause = externalObj);
            return e;
        } else { 
        Object obj = new(externalObj);
        return obj;
        }
    }

    # The function that maps to the `hasOption` method of `org.apache.commons.cli.CommandLine`.
    #
    # + arg0 - The `int` value required to map with the Java method parameter.
    # + return - The `boolean` value returning from the Java mapping.
    function hasOption(int arg0) returns boolean {
        boolean externalObj = org_apache_commons_cli_CommandLine_hasOption(self.jObj, arg0);
        return externalObj;
    }

    # The function that maps to the `hasOption` method of `org.apache.commons.cli.CommandLine`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `boolean` value returning from the Java mapping.
    function hasOption2(string arg0) returns boolean {
        boolean externalObj = org_apache_commons_cli_CommandLine_hasOption2(self.jObj, java:fromString(arg0));
        return externalObj;
    }

    # The function that maps to the `hashCode` method of `org.apache.commons.cli.CommandLine`.
    # 
    # + return - The `int` value returning from the Java mapping.
    function hashCode() returns int {
        int externalObj = org_apache_commons_cli_CommandLine_hashCode(self.jObj);
        return externalObj;
    }

    # The function that maps to the `iterator` method of `org.apache.commons.cli.CommandLine`.
    # 
    # + return - The `Iterator` value returning from the Java mapping.
    function iterator() returns Iterator {
        handle externalObj = org_apache_commons_cli_CommandLine_iterator(self.jObj);
        Iterator obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `notify` method of `org.apache.commons.cli.CommandLine`.
    function notify() {
        () obj = org_apache_commons_cli_CommandLine_notify(self.jObj);
    }

    # The function that maps to the `notifyAll` method of `org.apache.commons.cli.CommandLine`.
    function notifyAll() {
        () obj = org_apache_commons_cli_CommandLine_notifyAll(self.jObj);
    }

    # The function that maps to the `wait` method of `org.apache.commons.cli.CommandLine`.
    # 
    # + return - The `error?` value returning from the Java mapping.
    function 'wait() returns error? {
        error|() obj = org_apache_commons_cli_CommandLine_wait(self.jObj);
        if (obj is error) {
            InterruptedException e = InterruptedException(INTERRUPTEDEXCEPTION, message = obj.message(), cause = obj);
            return e;
        }
    }

    # The function that maps to the `wait` method of `org.apache.commons.cli.CommandLine`.
    #
    # + arg0 - The `int` value required to map with the Java method parameter.
    # + return - The `error?` value returning from the Java mapping.
    function 'wait2(int arg0) returns error? {
        error|() obj = org_apache_commons_cli_CommandLine_wait2(self.jObj, arg0);
        if (obj is error) {
            InterruptedException e = InterruptedException(INTERRUPTEDEXCEPTION, message = obj.message(), cause = obj);
            return e;
        }
    }

    # The function that maps to the `wait` method of `org.apache.commons.cli.CommandLine`.
    #
    # + arg0 - The `int` value required to map with the Java method parameter.
    # + arg1 - The `int` value required to map with the Java method parameter.
    # + return - The `error?` value returning from the Java mapping.
    function 'wait3(int arg0, int arg1) returns error? {
        error|() obj = org_apache_commons_cli_CommandLine_wait3(self.jObj, arg0, arg1);
        if (obj is error) {
            InterruptedException e = InterruptedException(INTERRUPTEDEXCEPTION, message = obj.message(), cause = obj);
            return e;
        }
    }
}

// External interop functions for mapping public methods.

function org_apache_commons_cli_CommandLine_equals(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "equals",
    'class: "org.apache.commons.cli.CommandLine",
    paramTypes: ["java.lang.Object"]
} external;

function org_apache_commons_cli_CommandLine_getArgList(handle receiver) returns handle = @java:Method {
    name: "getArgList",
    'class: "org.apache.commons.cli.CommandLine",
    paramTypes: []
} external;

function org_apache_commons_cli_CommandLine_getArgs(handle receiver) returns handle = @java:Method {
    name: "getArgs",
    'class: "org.apache.commons.cli.CommandLine",
    paramTypes: []
} external;

function org_apache_commons_cli_CommandLine_getClass(handle receiver) returns handle = @java:Method {
    name: "getClass",
    'class: "org.apache.commons.cli.CommandLine",
    paramTypes: []
} external;

function org_apache_commons_cli_CommandLine_getOptionObject(handle receiver, int arg0) returns handle = @java:Method {
    name: "getOptionObject",
    'class: "org.apache.commons.cli.CommandLine",
    paramTypes: ["char"]
} external;

function org_apache_commons_cli_CommandLine_getOptionObject2(handle receiver, handle arg0) returns handle = @java:Method {
    name: "getOptionObject",
    'class: "org.apache.commons.cli.CommandLine",
    paramTypes: ["java.lang.String"]
} external;

function org_apache_commons_cli_CommandLine_getOptionProperties(handle receiver, handle arg0) returns handle = @java:Method {
    name: "getOptionProperties",
    'class: "org.apache.commons.cli.CommandLine",
    paramTypes: ["java.lang.String"]
} external;

function org_apache_commons_cli_CommandLine_getOptionValue(handle receiver, int arg0) returns handle = @java:Method {
    name: "getOptionValue",
    'class: "org.apache.commons.cli.CommandLine",
    paramTypes: ["char"]
} external;

function org_apache_commons_cli_CommandLine_getOptionValue2(handle receiver, int arg0, handle arg1) returns handle = @java:Method {
    name: "getOptionValue",
    'class: "org.apache.commons.cli.CommandLine",
    paramTypes: ["char", "java.lang.String"]
} external;

function org_apache_commons_cli_CommandLine_getOptionValue3(handle receiver, handle arg0) returns handle = @java:Method {
    name: "getOptionValue",
    'class: "org.apache.commons.cli.CommandLine",
    paramTypes: ["java.lang.String"]
} external;

function org_apache_commons_cli_CommandLine_getOptionValue4(handle receiver, handle arg0, handle arg1) returns handle = @java:Method {
    name: "getOptionValue",
    'class: "org.apache.commons.cli.CommandLine",
    paramTypes: ["java.lang.String", "java.lang.String"]
} external;

function org_apache_commons_cli_CommandLine_getOptionValues(handle receiver, int arg0) returns handle = @java:Method {
    name: "getOptionValues",
    'class: "org.apache.commons.cli.CommandLine",
    paramTypes: ["char"]
} external;

function org_apache_commons_cli_CommandLine_getOptionValues2(handle receiver, handle arg0) returns handle = @java:Method {
    name: "getOptionValues",
    'class: "org.apache.commons.cli.CommandLine",
    paramTypes: ["java.lang.String"]
} external;

function org_apache_commons_cli_CommandLine_getOptions(handle receiver) returns handle = @java:Method {
    name: "getOptions",
    'class: "org.apache.commons.cli.CommandLine",
    paramTypes: []
} external;

function org_apache_commons_cli_CommandLine_getParsedOptionValue(handle receiver, handle arg0) returns handle|error = @java:Method {
    name: "getParsedOptionValue",
    'class: "org.apache.commons.cli.CommandLine",
    paramTypes: ["java.lang.String"]
} external;

function org_apache_commons_cli_CommandLine_hasOption(handle receiver, int arg0) returns boolean = @java:Method {
    name: "hasOption",
    'class: "org.apache.commons.cli.CommandLine",
    paramTypes: ["char"]
} external;

function org_apache_commons_cli_CommandLine_hasOption2(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "hasOption",
    'class: "org.apache.commons.cli.CommandLine",
    paramTypes: ["java.lang.String"]
} external;

function org_apache_commons_cli_CommandLine_hashCode(handle receiver) returns int = @java:Method {
    name: "hashCode",
    'class: "org.apache.commons.cli.CommandLine",
    paramTypes: []
} external;

function org_apache_commons_cli_CommandLine_iterator(handle receiver) returns handle = @java:Method {
    name: "iterator",
    'class: "org.apache.commons.cli.CommandLine",
    paramTypes: []
} external;

function org_apache_commons_cli_CommandLine_notify(handle receiver) = @java:Method {
    name: "notify",
    'class: "org.apache.commons.cli.CommandLine",
    paramTypes: []
} external;

function org_apache_commons_cli_CommandLine_notifyAll(handle receiver) = @java:Method {
    name: "notifyAll",
    'class: "org.apache.commons.cli.CommandLine",
    paramTypes: []
} external;

function org_apache_commons_cli_CommandLine_wait(handle receiver) returns error? = @java:Method {
    name: "wait",
    'class: "org.apache.commons.cli.CommandLine",
    paramTypes: []
} external;

function org_apache_commons_cli_CommandLine_wait2(handle receiver, int arg0) returns error? = @java:Method {
    name: "wait",
    'class: "org.apache.commons.cli.CommandLine",
    paramTypes: ["long"]
} external;

function org_apache_commons_cli_CommandLine_wait3(handle receiver, int arg0, int arg1) returns error? = @java:Method {
    name: "wait",
    'class: "org.apache.commons.cli.CommandLine",
    paramTypes: ["long", "int"]
} external;


