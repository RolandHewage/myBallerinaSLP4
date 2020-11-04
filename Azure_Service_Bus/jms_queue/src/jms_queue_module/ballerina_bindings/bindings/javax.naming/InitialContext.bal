
import ballerina/java;

# Ballerina object mapping for Java class `javax.naming.InitialContext`.
#
# + _InitialContext - The field that represents this Ballerina object, which is used for Java subtyping.
# + _Context - The field that represents the superclass object `Context`.
# + _Object - The field that represents the superclass object `Object`.
@java:Binding {
    'class: "javax.naming.InitialContext"
}
class InitialContext {

    *java:JObject;

    InitialContextT _InitialContext = InitialContextT;
    ContextT _Context = ContextT;
    ObjectT _Object = ObjectT;

    # The init function of the Ballerina object mapping `javax.naming.InitialContext` Java class.
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

    # The function that maps to the `addToEnvironment` method of `javax.naming.InitialContext`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + arg1 - The `Object` value required to map with the Java method parameter.
    # + return - The `Object|NamingException` value returning from the Java mapping.
    function addToEnvironment(string arg0, Object arg1) returns Object|NamingException {
        handle|error externalObj = javax_naming_InitialContext_addToEnvironment(self.jObj, java:fromString(arg0), arg1.jObj);
        if (externalObj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = externalObj.message(), cause = externalObj);
            return e;
        } else { 
        Object obj = new(externalObj);
        return obj;
        }
    }

    # The function that maps to the `bind` method of `javax.naming.InitialContext`.
    #
    # + arg0 - The `Name` value required to map with the Java method parameter.
    # + arg1 - The `Object` value required to map with the Java method parameter.
    # + return - The `error?` value returning from the Java mapping.
    function bind(Name arg0, Object arg1) returns error? {
        error|() obj = javax_naming_InitialContext_bind(self.jObj, arg0.jObj, arg1.jObj);
        if (obj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = obj.message(), cause = obj);
            return e;
        }
    }

    # The function that maps to the `bind` method of `javax.naming.InitialContext`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + arg1 - The `Object` value required to map with the Java method parameter.
    # + return - The `error?` value returning from the Java mapping.
    function bind2(string arg0, Object arg1) returns error? {
        error|() obj = javax_naming_InitialContext_bind2(self.jObj, java:fromString(arg0), arg1.jObj);
        if (obj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = obj.message(), cause = obj);
            return e;
        }
    }

    # The function that maps to the `close` method of `javax.naming.InitialContext`.
    # 
    # + return - The `error?` value returning from the Java mapping.
    function close() returns error? {
        error|() obj = javax_naming_InitialContext_close(self.jObj);
        if (obj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = obj.message(), cause = obj);
            return e;
        }
    }

    # The function that maps to the `composeName` method of `javax.naming.InitialContext`.
    #
    # + arg0 - The `Name` value required to map with the Java method parameter.
    # + arg1 - The `Name` value required to map with the Java method parameter.
    # + return - The `Name|NamingException` value returning from the Java mapping.
    function composeName(Name arg0, Name arg1) returns Name|NamingException {
        handle|error externalObj = javax_naming_InitialContext_composeName(self.jObj, arg0.jObj, arg1.jObj);
        if (externalObj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = externalObj.message(), cause = externalObj);
            return e;
        } else { 
        Name obj = new(externalObj);
        return obj;
        }
    }

    # The function that maps to the `composeName` method of `javax.naming.InitialContext`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + arg1 - The `string` value required to map with the Java method parameter.
    # + return - The `string?|NamingException` value returning from the Java mapping.
    function composeName2(string arg0, string arg1) returns string?|NamingException {
        handle|error externalObj = javax_naming_InitialContext_composeName2(self.jObj, java:fromString(arg0), java:fromString(arg1));
        if (externalObj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = externalObj.message(), cause = externalObj);
            return e;
        } else { 
        return java:toString(externalObj);
        }
    }

    # The function that maps to the `createSubcontext` method of `javax.naming.InitialContext`.
    #
    # + arg0 - The `Name` value required to map with the Java method parameter.
    # + return - The `Context|NamingException` value returning from the Java mapping.
    function createSubcontext(Name arg0) returns Context|NamingException {
        handle|error externalObj = javax_naming_InitialContext_createSubcontext(self.jObj, arg0.jObj);
        if (externalObj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = externalObj.message(), cause = externalObj);
            return e;
        } else { 
        Context obj = new(externalObj);
        return obj;
        }
    }

    # The function that maps to the `createSubcontext` method of `javax.naming.InitialContext`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `Context|NamingException` value returning from the Java mapping.
    function createSubcontext2(string arg0) returns Context|NamingException {
        handle|error externalObj = javax_naming_InitialContext_createSubcontext2(self.jObj, java:fromString(arg0));
        if (externalObj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = externalObj.message(), cause = externalObj);
            return e;
        } else { 
        Context obj = new(externalObj);
        return obj;
        }
    }

    # The function that maps to the `destroySubcontext` method of `javax.naming.InitialContext`.
    #
    # + arg0 - The `Name` value required to map with the Java method parameter.
    # + return - The `error?` value returning from the Java mapping.
    function destroySubcontext(Name arg0) returns error? {
        error|() obj = javax_naming_InitialContext_destroySubcontext(self.jObj, arg0.jObj);
        if (obj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = obj.message(), cause = obj);
            return e;
        }
    }

    # The function that maps to the `destroySubcontext` method of `javax.naming.InitialContext`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `error?` value returning from the Java mapping.
    function destroySubcontext2(string arg0) returns error? {
        error|() obj = javax_naming_InitialContext_destroySubcontext2(self.jObj, java:fromString(arg0));
        if (obj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = obj.message(), cause = obj);
            return e;
        }
    }

    # The function that maps to the `equals` method of `javax.naming.InitialContext`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + return - The `boolean` value returning from the Java mapping.
    function 'equals(Object arg0) returns boolean {
        boolean externalObj = javax_naming_InitialContext_equals(self.jObj, arg0.jObj);
        return externalObj;
    }

    # The function that maps to the `getClass` method of `javax.naming.InitialContext`.
    # 
    # + return - The `Class` value returning from the Java mapping.
    function getClass() returns Class {
        handle externalObj = javax_naming_InitialContext_getClass(self.jObj);
        Class obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `getEnvironment` method of `javax.naming.InitialContext`.
    # 
    # + return - The `Hashtable|NamingException` value returning from the Java mapping.
    function getEnvironment() returns Hashtable|NamingException {
        handle|error externalObj = javax_naming_InitialContext_getEnvironment(self.jObj);
        if (externalObj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = externalObj.message(), cause = externalObj);
            return e;
        } else { 
        Hashtable obj = new(externalObj);
        return obj;
        }
    }

    # The function that maps to the `getNameInNamespace` method of `javax.naming.InitialContext`.
    # 
    # + return - The `string?|NamingException` value returning from the Java mapping.
    function getNameInNamespace() returns string?|NamingException {
        handle|error externalObj = javax_naming_InitialContext_getNameInNamespace(self.jObj);
        if (externalObj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = externalObj.message(), cause = externalObj);
            return e;
        } else { 
        return java:toString(externalObj);
        }
    }

    # The function that maps to the `getNameParser` method of `javax.naming.InitialContext`.
    #
    # + arg0 - The `Name` value required to map with the Java method parameter.
    # + return - The `NameParser|NamingException` value returning from the Java mapping.
    function getNameParser(Name arg0) returns NameParser|NamingException {
        handle|error externalObj = javax_naming_InitialContext_getNameParser(self.jObj, arg0.jObj);
        if (externalObj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = externalObj.message(), cause = externalObj);
            return e;
        } else { 
        NameParser obj = new(externalObj);
        return obj;
        }
    }

    # The function that maps to the `getNameParser` method of `javax.naming.InitialContext`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `NameParser|NamingException` value returning from the Java mapping.
    function getNameParser2(string arg0) returns NameParser|NamingException {
        handle|error externalObj = javax_naming_InitialContext_getNameParser2(self.jObj, java:fromString(arg0));
        if (externalObj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = externalObj.message(), cause = externalObj);
            return e;
        } else { 
        NameParser obj = new(externalObj);
        return obj;
        }
    }

    # The function that maps to the `hashCode` method of `javax.naming.InitialContext`.
    # 
    # + return - The `int` value returning from the Java mapping.
    function hashCode() returns int {
        int externalObj = javax_naming_InitialContext_hashCode(self.jObj);
        return externalObj;
    }

    # The function that maps to the `list` method of `javax.naming.InitialContext`.
    #
    # + arg0 - The `Name` value required to map with the Java method parameter.
    # + return - The `NamingEnumeration|NamingException` value returning from the Java mapping.
    function list(Name arg0) returns NamingEnumeration|NamingException {
        handle|error externalObj = javax_naming_InitialContext_list(self.jObj, arg0.jObj);
        if (externalObj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = externalObj.message(), cause = externalObj);
            return e;
        } else { 
        NamingEnumeration obj = new(externalObj);
        return obj;
        }
    }

    # The function that maps to the `list` method of `javax.naming.InitialContext`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `NamingEnumeration|NamingException` value returning from the Java mapping.
    function list2(string arg0) returns NamingEnumeration|NamingException {
        handle|error externalObj = javax_naming_InitialContext_list2(self.jObj, java:fromString(arg0));
        if (externalObj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = externalObj.message(), cause = externalObj);
            return e;
        } else { 
        NamingEnumeration obj = new(externalObj);
        return obj;
        }
    }

    # The function that maps to the `listBindings` method of `javax.naming.InitialContext`.
    #
    # + arg0 - The `Name` value required to map with the Java method parameter.
    # + return - The `NamingEnumeration|NamingException` value returning from the Java mapping.
    function listBindings(Name arg0) returns NamingEnumeration|NamingException {
        handle|error externalObj = javax_naming_InitialContext_listBindings(self.jObj, arg0.jObj);
        if (externalObj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = externalObj.message(), cause = externalObj);
            return e;
        } else { 
        NamingEnumeration obj = new(externalObj);
        return obj;
        }
    }

    # The function that maps to the `listBindings` method of `javax.naming.InitialContext`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `NamingEnumeration|NamingException` value returning from the Java mapping.
    function listBindings2(string arg0) returns NamingEnumeration|NamingException {
        handle|error externalObj = javax_naming_InitialContext_listBindings2(self.jObj, java:fromString(arg0));
        if (externalObj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = externalObj.message(), cause = externalObj);
            return e;
        } else { 
        NamingEnumeration obj = new(externalObj);
        return obj;
        }
    }

    # The function that maps to the `lookup` method of `javax.naming.InitialContext`.
    #
    # + arg0 - The `Name` value required to map with the Java method parameter.
    # + return - The `Object|NamingException` value returning from the Java mapping.
    function lookup(Name arg0) returns Object|NamingException {
        handle|error externalObj = javax_naming_InitialContext_lookup(self.jObj, arg0.jObj);
        if (externalObj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = externalObj.message(), cause = externalObj);
            return e;
        } else { 
        Object obj = new(externalObj);
        return obj;
        }
    }

    # The function that maps to the `lookup` method of `javax.naming.InitialContext`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `Object|NamingException` value returning from the Java mapping.
    function lookup2(string arg0) returns Object|NamingException {
        handle|error externalObj = javax_naming_InitialContext_lookup2(self.jObj, java:fromString(arg0));
        if (externalObj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = externalObj.message(), cause = externalObj);
            return e;
        } else { 
        Object obj = new(externalObj);
        return obj;
        }
    }

    # The function that maps to the `lookupLink` method of `javax.naming.InitialContext`.
    #
    # + arg0 - The `Name` value required to map with the Java method parameter.
    # + return - The `Object|NamingException` value returning from the Java mapping.
    function lookupLink(Name arg0) returns Object|NamingException {
        handle|error externalObj = javax_naming_InitialContext_lookupLink(self.jObj, arg0.jObj);
        if (externalObj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = externalObj.message(), cause = externalObj);
            return e;
        } else { 
        Object obj = new(externalObj);
        return obj;
        }
    }

    # The function that maps to the `lookupLink` method of `javax.naming.InitialContext`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `Object|NamingException` value returning from the Java mapping.
    function lookupLink2(string arg0) returns Object|NamingException {
        handle|error externalObj = javax_naming_InitialContext_lookupLink2(self.jObj, java:fromString(arg0));
        if (externalObj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = externalObj.message(), cause = externalObj);
            return e;
        } else { 
        Object obj = new(externalObj);
        return obj;
        }
    }

    # The function that maps to the `notify` method of `javax.naming.InitialContext`.
    function notify() {
        () obj = javax_naming_InitialContext_notify(self.jObj);
    }

    # The function that maps to the `notifyAll` method of `javax.naming.InitialContext`.
    function notifyAll() {
        () obj = javax_naming_InitialContext_notifyAll(self.jObj);
    }

    # The function that maps to the `rebind` method of `javax.naming.InitialContext`.
    #
    # + arg0 - The `Name` value required to map with the Java method parameter.
    # + arg1 - The `Object` value required to map with the Java method parameter.
    # + return - The `error?` value returning from the Java mapping.
    function rebind(Name arg0, Object arg1) returns error? {
        error|() obj = javax_naming_InitialContext_rebind(self.jObj, arg0.jObj, arg1.jObj);
        if (obj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = obj.message(), cause = obj);
            return e;
        }
    }

    # The function that maps to the `rebind` method of `javax.naming.InitialContext`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + arg1 - The `Object` value required to map with the Java method parameter.
    # + return - The `error?` value returning from the Java mapping.
    function rebind2(string arg0, Object arg1) returns error? {
        error|() obj = javax_naming_InitialContext_rebind2(self.jObj, java:fromString(arg0), arg1.jObj);
        if (obj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = obj.message(), cause = obj);
            return e;
        }
    }

    # The function that maps to the `removeFromEnvironment` method of `javax.naming.InitialContext`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `Object|NamingException` value returning from the Java mapping.
    function removeFromEnvironment(string arg0) returns Object|NamingException {
        handle|error externalObj = javax_naming_InitialContext_removeFromEnvironment(self.jObj, java:fromString(arg0));
        if (externalObj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = externalObj.message(), cause = externalObj);
            return e;
        } else { 
        Object obj = new(externalObj);
        return obj;
        }
    }

    # The function that maps to the `rename` method of `javax.naming.InitialContext`.
    #
    # + arg0 - The `Name` value required to map with the Java method parameter.
    # + arg1 - The `Name` value required to map with the Java method parameter.
    # + return - The `error?` value returning from the Java mapping.
    function rename(Name arg0, Name arg1) returns error? {
        error|() obj = javax_naming_InitialContext_rename(self.jObj, arg0.jObj, arg1.jObj);
        if (obj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = obj.message(), cause = obj);
            return e;
        }
    }

    # The function that maps to the `rename` method of `javax.naming.InitialContext`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + arg1 - The `string` value required to map with the Java method parameter.
    # + return - The `error?` value returning from the Java mapping.
    function rename2(string arg0, string arg1) returns error? {
        error|() obj = javax_naming_InitialContext_rename2(self.jObj, java:fromString(arg0), java:fromString(arg1));
        if (obj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = obj.message(), cause = obj);
            return e;
        }
    }

    # The function that maps to the `unbind` method of `javax.naming.InitialContext`.
    #
    # + arg0 - The `Name` value required to map with the Java method parameter.
    # + return - The `error?` value returning from the Java mapping.
    function unbind(Name arg0) returns error? {
        error|() obj = javax_naming_InitialContext_unbind(self.jObj, arg0.jObj);
        if (obj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = obj.message(), cause = obj);
            return e;
        }
    }

    # The function that maps to the `unbind` method of `javax.naming.InitialContext`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `error?` value returning from the Java mapping.
    function unbind2(string arg0) returns error? {
        error|() obj = javax_naming_InitialContext_unbind2(self.jObj, java:fromString(arg0));
        if (obj is error) {
            NamingException e = NamingException(NAMINGEXCEPTION, message = obj.message(), cause = obj);
            return e;
        }
    }

    # The function that maps to the `wait` method of `javax.naming.InitialContext`.
    # 
    # + return - The `error?` value returning from the Java mapping.
    function 'wait() returns error? {
        error|() obj = javax_naming_InitialContext_wait(self.jObj);
        if (obj is error) {
            InterruptedException e = InterruptedException(INTERRUPTEDEXCEPTION, message = obj.message(), cause = obj);
            return e;
        }
    }

    # The function that maps to the `wait` method of `javax.naming.InitialContext`.
    #
    # + arg0 - The `int` value required to map with the Java method parameter.
    # + return - The `error?` value returning from the Java mapping.
    function 'wait2(int arg0) returns error? {
        error|() obj = javax_naming_InitialContext_wait2(self.jObj, arg0);
        if (obj is error) {
            InterruptedException e = InterruptedException(INTERRUPTEDEXCEPTION, message = obj.message(), cause = obj);
            return e;
        }
    }

    # The function that maps to the `wait` method of `javax.naming.InitialContext`.
    #
    # + arg0 - The `int` value required to map with the Java method parameter.
    # + arg1 - The `int` value required to map with the Java method parameter.
    # + return - The `error?` value returning from the Java mapping.
    function 'wait3(int arg0, int arg1) returns error? {
        error|() obj = javax_naming_InitialContext_wait3(self.jObj, arg0, arg1);
        if (obj is error) {
            InterruptedException e = InterruptedException(INTERRUPTEDEXCEPTION, message = obj.message(), cause = obj);
            return e;
        }
    }
}

