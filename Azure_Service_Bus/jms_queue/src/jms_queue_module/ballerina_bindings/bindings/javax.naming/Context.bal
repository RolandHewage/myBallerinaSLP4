
import ballerina/java;

# Ballerina object mapping for Java interface `javax.naming.Context`.
#
# + _Context - The field that represents this Ballerina object, which is used for Java subtyping.
# + _Object - The field that represents the superclass object `Object`.
@java:Binding {
    'class: "javax.naming.Context"
}
class Context {

    *java:JObject;

    ContextT _Context = ContextT;
    ObjectT _Object = ObjectT;

    # The init function of the Ballerina object mapping `javax.naming.Context` Java class.
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

    # The function that maps to the `addToEnvironment` method of `javax.naming.Context`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + arg1 - The `Object` value required to map with the Java method parameter.
    # + return - The `Object|NamingException` value returning from the Java mapping.
    function addToEnvironment(string arg0, Object arg1) returns Object|NamingException {
        handle|error externalObj = javax_naming_Context_addToEnvironment(self.jObj, java:fromString(arg0), arg1.jObj);
        if (externalObj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = externalObj.message(), cause = externalObj);
            return e;
        } else { 
        Object obj = new(externalObj);
        return obj;
        }
    }

    # The function that maps to the `bind` method of `javax.naming.Context`.
    #
    # + arg0 - The `Name` value required to map with the Java method parameter.
    # + arg1 - The `Object` value required to map with the Java method parameter.
    # + return - The `error?` value returning from the Java mapping.
    function bind(Name arg0, Object arg1) returns error? {
        error|() obj = javax_naming_Context_bind(self.jObj, arg0.jObj, arg1.jObj);
        if (obj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = obj.message(), cause = obj);
            return e;
        }
    }

    # The function that maps to the `bind` method of `javax.naming.Context`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + arg1 - The `Object` value required to map with the Java method parameter.
    # + return - The `error?` value returning from the Java mapping.
    function bind2(string arg0, Object arg1) returns error? {
        error|() obj = javax_naming_Context_bind2(self.jObj, java:fromString(arg0), arg1.jObj);
        if (obj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = obj.message(), cause = obj);
            return e;
        }
    }

    # The function that maps to the `close` method of `javax.naming.Context`.
    # 
    # + return - The `error?` value returning from the Java mapping.
    function close() returns error? {
        error|() obj = javax_naming_Context_close(self.jObj);
        if (obj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = obj.message(), cause = obj);
            return e;
        }
    }

    # The function that maps to the `composeName` method of `javax.naming.Context`.
    #
    # + arg0 - The `Name` value required to map with the Java method parameter.
    # + arg1 - The `Name` value required to map with the Java method parameter.
    # + return - The `Name|NamingException` value returning from the Java mapping.
    function composeName(Name arg0, Name arg1) returns Name|NamingException {
        handle|error externalObj = javax_naming_Context_composeName(self.jObj, arg0.jObj, arg1.jObj);
        if (externalObj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = externalObj.message(), cause = externalObj);
            return e;
        } else { 
        Name obj = new(externalObj);
        return obj;
        }
    }

    # The function that maps to the `composeName` method of `javax.naming.Context`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + arg1 - The `string` value required to map with the Java method parameter.
    # + return - The `string?|NamingException` value returning from the Java mapping.
    function composeName2(string arg0, string arg1) returns string?|NamingException {
        handle|error externalObj = javax_naming_Context_composeName2(self.jObj, java:fromString(arg0), java:fromString(arg1));
        if (externalObj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = externalObj.message(), cause = externalObj);
            return e;
        } else { 
        return java:toString(externalObj);
        }
    }

    # The function that maps to the `createSubcontext` method of `javax.naming.Context`.
    #
    # + arg0 - The `Name` value required to map with the Java method parameter.
    # + return - The `Context|NamingException` value returning from the Java mapping.
    function createSubcontext(Name arg0) returns Context|NamingException {
        handle|error externalObj = javax_naming_Context_createSubcontext(self.jObj, arg0.jObj);
        if (externalObj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = externalObj.message(), cause = externalObj);
            return e;
        } else { 
        Context obj = new(externalObj);
        return obj;
        }
    }

    # The function that maps to the `createSubcontext` method of `javax.naming.Context`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `Context|NamingException` value returning from the Java mapping.
    function createSubcontext2(string arg0) returns Context|NamingException {
        handle|error externalObj = javax_naming_Context_createSubcontext2(self.jObj, java:fromString(arg0));
        if (externalObj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = externalObj.message(), cause = externalObj);
            return e;
        } else { 
        Context obj = new(externalObj);
        return obj;
        }
    }

    # The function that maps to the `destroySubcontext` method of `javax.naming.Context`.
    #
    # + arg0 - The `Name` value required to map with the Java method parameter.
    # + return - The `error?` value returning from the Java mapping.
    function destroySubcontext(Name arg0) returns error? {
        error|() obj = javax_naming_Context_destroySubcontext(self.jObj, arg0.jObj);
        if (obj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = obj.message(), cause = obj);
            return e;
        }
    }

    # The function that maps to the `destroySubcontext` method of `javax.naming.Context`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `error?` value returning from the Java mapping.
    function destroySubcontext2(string arg0) returns error? {
        error|() obj = javax_naming_Context_destroySubcontext2(self.jObj, java:fromString(arg0));
        if (obj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = obj.message(), cause = obj);
            return e;
        }
    }

    # The function that maps to the `getEnvironment` method of `javax.naming.Context`.
    # 
    # + return - The `Hashtable|NamingException` value returning from the Java mapping.
    function getEnvironment() returns Hashtable|NamingException {
        handle|error externalObj = javax_naming_Context_getEnvironment(self.jObj);
        if (externalObj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = externalObj.message(), cause = externalObj);
            return e;
        } else { 
        Hashtable obj = new(externalObj);
        return obj;
        }
    }

    # The function that maps to the `getNameInNamespace` method of `javax.naming.Context`.
    # 
    # + return - The `string?|NamingException` value returning from the Java mapping.
    function getNameInNamespace() returns string?|NamingException {
        handle|error externalObj = javax_naming_Context_getNameInNamespace(self.jObj);
        if (externalObj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = externalObj.message(), cause = externalObj);
            return e;
        } else { 
        return java:toString(externalObj);
        }
    }

    # The function that maps to the `getNameParser` method of `javax.naming.Context`.
    #
    # + arg0 - The `Name` value required to map with the Java method parameter.
    # + return - The `NameParser|NamingException` value returning from the Java mapping.
    function getNameParser(Name arg0) returns NameParser|NamingException {
        handle|error externalObj = javax_naming_Context_getNameParser(self.jObj, arg0.jObj);
        if (externalObj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = externalObj.message(), cause = externalObj);
            return e;
        } else { 
        NameParser obj = new(externalObj);
        return obj;
        }
    }

    # The function that maps to the `getNameParser` method of `javax.naming.Context`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `NameParser|NamingException` value returning from the Java mapping.
    function getNameParser2(string arg0) returns NameParser|NamingException {
        handle|error externalObj = javax_naming_Context_getNameParser2(self.jObj, java:fromString(arg0));
        if (externalObj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = externalObj.message(), cause = externalObj);
            return e;
        } else { 
        NameParser obj = new(externalObj);
        return obj;
        }
    }

    # The function that maps to the `list` method of `javax.naming.Context`.
    #
    # + arg0 - The `Name` value required to map with the Java method parameter.
    # + return - The `NamingEnumeration|NamingException` value returning from the Java mapping.
    function list(Name arg0) returns NamingEnumeration|NamingException {
        handle|error externalObj = javax_naming_Context_list(self.jObj, arg0.jObj);
        if (externalObj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = externalObj.message(), cause = externalObj);
            return e;
        } else { 
        NamingEnumeration obj = new(externalObj);
        return obj;
        }
    }

    # The function that maps to the `list` method of `javax.naming.Context`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `NamingEnumeration|NamingException` value returning from the Java mapping.
    function list2(string arg0) returns NamingEnumeration|NamingException {
        handle|error externalObj = javax_naming_Context_list2(self.jObj, java:fromString(arg0));
        if (externalObj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = externalObj.message(), cause = externalObj);
            return e;
        } else { 
        NamingEnumeration obj = new(externalObj);
        return obj;
        }
    }

    # The function that maps to the `listBindings` method of `javax.naming.Context`.
    #
    # + arg0 - The `Name` value required to map with the Java method parameter.
    # + return - The `NamingEnumeration|NamingException` value returning from the Java mapping.
    function listBindings(Name arg0) returns NamingEnumeration|NamingException {
        handle|error externalObj = javax_naming_Context_listBindings(self.jObj, arg0.jObj);
        if (externalObj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = externalObj.message(), cause = externalObj);
            return e;
        } else { 
        NamingEnumeration obj = new(externalObj);
        return obj;
        }
    }

    # The function that maps to the `listBindings` method of `javax.naming.Context`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `NamingEnumeration|NamingException` value returning from the Java mapping.
    function listBindings2(string arg0) returns NamingEnumeration|NamingException {
        handle|error externalObj = javax_naming_Context_listBindings2(self.jObj, java:fromString(arg0));
        if (externalObj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = externalObj.message(), cause = externalObj);
            return e;
        } else { 
        NamingEnumeration obj = new(externalObj);
        return obj;
        }
    }

    # The function that maps to the `lookup` method of `javax.naming.Context`.
    #
    # + arg0 - The `Name` value required to map with the Java method parameter.
    # + return - The `Object|NamingException` value returning from the Java mapping.
    function lookup(Name arg0) returns Object|NamingException {
        handle|error externalObj = javax_naming_Context_lookup(self.jObj, arg0.jObj);
        if (externalObj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = externalObj.message(), cause = externalObj);
            return e;
        } else { 
        Object obj = new(externalObj);
        return obj;
        }
    }

    # The function that maps to the `lookup` method of `javax.naming.Context`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `Object|NamingException` value returning from the Java mapping.
    function lookup2(string arg0) returns Object|NamingException {
        handle|error externalObj = javax_naming_Context_lookup2(self.jObj, java:fromString(arg0));
        if (externalObj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = externalObj.message(), cause = externalObj);
            return e;
        } else { 
        Object obj = new(externalObj);
        return obj;
        }
    }

    # The function that maps to the `lookupLink` method of `javax.naming.Context`.
    #
    # + arg0 - The `Name` value required to map with the Java method parameter.
    # + return - The `Object|NamingException` value returning from the Java mapping.
    function lookupLink(Name arg0) returns Object|NamingException {
        handle|error externalObj = javax_naming_Context_lookupLink(self.jObj, arg0.jObj);
        if (externalObj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = externalObj.message(), cause = externalObj);
            return e;
        } else { 
        Object obj = new(externalObj);
        return obj;
        }
    }

    # The function that maps to the `lookupLink` method of `javax.naming.Context`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `Object|NamingException` value returning from the Java mapping.
    function lookupLink2(string arg0) returns Object|NamingException {
        handle|error externalObj = javax_naming_Context_lookupLink2(self.jObj, java:fromString(arg0));
        if (externalObj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = externalObj.message(), cause = externalObj);
            return e;
        } else { 
        Object obj = new(externalObj);
        return obj;
        }
    }

    # The function that maps to the `rebind` method of `javax.naming.Context`.
    #
    # + arg0 - The `Name` value required to map with the Java method parameter.
    # + arg1 - The `Object` value required to map with the Java method parameter.
    # + return - The `error?` value returning from the Java mapping.
    function rebind(Name arg0, Object arg1) returns error? {
        error|() obj = javax_naming_Context_rebind(self.jObj, arg0.jObj, arg1.jObj);
        if (obj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = obj.message(), cause = obj);
            return e;
        }
    }

    # The function that maps to the `rebind` method of `javax.naming.Context`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + arg1 - The `Object` value required to map with the Java method parameter.
    # + return - The `error?` value returning from the Java mapping.
    function rebind2(string arg0, Object arg1) returns error? {
        error|() obj = javax_naming_Context_rebind2(self.jObj, java:fromString(arg0), arg1.jObj);
        if (obj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = obj.message(), cause = obj);
            return e;
        }
    }

    # The function that maps to the `removeFromEnvironment` method of `javax.naming.Context`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `Object|NamingException` value returning from the Java mapping.
    function removeFromEnvironment(string arg0) returns Object|NamingException {
        handle|error externalObj = javax_naming_Context_removeFromEnvironment(self.jObj, java:fromString(arg0));
        if (externalObj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = externalObj.message(), cause = externalObj);
            return e;
        } else { 
        Object obj = new(externalObj);
        return obj;
        }
    }

    # The function that maps to the `rename` method of `javax.naming.Context`.
    #
    # + arg0 - The `Name` value required to map with the Java method parameter.
    # + arg1 - The `Name` value required to map with the Java method parameter.
    # + return - The `error?` value returning from the Java mapping.
    function rename(Name arg0, Name arg1) returns error? {
        error|() obj = javax_naming_Context_rename(self.jObj, arg0.jObj, arg1.jObj);
        if (obj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = obj.message(), cause = obj);
            return e;
        }
    }

    # The function that maps to the `rename` method of `javax.naming.Context`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + arg1 - The `string` value required to map with the Java method parameter.
    # + return - The `error?` value returning from the Java mapping.
    function rename2(string arg0, string arg1) returns error? {
        error|() obj = javax_naming_Context_rename2(self.jObj, java:fromString(arg0), java:fromString(arg1));
        if (obj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = obj.message(), cause = obj);
            return e;
        }
    }

    # The function that maps to the `unbind` method of `javax.naming.Context`.
    #
    # + arg0 - The `Name` value required to map with the Java method parameter.
    # + return - The `error?` value returning from the Java mapping.
    function unbind(Name arg0) returns error? {
        error|() obj = javax_naming_Context_unbind(self.jObj, arg0.jObj);
        if (obj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = obj.message(), cause = obj);
            return e;
        }
    }

    # The function that maps to the `unbind` method of `javax.naming.Context`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `error?` value returning from the Java mapping.
    function unbind2(string arg0) returns error? {
        error|() obj = javax_naming_Context_unbind2(self.jObj, java:fromString(arg0));
        if (obj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = obj.message(), cause = obj);
            return e;
        }
    }
}

