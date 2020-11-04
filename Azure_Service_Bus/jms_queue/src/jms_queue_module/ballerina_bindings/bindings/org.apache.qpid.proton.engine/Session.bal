
import ballerina/java;
import ballerina/java.arrays as jarrays;

# Ballerina object mapping for Java interface `org.apache.qpid.proton.engine.Session`.
#
# + _Session - The field that represents this Ballerina object, which is used for Java subtyping.
# + _Endpoint - The field that represents the superclass object `Endpoint`.
# + _Extendable - The field that represents the superclass object `Extendable`.
# + _Object - The field that represents the superclass object `Object`.
@java:Binding {
    'class: "org.apache.qpid.proton.engine.Session"
}
class Session {

    *java:JObject;

    SessionT _Session = SessionT;
    EndpointT _Endpoint = EndpointT;
    ExtendableT _Extendable = ExtendableT;
    ObjectT _Object = ObjectT;

    # The init function of the Ballerina object mapping `org.apache.qpid.proton.engine.Session` Java class.
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

    # The function that maps to the `attachments` method of `org.apache.qpid.proton.engine.Session`.
    # 
    # + return - The `Record` value returning from the Java mapping.
    function attachments() returns Record {
        handle externalObj = org_apache_qpid_proton_engine_Session_attachments(self.jObj);
        Record obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `close` method of `org.apache.qpid.proton.engine.Session`.
    function close() {
        () obj = org_apache_qpid_proton_engine_Session_close(self.jObj);
    }

    # The function that maps to the `free` method of `org.apache.qpid.proton.engine.Session`.
    function free() {
        () obj = org_apache_qpid_proton_engine_Session_free(self.jObj);
    }

    # The function that maps to the `getCondition` method of `org.apache.qpid.proton.engine.Session`.
    # 
    # + return - The `ErrorCondition` value returning from the Java mapping.
    function getCondition() returns ErrorCondition {
        handle externalObj = org_apache_qpid_proton_engine_Session_getCondition(self.jObj);
        ErrorCondition obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `getConnection` method of `org.apache.qpid.proton.engine.Session`.
    # 
    # + return - The `Connection` value returning from the Java mapping.
    function getConnection() returns Connection {
        handle externalObj = org_apache_qpid_proton_engine_Session_getConnection(self.jObj);
        Connection obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `getContext` method of `org.apache.qpid.proton.engine.Session`.
    # 
    # + return - The `Object` value returning from the Java mapping.
    function getContext() returns Object {
        handle externalObj = org_apache_qpid_proton_engine_Session_getContext(self.jObj);
        Object obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `getDesiredCapabilities` method of `org.apache.qpid.proton.engine.Session`.
    # 
    # + return - The `Symbol[]|error` value returning from the Java mapping.
    function getDesiredCapabilities() returns Symbol[]|error {
        handle externalObj = org_apache_qpid_proton_engine_Session_getDesiredCapabilities(self.jObj);
        Symbol[] obj = [];
        handle[] anyObj = <handle[]>check jarrays:fromHandle(externalObj, "handle");
        int count = anyObj.length();
        foreach int i in 0 ... count-1 {
            Symbol element = new(anyObj[i]);
            obj[i] = element;
        }
        return obj;
    }

    # The function that maps to the `getIncomingBytes` method of `org.apache.qpid.proton.engine.Session`.
    # 
    # + return - The `int` value returning from the Java mapping.
    function getIncomingBytes() returns int {
        int externalObj = org_apache_qpid_proton_engine_Session_getIncomingBytes(self.jObj);
        return externalObj;
    }

    # The function that maps to the `getIncomingCapacity` method of `org.apache.qpid.proton.engine.Session`.
    # 
    # + return - The `int` value returning from the Java mapping.
    function getIncomingCapacity() returns int {
        int externalObj = org_apache_qpid_proton_engine_Session_getIncomingCapacity(self.jObj);
        return externalObj;
    }

    # The function that maps to the `getLocalState` method of `org.apache.qpid.proton.engine.Session`.
    # 
    # + return - The `EndpointState` value returning from the Java mapping.
    function getLocalState() returns EndpointState {
        handle externalObj = org_apache_qpid_proton_engine_Session_getLocalState(self.jObj);
        EndpointState obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `getOfferedCapabilities` method of `org.apache.qpid.proton.engine.Session`.
    # 
    # + return - The `Symbol[]|error` value returning from the Java mapping.
    function getOfferedCapabilities() returns Symbol[]|error {
        handle externalObj = org_apache_qpid_proton_engine_Session_getOfferedCapabilities(self.jObj);
        Symbol[] obj = [];
        handle[] anyObj = <handle[]>check jarrays:fromHandle(externalObj, "handle");
        int count = anyObj.length();
        foreach int i in 0 ... count-1 {
            Symbol element = new(anyObj[i]);
            obj[i] = element;
        }
        return obj;
    }

    # The function that maps to the `getOutgoingBytes` method of `org.apache.qpid.proton.engine.Session`.
    # 
    # + return - The `int` value returning from the Java mapping.
    function getOutgoingBytes() returns int {
        int externalObj = org_apache_qpid_proton_engine_Session_getOutgoingBytes(self.jObj);
        return externalObj;
    }

    # The function that maps to the `getOutgoingWindow` method of `org.apache.qpid.proton.engine.Session`.
    # 
    # + return - The `int` value returning from the Java mapping.
    function getOutgoingWindow() returns int {
        int externalObj = org_apache_qpid_proton_engine_Session_getOutgoingWindow(self.jObj);
        return externalObj;
    }

    # The function that maps to the `getProperties` method of `org.apache.qpid.proton.engine.Session`.
    # 
    # + return - The `Map` value returning from the Java mapping.
    function getProperties() returns Map {
        handle externalObj = org_apache_qpid_proton_engine_Session_getProperties(self.jObj);
        Map obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `getRemoteCondition` method of `org.apache.qpid.proton.engine.Session`.
    # 
    # + return - The `ErrorCondition` value returning from the Java mapping.
    function getRemoteCondition() returns ErrorCondition {
        handle externalObj = org_apache_qpid_proton_engine_Session_getRemoteCondition(self.jObj);
        ErrorCondition obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `getRemoteDesiredCapabilities` method of `org.apache.qpid.proton.engine.Session`.
    # 
    # + return - The `Symbol[]|error` value returning from the Java mapping.
    function getRemoteDesiredCapabilities() returns Symbol[]|error {
        handle externalObj = org_apache_qpid_proton_engine_Session_getRemoteDesiredCapabilities(self.jObj);
        Symbol[] obj = [];
        handle[] anyObj = <handle[]>check jarrays:fromHandle(externalObj, "handle");
        int count = anyObj.length();
        foreach int i in 0 ... count-1 {
            Symbol element = new(anyObj[i]);
            obj[i] = element;
        }
        return obj;
    }

    # The function that maps to the `getRemoteOfferedCapabilities` method of `org.apache.qpid.proton.engine.Session`.
    # 
    # + return - The `Symbol[]|error` value returning from the Java mapping.
    function getRemoteOfferedCapabilities() returns Symbol[]|error {
        handle externalObj = org_apache_qpid_proton_engine_Session_getRemoteOfferedCapabilities(self.jObj);
        Symbol[] obj = [];
        handle[] anyObj = <handle[]>check jarrays:fromHandle(externalObj, "handle");
        int count = anyObj.length();
        foreach int i in 0 ... count-1 {
            Symbol element = new(anyObj[i]);
            obj[i] = element;
        }
        return obj;
    }

    # The function that maps to the `getRemoteProperties` method of `org.apache.qpid.proton.engine.Session`.
    # 
    # + return - The `Map` value returning from the Java mapping.
    function getRemoteProperties() returns Map {
        handle externalObj = org_apache_qpid_proton_engine_Session_getRemoteProperties(self.jObj);
        Map obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `getRemoteState` method of `org.apache.qpid.proton.engine.Session`.
    # 
    # + return - The `EndpointState` value returning from the Java mapping.
    function getRemoteState() returns EndpointState {
        handle externalObj = org_apache_qpid_proton_engine_Session_getRemoteState(self.jObj);
        EndpointState obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `next` method of `org.apache.qpid.proton.engine.Session`.
    #
    # + arg0 - The `EnumSet` value required to map with the Java method parameter.
    # + arg1 - The `EnumSet` value required to map with the Java method parameter.
    # + return - The `Session` value returning from the Java mapping.
    function next(EnumSet arg0, EnumSet arg1) returns Session {
        handle externalObj = org_apache_qpid_proton_engine_Session_next(self.jObj, arg0.jObj, arg1.jObj);
        Session obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `open` method of `org.apache.qpid.proton.engine.Session`.
    function open() {
        () obj = org_apache_qpid_proton_engine_Session_open(self.jObj);
    }

    # The function that maps to the `receiver` method of `org.apache.qpid.proton.engine.Session`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `Receiver` value returning from the Java mapping.
    function receiver(string arg0) returns Receiver {
        handle externalObj = org_apache_qpid_proton_engine_Session_receiver(self.jObj, java:fromString(arg0));
        Receiver obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `sender` method of `org.apache.qpid.proton.engine.Session`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `Sender` value returning from the Java mapping.
    function sender(string arg0) returns Sender {
        handle externalObj = org_apache_qpid_proton_engine_Session_sender(self.jObj, java:fromString(arg0));
        Sender obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `setCondition` method of `org.apache.qpid.proton.engine.Session`.
    #
    # + arg0 - The `ErrorCondition` value required to map with the Java method parameter.
    function setCondition(ErrorCondition arg0) {
        () obj = org_apache_qpid_proton_engine_Session_setCondition(self.jObj, arg0.jObj);
    }

    # The function that maps to the `setContext` method of `org.apache.qpid.proton.engine.Session`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    function setContext(Object arg0) {
        () obj = org_apache_qpid_proton_engine_Session_setContext(self.jObj, arg0.jObj);
    }

    # The function that maps to the `setDesiredCapabilities` method of `org.apache.qpid.proton.engine.Session`.
    #
    # + arg0 - The `Symbol[]` value required to map with the Java method parameter.
    # + return - The `error?` value returning from the Java mapping.
    function setDesiredCapabilities(Symbol[] arg0) returns error? {
        error|() obj = org_apache_qpid_proton_engine_Session_setDesiredCapabilities(self.jObj, check jarrays:toHandle(arg0, "org.apache.qpid.proton.amqp.Symbol"));
        if (obj is error) {
            return obj;
        }
    }

    # The function that maps to the `setIncomingCapacity` method of `org.apache.qpid.proton.engine.Session`.
    #
    # + arg0 - The `int` value required to map with the Java method parameter.
    function setIncomingCapacity(int arg0) {
        () obj = org_apache_qpid_proton_engine_Session_setIncomingCapacity(self.jObj, arg0);
    }

    # The function that maps to the `setOfferedCapabilities` method of `org.apache.qpid.proton.engine.Session`.
    #
    # + arg0 - The `Symbol[]` value required to map with the Java method parameter.
    # + return - The `error?` value returning from the Java mapping.
    function setOfferedCapabilities(Symbol[] arg0) returns error? {
        error|() obj = org_apache_qpid_proton_engine_Session_setOfferedCapabilities(self.jObj, check jarrays:toHandle(arg0, "org.apache.qpid.proton.amqp.Symbol"));
        if (obj is error) {
            return obj;
        }
    }

    # The function that maps to the `setOutgoingWindow` method of `org.apache.qpid.proton.engine.Session`.
    #
    # + arg0 - The `int` value required to map with the Java method parameter.
    function setOutgoingWindow(int arg0) {
        () obj = org_apache_qpid_proton_engine_Session_setOutgoingWindow(self.jObj, arg0);
    }

    # The function that maps to the `setProperties` method of `org.apache.qpid.proton.engine.Session`.
    #
    # + arg0 - The `Map` value required to map with the Java method parameter.
    function setProperties(Map arg0) {
        () obj = org_apache_qpid_proton_engine_Session_setProperties(self.jObj, arg0.jObj);
    }
}

// External interop functions for mapping public methods.

function org_apache_qpid_proton_engine_Session_attachments(handle receiver) returns handle = @java:Method {
    name: "attachments",
    'class: "org.apache.qpid.proton.engine.Session",
    paramTypes: []
} external;

function org_apache_qpid_proton_engine_Session_close(handle receiver) = @java:Method {
    name: "close",
    'class: "org.apache.qpid.proton.engine.Session",
    paramTypes: []
} external;

function org_apache_qpid_proton_engine_Session_free(handle receiver) = @java:Method {
    name: "free",
    'class: "org.apache.qpid.proton.engine.Session",
    paramTypes: []
} external;

function org_apache_qpid_proton_engine_Session_getCondition(handle receiver) returns handle = @java:Method {
    name: "getCondition",
    'class: "org.apache.qpid.proton.engine.Session",
    paramTypes: []
} external;

function org_apache_qpid_proton_engine_Session_getConnection(handle receiver) returns handle = @java:Method {
    name: "getConnection",
    'class: "org.apache.qpid.proton.engine.Session",
    paramTypes: []
} external;

function org_apache_qpid_proton_engine_Session_getContext(handle receiver) returns handle = @java:Method {
    name: "getContext",
    'class: "org.apache.qpid.proton.engine.Session",
    paramTypes: []
} external;

function org_apache_qpid_proton_engine_Session_getDesiredCapabilities(handle receiver) returns handle = @java:Method {
    name: "getDesiredCapabilities",
    'class: "org.apache.qpid.proton.engine.Session",
    paramTypes: []
} external;

function org_apache_qpid_proton_engine_Session_getIncomingBytes(handle receiver) returns int = @java:Method {
    name: "getIncomingBytes",
    'class: "org.apache.qpid.proton.engine.Session",
    paramTypes: []
} external;

function org_apache_qpid_proton_engine_Session_getIncomingCapacity(handle receiver) returns int = @java:Method {
    name: "getIncomingCapacity",
    'class: "org.apache.qpid.proton.engine.Session",
    paramTypes: []
} external;

function org_apache_qpid_proton_engine_Session_getLocalState(handle receiver) returns handle = @java:Method {
    name: "getLocalState",
    'class: "org.apache.qpid.proton.engine.Session",
    paramTypes: []
} external;

function org_apache_qpid_proton_engine_Session_getOfferedCapabilities(handle receiver) returns handle = @java:Method {
    name: "getOfferedCapabilities",
    'class: "org.apache.qpid.proton.engine.Session",
    paramTypes: []
} external;

function org_apache_qpid_proton_engine_Session_getOutgoingBytes(handle receiver) returns int = @java:Method {
    name: "getOutgoingBytes",
    'class: "org.apache.qpid.proton.engine.Session",
    paramTypes: []
} external;

function org_apache_qpid_proton_engine_Session_getOutgoingWindow(handle receiver) returns int = @java:Method {
    name: "getOutgoingWindow",
    'class: "org.apache.qpid.proton.engine.Session",
    paramTypes: []
} external;

function org_apache_qpid_proton_engine_Session_getProperties(handle receiver) returns handle = @java:Method {
    name: "getProperties",
    'class: "org.apache.qpid.proton.engine.Session",
    paramTypes: []
} external;

function org_apache_qpid_proton_engine_Session_getRemoteCondition(handle receiver) returns handle = @java:Method {
    name: "getRemoteCondition",
    'class: "org.apache.qpid.proton.engine.Session",
    paramTypes: []
} external;

function org_apache_qpid_proton_engine_Session_getRemoteDesiredCapabilities(handle receiver) returns handle = @java:Method {
    name: "getRemoteDesiredCapabilities",
    'class: "org.apache.qpid.proton.engine.Session",
    paramTypes: []
} external;

function org_apache_qpid_proton_engine_Session_getRemoteOfferedCapabilities(handle receiver) returns handle = @java:Method {
    name: "getRemoteOfferedCapabilities",
    'class: "org.apache.qpid.proton.engine.Session",
    paramTypes: []
} external;

function org_apache_qpid_proton_engine_Session_getRemoteProperties(handle receiver) returns handle = @java:Method {
    name: "getRemoteProperties",
    'class: "org.apache.qpid.proton.engine.Session",
    paramTypes: []
} external;

function org_apache_qpid_proton_engine_Session_getRemoteState(handle receiver) returns handle = @java:Method {
    name: "getRemoteState",
    'class: "org.apache.qpid.proton.engine.Session",
    paramTypes: []
} external;

function org_apache_qpid_proton_engine_Session_next(handle receiver, handle arg0, handle arg1) returns handle = @java:Method {
    name: "next",
    'class: "org.apache.qpid.proton.engine.Session",
    paramTypes: ["java.util.EnumSet", "java.util.EnumSet"]
} external;

function org_apache_qpid_proton_engine_Session_open(handle receiver) = @java:Method {
    name: "open",
    'class: "org.apache.qpid.proton.engine.Session",
    paramTypes: []
} external;

function org_apache_qpid_proton_engine_Session_receiver(handle receiver, handle arg0) returns handle = @java:Method {
    name: "receiver",
    'class: "org.apache.qpid.proton.engine.Session",
    paramTypes: ["java.lang.String"]
} external;

function org_apache_qpid_proton_engine_Session_sender(handle receiver, handle arg0) returns handle = @java:Method {
    name: "sender",
    'class: "org.apache.qpid.proton.engine.Session",
    paramTypes: ["java.lang.String"]
} external;

function org_apache_qpid_proton_engine_Session_setCondition(handle receiver, handle arg0) = @java:Method {
    name: "setCondition",
    'class: "org.apache.qpid.proton.engine.Session",
    paramTypes: ["org.apache.qpid.proton.amqp.transport.ErrorCondition"]
} external;

function org_apache_qpid_proton_engine_Session_setContext(handle receiver, handle arg0) = @java:Method {
    name: "setContext",
    'class: "org.apache.qpid.proton.engine.Session",
    paramTypes: ["java.lang.Object"]
} external;

function org_apache_qpid_proton_engine_Session_setDesiredCapabilities(handle receiver, handle arg0) = @java:Method {
    name: "setDesiredCapabilities",
    'class: "org.apache.qpid.proton.engine.Session",
    paramTypes: ["[Lorg.apache.qpid.proton.amqp.Symbol;"]
} external;

function org_apache_qpid_proton_engine_Session_setIncomingCapacity(handle receiver, int arg0) = @java:Method {
    name: "setIncomingCapacity",
    'class: "org.apache.qpid.proton.engine.Session",
    paramTypes: ["int"]
} external;

function org_apache_qpid_proton_engine_Session_setOfferedCapabilities(handle receiver, handle arg0) = @java:Method {
    name: "setOfferedCapabilities",
    'class: "org.apache.qpid.proton.engine.Session",
    paramTypes: ["[Lorg.apache.qpid.proton.amqp.Symbol;"]
} external;

function org_apache_qpid_proton_engine_Session_setOutgoingWindow(handle receiver, int arg0) = @java:Method {
    name: "setOutgoingWindow",
    'class: "org.apache.qpid.proton.engine.Session",
    paramTypes: ["long"]
} external;

function org_apache_qpid_proton_engine_Session_setProperties(handle receiver, handle arg0) = @java:Method {
    name: "setProperties",
    'class: "org.apache.qpid.proton.engine.Session",
    paramTypes: ["java.util.Map"]
} external;


