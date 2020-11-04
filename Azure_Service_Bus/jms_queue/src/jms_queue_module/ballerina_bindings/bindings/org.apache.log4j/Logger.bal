
import ballerina/java;
import ballerina/java.arrays as jarrays;

# Ballerina object mapping for Java class `org.apache.log4j.Logger`.
#
# + _Logger - The field that represents this Ballerina object, which is used for Java subtyping.
# + _Category - The field that represents the superclass object `Category`.
# + _Object - The field that represents the superclass object `Object`.
# + _AppenderAttachable - The field that represents the superclass object `AppenderAttachable`.
@java:Binding {
    'class: "org.apache.log4j.Logger"
}
class Logger {

    *java:JObject;

    LoggerT _Logger = LoggerT;
    CategoryT _Category = CategoryT;
    ObjectT _Object = ObjectT;
    AppenderAttachableT _AppenderAttachable = AppenderAttachableT;

    # The init function of the Ballerina object mapping `org.apache.log4j.Logger` Java class.
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

    # The function that maps to the `addAppender` method of `org.apache.log4j.Logger`.
    #
    # + arg0 - The `Appender` value required to map with the Java method parameter.
    function addAppender(Appender arg0) {
        () obj = org_apache_log4j_Logger_addAppender(self.jObj, arg0.jObj);
    }

    # The function that maps to the `assertLog` method of `org.apache.log4j.Logger`.
    #
    # + arg0 - The `boolean` value required to map with the Java method parameter.
    # + arg1 - The `string` value required to map with the Java method parameter.
    function assertLog(boolean arg0, string arg1) {
        () obj = org_apache_log4j_Logger_assertLog(self.jObj, arg0, java:fromString(arg1));
    }

    # The function that maps to the `callAppenders` method of `org.apache.log4j.Logger`.
    #
    # + arg0 - The `LoggingEvent` value required to map with the Java method parameter.
    function callAppenders(LoggingEvent arg0) {
        () obj = org_apache_log4j_Logger_callAppenders(self.jObj, arg0.jObj);
    }