# The function that retrieves the value of the public field INITIAL_CONTEXT_FACTORY.
#
# + return - The `string` value of the field.
function Context_getINITIAL_CONTEXT_FACTORY() returns string? {
    
    return java:toString(javax_naming_Context_getINITIAL_CONTEXT_FACTORY());
}

# The function that retrieves the value of the public field OBJECT_FACTORIES.
#
# + return - The `string` value of the field.
function Context_getOBJECT_FACTORIES() returns string? {
    
    return java:toString(javax_naming_Context_getOBJECT_FACTORIES());
}

# The function that retrieves the value of the public field STATE_FACTORIES.
#
# + return - The `string` value of the field.
function Context_getSTATE_FACTORIES() returns string? {
    
    return java:toString(javax_naming_Context_getSTATE_FACTORIES());
}

# The function that retrieves the value of the public field URL_PKG_PREFIXES.
#
# + return - The `string` value of the field.
function Context_getURL_PKG_PREFIXES() returns string? {
    
    return java:toString(javax_naming_Context_getURL_PKG_PREFIXES());
}

# The function that retrieves the value of the public field PROVIDER_URL.
#
# + return - The `string` value of the field.
function Context_getPROVIDER_URL() returns string? {
    
    return java:toString(javax_naming_Context_getPROVIDER_URL());
}

