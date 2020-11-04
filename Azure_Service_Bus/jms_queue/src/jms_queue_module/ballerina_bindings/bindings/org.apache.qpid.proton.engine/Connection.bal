
import ballerina/java;
import ballerina/java.arrays as jarrays;

# Ballerina object mapping for Java interface `org.apache.qpid.proton.engine.Connection`.
#
# + _Connection - The field that represents this Ballerina object, which is used for Java subtyping.
# + _Endpoint - The field that represents the superclass object `Endpoint`.
# + _Extendable - The field that represents the superclass object `Extendable`.
# + _Object - The field that represents the superclass object `Object`.
# + _ReactorChild - The field that represents the superclass object `ReactorChild`.
@java:Binding {
    'class: "org.apache.qpid.proton.engine.Connection"
}
class Connection {

    *java:JObject;

    ConnectionT _Connection = ConnectionT;
    EndpointT _Endpoint = EndpointT;
    ExtendableT _Extendable = ExtendableT;
    ObjectT _Object = ObjectT;
    ReactorChildT _ReactorChild = ReactorChildT;

    # The init function of the Ballerina object mapping `org.apache.qpid.proton.engine.Connection` Java class.
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

    # The function that maps to the `attachments` method of `org.apache.qpid.proton.engine.Connection`.
    # 
    # + return - The `Record` value returning from the Java mapping.
    function attachments() returns Record {
        handle externalObj = org_apache_qpid_proton_engine_Connection_attachments(self.jObj);
        Record obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `close` method of `org.apache.qpid.proton.engine.Connection`.
    function close() {
        () obj = org_apache_qpid_proton_engine_Connection_close(self.jObj);
    }

    # The function that maps to the `collect` method of `org.apache.qpid.proton.engine.Connection`.
    #
    # + arg0 - The `Collector` value required to map with the Java method parameter.
    function collect(Collector arg0) {
        () obj = org_apache_qpid_proton_engine_Connection_collect(self.jObj, arg0.jObj);
    }

    # The function that maps to the `free` method of `org.apache.qpid.proton.engine.Connection`.
    function free() {
        () obj = org_apache_qpid_proton_engine_Connection_free(self.jObj);
    }

    # The function that maps to the `free` method of `org.apache.qpid.proton.engine.Connection`.
    function free2() {
        () obj = org_apache_qpid_proton_engine_Connection_free2(self.jObj);
    }

    # The function that maps to the `getCondition` method of `org.apache.qpid.proton.engine.Connection`.
    # 
    # + return - The `ErrorCondition` value returning from the Java mapping.
    function getCondition() returns ErrorCondition {
        handle externalObj = org_apache_qpid_proton_engine_Connection_getCondition(self.jObj);
        ErrorCondition obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `getContainer` method of `org.apache.qpid.proton.engine.Connection`.
    # 
    # + return - The `string?` value returning from the Java mapping.
    function getContainer() returns string? {
        handle externalObj = org_apache_qpid_proton_engine_Connection_getContainer(self.jObj);
        return java:toString(externalObj);
    }

    # The function that maps to the `getContext` method of `org.apache.qpid.proton.engine.Connection`.
    # 
    # + return - The `Object` value returning from the Java mapping.
    function getContext() returns Object {
        handle externalObj = org_apache_qpid_proton_engine_Connection_getContext(self.jObj);
        Object obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `getHostname` method of `org.apache.qpid.proton.engine.Connection`.
    # 
    # + return - The `string?` value returning from the Java mapping.
    function getHostname() returns string? {
        handle externalObj = org_apache_qpid_proton_engine_Connection_getHostname(self.jObj);
        return java:toString(externalObj);
    }

    # The function that maps to the `getLocalState` method of `org.apache.qpid.proton.engine.Connection`.
    # 
    # + return - The `EndpointState` value returning from the Java mapping.
    function getLocalState() returns EndpointState {
        handle externalObj = org_apache_qpid_proton_engine_Connection_getLocalState(self.jObj);
        EndpointState obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `getReactor` method of `org.apache.qpid.proton.engine.Connection`.
    # 
    # + return - The `Reactor` value returning from the Java mapping.
    function getReactor() returns Reactor {
        handle externalObj = org_apache_qpid_proton_engine_Connection_getReactor(self.jObj);
        Reactor obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `getRemoteCondition` method of `org.apache.qpid.proton.engine.Connection`.
    # 
    # + return - The `ErrorCondition` value returning from the Java mapping.
    function getRemoteCondition() returns ErrorCondition {
        handle externalObj = org_apache_qpid_proton_engine_Connection_getRemoteCondition(self.jObj);
        ErrorCondition obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `getRemoteContainer` method of `org.apache.qpid.proton.engine.Connection`.
    # 
    # + return - The `string?` value returning from the Java mapping.
    function getRemoteContainer() returns string? {
        handle externalObj = org_apache_qpid_proton_engine_Connection_getRemoteContainer(self.jObj);
        return java:toString(externalObj);
    }

    # The function that maps to the `getRemoteDesiredCapabilities` method of `org.apache.qpid.proton.engine.Connection`.
    # 
    # + return - The `Symbol[]|error` value returning from the Java mapping.
    function getRemoteDesiredCapabilities() returns Symbol[]|error {
        handle externalObj = org_apache_qpid_proton_engine_Connection_getRemoteDesiredCapabilities(self.jObj);
        Symbol[] obj = [];
        handle[] anyObj = <handle[]>check jarrays:fromHandle(externalObj, "handle");
        int count = anyObj.length();
        foreach int i in 0 ... count-1 {
            Symbol element = new(anyObj[i]);
            obj[i] = element;
        }
        return obj;
    }

    # The function that maps to the `getRemoteHostname` method of `org.apache.qpid.proton.engine.Connection`.
    # 
    # + return - The `string?` value returning from the Java mapping.
    function getRemoteHostname() returns string? {
        handle externalObj = org_apache_qpid_proton_engine_Connection_getRemoteHostname(self.jObj);
        return java:toString(externalObj);
    }

    # The function that maps to the `getRemoteOfferedCapabilities` method of `org.apache.qpid.proton.engine.Connection`.
    # 
    # + return - The `Symbol[]|error` value returning from the Java mapping.
    function getRemoteOfferedCapabilities() returns Symbol[]|error {
        handle externalObj = org_apache_qpid_proton_engine_Connection_getRemoteOfferedCapabilities(self.jObj);
        Symbol[] obj = [];
        handle[] anyObj = <handle[]>check jarrays:fromHandle(externalObj, "handle");
        int count = anyObj.length();
        foreach int i in 0 ... count-1 {
            Symbol element = new(anyObj[i]);
            obj[i] = element;
        }
        return obj;
    }

    # The function that maps to the `getRemoteProperties` method of `org.apache.qpid.proton.engine.Connection`.
    # 
    # + return - The `Map` value returning from the Java mapping.
    function getRemoteProperties() returns Map {
        handle externalObj = org_apache_qpid_proton_engine_Connection_getRemoteProperties(self.jObj);
        Map obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `getRemoteState` method of `org.apache.qpid.proton.engine.Connection`.
    # 
    # + return - The `EndpointState` value returning from the Java mapping.
    function getRemoteState() returns EndpointState {
        handle externalObj = org_apache_qpid_proton_engine_Connection_getRemoteState(self.jObj);
        EndpointState obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `getTransport` method of `org.apache.qpid.proton.engine.Connection`.
    # 
    # + return - The `Transport` value returning from the Java mapping.
    function getTransport() returns Transport {
        handle externalObj = org_apache_qpid_proton_engine_Connection_getTransport(self.jObj);
        Transport obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `getWorkHead` method of `org.apache.qpid.proton.engine.Connection`.
    # 
    # + return - The `Delivery` value returning from the Java mapping.
    function getWorkHead() returns Delivery {
        handle externalObj = org_apache_qpid_proton_engine_Connection_getWorkHead(self.jObj);
        Delivery obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `linkHead` method of `org.apache.qpid.proton.engine.Connection`.
    #
    # + arg0 - The `EnumSet` value required to map with the Java method parameter.
    # + arg1 - The `EnumSet` value required to map with the Java method parameter.
    # + return - The `Link` value returning from the Java mapping.
    function linkHead(EnumSet arg0, EnumSet arg1) returns Link {
        handle externalObj = org_apache_qpid_proton_engine_Connection_linkHead(self.jObj, arg0.jObj, arg1.jObj);
        Link obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `open` method of `org.apache.qpid.proton.engine.Connection`.
    function open() {
        () obj = org_apache_qpid_proton_engine_Connection_open(self.jObj);
    }

    # The function that maps to the `session` method of `org.apache.qpid.proton.engine.Connection`.
    # 
    # + return - The `Session` value returning from the Java mapping.
    function session() returns Session {
        handle externalObj = org_apache_qpid_proton_engine_Connection_session(self.jObj);
        Session obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `sessionHead` method of `org.apache.qpid.proton.engine.Connection`.
    #
    # + arg0 - The `EnumSet` value required to map with the Java method parameter.
    # + arg1 - The `EnumSet` value required to map with the Java method parameter.
    # + return - The `Session` value returning from the Java mapping.
    function sessionHead(EnumSet arg0, EnumSet arg1) returns Session {
        handle externalObj = org_apache_qpid_proton_engine_Connection_sessionHead(self.jObj, arg0.jObj, arg1.jObj);
        Session obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `setCondition` method of `org.apache.qpid.proton.engine.Connection`.
    #
    # + arg0 - The `ErrorCondition` value required to map with the Java method parameter.
    function setCondition(ErrorCondition arg0) {
        () obj = org_apache_qpid_proton_engine_Connection_setCondition(self.jObj, arg0.jObj);
    }

    # The function that maps to the `setContainer` method of `org.apache.qpid.proton.engine.Connection`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    function setContainer(string arg0) {
        () obj = org_apache_qpid_proton_engine_Connection_setContainer(self.jObj, java:fromString(arg0));
    }

    # The function that maps to the `setContext` method of `org.apache.qpid.proton.engine.Connection`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    function setContext(Object arg0) {
        () obj = org_apache_qpid_proton_engine_Connection_setContext(self.jObj, arg0.jObj);
    }

    # The function that maps to the `setDesiredCapabilities` method of `org.apache.qpid.proton.engine.Connection`.
    #
    # + arg0 - The `Symbol[]` value required to map with the Java method parameter.
    # + return - The `error?` value returning from the Java mapping.
    function setDesiredCapabilities(Symbol[] arg0) returns error? {
        error|() obj = org_apache_qpid_proton_engine_Connection_setDesiredCapabilities(self.jObj, check jarrays:toHandle(arg0, "org.apache.qpid.proton.amqp.Symbol"));
        if (obj is error) {
            return obj;
        }
    }

    # The function that maps to the `setHostname` method of `org.apache.qpid.proton.engine.Connection`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    function setHostname(string arg0) {
        () obj = org_apache_qpid_proton_engine_Connection_setHostname(self.jObj, java:fromString(arg0));
    }

    # The function that maps to the `setOfferedCapabilities` method of `org.apache.qpid.proton.engine.Connection`.
    #
    # + arg0 - The `Symbol[]` value required to map with the Java method parameter.
    # + return - The `error?` value returning from the Java mapping.
    function setOfferedCapabilities(Symbol[] arg0) returns error? {
        error|() obj = org_apache_qpid_proton_engine_Connection_setOfferedCapabilities(self.jObj, check jarrays:toHandle(arg0, "org.apache.qpid.proton.amqp.Symbol"));
        if (obj is error) {
            return obj;
        }
    }

    # The function that maps to the `setProperties` method of `org.apache.qpid.proton.engine.Connection`.
    #
    # + arg0 - The `Map` value required to map with the Java method parameter.
    function setProperties(Map arg0) {
        () obj = org_apache_qpid_proton_engine_Connection_setProperties(self.jObj, arg0.jObj);
    }
}

// External interop functions for mapping public methods.

function org_apache_qpid_proton_engine_Connection_attachments(handle receiver) returns handle = @java:Method {
    name: "attachments",
    'class: "org.apache.qpid.proton.engine.Connection",
    paramTypes: []
} external;

function org_apache_qpid_proton_engine_Connection_close(handle receiver) = @java:Method {
    name: "close",
    'class: "org.apache.qpid.proton.engine.Connection",
    paramTypes: []
} external;

function org_apache_qpid_proton_engine_Connection_collect(handle receiver, handle arg0) = @java:Method {
    name: "collect",
    'class: "org.apache.qpid.proton.engine.Connection",
    paramTypes: ["org.apache.qpid.proton.engine.Collector"]
} external;

function org_apache_qpid_proton_engine_Connection_free(handle receiver) = @java:Method {
    name: "free",
    'class: "org.apache.qpid.proton.engine.Connection",
    paramTypes: []
} external;

function org_apache_qpid_proton_engine_Connection_free2(handle receiver) = @java:Method {
    name: "free",
    'class: "org.apache.qpid.proton.engine.Connection",
    paramTypes: []
} external;

function org_apache_qpid_proton_engine_Connection_getCondition(handle receiver) returns handle = @java:Method {
    name: "getCondition",
    'class: "org.apache.qpid.proton.engine.Connection",
    paramTypes: []
} external;

function org_apache_qpid_proton_engine_Connection_getContainer(handle receiver) returns handle = @java:Method {
    name: "getContainer",
    'class: "org.apache.qpid.proton.engine.Connection",
    paramTypes: []
} external;

function org_apache_qpid_proton_engine_Connection_getContext(handle receiver) returns handle = @java:Method {
    name: "getContext",
    'class: "org.apache.qpid.proton.engine.Connection",
    paramTypes: []
} external;

function org_apache_qpid_proton_engine_Connection_getHostname(handle receiver) returns handle = @java:Method {
    name: "getHostname",
    'class: "org.apache.qpid.proton.engine.Connection",
    paramTypes: []
} external;

function org_apache_qpid_proton_engine_Connection_getLocalState(handle receiver) returns handle = @java:Method {
    name: "getLocalState",
    'class: "org.apache.qpid.proton.engine.Connection",
    paramTypes: []
} external;

function org_apache_qpid_proton_engine_Connection_getReactor(handle receiver) returns handle = @java:Method {
    name: "getReactor",
    'class: "org.apache.qpid.proton.engine.Connection",
    paramTypes: []
} external;

function org_apache_qpid_proton_engine_Connection_getRemoteCondition(handle receiver) returns handle = @java:Method {
    name: "getRemoteCondition",
    'class: "org.apache.qpid.proton.engine.Connection",
    paramTypes: []
} external;

function org_apache_qpid_proton_engine_Connection_getRemoteContainer(handle receiver) returns handle = @java:Method {
    name: "getRemoteContainer",
    'class: "org.apache.qpid.proton.engine.Connection",
    paramTypes: []
} external;

function org_apache_qpid_proton_engine_Connection_getRemoteDesiredCapabilities(handle receiver) returns handle = @java:Method {
    name: "getRemoteDesiredCapabilities",
    'class: "org.apache.qpid.proton.engine.Connection",
    paramTypes: []
} external;

function org_apache_qpid_proton_engine_Connection_getRemoteHostname(handle receiver) returns handle = @java:Method {
    name: "getRemoteHostname",
    'class: "org.apache.qpid.proton.engine.Connection",
    paramTypes: []
} external;

function org_apache_qpid_proton_engine_Connection_getRemoteOfferedCapabilities(handle receiver) returns handle = @java:Method {
    name: "getRemoteOfferedCapabilities",
    'class: "org.apache.qpid.proton.engine.Connection",
    paramTypes: []
} external;

function org_apache_qpid_proton_engine_Connection_getRemoteProperties(handle receiver) returns handle = @java:Method {
    name: "getRemoteProperties",
    'class: "org.apache.qpid.proton.engine.Connection",
    paramTypes: []
} external;

function org_apache_qpid_proton_engine_Connection_getRemoteState(handle receiver) returns handle = @java:Method {
    name: "getRemoteState",
    'class: "org.apache.qpid.proton.engine.Connection",
    paramTypes: []
} external;

function org_apache_qpid_proton_engine_Connection_getTransport(handle receiver) returns handle = @java:Method {
    name: "getTransport",
    'class: "org.apache.qpid.proton.engine.Connection",
    paramTypes: []
} external;

function org_apache_qpid_proton_engine_Connection_getWorkHead(handle receiver) returns handle = @java:Method {
    name: "getWorkHead",
    'class: "org.apache.qpid.proton.engine.Connection",
    paramTypes: []
} external;

function org_apache_qpid_proton_engine_Connection_linkHead(handle receiver, handle arg0, handle arg1) returns handle = @java:Method {
    name: "linkHead",
    'class: "org.apache.qpid.proton.engine.Connection",
    paramTypes: ["java.util.EnumSet", "java.util.EnumSet"]
} external;

function org_apache_qpid_proton_engine_Connection_open(handle receiver) = @java:Method {
    name: "open",
    'class: "org.apache.qpid.proton.engine.Connection",
    paramTypes: []
} external;

function org_apache_qpid_proton_engine_Connection_session(handle receiver) returns handle = @java:Method {
    name: "session",
    'class: "org.apache.qpid.proton.engine.Connection",
    paramTypes: []
} external;

function org_apache_qpid_proton_engine_Connection_sessionHead(handle receiver, handle arg0, handle arg1) returns handle = @java:Method {
    name: "sessionHead",
    'class: "org.apache.qpid.proton.engine.Connection",
    paramTypes: ["java.util.EnumSet", "java.util.EnumSet"]
} external;

function org_apache_qpid_proton_engine_Connection_setCondition(handle receiver, handle arg0) = @java:Method {
    name: "setCondition",
    'class: "org.apache.qpid.proton.engine.Connection",
    paramTypes: ["org.apache.qpid.proton.amqp.transport.ErrorCondition"]
} external;

function org_apache_qpid_proton_engine_Connection_setContainer(handle receiver, handle arg0) = @java:Method {
    name: "setContainer",
    'class: "org.apache.qpid.proton.engine.Connection",
    paramTypes: ["java.lang.String"]
} external;

function org_apache_qpid_proton_engine_Connection_setContext(handle receiver, handle arg0) = @java:Method {
    name: "setContext",
    'class: "org.apache.qpid.proton.engine.Connection",
    paramTypes: ["java.lang.Object"]
} external;

function org_apache_qpid_proton_engine_Connection_setDesiredCapabilities(handle receiver, handle arg0) = @java:Method {
    name: "setDesiredCapabilities",
    'class: "org.apache.qpid.proton.engine.Connection",
    paramTypes: ["[Lorg.apache.qpid.proton.amqp.Symbol;"]
} external;

function org_apache_qpid_proton_engine_Connection_setHostname(handle receiver, handle arg0) = @java:Method {
    name: "setHostname",
    'class: "org.apache.qpid.proton.engine.Connection",
    paramTypes: ["java.lang.String"]
} external;

function org_apache_qpid_proton_engine_Connection_setOfferedCapabilities(handle receiver, handle arg0) = @java:Method {
    name: "setOfferedCapabilities",
    'class: "org.apache.qpid.proton.engine.Connection",
    paramTypes: ["[Lorg.apache.qpid.proton.amqp.Symbol;"]
} external;

function org_apache_qpid_proton_engine_Connection_setProperties(handle receiver, handle arg0) = @java:Method {
    name: "setProperties",
    'class: "org.apache.qpid.proton.engine.Connection",
    paramTypes: ["java.util.Map"]
} external;


