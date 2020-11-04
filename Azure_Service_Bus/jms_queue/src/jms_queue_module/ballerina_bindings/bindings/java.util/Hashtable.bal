
import ballerina/java;

# Ballerina object mapping for Java class `java.util.Hashtable`.
#
# + _Hashtable - The field that represents this Ballerina object, which is used for Java subtyping.
# + _Dictionary - The field that represents the superclass object `Dictionary`.
# + _Serializable - The field that represents the superclass object `Serializable`.
# + _Cloneable - The field that represents the superclass object `Cloneable`.
# + _Object - The field that represents the superclass object `Object`.
# + _Map - The field that represents the superclass object `Map`.
@java:Binding {
    'class: "java.util.Hashtable"
}
class Hashtable {

    *java:JObject;

    HashtableT _Hashtable = HashtableT;
    DictionaryT _Dictionary = DictionaryT;
    SerializableT _Serializable = SerializableT;
    CloneableT _Cloneable = CloneableT;
    ObjectT _Object = ObjectT;
    MapT _Map = MapT;

    # The init function of the Ballerina object mapping `java.util.Hashtable` Java class.
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

    # The function that maps to the `clear` method of `java.util.Hashtable`.
    function clear() {
        () obj = java_util_Hashtable_clear(self.jObj);
    }