# The function that retrieves the value of the public field DNS_URL.
#
# + return - The `string` value of the field.
function Context_getDNS_URL() returns string? {
    
    return java:toString(javax_naming_Context_getDNS_URL());
}

# The function that retrieves the value of the public field AUTHORITATIVE.
#
# + return - The `string` value of the field.
function Context_getAUTHORITATIVE() returns string? {
    
    return java:toString(javax_naming_Context_getAUTHORITATIVE());
}

# The function that retrieves the value of the public field BATCHSIZE.
#
# + return - The `string` value of the field.
function Context_getBATCHSIZE() returns string? {
    
    return java:toString(javax_naming_Context_getBATCHSIZE());
}

# The function that retrieves the value of the public field REFERRAL.
#
# + return - The `string` value of the field.
function Context_getREFERRAL() returns string? {
    
    return java:toString(javax_naming_Context_getREFERRAL());
}

# The function that retrieves the value of the public field SECURITY_PROTOCOL.
#
# + return - The `string` value of the field.
function Context_getSECURITY_PROTOCOL() returns string? {
    
    return java:toString(javax_naming_Context_getSECURITY_PROTOCOL());
}

# The function that retrieves the value of the public field SECURITY_AUTHENTICATION.
#
# + return - The `string` value of the field.
function Context_getSECURITY_AUTHENTICATION() returns string? {
    
    return java:toString(javax_naming_Context_getSECURITY_AUTHENTICATION());
}

