import ballerina/io;
import ballerina/sql;
import ballerinax/mysql;
import ballerina/http;
import ballerina/lang.'int as ints;
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

mysql:Client employeeDB = check new (host = "localhost",
        user = dbUser, password = dbPassword, database =
        "EMPLOYEE_RECORDS", port = 3306); 

// Service for the employee data service
@http:ServiceConfig {
    basePath: "/records"
}
service EmployeeData on httpListener {

    @http:ResourceConfig {
        methods: ["POST"],
        path: "/employee/"
    }
    resource function addEmployeeResource(http:Caller httpCaller, http:Request request) {

        // Initialize an empty http response message
        http:Response response = new;

        // Extract the data from the request payload
        var payloadJson = request.getJsonPayload();

        if (payloadJson is json) {

            Employee|error employeeData = payloadJson.cloneWithType(Employee);

            if (employeeData is Employee) {
                // Validate JSON payload
                if (employeeData.name == "" || employeeData.age ==0 || employeeData.ssn == 0 ||
                    employeeData.employeeId == 0) {
                        response.statusCode = 400;
                        response.setPayload("Error: JSON payload should contain " +
                        "{name:<string>, age:<int>, ssn:<123456>, employeeId:<int>");
                } else {
                    // Invoke insertData function to save data in the MySQL database
                    json ret =  insertData(<@untainted> employeeData.name, <@untainted> employeeData.age, <@untainted> employeeData.ssn,
                        <@untainted> employeeData.employeeId);
                    // sql:ExecutionResult result = check employeeDB->execute("INSERT INTO EMPLOYEE_RECORDS.EMPLOYEES "+
                    //     "(EmployeeID,Name,Age," +
                    //     "SSN) VALUES ("+employeeData.employeeId+", "+employeeData.name+", "+employeeData.age+", "+employeeData.ssn+")"); 
                    // Send the response back to the client with the employee data
                    response.setPayload(ret);
                    // io:println("Add Employee successfully!");

                    sql:Error? e = employeeDB.close();
                }
            } else {
                // Send an error response in case of a conversion failure
                response.statusCode = 400;
                response.setPayload("Error: Please send the JSON payload in the correct format");
            }
        } else {
            // Send an error response in case of an error in retriving the request payload
            response.statusCode = 500;
            response.setPayload("Error: An internal error occurred");
        }
        var respondRet = httpCaller->respond(response);
        if (respondRet is error) {
            // Log the error for the service maintainers.
            io:println("Error responding to the client", respondRet);
        }
    }


    @http:ResourceConfig {
        methods: ["GET"],
        path: "/employee/{employeeId}"
    }
    resource function retrieveEmployeeResource(http:Caller httpCaller, http:Request request, string
        employeeId) {
        // Initialize an empty http response message
        http:Response response = new;
        // Convert the employeeId string to integer
        var empID = ints:fromString(employeeId);
        if (empID is int) {
            // Invoke retrieveById function to retrieve data from MYSQL database
            var employeeData = retrieveById(<@untainted> empID);
            // Send the response back to the client with the employee data
            response.setPayload(employeeData);
            sql:Error? e = employeeDB.close();
        } else {
            response.statusCode = 400;
            response.setPayload("Error: employeeId parameter should be a valid integer");
        }
        var respondRet = httpCaller->respond(response);
        if (respondRet is error) {
            // Log the error for the service maintainers.
            io:println("Error responding to the client", respondRet);
        }
    }  

    @http:ResourceConfig {
        methods: ["PUT"],
        path: "/employee/"
    }
    resource function updateEmployeeResource(http:Caller httpCaller, http:Request request) {
        // Initialize an empty http response message
        http:Response response = new;

        // Extract the data from the request payload
        var payloadJson = request.getJsonPayload();
        if (payloadJson is json) {
            Employee|error employeeData = payloadJson.cloneWithType(Employee);
            // Employee|error employeeData = Employee.constructFrom(payloadJson);

            if (employeeData is Employee) {
                if (employeeData.name == "" || employeeData.age == 0 || employeeData.ssn == 0 ||
                    employeeData.employeeId == 0) {
                    response.setPayload("Error : json payload should contain"+
                        "{name:<string>, age:<int>, ssn:<123456>,employeeId:<int>} ");
                    response.statusCode = 400;
                } else {
                    // Invoke updateData function to update data in mysql database
                    json ret = updateData(<@untainted> employeeData.name, <@untainted> employeeData.age, <@untainted> employeeData.ssn,
                        <@untainted> employeeData.employeeId);
                    // Send the response back to the client with the employee data
                    response.setPayload(ret);
                    sql:Error? e = employeeDB.close();
                }
            } else {
                // Send an error response in case of a conversion failure
                response.statusCode = 400;
                response.setPayload("Error: Please send the JSON payload in the correct format");
            }
        } else {
            // Send an error response in case of an error in retriving the request payload
            response.statusCode = 500;
            response.setPayload("Error: An internal error occurred");
        }
        var respondRet = httpCaller->respond(response);
        if (respondRet is error) {
            // Log the error for the service maintainers.
            io:println("Error responding to the client", respondRet);
        }
    } 

    @http:ResourceConfig {
        methods: ["DELETE"],
        path: "/employee/{employeeId}"
    }
    resource function deleteEmployeeResource(http:Caller httpCaller, http:Request request, string
        employeeId) {
        // Initialize an empty http response message
        http:Response response = new;
        // Convert the employeeId string to integer
        var empID = ints:fromString(employeeId);
        if (empID is int) {
            var deleteStatus = deleteData(<@untainted> empID);
            // Send the response back to the client with the employee data
            response.setPayload(deleteStatus);
            sql:Error? e = employeeDB.close();
        } else {
            response.statusCode = 400;
            response.setPayload("Error: employeeId parameter should be a valid integer");
        }
        var respondRet = httpCaller->respond(response);
        if (respondRet is error) {
            // Log the error for the service maintainers.
            io:println("Error responding to the client", respondRet);
        }
    }   
}