    # The function that maps to the `clone` method of `java.util.Hashtable`.
    # 
    # + return - The `Object` value returning from the Java mapping.
    function clone() returns Object {
        handle externalObj = java_util_Hashtable_clone(self.jObj);
        Object obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `compute` method of `java.util.Hashtable`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + arg1 - The `BiFunction` value required to map with the Java method parameter.
    # + return - The `Object` value returning from the Java mapping.
    function compute(Object arg0, BiFunction arg1) returns Object {
        handle externalObj = java_util_Hashtable_compute(self.jObj, arg0.jObj, arg1.jObj);
        Object obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `computeIfAbsent` method of `java.util.Hashtable`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + arg1 - The `Function` value required to map with the Java method parameter.
    # + return - The `Object` value returning from the Java mapping.
    function computeIfAbsent(Object arg0, Function arg1) returns Object {
        handle externalObj = java_util_Hashtable_computeIfAbsent(self.jObj, arg0.jObj, arg1.jObj);
        Object obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `computeIfPresent` method of `java.util.Hashtable`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + arg1 - The `BiFunction` value required to map with the Java method parameter.
    # + return - The `Object` value returning from the Java mapping.
    function computeIfPresent(Object arg0, BiFunction arg1) returns Object {
        handle externalObj = java_util_Hashtable_computeIfPresent(self.jObj, arg0.jObj, arg1.jObj);
        Object obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `contains` method of `java.util.Hashtable`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + return - The `boolean` value returning from the Java mapping.
    function contains(Object arg0) returns boolean {
        boolean externalObj = java_util_Hashtable_contains(self.jObj, arg0.jObj);
        return externalObj;
    }

    # The function that maps to the `containsKey` method of `java.util.Hashtable`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + return - The `boolean` value returning from the Java mapping.
    function containsKey(Object arg0) returns boolean {
        boolean externalObj = java_util_Hashtable_containsKey(self.jObj, arg0.jObj);
        return externalObj;
    }

    # The function that maps to the `containsValue` method of `java.util.Hashtable`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + return - The `boolean` value returning from the Java mapping.
    function containsValue(Object arg0) returns boolean {
        boolean externalObj = java_util_Hashtable_containsValue(self.jObj, arg0.jObj);
        return externalObj;
    }

    # The function that maps to the `elements` method of `java.util.Hashtable`.
    # 
    # + return - The `Enumeration` value returning from the Java mapping.
    function elements() returns Enumeration {
        handle externalObj = java_util_Hashtable_elements(self.jObj);
        Enumeration obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `entrySet` method of `java.util.Hashtable`.
    # 
    # + return - The `Set` value returning from the Java mapping.
    function entrySet() returns Set {
        handle externalObj = java_util_Hashtable_entrySet(self.jObj);
        Set obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `equals` method of `java.util.Hashtable`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + return - The `boolean` value returning from the Java mapping.
    function 'equals(Object arg0) returns boolean {
        boolean externalObj = java_util_Hashtable_equals(self.jObj, arg0.jObj);
        return externalObj;
    }

    # The function that maps to the `forEach` method of `java.util.Hashtable`.
    #
    # + arg0 - The `BiConsumer` value required to map with the Java method parameter.
    function forEach(BiConsumer arg0) {
        () obj = java_util_Hashtable_forEach(self.jObj, arg0.jObj);
    }

    # The function that maps to the `get` method of `java.util.Hashtable`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + return - The `Object` value returning from the Java mapping.
    function get(Object arg0) returns Object {
        handle externalObj = java_util_Hashtable_get(self.jObj, arg0.jObj);
        Object obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `getClass` method of `java.util.Hashtable`.
    # 
    # + return - The `Class` value returning from the Java mapping.
    function getClass() returns Class {
        handle externalObj = java_util_Hashtable_getClass(self.jObj);
        Class obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `getOrDefault` method of `java.util.Hashtable`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + arg1 - The `Object` value required to map with the Java method parameter.
    # + return - The `Object` value returning from the Java mapping.
    function getOrDefault(Object arg0, Object arg1) returns Object {
        handle externalObj = java_util_Hashtable_getOrDefault(self.jObj, arg0.jObj, arg1.jObj);
        Object obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `hashCode` method of `java.util.Hashtable`.
    # 
    # + return - The `int` value returning from the Java mapping.
    function hashCode() returns int {
        int externalObj = java_util_Hashtable_hashCode(self.jObj);
        return externalObj;
    }

    # The function that maps to the `isEmpty` method of `java.util.Hashtable`.
    # 
    # + return - The `boolean` value returning from the Java mapping.
    function isEmpty() returns boolean {
        boolean externalObj = java_util_Hashtable_isEmpty(self.jObj);
        return externalObj;
    }

    # The function that maps to the `keySet` method of `java.util.Hashtable`.
    # 
    # + return - The `Set` value returning from the Java mapping.
    function keySet() returns Set {
        handle externalObj = java_util_Hashtable_keySet(self.jObj);
        Set obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `keys` method of `java.util.Hashtable`.
    # 
    # + return - The `Enumeration` value returning from the Java mapping.
    function keys() returns Enumeration {
        handle externalObj = java_util_Hashtable_keys(self.jObj);
        Enumeration obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `merge` method of `java.util.Hashtable`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + arg1 - The `Object` value required to map with the Java method parameter.
    # + arg2 - The `BiFunction` value required to map with the Java method parameter.
    # + return - The `Object` value returning from the Java mapping.
    function merge(Object arg0, Object arg1, BiFunction arg2) returns Object {
        handle externalObj = java_util_Hashtable_merge(self.jObj, arg0.jObj, arg1.jObj, arg2.jObj);
        Object obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `notify` method of `java.util.Hashtable`.
    function notify() {
        () obj = java_util_Hashtable_notify(self.jObj);
    }

    # The function that maps to the `notifyAll` method of `java.util.Hashtable`.
    function notifyAll() {
        () obj = java_util_Hashtable_notifyAll(self.jObj);
    }

    # The function that maps to the `put` method of `java.util.Hashtable`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + arg1 - The `Object` value required to map with the Java method parameter.
    # + return - The `Object` value returning from the Java mapping.
    function put(Object arg0, Object arg1) returns Object {
        handle externalObj = java_util_Hashtable_put(self.jObj, arg0.jObj, arg1.jObj);
        Object obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `putAll` method of `java.util.Hashtable`.
    #
    # + arg0 - The `Map` value required to map with the Java method parameter.
    function putAll(Map arg0) {
        () obj = java_util_Hashtable_putAll(self.jObj, arg0.jObj);
    }

    # The function that maps to the `putIfAbsent` method of `java.util.Hashtable`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + arg1 - The `Object` value required to map with the Java method parameter.
    # + return - The `Object` value returning from the Java mapping.
    function putIfAbsent(Object arg0, Object arg1) returns Object {
        handle externalObj = java_util_Hashtable_putIfAbsent(self.jObj, arg0.jObj, arg1.jObj);
        Object obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `remove` method of `java.util.Hashtable`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + return - The `Object` value returning from the Java mapping.
    function remove(Object arg0) returns Object {
        handle externalObj = java_util_Hashtable_remove(self.jObj, arg0.jObj);
        Object obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `remove` method of `java.util.Hashtable`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + arg1 - The `Object` value required to map with the Java method parameter.
    # + return - The `boolean` value returning from the Java mapping.
    function remove2(Object arg0, Object arg1) returns boolean {
        boolean externalObj = java_util_Hashtable_remove2(self.jObj, arg0.jObj, arg1.jObj);
        return externalObj;
    }

    # The function that maps to the `replace` method of `java.util.Hashtable`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + arg1 - The `Object` value required to map with the Java method parameter.
    # + return - The `Object` value returning from the Java mapping.
    function replace(Object arg0, Object arg1) returns Object {
        handle externalObj = java_util_Hashtable_replace(self.jObj, arg0.jObj, arg1.jObj);
        Object obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `replace` method of `java.util.Hashtable`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + arg1 - The `Object` value required to map with the Java method parameter.
    # + arg2 - The `Object` value required to map with the Java method parameter.
    # + return - The `boolean` value returning from the Java mapping.
    function replace2(Object arg0, Object arg1, Object arg2) returns boolean {
        boolean externalObj = java_util_Hashtable_replace2(self.jObj, arg0.jObj, arg1.jObj, arg2.jObj);
        return externalObj;
    }

    # The function that maps to the `replaceAll` method of `java.util.Hashtable`.
    #
    # + arg0 - The `BiFunction` value required to map with the Java method parameter.
    function replaceAll(BiFunction arg0) {
        () obj = java_util_Hashtable_replaceAll(self.jObj, arg0.jObj);
    }

    # The function that maps to the `size` method of `java.util.Hashtable`.
    # 
    # + return - The `int` value returning from the Java mapping.
    function size() returns int {
        int externalObj = java_util_Hashtable_size(self.jObj);
        return externalObj;
    }

    # The function that maps to the `values` method of `java.util.Hashtable`.
    # 
    # + return - The `Collection` value returning from the Java mapping.
    function values() returns Collection {
        handle externalObj = java_util_Hashtable_values(self.jObj);
        Collection obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `wait` method of `java.util.Hashtable`.
    # 
    # + return - The `error?` value returning from the Java mapping.
    function 'wait() returns error? {
        error|() obj = java_util_Hashtable_wait(self.jObj);
        if (obj is error) {
            InterruptedException e = InterruptedException(INTERRUPTEDEXCEPTION, message = obj.message(), cause = obj);
            return e;
        }
    }

    # The function that maps to the `wait` method of `java.util.Hashtable`.
    #
    # + arg0 - The `int` value required to map with the Java method parameter.
    # + return - The `error?` value returning from the Java mapping.
    function 'wait2(int arg0) returns error? {
        error|() obj = java_util_Hashtable_wait2(self.jObj, arg0);
        if (obj is error) {
            InterruptedException e = InterruptedException(INTERRUPTEDEXCEPTION, message = obj.message(), cause = obj);
            return e;
        }
    }

    # The function that maps to the `wait` method of `java.util.Hashtable`.
    #
    # + arg0 - The `int` value required to map with the Java method parameter.
    # + arg1 - The `int` value required to map with the Java method parameter.
    # + return - The `error?` value returning from the Java mapping.
    function 'wait3(int arg0, int arg1) returns error? {
        error|() obj = java_util_Hashtable_wait3(self.jObj, arg0, arg1);
        if (obj is error) {
            InterruptedException e = InterruptedException(INTERRUPTEDEXCEPTION, message = obj.message(), cause = obj);
            return e;
        }
    }
}

# Constructor function to generate an object of type `Hashtable` representing the `java.util.Hashtable` Java class.
#
# + return - The new `Hashtable` object generated.
function newHashtable1() returns Hashtable {
    handle obj = java_util_Hashtable_newHashtable1();
    Hashtable _hashtable = new(obj);
    return _hashtable;
}

# Constructor function to generate an object of type `Hashtable` representing the `java.util.Hashtable` Java class.
#
# + arg0 - The `int` value required to map with the Java constructor parameter.
# + return - The new `Hashtable` object generated.
function newHashtable2(int arg0) returns Hashtable {
    handle obj = java_util_Hashtable_newHashtable2(arg0);
    Hashtable _hashtable = new(obj);
    return _hashtable;
}

# Constructor function to generate an object of type `Hashtable` representing the `java.util.Hashtable` Java class.
#
# + arg0 - The `int` value required to map with the Java constructor parameter.
# + arg1 - The `float` value required to map with the Java constructor parameter.
# + return - The new `Hashtable` object generated.
function newHashtable3(int arg0, float arg1) returns Hashtable {
    handle obj = java_util_Hashtable_newHashtable3(arg0, arg1);
    Hashtable _hashtable = new(obj);
    return _hashtable;
}

# Constructor function to generate an object of type `Hashtable` representing the `java.util.Hashtable` Java class.
#
# + arg0 - The `Map` value required to map with the Java constructor parameter.
# + return - The new `Hashtable` object generated.
function newHashtable4(Map arg0) returns Hashtable {
    handle obj = java_util_Hashtable_newHashtable4(arg0.jObj);
    Hashtable _hashtable = new(obj);
    return _hashtable;
}

// External interop functions for mapping public constructors.

function java_util_Hashtable_newHashtable1() returns handle = @java:Constructor {
    'class: "java.util.Hashtable",
    paramTypes: []
} external;

function java_util_Hashtable_newHashtable2(int arg0) returns handle = @java:Constructor {
    'class: "java.util.Hashtable",
    paramTypes: ["int"]
} external;

function java_util_Hashtable_newHashtable3(int arg0, float arg1) returns handle = @java:Constructor {
    'class: "java.util.Hashtable",
    paramTypes: ["int", "float"]
} external;

function java_util_Hashtable_newHashtable4(handle arg0) returns handle = @java:Constructor {
    'class: "java.util.Hashtable",
    paramTypes: ["java.util.Map"]
} external;

// External interop functions for mapping public methods.

function java_util_Hashtable_clear(handle receiver) = @java:Method {
    name: "clear",
    'class: "java.util.Hashtable",
    paramTypes: []
} external;

function java_util_Hashtable_clone(handle receiver) returns handle = @java:Method {
    name: "clone",
    'class: "java.util.Hashtable",
    paramTypes: []
} external;

function java_util_Hashtable_compute(handle receiver, handle arg0, handle arg1) returns handle = @java:Method {
    name: "compute",
    'class: "java.util.Hashtable",
    paramTypes: ["java.lang.Object", "java.util.function.BiFunction"]
} external;

function java_util_Hashtable_computeIfAbsent(handle receiver, handle arg0, handle arg1) returns handle = @java:Method {
    name: "computeIfAbsent",
    'class: "java.util.Hashtable",
    paramTypes: ["java.lang.Object", "java.util.function.Function"]
} external;

function java_util_Hashtable_computeIfPresent(handle receiver, handle arg0, handle arg1) returns handle = @java:Method {
    name: "computeIfPresent",
    'class: "java.util.Hashtable",
    paramTypes: ["java.lang.Object", "java.util.function.BiFunction"]
} external;

function java_util_Hashtable_contains(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "contains",
    'class: "java.util.Hashtable",
    paramTypes: ["java.lang.Object"]
} external;

function java_util_Hashtable_containsKey(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "containsKey",
    'class: "java.util.Hashtable",
    paramTypes: ["java.lang.Object"]
} external;

function java_util_Hashtable_containsValue(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "containsValue",
    'class: "java.util.Hashtable",
    paramTypes: ["java.lang.Object"]
} external;

function java_util_Hashtable_elements(handle receiver) returns handle = @java:Method {
    name: "elements",
    'class: "java.util.Hashtable",
    paramTypes: []
} external;

function java_util_Hashtable_entrySet(handle receiver) returns handle = @java:Method {
    name: "entrySet",
    'class: "java.util.Hashtable",
    paramTypes: []
} external;

function java_util_Hashtable_equals(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "equals",
    'class: "java.util.Hashtable",
    paramTypes: ["java.lang.Object"]
} external;

function java_util_Hashtable_forEach(handle receiver, handle arg0) = @java:Method {
    name: "forEach",
    'class: "java.util.Hashtable",
    paramTypes: ["java.util.function.BiConsumer"]
} external;

function java_util_Hashtable_get(handle receiver, handle arg0) returns handle = @java:Method {
    name: "get",
    'class: "java.util.Hashtable",
    paramTypes: ["java.lang.Object"]
} external;

function java_util_Hashtable_getClass(handle receiver) returns handle = @java:Method {
    name: "getClass",
    'class: "java.util.Hashtable",
    paramTypes: []
} external;

function java_util_Hashtable_getOrDefault(handle receiver, handle arg0, handle arg1) returns handle = @java:Method {
    name: "getOrDefault",
    'class: "java.util.Hashtable",
    paramTypes: ["java.lang.Object", "java.lang.Object"]
} external;

function java_util_Hashtable_hashCode(handle receiver) returns int = @java:Method {
    name: "hashCode",
    'class: "java.util.Hashtable",
    paramTypes: []
} external;

function java_util_Hashtable_isEmpty(handle receiver) returns boolean = @java:Method {
    name: "isEmpty",
    'class: "java.util.Hashtable",
    paramTypes: []
} external;

function java_util_Hashtable_keySet(handle receiver) returns handle = @java:Method {
    name: "keySet",
    'class: "java.util.Hashtable",
    paramTypes: []
} external;

function java_util_Hashtable_keys(handle receiver) returns handle = @java:Method {
    name: "keys",
    'class: "java.util.Hashtable",
    paramTypes: []
} external;

function java_util_Hashtable_merge(handle receiver, handle arg0, handle arg1, handle arg2) returns handle = @java:Method {
    name: "merge",
    'class: "java.util.Hashtable",
    paramTypes: ["java.lang.Object", "java.lang.Object", "java.util.function.BiFunction"]
} external;

function java_util_Hashtable_notify(handle receiver) = @java:Method {
    name: "notify",
    'class: "java.util.Hashtable",
    paramTypes: []
} external;

function java_util_Hashtable_notifyAll(handle receiver) = @java:Method {
    name: "notifyAll",
    'class: "java.util.Hashtable",
    paramTypes: []
} external;

function java_util_Hashtable_put(handle receiver, handle arg0, handle arg1) returns handle = @java:Method {
    name: "put",
    'class: "java.util.Hashtable",
    paramTypes: ["java.lang.Object", "java.lang.Object"]
} external;

function java_util_Hashtable_putAll(handle receiver, handle arg0) = @java:Method {
    name: "putAll",
    'class: "java.util.Hashtable",
    paramTypes: ["java.util.Map"]
} external;

function java_util_Hashtable_putIfAbsent(handle receiver, handle arg0, handle arg1) returns handle = @java:Method {
    name: "putIfAbsent",
    'class: "java.util.Hashtable",
    paramTypes: ["java.lang.Object", "java.lang.Object"]
} external;

function java_util_Hashtable_remove(handle receiver, handle arg0) returns handle = @java:Method {
    name: "remove",
    'class: "java.util.Hashtable",
    paramTypes: ["java.lang.Object"]
} external;

function java_util_Hashtable_remove2(handle receiver, handle arg0, handle arg1) returns boolean = @java:Method {
    name: "remove",
    'class: "java.util.Hashtable",
    paramTypes: ["java.lang.Object", "java.lang.Object"]
} external;

function java_util_Hashtable_replace(handle receiver, handle arg0, handle arg1) returns handle = @java:Method {
    name: "replace",
    'class: "java.util.Hashtable",
    paramTypes: ["java.lang.Object", "java.lang.Object"]
} external;

function java_util_Hashtable_replace2(handle receiver, handle arg0, handle arg1, handle arg2) returns boolean = @java:Method {
    name: "replace",
    'class: "java.util.Hashtable",
    paramTypes: ["java.lang.Object", "java.lang.Object", "java.lang.Object"]
} external;

function java_util_Hashtable_replaceAll(handle receiver, handle arg0) = @java:Method {
    name: "replaceAll",
    'class: "java.util.Hashtable",
    paramTypes: ["java.util.function.BiFunction"]
} external;

function java_util_Hashtable_size(handle receiver) returns int = @java:Method {
    name: "size",
    'class: "java.util.Hashtable",
    paramTypes: []
} external;

function java_util_Hashtable_values(handle receiver) returns handle = @java:Method {
    name: "values",
    'class: "java.util.Hashtable",
    paramTypes: []
} external;

function java_util_Hashtable_wait(handle receiver) returns error? = @java:Method {
    name: "wait",
    'class: "java.util.Hashtable",
    paramTypes: []
} external;

function java_util_Hashtable_wait2(handle receiver, int arg0) returns error? = @java:Method {
    name: "wait",
    'class: "java.util.Hashtable",
    paramTypes: ["long"]
} external;

function java_util_Hashtable_wait3(handle receiver, int arg0, int arg1) returns error? = @java:Method {
    name: "wait",
    'class: "java.util.Hashtable",
    paramTypes: ["long", "int"]
} external;