# Constructor function to generate an object of type `InitialContext` representing the `javax.naming.InitialContext` Java class.
#
# + return - The new `InitialContext` object or `|NamingException` error generated.
function newInitialContext1() returns InitialContext|NamingException {
    handle|error obj = javax_naming_InitialContext_newInitialContext1();
    if (obj is error) {
        NamingException e = NamingException(NAMINGEXCEPTION, message = obj.message(), cause = obj);
        return e;
    } else { 
    InitialContext _initialContext = new(obj);
    return _initialContext;
    } 
}

# Constructor function to generate an object of type `InitialContext` representing the `javax.naming.InitialContext` Java class.
#
# + arg0 - The `Hashtable` value required to map with the Java constructor parameter.
# + return - The new `InitialContext` object or `|NamingException` error generated.
function newInitialContext2(Hashtable arg0) returns InitialContext|NamingException {
    handle|error obj = javax_naming_InitialContext_newInitialContext2(arg0.jObj);
    if (obj is error) {
        NamingException e = NamingException(NAMINGEXCEPTION, message = obj.message(), cause = obj);
        return e;
    } else { 
    InitialContext _initialContext = new(obj);
    return _initialContext;
    } 
}

# The function that maps to the `doLookup` method of `javax.naming.InitialContext`.
#
# + arg0 - The `Name` value required to map with the Java method parameter.
# + return - The `Object|NamingException` value returning from the Java mapping.
function InitialContext_doLookup(Name arg0) returns Object|NamingException {
    handle|error externalObj = javax_naming_InitialContext_doLookup(arg0.jObj);
    if (externalObj is error) {
        NamingException e = NamingException(NAMINGEXCEPTION, message = externalObj.message(), cause = externalObj);
        return e;
    } else { 
    Object obj = new(externalObj);
    return obj;
    }
}