# The function that retrieves the value of the public field SECURITY_PRINCIPAL.
#
# + return - The `string` value of the field.
function Context_getSECURITY_PRINCIPAL() returns string? {
    
    return java:toString(javax_naming_Context_getSECURITY_PRINCIPAL());
}

# The function that retrieves the value of the public field SECURITY_CREDENTIALS.
#
# + return - The `string` value of the field.
function Context_getSECURITY_CREDENTIALS() returns string? {
    
    return java:toString(javax_naming_Context_getSECURITY_CREDENTIALS());
}

# The function that retrieves the value of the public field LANGUAGE.
#
# + return - The `string` value of the field.
function Context_getLANGUAGE() returns string? {
    
    return java:toString(javax_naming_Context_getLANGUAGE());
}

# The function that retrieves the value of the public field APPLET.
#
# + return - The `string` value of the field.
function Context_getAPPLET() returns string? {
    
    return java:toString(javax_naming_Context_getAPPLET());
}

// External interop functions for mapping public methods.

function javax_naming_Context_addToEnvironment(handle receiver, handle arg0, handle arg1) returns handle|error = @java:Method {
    name: "addToEnvironment",
    'class: "javax.naming.Context",
    paramTypes: ["java.lang.String", "java.lang.Object"]
} external;

function javax_naming_Context_bind(handle receiver, handle arg0, handle arg1) returns error? = @java:Method {
    name: "bind",
    'class: "javax.naming.Context",
    paramTypes: ["javax.naming.Name", "java.lang.Object"]
} external;

