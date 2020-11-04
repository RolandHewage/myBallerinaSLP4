// Ballerina error type for javax.naming.NamingException.

const NAMINGEXCEPTION = "NamingException";

type NamingExceptionData record {
    string message;
    error cause?;
};

type NamingException distinct error<NamingExceptionData>;