# The function that maps to the `doLookup` method of `javax.naming.InitialContext`.
#
# + arg0 - The `string` value required to map with the Java method parameter.
# + return - The `Object|NamingException` value returning from the Java mapping.
function InitialContext_doLookup2(string arg0) returns Object|NamingException {
    handle|error externalObj = javax_naming_InitialContext_doLookup2(java:fromString(arg0));
    if (externalObj is error) {
        NamingException e = NamingException(NAMINGEXCEPTION, message = externalObj.message(), cause = externalObj);
        return e;
    } else { 
    Object obj = new(externalObj);
    return obj;
    }
}

# The function that retrieves the value of the public field INITIAL_CONTEXT_FACTORY.
#
# + return - The `string` value of the field.
function InitialContext_getINITIAL_CONTEXT_FACTORY() returns string? {
    
    return java:toString(javax_naming_InitialContext_getINITIAL_CONTEXT_FACTORY());
}

# The function that retrieves the value of the public field OBJECT_FACTORIES.
#
# + return - The `string` value of the field.
function InitialContext_getOBJECT_FACTORIES() returns string? {
    
    return java:toString(javax_naming_InitialContext_getOBJECT_FACTORIES());
}

# The function that retrieves the value of the public field STATE_FACTORIES.
#
# + return - The `string` value of the field.
function InitialContext_getSTATE_FACTORIES() returns string? {
    
    return java:toString(javax_naming_InitialContext_getSTATE_FACTORIES());
}

