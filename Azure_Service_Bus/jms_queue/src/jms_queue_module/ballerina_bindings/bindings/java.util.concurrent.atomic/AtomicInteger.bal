
import ballerina/java;

# Ballerina object mapping for Java class `java.util.concurrent.atomic.AtomicInteger`.
#
# + _AtomicInteger - The field that represents this Ballerina object, which is used for Java subtyping.
# + _Serializable - The field that represents the superclass object `Serializable`.
# + _Number - The field that represents the superclass object `Number`.
# + _Object - The field that represents the superclass object `Object`.
@java:Binding {
    'class: "java.util.concurrent.atomic.AtomicInteger"
}
class AtomicInteger {

    *java:JObject;

    AtomicIntegerT _AtomicInteger = AtomicIntegerT;
    SerializableT _Serializable = SerializableT;
    NumberT _Number = NumberT;
    ObjectT _Object = ObjectT;

    # The init function of the Ballerina object mapping `java.util.concurrent.atomic.AtomicInteger` Java class.
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

    # The function that maps to the `accumulateAndGet` method of `java.util.concurrent.atomic.AtomicInteger`.
    #
    # + arg0 - The `int` value required to map with the Java method parameter.
    # + arg1 - The `IntBinaryOperator` value required to map with the Java method parameter.
    # + return - The `int` value returning from the Java mapping.
    function accumulateAndGet(int arg0, IntBinaryOperator arg1) returns int {
        int externalObj = java_util_concurrent_atomic_AtomicInteger_accumulateAndGet(self.jObj, arg0, arg1.jObj);
        return externalObj;
    }

    # The function that maps to the `addAndGet` method of `java.util.concurrent.atomic.AtomicInteger`.
    #
    # + arg0 - The `int` value required to map with the Java method parameter.
    # + return - The `int` value returning from the Java mapping.
    function addAndGet(int arg0) returns int {
        int externalObj = java_util_concurrent_atomic_AtomicInteger_addAndGet(self.jObj, arg0);
        return externalObj;
    }

    # The function that maps to the `byteValue` method of `java.util.concurrent.atomic.AtomicInteger`.
    # 
    # + return - The `byte` value returning from the Java mapping.
    function byteValue() returns byte {
        byte externalObj = java_util_concurrent_atomic_AtomicInteger_byteValue(self.jObj);
        return externalObj;
    }

    # The function that maps to the `compareAndSet` method of `java.util.concurrent.atomic.AtomicInteger`.
    #
    # + arg0 - The `int` value required to map with the Java method parameter.
    # + arg1 - The `int` value required to map with the Java method parameter.
    # + return - The `boolean` value returning from the Java mapping.
    function compareAndSet(int arg0, int arg1) returns boolean {
        boolean externalObj = java_util_concurrent_atomic_AtomicInteger_compareAndSet(self.jObj, arg0, arg1);
        return externalObj;
    }

    # The function that maps to the `decrementAndGet` method of `java.util.concurrent.atomic.AtomicInteger`.
    # 
    # + return - The `int` value returning from the Java mapping.
    function decrementAndGet() returns int {
        int externalObj = java_util_concurrent_atomic_AtomicInteger_decrementAndGet(self.jObj);
        return externalObj;
    }

    # The function that maps to the `doubleValue` method of `java.util.concurrent.atomic.AtomicInteger`.
    # 
    # + return - The `float` value returning from the Java mapping.
    function doubleValue() returns float {
        float externalObj = java_util_concurrent_atomic_AtomicInteger_doubleValue(self.jObj);
        return externalObj;
    }

