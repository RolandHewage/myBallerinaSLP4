import ballerina/io;
import ballerina/sql;
import ballerinax/mysql;
import ballerina/http;
// import ballerina/log;

string dbUser = "roly";
string dbPassword = "alianza2";

listener http:Listener httpListener = new(9090);

type Employee record {
    string name;
    int age;
    int ssn;
    int employeeId;
};

function initializeClients() returns sql:Error? {

    mysql:Options mysqlOptions = {
        ssl: {
            mode: mysql:SSL_PREFERRED        },
        connectTimeoutInSeconds: 10
    };


    sql:ConnectionPool connPool = {
        maxOpenConnections: 5,
        maxConnectionLifeTimeInSeconds: 2000.0,
        minIdleConnections: 5    };


    mysql:Client employeeDB = check new (host = "localhost",
        user = dbUser, password = dbPassword, database =
        "EMPLOYEE_RECORDS", port = 3306, options = mysqlOptions,
        connectionPool = connPool);   

    check employeeDB.close();
    
}
    
public function main() {
    sql:Error? err = initializeClients();    
    if (err is sql:Error) {
        io:println("Error occurred, initialization failed! ", err);
    } else {
        io:println("Sample executed successfully!");
    }
}

// // Service for the employee data service
// @http:ServiceConfig {
//     basePath: "/records"
// }
// service EmployeeData on httpListener {

//     @http:ResourceConfig {
//         methods: ["POST"],
//         path: "/employee/"
//     }
//     resource function addEmployeeResource(http:Caller httpCaller, http:Request request) returns sql:Error?{
//         sql:Error? err = initializeClients();    
//         if (err is sql:Error) {
//             io:println("Error occurred, initialization failed! ", err);
//         } else {
//             io:println("Sample executed successfully!");
//         }

//         mysql:Client employeeDB = check new (host = "localhost",
//         user = dbUser, password = dbPassword, database =
//         "EMPLOYEE_RECORDS");

//         // Initialize an empty http response message
//         http:Response response = new;

//         // Extract the data from the request payload
//         var payloadJson = request.getJsonPayload();

//         if (payloadJson is json) {

//             Employee|error employeeData = payloadJson.cloneWithType(Employee);

//             if (employeeData is Employee) {
//                 // Validate JSON payload
//                 if (employeeData.name == "" || employeeData.age ==0 || employeeData.ssn == 0 ||
//                     employeeData.employeeId == 0) {
//                         response.statusCode = 400;
//                         response.setPayload("Error: JSON payload should contain " +
//                         "{name:<string>, age:<int>, ssn:<123456>, employeeId:<int>");
//                 } else {
//                     // Invoke insertData function to save data in the MySQL database
//                     sql:ExecutionResult result = check employeeDB->execute("INSERT INTO EMPLOYEE_RECORDS.EMPLOYEES "+
//                         "(EmployeeID,Name,Age," +
//                         "SSN) VALUES ("+employeeData.employeeId+", "+employeeData.name+", "+employeeData.age+", "+employeeData.ssn+")"); 
//                     // Send the response back to the client with the employee data
//                     response.setPayload(result);
//                     check employeeDB.close();
//                 }
//             } else {
//                 // Send an error response in case of a conversion failure
//                 response.statusCode = 400;
//                 response.setPayload("Error: Please send the JSON payload in the correct format");
//             }
//         } else {
//             // Send an error response in case of an error in retriving the request payload
//             response.statusCode = 500;
//             response.setPayload("Error: An internal error occurred");
//         }
//         var respondRet = httpCaller->respond(response);
//         if (respondRet is error) {
//             // Log the error for the service maintainers.
//             log:printError("Error responding to the client", err = respondRet);
//         }
//         check employeeDB.close();
//     }
// }