# The function that retrieves the value of the public field URL_PKG_PREFIXES.
#
# + return - The `string` value of the field.
function InitialContext_getURL_PKG_PREFIXES() returns string? {
    
    return java:toString(javax_naming_InitialContext_getURL_PKG_PREFIXES());
}

# The function that retrieves the value of the public field PROVIDER_URL.
#
# + return - The `string` value of the field.
function InitialContext_getPROVIDER_URL() returns string? {
    
    return java:toString(javax_naming_InitialContext_getPROVIDER_URL());
}

# The function that retrieves the value of the public field DNS_URL.
#
# + return - The `string` value of the field.
function InitialContext_getDNS_URL() returns string? {
    
    return java:toString(javax_naming_InitialContext_getDNS_URL());
}

# The function that retrieves the value of the public field AUTHORITATIVE.
#
# + return - The `string` value of the field.
function InitialContext_getAUTHORITATIVE() returns string? {
    
    return java:toString(javax_naming_InitialContext_getAUTHORITATIVE());
}

# The function that retrieves the value of the public field BATCHSIZE.
#
# + return - The `string` value of the field.
function InitialContext_getBATCHSIZE() returns string? {
    
    return java:toString(javax_naming_InitialContext_getBATCHSIZE());
}

# The function that retrieves the value of the public field REFERRAL.
#
# + return - The `string` value of the field.
function InitialContext_getREFERRAL() returns string? {
    
    return java:toString(javax_naming_InitialContext_getREFERRAL());
}