    # The function that maps to the `equals` method of `java.util.concurrent.atomic.AtomicInteger`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + return - The `boolean` value returning from the Java mapping.
    function 'equals(Object arg0) returns boolean {
        boolean externalObj = java_util_concurrent_atomic_AtomicInteger_equals(self.jObj, arg0.jObj);
        return externalObj;
    }

    # The function that maps to the `floatValue` method of `java.util.concurrent.atomic.AtomicInteger`.
    # 
    # + return - The `float` value returning from the Java mapping.
    function floatValue() returns float {
        float externalObj = java_util_concurrent_atomic_AtomicInteger_floatValue(self.jObj);
        return externalObj;
    }

    # The function that maps to the `get` method of `java.util.concurrent.atomic.AtomicInteger`.
    # 
    # + return - The `int` value returning from the Java mapping.
    function get() returns int {
        int externalObj = java_util_concurrent_atomic_AtomicInteger_get(self.jObj);
        return externalObj;
    }

    # The function that maps to the `getAndAccumulate` method of `java.util.concurrent.atomic.AtomicInteger`.
    #
    # + arg0 - The `int` value required to map with the Java method parameter.
    # + arg1 - The `IntBinaryOperator` value required to map with the Java method parameter.
    # + return - The `int` value returning from the Java mapping.
    function getAndAccumulate(int arg0, IntBinaryOperator arg1) returns int {
        int externalObj = java_util_concurrent_atomic_AtomicInteger_getAndAccumulate(self.jObj, arg0, arg1.jObj);
        return externalObj;
    }

    # The function that maps to the `getAndAdd` method of `java.util.concurrent.atomic.AtomicInteger`.
    #
    # + arg0 - The `int` value required to map with the Java method parameter.
    # + return - The `int` value returning from the Java mapping.
    function getAndAdd(int arg0) returns int {
        int externalObj = java_util_concurrent_atomic_AtomicInteger_getAndAdd(self.jObj, arg0);
        return externalObj;
    }

    # The function that maps to the `getAndDecrement` method of `java.util.concurrent.atomic.AtomicInteger`.
    # 
    # + return - The `int` value returning from the Java mapping.
    function getAndDecrement() returns int {
        int externalObj = java_util_concurrent_atomic_AtomicInteger_getAndDecrement(self.jObj);
        return externalObj;
    }

    # The function that maps to the `getAndIncrement` method of `java.util.concurrent.atomic.AtomicInteger`.
    # 
    # + return - The `int` value returning from the Java mapping.
    function getAndIncrement() returns int {
        int externalObj = java_util_concurrent_atomic_AtomicInteger_getAndIncrement(self.jObj);
        return externalObj;
    }

    # The function that maps to the `getAndSet` method of `java.util.concurrent.atomic.AtomicInteger`.
    #
    # + arg0 - The `int` value required to map with the Java method parameter.
    # + return - The `int` value returning from the Java mapping.
    function getAndSet(int arg0) returns int {
        int externalObj = java_util_concurrent_atomic_AtomicInteger_getAndSet(self.jObj, arg0);
        return externalObj;
    }

    # The function that maps to the `getAndUpdate` method of `java.util.concurrent.atomic.AtomicInteger`.
    #
    # + arg0 - The `IntUnaryOperator` value required to map with the Java method parameter.
    # + return - The `int` value returning from the Java mapping.
    function getAndUpdate(IntUnaryOperator arg0) returns int {
        int externalObj = java_util_concurrent_atomic_AtomicInteger_getAndUpdate(self.jObj, arg0.jObj);
        return externalObj;
    }

    # The function that maps to the `getClass` method of `java.util.concurrent.atomic.AtomicInteger`.
    # 
    # + return - The `Class` value returning from the Java mapping.
    function getClass() returns Class {
        handle externalObj = java_util_concurrent_atomic_AtomicInteger_getClass(self.jObj);
        Class obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `hashCode` method of `java.util.concurrent.atomic.AtomicInteger`.
    # 
    # + return - The `int` value returning from the Java mapping.
    function hashCode() returns int {
        int externalObj = java_util_concurrent_atomic_AtomicInteger_hashCode(self.jObj);
        return externalObj;
    }

    # The function that maps to the `incrementAndGet` method of `java.util.concurrent.atomic.AtomicInteger`.
    # 
    # + return - The `int` value returning from the Java mapping.
    function incrementAndGet() returns int {
        int externalObj = java_util_concurrent_atomic_AtomicInteger_incrementAndGet(self.jObj);
        return externalObj;
    }

    # The function that maps to the `intValue` method of `java.util.concurrent.atomic.AtomicInteger`.
    # 
    # + return - The `int` value returning from the Java mapping.
    function intValue() returns int {
        int externalObj = java_util_concurrent_atomic_AtomicInteger_intValue(self.jObj);
        return externalObj;
    }

    # The function that maps to the `lazySet` method of `java.util.concurrent.atomic.AtomicInteger`.
    #
    # + arg0 - The `int` value required to map with the Java method parameter.
    function lazySet(int arg0) {
        () obj = java_util_concurrent_atomic_AtomicInteger_lazySet(self.jObj, arg0);
    }

    # The function that maps to the `longValue` method of `java.util.concurrent.atomic.AtomicInteger`.
    # 
    # + return - The `int` value returning from the Java mapping.
    function longValue() returns int {
        int externalObj = java_util_concurrent_atomic_AtomicInteger_longValue(self.jObj);
        return externalObj;
    }

    # The function that maps to the `notify` method of `java.util.concurrent.atomic.AtomicInteger`.
    function notify() {
        () obj = java_util_concurrent_atomic_AtomicInteger_notify(self.jObj);
    }

    # The function that maps to the `notifyAll` method of `java.util.concurrent.atomic.AtomicInteger`.
    function notifyAll() {
        () obj = java_util_concurrent_atomic_AtomicInteger_notifyAll(self.jObj);
    }

    # The function that maps to the `set` method of `java.util.concurrent.atomic.AtomicInteger`.
    #
    # + arg0 - The `int` value required to map with the Java method parameter.
    function set(int arg0) {
        () obj = java_util_concurrent_atomic_AtomicInteger_set(self.jObj, arg0);
    }

    # The function that maps to the `shortValue` method of `java.util.concurrent.atomic.AtomicInteger`.
    # 
    # + return - The `int` value returning from the Java mapping.
    function shortValue() returns int {
        int externalObj = java_util_concurrent_atomic_AtomicInteger_shortValue(self.jObj);
        return externalObj;
    }

    # The function that maps to the `updateAndGet` method of `java.util.concurrent.atomic.AtomicInteger`.
    #
    # + arg0 - The `IntUnaryOperator` value required to map with the Java method parameter.
    # + return - The `int` value returning from the Java mapping.
    function updateAndGet(IntUnaryOperator arg0) returns int {
        int externalObj = java_util_concurrent_atomic_AtomicInteger_updateAndGet(self.jObj, arg0.jObj);
        return externalObj;
    }

    # The function that maps to the `wait` method of `java.util.concurrent.atomic.AtomicInteger`.
    # 
    # + return - The `error?` value returning from the Java mapping.
    function 'wait() returns error? {
        error|() obj = java_util_concurrent_atomic_AtomicInteger_wait(self.jObj);
        if (obj is error) {
            InterruptedException e = InterruptedException(INTERRUPTEDEXCEPTION, message = obj.message(), cause = obj);
            return e;
        }
    }

    # The function that maps to the `wait` method of `java.util.concurrent.atomic.AtomicInteger`.
    #
    # + arg0 - The `int` value required to map with the Java method parameter.
    # + return - The `error?` value returning from the Java mapping.
    function 'wait2(int arg0) returns error? {
        error|() obj = java_util_concurrent_atomic_AtomicInteger_wait2(self.jObj, arg0);
        if (obj is error) {
            InterruptedException e = InterruptedException(INTERRUPTEDEXCEPTION, message = obj.message(), cause = obj);
            return e;
        }
    }

    # The function that maps to the `wait` method of `java.util.concurrent.atomic.AtomicInteger`.
    #
    # + arg0 - The `int` value required to map with the Java method parameter.
    # + arg1 - The `int` value required to map with the Java method parameter.
    # + return - The `error?` value returning from the Java mapping.
    function 'wait3(int arg0, int arg1) returns error? {
        error|() obj = java_util_concurrent_atomic_AtomicInteger_wait3(self.jObj, arg0, arg1);
        if (obj is error) {
            InterruptedException e = InterruptedException(INTERRUPTEDEXCEPTION, message = obj.message(), cause = obj);
            return e;
        }
    }

    # The function that maps to the `weakCompareAndSet` method of `java.util.concurrent.atomic.AtomicInteger`.
    #
    # + arg0 - The `int` value required to map with the Java method parameter.
    # + arg1 - The `int` value required to map with the Java method parameter.
    # + return - The `boolean` value returning from the Java mapping.
    function weakCompareAndSet(int arg0, int arg1) returns boolean {
        boolean externalObj = java_util_concurrent_atomic_AtomicInteger_weakCompareAndSet(self.jObj, arg0, arg1);
        return externalObj;
    }
}