public function insertData(string name, int age, int ssn, int employeeId) returns json {
    json updateStatus;
    // string sqlString =
    // "INSERT INTO EMPLOYEES (Name, Age, SSN, EmployeeID) VALUES (?,?,?,?)";
    string sqlString = string `INSERT INTO EMPLOYEE_RECORDS.EMPLOYEES (EmployeeID,Name,Age,SSN) VALUES (${employeeId},'${name}',${age},${ssn})`;
    // string sqlString = string `INSERT INTO EMPLOYEE_RECORDS.EMPLOYEES (EmployeeID,Name,Age,SSN) VALUES (2,"mak",4,8)`;
    // Insert data to SQL database by invoking update action
    // var ret = employeeDB->update(sqlString, name, age, ssn, employeeId);
    // var ret = employeeDB->execute("INSERT INTO EMPLOYEE_RECORDS.EMPLOYEES "+
    //     "(EmployeeID,Name,Age," +
    //     "SSN) VALUES (12,'name',23,34)");
    var ret = employeeDB->execute(sqlString);
    // Check type to verify the validity of the result from database
    if (ret is sql:ExecutionResult) {
        updateStatus = { "Status": "Data Inserted Successfully" };
    } else {
        updateStatus = { "Status": "Data Not Inserted", "Error": "Error occurred in data update" };
        // Log the error for the service maintainers.
        io:println("Error occurred in data update", ret);
    }
    return updateStatus;
}

public function retrieveById(int employeeID) returns json {
    json jsonReturnValue = {};
    string sqlString = string `SELECT * FROM EMPLOYEES WHERE EmployeeID = ${employeeID}`;
    // Retrieve employee data by invoking select remote function defined in ballerina sql client
    stream<record{}, error> ret = employeeDB->query(sqlString,Employee);
    stream<Employee, sql:Error> employeeStream = <stream<Employee, sql:Error>> ret;

    error? e = employeeStream.forEach(function(Employee employee) {
        io:println(employee);
        json|error employeeData = employee.cloneWithType(json);

        if (employeeData is json) {
            jsonReturnValue = employeeData;
        } else {
            jsonReturnValue = { "Status": "Data Not Found", "Error": "Error occurred in data conversion" };
            io:println("Error occurred in data conversion", employeeData);
        }        
    });

    return jsonReturnValue;

    // if (employeeStream is Employee) {
    //     // Convert the sql data table into JSON using type conversion
    //     Employee jsonConvertRet = ret.cloneWithType(Employee);
    //     // var jsonConvertRet = json.constructFrom(ret);
    //     if (jsonConvertRet is json) {
    //         jsonReturnValue = jsonConvertRet;
    //     } else {
    //         jsonReturnValue = { "Status": "Data Not Found", "Error": "Error occurred in data conversion" };
    //         io:println("Error occurred in data conversion", jsonConvertRet);
    //     }
    // } else {
    //     jsonReturnValue = { "Status": "Data Not Found", "Error": "Error occurred in data retrieval" };
    //     io:println("Error occurred in data retrieval", ret);
    // }
    // return jsonReturnValue;
}

public function updateData(string name, int age, int ssn, int employeeId) returns json {
    json updateStatus;
    // string sqlString =
    // "UPDATE EMPLOYEES SET Name = ?, Age = ?, SSN = ? WHERE EmployeeID  = ?";
    string sqlString = string `UPDATE EMPLOYEE_RECORDS.EMPLOYEES SET Name = '${name}', Age = ${age},SSN = ${ssn} WHERE EmployeeID = ${employeeId}`;
    // Update existing data by invoking update remote function defined in ballerina sql client
    var ret = employeeDB->execute(sqlString);
    if (ret is sql:ExecutionResult) {
        // if (ret["updatedRowCount"] > 0) {
            updateStatus = { "Status": "Data Updated Successfully" };
        // } else {
        //     updateStatus = { "Status": "Data Not Updated" };
        // }
    } else {
        updateStatus = { "Status": "Data Not Updated",  "Error": "Error occurred during update operation" };
        // Log the error for the service maintainers.
        io:println("Error occurred during update operation", ret);
    }
    return updateStatus;
}

public function deleteData(int employeeId) returns (json) {
    json updateStatus;

    // string sqlString = "DELETE FROM EMPLOYEES WHERE EmployeeID = ?";
    string sqlString = string `DELETE FROM EMPLOYEE_RECORDS.EMPLOYEES WHERE EmployeeID = ${employeeId}`;
    // Delete existing data by invoking update remote function defined in ballerina sql client
    var ret = employeeDB->execute(sqlString);
    if (ret is sql:ExecutionResult) {
        updateStatus = { "Status": "Data Deleted Successfully" };
    } else {
        updateStatus = { "Status": "Data Not Deleted",  "Error": "Error occurred during delete operation" };
        // Log the error for the service maintainers.
        io:println("Error occurred during delete operation", ret);
    }
    return updateStatus;
}