# The function that retrieves the value of the public field SECURITY_PROTOCOL.
#
# + return - The `string` value of the field.
function InitialContext_getSECURITY_PROTOCOL() returns string? {
    
    return java:toString(javax_naming_InitialContext_getSECURITY_PROTOCOL());
}

# The function that retrieves the value of the public field SECURITY_AUTHENTICATION.
#
# + return - The `string` value of the field.
function InitialContext_getSECURITY_AUTHENTICATION() returns string? {
    
    return java:toString(javax_naming_InitialContext_getSECURITY_AUTHENTICATION());
}

# The function that retrieves the value of the public field SECURITY_PRINCIPAL.
#
# + return - The `string` value of the field.
function InitialContext_getSECURITY_PRINCIPAL() returns string? {
    
    return java:toString(javax_naming_InitialContext_getSECURITY_PRINCIPAL());
}

# The function that retrieves the value of the public field SECURITY_CREDENTIALS.
#
# + return - The `string` value of the field.
function InitialContext_getSECURITY_CREDENTIALS() returns string? {
    
    return java:toString(javax_naming_InitialContext_getSECURITY_CREDENTIALS());
}

# The function that retrieves the value of the public field LANGUAGE.
#
# + return - The `string` value of the field.
function InitialContext_getLANGUAGE() returns string? {
    
    return java:toString(javax_naming_InitialContext_getLANGUAGE());
}