# Constructor function to generate an object of type `AtomicInteger` representing the `java.util.concurrent.atomic.AtomicInteger` Java class.
#
# + return - The new `AtomicInteger` object generated.
function newAtomicInteger1() returns AtomicInteger {
    handle obj = java_util_concurrent_atomic_AtomicInteger_newAtomicInteger1();
    AtomicInteger _atomicInteger = new(obj);
    return _atomicInteger;
}

# Constructor function to generate an object of type `AtomicInteger` representing the `java.util.concurrent.atomic.AtomicInteger` Java class.
#
# + arg0 - The `int` value required to map with the Java constructor parameter.
# + return - The new `AtomicInteger` object generated.
function newAtomicInteger2(int arg0) returns AtomicInteger {
    handle obj = java_util_concurrent_atomic_AtomicInteger_newAtomicInteger2(arg0);
    AtomicInteger _atomicInteger = new(obj);
    return _atomicInteger;
}

// External interop functions for mapping public constructors.

function java_util_concurrent_atomic_AtomicInteger_newAtomicInteger1() returns handle = @java:Constructor {
    'class: "java.util.concurrent.atomic.AtomicInteger",
    paramTypes: []
} external;

function java_util_concurrent_atomic_AtomicInteger_newAtomicInteger2(int arg0) returns handle = @java:Constructor {
    'class: "java.util.concurrent.atomic.AtomicInteger",
    paramTypes: ["int"]
} external;

