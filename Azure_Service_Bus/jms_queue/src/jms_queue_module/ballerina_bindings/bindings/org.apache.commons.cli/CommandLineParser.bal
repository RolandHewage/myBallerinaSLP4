
import ballerina/java;
import ballerina/java.arrays as jarrays;

# Ballerina object mapping for Java interface `org.apache.commons.cli.CommandLineParser`.
#
# + _CommandLineParser - The field that represents this Ballerina object, which is used for Java subtyping.
# + _Object - The field that represents the superclass object `Object`.
@java:Binding {
    'class: "org.apache.commons.cli.CommandLineParser"
}
class CommandLineParser {

    *java:JObject;

    CommandLineParserT _CommandLineParser = CommandLineParserT;
    ObjectT _Object = ObjectT;

    # The init function of the Ballerina object mapping `org.apache.commons.cli.CommandLineParser` Java class.
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

    # The function that maps to the `parse` method of `org.apache.commons.cli.CommandLineParser`.
    #
    # + arg0 - The `Options` value required to map with the Java method parameter.
    # + arg1 - The `string[]` value required to map with the Java method parameter.
    # + return - The `CommandLine|ParseException|error` value returning from the Java mapping.
    function parse(Options arg0, string[] arg1) returns CommandLine|ParseException|error {
        handle|error externalObj = org_apache_commons_cli_CommandLineParser_parse(self.jObj, arg0.jObj, check jarrays:toHandle(arg1, "java.lang.String"));
        if (externalObj is error) {
            ParseException e = ParseException(PARSEEXCEPTION, message = externalObj.message(), cause = externalObj);
            return e;
        } else { 
        CommandLine obj = new(externalObj);
        return obj;
        }
    }

    # The function that maps to the `parse` method of `org.apache.commons.cli.CommandLineParser`.
    #
    # + arg0 - The `Options` value required to map with the Java method parameter.
    # + arg1 - The `string[]` value required to map with the Java method parameter.
    # + arg2 - The `boolean` value required to map with the Java method parameter.
    # + return - The `CommandLine|ParseException|error` value returning from the Java mapping.
    function parse2(Options arg0, string[] arg1, boolean arg2) returns CommandLine|ParseException|error {
        handle|error externalObj = org_apache_commons_cli_CommandLineParser_parse2(self.jObj, arg0.jObj, check jarrays:toHandle(arg1, "java.lang.String"), arg2);
        if (externalObj is error) {
            ParseException e = ParseException(PARSEEXCEPTION, message = externalObj.message(), cause = externalObj);
            return e;
        } else { 
        CommandLine obj = new(externalObj);
        return obj;
        }
    }
}

// External interop functions for mapping public methods.

function org_apache_commons_cli_CommandLineParser_parse(handle receiver, handle arg0, handle arg1) returns handle|error = @java:Method {
    name: "parse",
    'class: "org.apache.commons.cli.CommandLineParser",
    paramTypes: ["org.apache.commons.cli.Options", "[Ljava.lang.String;"]
} external;

function org_apache_commons_cli_CommandLineParser_parse2(handle receiver, handle arg0, handle arg1, boolean arg2) returns handle|error = @java:Method {
    name: "parse",
    'class: "org.apache.commons.cli.CommandLineParser",
    paramTypes: ["org.apache.commons.cli.Options", "[Ljava.lang.String;", "boolean"]
} external;