# The function that retrieves the value of the public field APPLET.
#
# + return - The `string` value of the field.
function InitialContext_getAPPLET() returns string? {
    
    return java:toString(javax_naming_InitialContext_getAPPLET());
}

// External interop functions for mapping public constructors.

function javax_naming_InitialContext_newInitialContext1() returns handle|error = @java:Constructor {
    'class: "javax.naming.InitialContext",
    paramTypes: []
} external;

function javax_naming_InitialContext_newInitialContext2(handle arg0) returns handle|error = @java:Constructor {
    'class: "javax.naming.InitialContext",
    paramTypes: ["java.util.Hashtable"]
} external;

// External interop functions for mapping public methods.

function javax_naming_InitialContext_addToEnvironment(handle receiver, handle arg0, handle arg1) returns handle|error = @java:Method {
    name: "addToEnvironment",
    'class: "javax.naming.InitialContext",
    paramTypes: ["java.lang.String", "java.lang.Object"]
} external;

function javax_naming_InitialContext_bind(handle receiver, handle arg0, handle arg1) returns error? = @java:Method {
    name: "bind",
    'class: "javax.naming.InitialContext",
    paramTypes: ["javax.naming.Name", "java.lang.Object"]
} external;

function javax_naming_InitialContext_bind2(handle receiver, handle arg0, handle arg1) returns error? = @java:Method {
    name: "bind",
    'class: "javax.naming.InitialContext",
    paramTypes: ["java.lang.String", "java.lang.Object"]
} external;

function javax_naming_InitialContext_close(handle receiver) returns error? = @java:Method {
    name: "close",
    'class: "javax.naming.InitialContext",
    paramTypes: []
} external;

function javax_naming_InitialContext_composeName(handle receiver, handle arg0, handle arg1) returns handle|error = @java:Method {
    name: "composeName",
    'class: "javax.naming.InitialContext",
    paramTypes: ["javax.naming.Name", "javax.naming.Name"]
} external;

function javax_naming_InitialContext_composeName2(handle receiver, handle arg0, handle arg1) returns handle|error = @java:Method {
    name: "composeName",
    'class: "javax.naming.InitialContext",
    paramTypes: ["java.lang.String", "java.lang.String"]
} external;

function javax_naming_InitialContext_createSubcontext(handle receiver, handle arg0) returns handle|error = @java:Method {
    name: "createSubcontext",
    'class: "javax.naming.InitialContext",
    paramTypes: ["javax.naming.Name"]
} external;

function javax_naming_InitialContext_createSubcontext2(handle receiver, handle arg0) returns handle|error = @java:Method {
    name: "createSubcontext",
    'class: "javax.naming.InitialContext",
    paramTypes: ["java.lang.String"]
} external;

function javax_naming_InitialContext_destroySubcontext(handle receiver, handle arg0) returns error? = @java:Method {
    name: "destroySubcontext",
    'class: "javax.naming.InitialContext",
    paramTypes: ["javax.naming.Name"]
} external;

function javax_naming_InitialContext_destroySubcontext2(handle receiver, handle arg0) returns error? = @java:Method {
    name: "destroySubcontext",
    'class: "javax.naming.InitialContext",
    paramTypes: ["java.lang.String"]
} external;

function javax_naming_InitialContext_doLookup(handle arg0) returns handle|error = @java:Method {
    name: "doLookup",
    'class: "javax.naming.InitialContext",
    paramTypes: ["javax.naming.Name"]
} external;

function javax_naming_InitialContext_doLookup2(handle arg0) returns handle|error = @java:Method {
    name: "doLookup",
    'class: "javax.naming.InitialContext",
    paramTypes: ["java.lang.String"]
} external;