// External interop functions for mapping public methods.

function java_util_concurrent_atomic_AtomicInteger_accumulateAndGet(handle receiver, int arg0, handle arg1) returns int = @java:Method {
    name: "accumulateAndGet",
    'class: "java.util.concurrent.atomic.AtomicInteger",
    paramTypes: ["int", "java.util.function.IntBinaryOperator"]
} external;

function java_util_concurrent_atomic_AtomicInteger_addAndGet(handle receiver, int arg0) returns int = @java:Method {
    name: "addAndGet",
    'class: "java.util.concurrent.atomic.AtomicInteger",
    paramTypes: ["int"]
} external;

function java_util_concurrent_atomic_AtomicInteger_byteValue(handle receiver) returns byte = @java:Method {
    name: "byteValue",
    'class: "java.util.concurrent.atomic.AtomicInteger",
    paramTypes: []
} external;

function java_util_concurrent_atomic_AtomicInteger_compareAndSet(handle receiver, int arg0, int arg1) returns boolean = @java:Method {
    name: "compareAndSet",
    'class: "java.util.concurrent.atomic.AtomicInteger",
    paramTypes: ["int", "int"]
} external;

function java_util_concurrent_atomic_AtomicInteger_decrementAndGet(handle receiver) returns int = @java:Method {
    name: "decrementAndGet",
    'class: "java.util.concurrent.atomic.AtomicInteger",
    paramTypes: []
} external;

function java_util_concurrent_atomic_AtomicInteger_doubleValue(handle receiver) returns float = @java:Method {
    name: "doubleValue",
    'class: "java.util.concurrent.atomic.AtomicInteger",
    paramTypes: []
} external;

function java_util_concurrent_atomic_AtomicInteger_equals(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "equals",
    'class: "java.util.concurrent.atomic.AtomicInteger",
    paramTypes: ["java.lang.Object"]
} external;

function java_util_concurrent_atomic_AtomicInteger_floatValue(handle receiver) returns float = @java:Method {
    name: "floatValue",
    'class: "java.util.concurrent.atomic.AtomicInteger",
    paramTypes: []
} external;

function java_util_concurrent_atomic_AtomicInteger_get(handle receiver) returns int = @java:Method {
    name: "get",
    'class: "java.util.concurrent.atomic.AtomicInteger",
    paramTypes: []
} external;

function java_util_concurrent_atomic_AtomicInteger_getAndAccumulate(handle receiver, int arg0, handle arg1) returns int = @java:Method {
    name: "getAndAccumulate",
    'class: "java.util.concurrent.atomic.AtomicInteger",
    paramTypes: ["int", "java.util.function.IntBinaryOperator"]
} external;

function java_util_concurrent_atomic_AtomicInteger_getAndAdd(handle receiver, int arg0) returns int = @java:Method {
    name: "getAndAdd",
    'class: "java.util.concurrent.atomic.AtomicInteger",
    paramTypes: ["int"]
} external;

function java_util_concurrent_atomic_AtomicInteger_getAndDecrement(handle receiver) returns int = @java:Method {
    name: "getAndDecrement",
    'class: "java.util.concurrent.atomic.AtomicInteger",
    paramTypes: []
} external;

function java_util_concurrent_atomic_AtomicInteger_getAndIncrement(handle receiver) returns int = @java:Method {
    name: "getAndIncrement",
    'class: "java.util.concurrent.atomic.AtomicInteger",
    paramTypes: []
} external;

