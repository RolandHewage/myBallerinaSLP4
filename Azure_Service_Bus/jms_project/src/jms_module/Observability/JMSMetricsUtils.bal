import ballerina/observe;
import ballerina/log;

# Register and increment counter
#
# + counter - counter to be registered and incremented
function registerAndIncrementCounter(observe:Counter counter) {
    error? result = counter.register();
    if (result is error) {
        log:printError("Error in registering counter : " + counter.name, result);
    }
    counter.increment();
}

# Register and increment gauge
#
# + gauge - gauge to be registered and incremented
function registerAndIncrementGauge(observe:Gauge gauge) {
    error? result = gauge.register();
    if (result is error) {
        log:printError("Error in registering gauge : " + gauge.name, result);
    }
    gauge.increment();
}

# Decrement gauge
#
# + gauge - gauge to be decremented
function decrementGauge(observe:Gauge gauge) {
    gauge.decrement();
}