function javax_naming_InitialContext_equals(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "equals",
    'class: "javax.naming.InitialContext",
    paramTypes: ["java.lang.Object"]
} external;

function javax_naming_InitialContext_getClass(handle receiver) returns handle = @java:Method {
    name: "getClass",
    'class: "javax.naming.InitialContext",
    paramTypes: []
} external;

function javax_naming_InitialContext_getEnvironment(handle receiver) returns handle|error = @java:Method {
    name: "getEnvironment",
    'class: "javax.naming.InitialContext",
    paramTypes: []
} external;

function javax_naming_InitialContext_getNameInNamespace(handle receiver) returns handle|error = @java:Method {
    name: "getNameInNamespace",
    'class: "javax.naming.InitialContext",
    paramTypes: []
} external;

function javax_naming_InitialContext_getNameParser(handle receiver, handle arg0) returns handle|error = @java:Method {
    name: "getNameParser",
    'class: "javax.naming.InitialContext",
    paramTypes: ["javax.naming.Name"]
} external;

function javax_naming_InitialContext_getNameParser2(handle receiver, handle arg0) returns handle|error = @java:Method {
    name: "getNameParser",
    'class: "javax.naming.InitialContext",
    paramTypes: ["java.lang.String"]
} external;

function javax_naming_InitialContext_hashCode(handle receiver) returns int = @java:Method {
    name: "hashCode",
    'class: "javax.naming.InitialContext",
    paramTypes: []
} external;

function javax_naming_InitialContext_list(handle receiver, handle arg0) returns handle|error = @java:Method {
    name: "list",
    'class: "javax.naming.InitialContext",
    paramTypes: ["javax.naming.Name"]
} external;

function javax_naming_InitialContext_list2(handle receiver, handle arg0) returns handle|error = @java:Method {
    name: "list",
    'class: "javax.naming.InitialContext",
    paramTypes: ["java.lang.String"]
} external;

function javax_naming_InitialContext_listBindings(handle receiver, handle arg0) returns handle|error = @java:Method {
    name: "listBindings",
    'class: "javax.naming.InitialContext",
    paramTypes: ["javax.naming.Name"]
} external;

function javax_naming_InitialContext_listBindings2(handle receiver, handle arg0) returns handle|error = @java:Method {
    name: "listBindings",
    'class: "javax.naming.InitialContext",
    paramTypes: ["java.lang.String"]
} external;

function javax_naming_InitialContext_lookup(handle receiver, handle arg0) returns handle|error = @java:Method {
    name: "lookup",
    'class: "javax.naming.InitialContext",
    paramTypes: ["javax.naming.Name"]
} external;

function javax_naming_InitialContext_lookup2(handle receiver, handle arg0) returns handle|error = @java:Method {
    name: "lookup",
    'class: "javax.naming.InitialContext",
    paramTypes: ["java.lang.String"]
} external;

function javax_naming_InitialContext_lookupLink(handle receiver, handle arg0) returns handle|error = @java:Method {
    name: "lookupLink",
    'class: "javax.naming.InitialContext",
    paramTypes: ["javax.naming.Name"]
} external;

function javax_naming_InitialContext_lookupLink2(handle receiver, handle arg0) returns handle|error = @java:Method {
    name: "lookupLink",
    'class: "javax.naming.InitialContext",
    paramTypes: ["java.lang.String"]
} external;

function javax_naming_InitialContext_notify(handle receiver) = @java:Method {
    name: "notify",
    'class: "javax.naming.InitialContext",
    paramTypes: []
} external;

function javax_naming_InitialContext_notifyAll(handle receiver) = @java:Method {
    name: "notifyAll",
    'class: "javax.naming.InitialContext",
    paramTypes: []
} external;

function javax_naming_InitialContext_rebind(handle receiver, handle arg0, handle arg1) returns error? = @java:Method {
    name: "rebind",
    'class: "javax.naming.InitialContext",
    paramTypes: ["javax.naming.Name", "java.lang.Object"]
} external;

function javax_naming_InitialContext_rebind2(handle receiver, handle arg0, handle arg1) returns error? = @java:Method {
    name: "rebind",
    'class: "javax.naming.InitialContext",
    paramTypes: ["java.lang.String", "java.lang.Object"]
} external;

function javax_naming_InitialContext_removeFromEnvironment(handle receiver, handle arg0) returns handle|error = @java:Method {
    name: "removeFromEnvironment",
    'class: "javax.naming.InitialContext",
    paramTypes: ["java.lang.String"]
} external;