function java_util_concurrent_atomic_AtomicInteger_getAndSet(handle receiver, int arg0) returns int = @java:Method {
    name: "getAndSet",
    'class: "java.util.concurrent.atomic.AtomicInteger",
    paramTypes: ["int"]
} external;

function java_util_concurrent_atomic_AtomicInteger_getAndUpdate(handle receiver, handle arg0) returns int = @java:Method {
    name: "getAndUpdate",
    'class: "java.util.concurrent.atomic.AtomicInteger",
    paramTypes: ["java.util.function.IntUnaryOperator"]
} external;

function java_util_concurrent_atomic_AtomicInteger_getClass(handle receiver) returns handle = @java:Method {
    name: "getClass",
    'class: "java.util.concurrent.atomic.AtomicInteger",
    paramTypes: []
} external;

function java_util_concurrent_atomic_AtomicInteger_hashCode(handle receiver) returns int = @java:Method {
    name: "hashCode",
    'class: "java.util.concurrent.atomic.AtomicInteger",
    paramTypes: []
} external;

function java_util_concurrent_atomic_AtomicInteger_incrementAndGet(handle receiver) returns int = @java:Method {
    name: "incrementAndGet",
    'class: "java.util.concurrent.atomic.AtomicInteger",
    paramTypes: []
} external;

function java_util_concurrent_atomic_AtomicInteger_intValue(handle receiver) returns int = @java:Method {
    name: "intValue",
    'class: "java.util.concurrent.atomic.AtomicInteger",
    paramTypes: []
} external;

function java_util_concurrent_atomic_AtomicInteger_lazySet(handle receiver, int arg0) = @java:Method {
    name: "lazySet",
    'class: "java.util.concurrent.atomic.AtomicInteger",
    paramTypes: ["int"]
} external;

function java_util_concurrent_atomic_AtomicInteger_longValue(handle receiver) returns int = @java:Method {
    name: "longValue",
    'class: "java.util.concurrent.atomic.AtomicInteger",
    paramTypes: []
} external;

function java_util_concurrent_atomic_AtomicInteger_notify(handle receiver) = @java:Method {
    name: "notify",
    'class: "java.util.concurrent.atomic.AtomicInteger",
    paramTypes: []
} external;

function java_util_concurrent_atomic_AtomicInteger_notifyAll(handle receiver) = @java:Method {
    name: "notifyAll",
    'class: "java.util.concurrent.atomic.AtomicInteger",
    paramTypes: []
} external;

function java_util_concurrent_atomic_AtomicInteger_set(handle receiver, int arg0) = @java:Method {
    name: "set",
    'class: "java.util.concurrent.atomic.AtomicInteger",
    paramTypes: ["int"]
} external;

function java_util_concurrent_atomic_AtomicInteger_shortValue(handle receiver) returns int = @java:Method {
    name: "shortValue",
    'class: "java.util.concurrent.atomic.AtomicInteger",
    paramTypes: []
} external;

function java_util_concurrent_atomic_AtomicInteger_updateAndGet(handle receiver, handle arg0) returns int = @java:Method {
    name: "updateAndGet",
    'class: "java.util.concurrent.atomic.AtomicInteger",
    paramTypes: ["java.util.function.IntUnaryOperator"]
} external;

function java_util_concurrent_atomic_AtomicInteger_wait(handle receiver) returns error? = @java:Method {
    name: "wait",
    'class: "java.util.concurrent.atomic.AtomicInteger",
    paramTypes: []
} external;

function java_util_concurrent_atomic_AtomicInteger_wait2(handle receiver, int arg0) returns error? = @java:Method {
    name: "wait",
    'class: "java.util.concurrent.atomic.AtomicInteger",
    paramTypes: ["long"]
} external;

function java_util_concurrent_atomic_AtomicInteger_wait3(handle receiver, int arg0, int arg1) returns error? = @java:Method {
    name: "wait",
    'class: "java.util.concurrent.atomic.AtomicInteger",
    paramTypes: ["long", "int"]
} external;

function java_util_concurrent_atomic_AtomicInteger_weakCompareAndSet(handle receiver, int arg0, int arg1) returns boolean = @java:Method {
    name: "weakCompareAndSet",
    'class: "java.util.concurrent.atomic.AtomicInteger",
    paramTypes: ["int", "int"]
} external;