function javax_naming_Context_bind2(handle receiver, handle arg0, handle arg1) returns error? = @java:Method {
    name: "bind",
    'class: "javax.naming.Context",
    paramTypes: ["java.lang.String", "java.lang.Object"]
} external;

function javax_naming_Context_close(handle receiver) returns error? = @java:Method {
    name: "close",
    'class: "javax.naming.Context",
    paramTypes: []
} external;

function javax_naming_Context_composeName(handle receiver, handle arg0, handle arg1) returns handle|error = @java:Method {
    name: "composeName",
    'class: "javax.naming.Context",
    paramTypes: ["javax.naming.Name", "javax.naming.Name"]
} external;

function javax_naming_Context_composeName2(handle receiver, handle arg0, handle arg1) returns handle|error = @java:Method {
    name: "composeName",
    'class: "javax.naming.Context",
    paramTypes: ["java.lang.String", "java.lang.String"]
} external;

function javax_naming_Context_createSubcontext(handle receiver, handle arg0) returns handle|error = @java:Method {
    name: "createSubcontext",
    'class: "javax.naming.Context",
    paramTypes: ["javax.naming.Name"]
} external;

function javax_naming_Context_createSubcontext2(handle receiver, handle arg0) returns handle|error = @java:Method {
    name: "createSubcontext",
    'class: "javax.naming.Context",
    paramTypes: ["java.lang.String"]
} external;