function javax_naming_InitialContext_rename(handle receiver, handle arg0, handle arg1) returns error? = @java:Method {
    name: "rename",
    'class: "javax.naming.InitialContext",
    paramTypes: ["javax.naming.Name", "javax.naming.Name"]
} external;

function javax_naming_InitialContext_rename2(handle receiver, handle arg0, handle arg1) returns error? = @java:Method {
    name: "rename",
    'class: "javax.naming.InitialContext",
    paramTypes: ["java.lang.String", "java.lang.String"]
} external;

function javax_naming_InitialContext_unbind(handle receiver, handle arg0) returns error? = @java:Method {
    name: "unbind",
    'class: "javax.naming.InitialContext",
    paramTypes: ["javax.naming.Name"]
} external;

function javax_naming_InitialContext_unbind2(handle receiver, handle arg0) returns error? = @java:Method {
    name: "unbind",
    'class: "javax.naming.InitialContext",
    paramTypes: ["java.lang.String"]
} external;

function javax_naming_InitialContext_wait(handle receiver) returns error? = @java:Method {
    name: "wait",
    'class: "javax.naming.InitialContext",
    paramTypes: []
} external;

function javax_naming_InitialContext_wait2(handle receiver, int arg0) returns error? = @java:Method {
    name: "wait",
    'class: "javax.naming.InitialContext",
    paramTypes: ["long"]
} external;

function javax_naming_InitialContext_wait3(handle receiver, int arg0, int arg1) returns error? = @java:Method {
    name: "wait",
    'class: "javax.naming.InitialContext",
    paramTypes: ["long", "int"]
} external;

// External interop functions for mapping public fields.

function javax_naming_InitialContext_getINITIAL_CONTEXT_FACTORY() returns handle = @java:FieldGet {
    name: "INITIAL_CONTEXT_FACTORY",
    'class: "javax.naming.InitialContext"
} external;

function javax_naming_InitialContext_getOBJECT_FACTORIES() returns handle = @java:FieldGet {
    name: "OBJECT_FACTORIES",
    'class: "javax.naming.InitialContext"
} external;

function javax_naming_InitialContext_getSTATE_FACTORIES() returns handle = @java:FieldGet {
    name: "STATE_FACTORIES",
    'class: "javax.naming.InitialContext"
} external;

function javax_naming_InitialContext_getURL_PKG_PREFIXES() returns handle = @java:FieldGet {
    name: "URL_PKG_PREFIXES",
    'class: "javax.naming.InitialContext"
} external;

function javax_naming_InitialContext_getPROVIDER_URL() returns handle = @java:FieldGet {
    name: "PROVIDER_URL",
    'class: "javax.naming.InitialContext"
} external;

function javax_naming_InitialContext_getDNS_URL() returns handle = @java:FieldGet {
    name: "DNS_URL",
    'class: "javax.naming.InitialContext"
} external;

function javax_naming_InitialContext_getAUTHORITATIVE() returns handle = @java:FieldGet {
    name: "AUTHORITATIVE",
    'class: "javax.naming.InitialContext"
} external;

function javax_naming_InitialContext_getBATCHSIZE() returns handle = @java:FieldGet {
    name: "BATCHSIZE",
    'class: "javax.naming.InitialContext"
} external;

function javax_naming_InitialContext_getREFERRAL() returns handle = @java:FieldGet {
    name: "REFERRAL",
    'class: "javax.naming.InitialContext"
} external;

function javax_naming_InitialContext_getSECURITY_PROTOCOL() returns handle = @java:FieldGet {
    name: "SECURITY_PROTOCOL",
    'class: "javax.naming.InitialContext"
} external;

function javax_naming_InitialContext_getSECURITY_AUTHENTICATION() returns handle = @java:FieldGet {
    name: "SECURITY_AUTHENTICATION",
    'class: "javax.naming.InitialContext"
} external;

function javax_naming_InitialContext_getSECURITY_PRINCIPAL() returns handle = @java:FieldGet {
    name: "SECURITY_PRINCIPAL",
    'class: "javax.naming.InitialContext"
} external;

function javax_naming_InitialContext_getSECURITY_CREDENTIALS() returns handle = @java:FieldGet {
    name: "SECURITY_CREDENTIALS",
    'class: "javax.naming.InitialContext"
} external;

function javax_naming_InitialContext_getLANGUAGE() returns handle = @java:FieldGet {
    name: "LANGUAGE",
    'class: "javax.naming.InitialContext"
} external;

function javax_naming_InitialContext_getAPPLET() returns handle = @java:FieldGet {
    name: "APPLET",
    'class: "javax.naming.InitialContext"
} external;


