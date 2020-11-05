public type AbstractMessage client object {

    handle jmsMessage;

    public remote function acknowledge() returns error?;

    public function clearBody() returns error?;

    public function clearProperties() returns error?;

    public function getBooleanProperty(string name) returns boolean | error;

    public function getByteProperty(string name) returns byte | error;

    public function getDoubleProperty(string name) returns float | error;

    public function getFloatProperty(string name) returns float | error;

    public function getIntProperty(string name) returns int | error;

    public function getJMSCorrelationID() returns (string|error)?;

    // public function getJMSCorrelationIDAsBytes() returns byte[] | error;

    public function getJMSDeliveryMode() returns int | error;

    public function getJMSDeliveryTime() returns int | error;

    public function getJMSDestination() returns Destination | error;

    public function getJMSExpiration() returns int | error;

    public function getJMSMessageID() returns (string|error)?;

    public function getJMSPriority() returns int | error;

    public function getJMSRedelivered() returns boolean | error;

    public function getJMSReplyTo() returns Destination | error;

    public function getJMSTimestamp() returns int | error;

    public function getJMSType() returns (string|error)?;

    public function getLongProperty(string name) returns int | error;

    // public function getPropertyNames() returns string[] | error;

    public function getShortProperty(string name) returns int | error;

    public function getStringProperty(string name) returns (string|error)?;

    public function propertyExists(string name) returns boolean | error;

    public function setBooleanProperty(string name, boolean value) returns error?;

    public function setByteProperty(string name, byte value) returns error?;

    public function setDoubleProperty(string name, float value) returns error?;

    public function setFloatProperty(string name, float value) returns error?;

    public function setIntProperty(string name, int value) returns error?;

    public function setJMSCorrelationID(string correlationId) returns error?;

    // public function setJMSCorrelationIDAsBytes(byte[] correlationId) returns error?;

    public function setJMSReplyTo(Destination replyTo) returns error?;

    public function setJMSType(string jmsType) returns error?;

    public function setLongProperty(string name, int value) returns error?;

    public function setShortProperty(string name, int value) returns error?;

    public function setStringProperty(string name, string value) returns error?;

    function getJmsMessage() returns handle;

};