    # The function that maps to the `debug` method of `org.apache.log4j.Logger`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    function debug(Object arg0) {
        () obj = org_apache_log4j_Logger_debug(self.jObj, arg0.jObj);
    }

    # The function that maps to the `debug` method of `org.apache.log4j.Logger`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + arg1 - The `Throwable` value required to map with the Java method parameter.
    function debug2(Object arg0, Throwable arg1) {
        () obj = org_apache_log4j_Logger_debug2(self.jObj, arg0.jObj, arg1.jObj);
    }

    # The function that maps to the `equals` method of `org.apache.log4j.Logger`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + return - The `boolean` value returning from the Java mapping.
    function 'equals(Object arg0) returns boolean {
        boolean externalObj = org_apache_log4j_Logger_equals(self.jObj, arg0.jObj);
        return externalObj;
    }

    # The function that maps to the `error` method of `org.apache.log4j.Logger`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    function 'error(Object arg0) {
        () obj = org_apache_log4j_Logger_error(self.jObj, arg0.jObj);
    }

    # The function that maps to the `error` method of `org.apache.log4j.Logger`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + arg1 - The `Throwable` value required to map with the Java method parameter.
    function 'error2(Object arg0, Throwable arg1) {
        () obj = org_apache_log4j_Logger_error2(self.jObj, arg0.jObj, arg1.jObj);
    }

    # The function that maps to the `fatal` method of `org.apache.log4j.Logger`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    function fatal(Object arg0) {
        () obj = org_apache_log4j_Logger_fatal(self.jObj, arg0.jObj);
    }

    # The function that maps to the `fatal` method of `org.apache.log4j.Logger`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + arg1 - The `Throwable` value required to map with the Java method parameter.
    function fatal2(Object arg0, Throwable arg1) {
        () obj = org_apache_log4j_Logger_fatal2(self.jObj, arg0.jObj, arg1.jObj);
    }

    # The function that maps to the `getAdditivity` method of `org.apache.log4j.Logger`.
    # 
    # + return - The `boolean` value returning from the Java mapping.
    function getAdditivity() returns boolean {
        boolean externalObj = org_apache_log4j_Logger_getAdditivity(self.jObj);
        return externalObj;
    }

    # The function that maps to the `getAllAppenders` method of `org.apache.log4j.Logger`.
    # 
    # + return - The `Enumeration` value returning from the Java mapping.
    function getAllAppenders() returns Enumeration {
        handle externalObj = org_apache_log4j_Logger_getAllAppenders(self.jObj);
        Enumeration obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `getAppender` method of `org.apache.log4j.Logger`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `Appender` value returning from the Java mapping.
    function getAppender(string arg0) returns Appender {
        handle externalObj = org_apache_log4j_Logger_getAppender(self.jObj, java:fromString(arg0));
        Appender obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `getChainedPriority` method of `org.apache.log4j.Logger`.
    # 
    # + return - The `Priority` value returning from the Java mapping.
    function getChainedPriority() returns Priority {
        handle externalObj = org_apache_log4j_Logger_getChainedPriority(self.jObj);
        Priority obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `getClass` method of `org.apache.log4j.Logger`.
    # 
    # + return - The `Class` value returning from the Java mapping.
    function getClass() returns Class {
        handle externalObj = org_apache_log4j_Logger_getClass(self.jObj);
        Class obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `getEffectiveLevel` method of `org.apache.log4j.Logger`.
    # 
    # + return - The `Level` value returning from the Java mapping.
    function getEffectiveLevel() returns Level {
        handle externalObj = org_apache_log4j_Logger_getEffectiveLevel(self.jObj);
        Level obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `getHierarchy` method of `org.apache.log4j.Logger`.
    # 
    # + return - The `LoggerRepository` value returning from the Java mapping.
    function getHierarchy() returns LoggerRepository {
        handle externalObj = org_apache_log4j_Logger_getHierarchy(self.jObj);
        LoggerRepository obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `getLevel` method of `org.apache.log4j.Logger`.
    # 
    # + return - The `Level` value returning from the Java mapping.
    function getLevel() returns Level {
        handle externalObj = org_apache_log4j_Logger_getLevel(self.jObj);
        Level obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `getLoggerRepository` method of `org.apache.log4j.Logger`.
    # 
    # + return - The `LoggerRepository` value returning from the Java mapping.
    function getLoggerRepository() returns LoggerRepository {
        handle externalObj = org_apache_log4j_Logger_getLoggerRepository(self.jObj);
        LoggerRepository obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `getName` method of `org.apache.log4j.Logger`.
    # 
    # + return - The `string?` value returning from the Java mapping.
    function getName() returns string? {
        handle externalObj = org_apache_log4j_Logger_getName(self.jObj);
        return java:toString(externalObj);
    }

    # The function that maps to the `getParent` method of `org.apache.log4j.Logger`.
    # 
    # + return - The `Category` value returning from the Java mapping.
    function getParent() returns Category {
        handle externalObj = org_apache_log4j_Logger_getParent(self.jObj);
        Category obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `getPriority` method of `org.apache.log4j.Logger`.
    # 
    # + return - The `Level` value returning from the Java mapping.
    function getPriority() returns Level {
        handle externalObj = org_apache_log4j_Logger_getPriority(self.jObj);
        Level obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `getResourceBundle` method of `org.apache.log4j.Logger`.
    # 
    # + return - The `ResourceBundle` value returning from the Java mapping.
    function getResourceBundle() returns ResourceBundle {
        handle externalObj = org_apache_log4j_Logger_getResourceBundle(self.jObj);
        ResourceBundle obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `hashCode` method of `org.apache.log4j.Logger`.
    # 
    # + return - The `int` value returning from the Java mapping.
    function hashCode() returns int {
        int externalObj = org_apache_log4j_Logger_hashCode(self.jObj);
        return externalObj;
    }

    # The function that maps to the `info` method of `org.apache.log4j.Logger`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    function info(Object arg0) {
        () obj = org_apache_log4j_Logger_info(self.jObj, arg0.jObj);
    }

    # The function that maps to the `info` method of `org.apache.log4j.Logger`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + arg1 - The `Throwable` value required to map with the Java method parameter.
    function info2(Object arg0, Throwable arg1) {
        () obj = org_apache_log4j_Logger_info2(self.jObj, arg0.jObj, arg1.jObj);
    }

    # The function that maps to the `isAttached` method of `org.apache.log4j.Logger`.
    #
    # + arg0 - The `Appender` value required to map with the Java method parameter.
    # + return - The `boolean` value returning from the Java mapping.
    function isAttached(Appender arg0) returns boolean {
        boolean externalObj = org_apache_log4j_Logger_isAttached(self.jObj, arg0.jObj);
        return externalObj;
    }

    # The function that maps to the `isDebugEnabled` method of `org.apache.log4j.Logger`.
    # 
    # + return - The `boolean` value returning from the Java mapping.
    function isDebugEnabled() returns boolean {
        boolean externalObj = org_apache_log4j_Logger_isDebugEnabled(self.jObj);
        return externalObj;
    }

    # The function that maps to the `isEnabledFor` method of `org.apache.log4j.Logger`.
    #
    # + arg0 - The `Priority` value required to map with the Java method parameter.
    # + return - The `boolean` value returning from the Java mapping.
    function isEnabledFor(Priority arg0) returns boolean {
        boolean externalObj = org_apache_log4j_Logger_isEnabledFor(self.jObj, arg0.jObj);
        return externalObj;
    }

    # The function that maps to the `isInfoEnabled` method of `org.apache.log4j.Logger`.
    # 
    # + return - The `boolean` value returning from the Java mapping.
    function isInfoEnabled() returns boolean {
        boolean externalObj = org_apache_log4j_Logger_isInfoEnabled(self.jObj);
        return externalObj;
    }

    # The function that maps to the `l7dlog` method of `org.apache.log4j.Logger`.
    #
    # + arg0 - The `Priority` value required to map with the Java method parameter.
    # + arg1 - The `string` value required to map with the Java method parameter.
    # + arg2 - The `Object[]` value required to map with the Java method parameter.
    # + arg3 - The `Throwable` value required to map with the Java method parameter.
    # + return - The `error?` value returning from the Java mapping.
    function l7dlog(Priority arg0, string arg1, Object[] arg2, Throwable arg3) returns error? {
        error|() obj = org_apache_log4j_Logger_l7dlog(self.jObj, arg0.jObj, java:fromString(arg1), check jarrays:toHandle(arg2, "java.lang.Object"), arg3.jObj);
        if (obj is error) {
            return obj;
        }
    }

    # The function that maps to the `l7dlog` method of `org.apache.log4j.Logger`.
    #
    # + arg0 - The `Priority` value required to map with the Java method parameter.
    # + arg1 - The `string` value required to map with the Java method parameter.
    # + arg2 - The `Throwable` value required to map with the Java method parameter.
    function l7dlog2(Priority arg0, string arg1, Throwable arg2) {
        () obj = org_apache_log4j_Logger_l7dlog2(self.jObj, arg0.jObj, java:fromString(arg1), arg2.jObj);
    }

    # The function that maps to the `log` method of `org.apache.log4j.Logger`.
    #
    # + arg0 - The `Priority` value required to map with the Java method parameter.
    # + arg1 - The `Object` value required to map with the Java method parameter.
    function log(Priority arg0, Object arg1) {
        () obj = org_apache_log4j_Logger_log(self.jObj, arg0.jObj, arg1.jObj);
    }

    # The function that maps to the `log` method of `org.apache.log4j.Logger`.
    #
    # + arg0 - The `Priority` value required to map with the Java method parameter.
    # + arg1 - The `Object` value required to map with the Java method parameter.
    # + arg2 - The `Throwable` value required to map with the Java method parameter.
    function log2(Priority arg0, Object arg1, Throwable arg2) {
        () obj = org_apache_log4j_Logger_log2(self.jObj, arg0.jObj, arg1.jObj, arg2.jObj);
    }

    # The function that maps to the `log` method of `org.apache.log4j.Logger`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + arg1 - The `Priority` value required to map with the Java method parameter.
    # + arg2 - The `Object` value required to map with the Java method parameter.
    # + arg3 - The `Throwable` value required to map with the Java method parameter.
    function log3(string arg0, Priority arg1, Object arg2, Throwable arg3) {
        () obj = org_apache_log4j_Logger_log3(self.jObj, java:fromString(arg0), arg1.jObj, arg2.jObj, arg3.jObj);
    }

    # The function that maps to the `notify` method of `org.apache.log4j.Logger`.
    function notify() {
        () obj = org_apache_log4j_Logger_notify(self.jObj);
    }

    # The function that maps to the `notifyAll` method of `org.apache.log4j.Logger`.
    function notifyAll() {
        () obj = org_apache_log4j_Logger_notifyAll(self.jObj);
    }

    # The function that maps to the `removeAllAppenders` method of `org.apache.log4j.Logger`.
    function removeAllAppenders() {
        () obj = org_apache_log4j_Logger_removeAllAppenders(self.jObj);
    }

    # The function that maps to the `removeAppender` method of `org.apache.log4j.Logger`.
    #
    # + arg0 - The `Appender` value required to map with the Java method parameter.
    function removeAppender(Appender arg0) {
        () obj = org_apache_log4j_Logger_removeAppender(self.jObj, arg0.jObj);
    }

    # The function that maps to the `removeAppender` method of `org.apache.log4j.Logger`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    function removeAppender2(string arg0) {
        () obj = org_apache_log4j_Logger_removeAppender2(self.jObj, java:fromString(arg0));
    }

    # The function that maps to the `setAdditivity` method of `org.apache.log4j.Logger`.
    #
    # + arg0 - The `boolean` value required to map with the Java method parameter.
    function setAdditivity(boolean arg0) {
        () obj = org_apache_log4j_Logger_setAdditivity(self.jObj, arg0);
    }

    # The function that maps to the `setLevel` method of `org.apache.log4j.Logger`.
    #
    # + arg0 - The `Level` value required to map with the Java method parameter.
    function setLevel(Level arg0) {
        () obj = org_apache_log4j_Logger_setLevel(self.jObj, arg0.jObj);
    }

    # The function that maps to the `setPriority` method of `org.apache.log4j.Logger`.
    #
    # + arg0 - The `Priority` value required to map with the Java method parameter.
    function setPriority(Priority arg0) {
        () obj = org_apache_log4j_Logger_setPriority(self.jObj, arg0.jObj);
    }

    # The function that maps to the `setResourceBundle` method of `org.apache.log4j.Logger`.
    #
    # + arg0 - The `ResourceBundle` value required to map with the Java method parameter.
    function setResourceBundle(ResourceBundle arg0) {
        () obj = org_apache_log4j_Logger_setResourceBundle(self.jObj, arg0.jObj);
    }

    # The function that maps to the `wait` method of `org.apache.log4j.Logger`.
    # 
    # + return - The `error?` value returning from the Java mapping.
    function 'wait() returns error? {
        error|() obj = org_apache_log4j_Logger_wait(self.jObj);
        if (obj is error) {
            InterruptedException e = InterruptedException(INTERRUPTEDEXCEPTION, message = obj.message(), cause = obj);
            return e;
        }
    }

    # The function that maps to the `wait` method of `org.apache.log4j.Logger`.
    #
    # + arg0 - The `int` value required to map with the Java method parameter.
    # + return - The `error?` value returning from the Java mapping.
    function 'wait2(int arg0) returns error? {
        error|() obj = org_apache_log4j_Logger_wait2(self.jObj, arg0);
        if (obj is error) {
            InterruptedException e = InterruptedException(INTERRUPTEDEXCEPTION, message = obj.message(), cause = obj);
            return e;
        }
    }

    # The function that maps to the `wait` method of `org.apache.log4j.Logger`.
    #
    # + arg0 - The `int` value required to map with the Java method parameter.
    # + arg1 - The `int` value required to map with the Java method parameter.
    # + return - The `error?` value returning from the Java mapping.
    function 'wait3(int arg0, int arg1) returns error? {
        error|() obj = org_apache_log4j_Logger_wait3(self.jObj, arg0, arg1);
        if (obj is error) {
            InterruptedException e = InterruptedException(INTERRUPTEDEXCEPTION, message = obj.message(), cause = obj);
            return e;
        }
    }

    # The function that maps to the `warn` method of `org.apache.log4j.Logger`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    function warn(Object arg0) {
        () obj = org_apache_log4j_Logger_warn(self.jObj, arg0.jObj);
    }

    # The function that maps to the `warn` method of `org.apache.log4j.Logger`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + arg1 - The `Throwable` value required to map with the Java method parameter.
    function warn2(Object arg0, Throwable arg1) {
        () obj = org_apache_log4j_Logger_warn2(self.jObj, arg0.jObj, arg1.jObj);
    }
}

# The function that maps to the `exists` method of `org.apache.log4j.Logger`.
#
# + arg0 - The `string` value required to map with the Java method parameter.
# + return - The `Logger` value returning from the Java mapping.
function Logger_exists(string arg0) returns Logger {
    handle externalObj = org_apache_log4j_Logger_exists(java:fromString(arg0));
    Logger obj = new(externalObj);
    return obj;
}

# The function that maps to the `getCurrentCategories` method of `org.apache.log4j.Logger`.
# 
# + return - The `Enumeration` value returning from the Java mapping.
function Logger_getCurrentCategories() returns Enumeration {
    handle externalObj = org_apache_log4j_Logger_getCurrentCategories();
    Enumeration obj = new(externalObj);
    return obj;
}

# The function that maps to the `getDefaultHierarchy` method of `org.apache.log4j.Logger`.
# 
# + return - The `LoggerRepository` value returning from the Java mapping.
function Logger_getDefaultHierarchy() returns LoggerRepository {
    handle externalObj = org_apache_log4j_Logger_getDefaultHierarchy();
    LoggerRepository obj = new(externalObj);
    return obj;
}

# The function that maps to the `getInstance` method of `org.apache.log4j.Logger`.
#
# + arg0 - The `Class` value required to map with the Java method parameter.
# + return - The `Category` value returning from the Java mapping.
function Logger_getInstance(Class arg0) returns Category {
    handle externalObj = org_apache_log4j_Logger_getInstance(arg0.jObj);
    Category obj = new(externalObj);
    return obj;
}

# The function that maps to the `getInstance` method of `org.apache.log4j.Logger`.
#
# + arg0 - The `string` value required to map with the Java method parameter.
# + return - The `Category` value returning from the Java mapping.
function Logger_getInstance2(string arg0) returns Category {
    handle externalObj = org_apache_log4j_Logger_getInstance2(java:fromString(arg0));
    Category obj = new(externalObj);
    return obj;
}

# The function that maps to the `getLogger` method of `org.apache.log4j.Logger`.
#
# + arg0 - The `Class` value required to map with the Java method parameter.
# + return - The `Logger` value returning from the Java mapping.
function Logger_getLogger(Class arg0) returns Logger {
    handle externalObj = org_apache_log4j_Logger_getLogger(arg0.jObj);
    Logger obj = new(externalObj);
    return obj;
}

# The function that maps to the `getLogger` method of `org.apache.log4j.Logger`.
#
# + arg0 - The `string` value required to map with the Java method parameter.
# + return - The `Logger` value returning from the Java mapping.
function Logger_getLogger2(string arg0) returns Logger {
    handle externalObj = org_apache_log4j_Logger_getLogger2(java:fromString(arg0));
    Logger obj = new(externalObj);
    return obj;
}

# The function that maps to the `getLogger` method of `org.apache.log4j.Logger`.
#
# + arg0 - The `string` value required to map with the Java method parameter.
# + arg1 - The `LoggerFactory` value required to map with the Java method parameter.
# + return - The `Logger` value returning from the Java mapping.
function Logger_getLogger3(string arg0, LoggerFactory arg1) returns Logger {
    handle externalObj = org_apache_log4j_Logger_getLogger3(java:fromString(arg0), arg1.jObj);
    Logger obj = new(externalObj);
    return obj;
}

# The function that maps to the `getRoot` method of `org.apache.log4j.Logger`.
# 
# + return - The `Category` value returning from the Java mapping.
function Logger_getRoot() returns Category {
    handle externalObj = org_apache_log4j_Logger_getRoot();
    Category obj = new(externalObj);
    return obj;
}

# The function that maps to the `getRootLogger` method of `org.apache.log4j.Logger`.
# 
# + return - The `Logger` value returning from the Java mapping.
function Logger_getRootLogger() returns Logger {
    handle externalObj = org_apache_log4j_Logger_getRootLogger();
    Logger obj = new(externalObj);
    return obj;
}

# The function that maps to the `shutdown` method of `org.apache.log4j.Logger`.
function Logger_shutdown() {
    () obj = org_apache_log4j_Logger_shutdown();
}

// External interop functions for mapping public methods.

function org_apache_log4j_Logger_addAppender(handle receiver, handle arg0) = @java:Method {
    name: "addAppender",
    'class: "org.apache.log4j.Logger",
    paramTypes: ["org.apache.log4j.Appender"]
} external;

function org_apache_log4j_Logger_assertLog(handle receiver, boolean arg0, handle arg1) = @java:Method {
    name: "assertLog",
    'class: "org.apache.log4j.Logger",
    paramTypes: ["boolean", "java.lang.String"]
} external;

function org_apache_log4j_Logger_callAppenders(handle receiver, handle arg0) = @java:Method {
    name: "callAppenders",
    'class: "org.apache.log4j.Logger",
    paramTypes: ["org.apache.log4j.spi.LoggingEvent"]
} external;

function org_apache_log4j_Logger_debug(handle receiver, handle arg0) = @java:Method {
    name: "debug",
    'class: "org.apache.log4j.Logger",
    paramTypes: ["java.lang.Object"]
} external;

function org_apache_log4j_Logger_debug2(handle receiver, handle arg0, handle arg1) = @java:Method {
    name: "debug",
    'class: "org.apache.log4j.Logger",
    paramTypes: ["java.lang.Object", "java.lang.Throwable"]
} external;

function org_apache_log4j_Logger_equals(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "equals",
    'class: "org.apache.log4j.Logger",
    paramTypes: ["java.lang.Object"]
} external;

function org_apache_log4j_Logger_error(handle receiver, handle arg0) = @java:Method {
    name: "error",
    'class: "org.apache.log4j.Logger",
    paramTypes: ["java.lang.Object"]
} external;

function org_apache_log4j_Logger_error2(handle receiver, handle arg0, handle arg1) = @java:Method {
    name: "error",
    'class: "org.apache.log4j.Logger",
    paramTypes: ["java.lang.Object", "java.lang.Throwable"]
} external;

function org_apache_log4j_Logger_exists(handle arg0) returns handle = @java:Method {
    name: "exists",
    'class: "org.apache.log4j.Logger",
    paramTypes: ["java.lang.String"]
} external;

function org_apache_log4j_Logger_fatal(handle receiver, handle arg0) = @java:Method {
    name: "fatal",
    'class: "org.apache.log4j.Logger",
    paramTypes: ["java.lang.Object"]
} external;

function org_apache_log4j_Logger_fatal2(handle receiver, handle arg0, handle arg1) = @java:Method {
    name: "fatal",
    'class: "org.apache.log4j.Logger",
    paramTypes: ["java.lang.Object", "java.lang.Throwable"]
} external;

function org_apache_log4j_Logger_getAdditivity(handle receiver) returns boolean = @java:Method {
    name: "getAdditivity",
    'class: "org.apache.log4j.Logger",
    paramTypes: []
} external;

function org_apache_log4j_Logger_getAllAppenders(handle receiver) returns handle = @java:Method {
    name: "getAllAppenders",
    'class: "org.apache.log4j.Logger",
    paramTypes: []
} external;

function org_apache_log4j_Logger_getAppender(handle receiver, handle arg0) returns handle = @java:Method {
    name: "getAppender",
    'class: "org.apache.log4j.Logger",
    paramTypes: ["java.lang.String"]
} external;

function org_apache_log4j_Logger_getChainedPriority(handle receiver) returns handle = @java:Method {
    name: "getChainedPriority",
    'class: "org.apache.log4j.Logger",
    paramTypes: []
} external;

function org_apache_log4j_Logger_getClass(handle receiver) returns handle = @java:Method {
    name: "getClass",
    'class: "org.apache.log4j.Logger",
    paramTypes: []
} external;

function org_apache_log4j_Logger_getCurrentCategories() returns handle = @java:Method {
    name: "getCurrentCategories",
    'class: "org.apache.log4j.Logger",
    paramTypes: []
} external;

function org_apache_log4j_Logger_getDefaultHierarchy() returns handle = @java:Method {
    name: "getDefaultHierarchy",
    'class: "org.apache.log4j.Logger",
    paramTypes: []
} external;

function org_apache_log4j_Logger_getEffectiveLevel(handle receiver) returns handle = @java:Method {
    name: "getEffectiveLevel",
    'class: "org.apache.log4j.Logger",
    paramTypes: []
} external;

function org_apache_log4j_Logger_getHierarchy(handle receiver) returns handle = @java:Method {
    name: "getHierarchy",
    'class: "org.apache.log4j.Logger",
    paramTypes: []
} external;

function org_apache_log4j_Logger_getInstance(handle arg0) returns handle = @java:Method {
    name: "getInstance",
    'class: "org.apache.log4j.Logger",
    paramTypes: ["java.lang.Class"]
} external;

function org_apache_log4j_Logger_getInstance2(handle arg0) returns handle = @java:Method {
    name: "getInstance",
    'class: "org.apache.log4j.Logger",
    paramTypes: ["java.lang.String"]
} external;

function org_apache_log4j_Logger_getLevel(handle receiver) returns handle = @java:Method {
    name: "getLevel",
    'class: "org.apache.log4j.Logger",
    paramTypes: []
} external;

function org_apache_log4j_Logger_getLogger(handle arg0) returns handle = @java:Method {
    name: "getLogger",
    'class: "org.apache.log4j.Logger",
    paramTypes: ["java.lang.Class"]
} external;

function org_apache_log4j_Logger_getLogger2(handle arg0) returns handle = @java:Method {
    name: "getLogger",
    'class: "org.apache.log4j.Logger",
    paramTypes: ["java.lang.String"]
} external;

function org_apache_log4j_Logger_getLogger3(handle arg0, handle arg1) returns handle = @java:Method {
    name: "getLogger",
    'class: "org.apache.log4j.Logger",
    paramTypes: ["java.lang.String", "org.apache.log4j.spi.LoggerFactory"]
} external;

function org_apache_log4j_Logger_getLoggerRepository(handle receiver) returns handle = @java:Method {
    name: "getLoggerRepository",
    'class: "org.apache.log4j.Logger",
    paramTypes: []
} external;

function org_apache_log4j_Logger_getName(handle receiver) returns handle = @java:Method {
    name: "getName",
    'class: "org.apache.log4j.Logger",
    paramTypes: []
} external;

function org_apache_log4j_Logger_getParent(handle receiver) returns handle = @java:Method {
    name: "getParent",
    'class: "org.apache.log4j.Logger",
    paramTypes: []
} external;

function org_apache_log4j_Logger_getPriority(handle receiver) returns handle = @java:Method {
    name: "getPriority",
    'class: "org.apache.log4j.Logger",
    paramTypes: []
} external;

function org_apache_log4j_Logger_getResourceBundle(handle receiver) returns handle = @java:Method {
    name: "getResourceBundle",
    'class: "org.apache.log4j.Logger",
    paramTypes: []
} external;

function org_apache_log4j_Logger_getRoot() returns handle = @java:Method {
    name: "getRoot",
    'class: "org.apache.log4j.Logger",
    paramTypes: []
} external;

function org_apache_log4j_Logger_getRootLogger() returns handle = @java:Method {
    name: "getRootLogger",
    'class: "org.apache.log4j.Logger",
    paramTypes: []
} external;

function org_apache_log4j_Logger_hashCode(handle receiver) returns int = @java:Method {
    name: "hashCode",
    'class: "org.apache.log4j.Logger",
    paramTypes: []
} external;

function org_apache_log4j_Logger_info(handle receiver, handle arg0) = @java:Method {
    name: "info",
    'class: "org.apache.log4j.Logger",
    paramTypes: ["java.lang.Object"]
} external;

function org_apache_log4j_Logger_info2(handle receiver, handle arg0, handle arg1) = @java:Method {
    name: "info",
    'class: "org.apache.log4j.Logger",
    paramTypes: ["java.lang.Object", "java.lang.Throwable"]
} external;

function org_apache_log4j_Logger_isAttached(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "isAttached",
    'class: "org.apache.log4j.Logger",
    paramTypes: ["org.apache.log4j.Appender"]
} external;

function org_apache_log4j_Logger_isDebugEnabled(handle receiver) returns boolean = @java:Method {
    name: "isDebugEnabled",
    'class: "org.apache.log4j.Logger",
    paramTypes: []
} external;

function org_apache_log4j_Logger_isEnabledFor(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "isEnabledFor",
    'class: "org.apache.log4j.Logger",
    paramTypes: ["org.apache.log4j.Priority"]
} external;

function org_apache_log4j_Logger_isInfoEnabled(handle receiver) returns boolean = @java:Method {
    name: "isInfoEnabled",
    'class: "org.apache.log4j.Logger",
    paramTypes: []
} external;

function org_apache_log4j_Logger_l7dlog(handle receiver, handle arg0, handle arg1, handle arg2, handle arg3) = @java:Method {
    name: "l7dlog",
    'class: "org.apache.log4j.Logger",
    paramTypes: ["org.apache.log4j.Priority", "java.lang.String", "[Ljava.lang.Object;", "java.lang.Throwable"]
} external;

function org_apache_log4j_Logger_l7dlog2(handle receiver, handle arg0, handle arg1, handle arg2) = @java:Method {
    name: "l7dlog",
    'class: "org.apache.log4j.Logger",
    paramTypes: ["org.apache.log4j.Priority", "java.lang.String", "java.lang.Throwable"]
} external;

function org_apache_log4j_Logger_log(handle receiver, handle arg0, handle arg1) = @java:Method {
    name: "log",
    'class: "org.apache.log4j.Logger",
    paramTypes: ["org.apache.log4j.Priority", "java.lang.Object"]
} external;

function org_apache_log4j_Logger_log2(handle receiver, handle arg0, handle arg1, handle arg2) = @java:Method {
    name: "log",
    'class: "org.apache.log4j.Logger",
    paramTypes: ["org.apache.log4j.Priority", "java.lang.Object", "java.lang.Throwable"]
} external;

function org_apache_log4j_Logger_log3(handle receiver, handle arg0, handle arg1, handle arg2, handle arg3) = @java:Method {
    name: "log",
    'class: "org.apache.log4j.Logger",
    paramTypes: ["java.lang.String", "org.apache.log4j.Priority", "java.lang.Object", "java.lang.Throwable"]
} external;

function org_apache_log4j_Logger_notify(handle receiver) = @java:Method {
    name: "notify",
    'class: "org.apache.log4j.Logger",
    paramTypes: []
} external;

function org_apache_log4j_Logger_notifyAll(handle receiver) = @java:Method {
    name: "notifyAll",
    'class: "org.apache.log4j.Logger",
    paramTypes: []
} external;

function org_apache_log4j_Logger_removeAllAppenders(handle receiver) = @java:Method {
    name: "removeAllAppenders",
    'class: "org.apache.log4j.Logger",
    paramTypes: []
} external;

function org_apache_log4j_Logger_removeAppender(handle receiver, handle arg0) = @java:Method {
    name: "removeAppender",
    'class: "org.apache.log4j.Logger",
    paramTypes: ["org.apache.log4j.Appender"]
} external;

function org_apache_log4j_Logger_removeAppender2(handle receiver, handle arg0) = @java:Method {
    name: "removeAppender",
    'class: "org.apache.log4j.Logger",
    paramTypes: ["java.lang.String"]
} external;

function org_apache_log4j_Logger_setAdditivity(handle receiver, boolean arg0) = @java:Method {
    name: "setAdditivity",
    'class: "org.apache.log4j.Logger",
    paramTypes: ["boolean"]
} external;

function org_apache_log4j_Logger_setLevel(handle receiver, handle arg0) = @java:Method {
    name: "setLevel",
    'class: "org.apache.log4j.Logger",
    paramTypes: ["org.apache.log4j.Level"]
} external;

function org_apache_log4j_Logger_setPriority(handle receiver, handle arg0) = @java:Method {
    name: "setPriority",
    'class: "org.apache.log4j.Logger",
    paramTypes: ["org.apache.log4j.Priority"]
} external;

function org_apache_log4j_Logger_setResourceBundle(handle receiver, handle arg0) = @java:Method {
    name: "setResourceBundle",
    'class: "org.apache.log4j.Logger",
    paramTypes: ["java.util.ResourceBundle"]
} external;

function org_apache_log4j_Logger_shutdown() = @java:Method {
    name: "shutdown",
    'class: "org.apache.log4j.Logger",
    paramTypes: []
} external;

function org_apache_log4j_Logger_wait(handle receiver) returns error? = @java:Method {
    name: "wait",
    'class: "org.apache.log4j.Logger",
    paramTypes: []
} external;

function org_apache_log4j_Logger_wait2(handle receiver, int arg0) returns error? = @java:Method {
    name: "wait",
    'class: "org.apache.log4j.Logger",
    paramTypes: ["long"]
} external;

function org_apache_log4j_Logger_wait3(handle receiver, int arg0, int arg1) returns error? = @java:Method {
    name: "wait",
    'class: "org.apache.log4j.Logger",
    paramTypes: ["long", "int"]
} external;

function org_apache_log4j_Logger_warn(handle receiver, handle arg0) = @java:Method {
    name: "warn",
    'class: "org.apache.log4j.Logger",
    paramTypes: ["java.lang.Object"]
} external;

function org_apache_log4j_Logger_warn2(handle receiver, handle arg0, handle arg1) = @java:Method {
    name: "warn",
    'class: "org.apache.log4j.Logger",
    paramTypes: ["java.lang.Object", "java.lang.Throwable"]
} external;