function javax_naming_Context_destroySubcontext(handle receiver, handle arg0) returns error? = @java:Method {
    name: "destroySubcontext",
    'class: "javax.naming.Context",
    paramTypes: ["javax.naming.Name"]
} external;

function javax_naming_Context_destroySubcontext2(handle receiver, handle arg0) returns error? = @java:Method {
    name: "destroySubcontext",
    'class: "javax.naming.Context",
    paramTypes: ["java.lang.String"]
} external;

function javax_naming_Context_getEnvironment(handle receiver) returns handle|error = @java:Method {
    name: "getEnvironment",
    'class: "javax.naming.Context",
    paramTypes: []
} external;

function javax_naming_Context_getNameInNamespace(handle receiver) returns handle|error = @java:Method {
    name: "getNameInNamespace",
    'class: "javax.naming.Context",
    paramTypes: []
} external;

function javax_naming_Context_getNameParser(handle receiver, handle arg0) returns handle|error = @java:Method {
    name: "getNameParser",
    'class: "javax.naming.Context",
    paramTypes: ["javax.naming.Name"]
} external;

function javax_naming_Context_getNameParser2(handle receiver, handle arg0) returns handle|error = @java:Method {
    name: "getNameParser",
    'class: "javax.naming.Context",
    paramTypes: ["java.lang.String"]
} external;

function javax_naming_Context_list(handle receiver, handle arg0) returns handle|error = @java:Method {
    name: "list",
    'class: "javax.naming.Context",
    paramTypes: ["javax.naming.Name"]
} external;

function javax_naming_Context_list2(handle receiver, handle arg0) returns handle|error = @java:Method {
    name: "list",
    'class: "javax.naming.Context",
    paramTypes: ["java.lang.String"]
} external;

function javax_naming_Context_listBindings(handle receiver, handle arg0) returns handle|error = @java:Method {
    name: "listBindings",
    'class: "javax.naming.Context",
    paramTypes: ["javax.naming.Name"]
} external;

function javax_naming_Context_listBindings2(handle receiver, handle arg0) returns handle|error = @java:Method {
    name: "listBindings",
    'class: "javax.naming.Context",
    paramTypes: ["java.lang.String"]
} external;

function javax_naming_Context_lookup(handle receiver, handle arg0) returns handle|error = @java:Method {
    name: "lookup",
    'class: "javax.naming.Context",
    paramTypes: ["javax.naming.Name"]
} external;

function javax_naming_Context_lookup2(handle receiver, handle arg0) returns handle|error = @java:Method {
    name: "lookup",
    'class: "javax.naming.Context",
    paramTypes: ["java.lang.String"]
} external;

function javax_naming_Context_lookupLink(handle receiver, handle arg0) returns handle|error = @java:Method {
    name: "lookupLink",
    'class: "javax.naming.Context",
    paramTypes: ["javax.naming.Name"]
} external;

function javax_naming_Context_lookupLink2(handle receiver, handle arg0) returns handle|error = @java:Method {
    name: "lookupLink",
    'class: "javax.naming.Context",
    paramTypes: ["java.lang.String"]
} external;

function javax_naming_Context_rebind(handle receiver, handle arg0, handle arg1) returns error? = @java:Method {
    name: "rebind",
    'class: "javax.naming.Context",
    paramTypes: ["javax.naming.Name", "java.lang.Object"]
} external;

function javax_naming_Context_rebind2(handle receiver, handle arg0, handle arg1) returns error? = @java:Method {
    name: "rebind",
    'class: "javax.naming.Context",
    paramTypes: ["java.lang.String", "java.lang.Object"]
} external;

