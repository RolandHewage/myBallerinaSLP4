// Ballerina error type for org.apache.commons.cli.ParseException.

const PARSEEXCEPTION = "ParseException";

type ParseExceptionData record {
    string message;
    error cause?;
};

type ParseException distinct error<ParseExceptionData>;