function javax_naming_Context_removeFromEnvironment(handle receiver, handle arg0) returns handle|error = @java:Method {
    name: "removeFromEnvironment",
    'class: "javax.naming.Context",
    paramTypes: ["java.lang.String"]
} external;

function javax_naming_Context_rename(handle receiver, handle arg0, handle arg1) returns error? = @java:Method {
    name: "rename",
    'class: "javax.naming.Context",
    paramTypes: ["javax.naming.Name", "javax.naming.Name"]
} external;

function javax_naming_Context_rename2(handle receiver, handle arg0, handle arg1) returns error? = @java:Method {
    name: "rename",
    'class: "javax.naming.Context",
    paramTypes: ["java.lang.String", "java.lang.String"]
} external;

function javax_naming_Context_unbind(handle receiver, handle arg0) returns error? = @java:Method {
    name: "unbind",
    'class: "javax.naming.Context",
    paramTypes: ["javax.naming.Name"]
} external;

function javax_naming_Context_unbind2(handle receiver, handle arg0) returns error? = @java:Method {
    name: "unbind",
    'class: "javax.naming.Context",
    paramTypes: ["java.lang.String"]
} external;

// External interop functions for mapping public fields.

function javax_naming_Context_getINITIAL_CONTEXT_FACTORY() returns handle = @java:FieldGet {
    name: "INITIAL_CONTEXT_FACTORY",
    'class: "javax.naming.Context"
} external;

function javax_naming_Context_getOBJECT_FACTORIES() returns handle = @java:FieldGet {
    name: "OBJECT_FACTORIES",
    'class: "javax.naming.Context"
} external;

function javax_naming_Context_getSTATE_FACTORIES() returns handle = @java:FieldGet {
    name: "STATE_FACTORIES",
    'class: "javax.naming.Context"
} external;

function javax_naming_Context_getURL_PKG_PREFIXES() returns handle = @java:FieldGet {
    name: "URL_PKG_PREFIXES",
    'class: "javax.naming.Context"
} external;

function javax_naming_Context_getPROVIDER_URL() returns handle = @java:FieldGet {
    name: "PROVIDER_URL",
    'class: "javax.naming.Context"
} external;

function javax_naming_Context_getDNS_URL() returns handle = @java:FieldGet {
    name: "DNS_URL",
    'class: "javax.naming.Context"
} external;

function javax_naming_Context_getAUTHORITATIVE() returns handle = @java:FieldGet {
    name: "AUTHORITATIVE",
    'class: "javax.naming.Context"
} external;

function javax_naming_Context_getBATCHSIZE() returns handle = @java:FieldGet {
    name: "BATCHSIZE",
    'class: "javax.naming.Context"
} external;

function javax_naming_Context_getREFERRAL() returns handle = @java:FieldGet {
    name: "REFERRAL",
    'class: "javax.naming.Context"
} external;

function javax_naming_Context_getSECURITY_PROTOCOL() returns handle = @java:FieldGet {
    name: "SECURITY_PROTOCOL",
    'class: "javax.naming.Context"
} external;

function javax_naming_Context_getSECURITY_AUTHENTICATION() returns handle = @java:FieldGet {
    name: "SECURITY_AUTHENTICATION",
    'class: "javax.naming.Context"
} external;

function javax_naming_Context_getSECURITY_PRINCIPAL() returns handle = @java:FieldGet {
    name: "SECURITY_PRINCIPAL",
    'class: "javax.naming.Context"
} external;

function javax_naming_Context_getSECURITY_CREDENTIALS() returns handle = @java:FieldGet {
    name: "SECURITY_CREDENTIALS",
    'class: "javax.naming.Context"
} external;

function javax_naming_Context_getLANGUAGE() returns handle = @java:FieldGet {
    name: "LANGUAGE",
    'class: "javax.naming.Context"
} external;

function javax_naming_Context_getAPPLET() returns handle = @java:FieldGet {
    name: "APPLET",
    'class: "javax.naming.Context"
} external;


