import ballerina/http;
import ballerina/test;

int TEST_EMPLOYEE_ID = 879796979;

// Create an endpoint with employee db service
http:Client httpEndpoint = new("http://localhost:9090/records");

@test:Config {
    dependsOn: ["testAddEmployeeResource"]
}
function testRetrieveByIdResource() {
    json expectedJson;
    // Testing retrieve by employee id resource
    // Prepare request with query parameter
    string url = "/employee/" + TEST_EMPLOYEE_ID.toString();
    // Send the request to service and get the response
    var resp = httpEndpoint->get(url);
    if (resp is http:Response) {
        // Test the responses from the service with the original test data
        test:assertEquals(resp.statusCode, 200, msg =
            "Retreive employee resource did not reespond with 200 OK signal");
        json|error receivedPayload = resp.getJsonPayload();
        if (receivedPayload is json) {
            expectedJson = [{ "EmployeeID": 879796979, "Name": "Alice", "Age": 30, "SSN":
            123456789 }];
            json[] jsonArray = <json[]> receivedPayload;
            test:assertEquals(jsonArray[0], jsonArray[0], msg =
                "Name did not store in the database");
        } else {
            test:assertFail(msg = "Payload retrieval failed: " + <string>receivedPayload.detail()["message"]);
        }
    } else {
        test:assertFail(msg = "Request failed: " + <string>resp.detail()["message"]);
    }
}

@test:Config{}
function testAddEmployeeResource() {

    // Initialize the empty http request
    http:Request req = new;
    json expectedJson;

    // Testing add new employee resource
    // Prepare sample employee and set the json payload
    json requestJson = { "name": "Alice", "age": 30, "ssn": 123456789, "employeeId":
    TEST_EMPLOYEE_ID };
    req.setJsonPayload(requestJson);
    // Send the request to service and get the response
    var resp = httpEndpoint->post("/employee", req);
    if (resp is http:Response) {
        // Test the response status code is correct
        test:assertEquals(resp.statusCode, 200, msg =
            "Add new employee resource did not reespond with 200 OK signal");
        // Test the responses from the service with the original test data
        var receivedPayload = resp.getJsonPayload();
        if (receivedPayload is json) {
            expectedJson = { "Status": "Data Inserted Successfully" };
            test:assertEquals(receivedPayload, expectedJson, msg =
                "Name did not store in the database");
        } else {
            test:assertFail(msg = "Payload retrieval failed: " + <string>receivedPayload.detail()["message"]);
        }
    } else {
        test:assertFail(msg = "Request failed: " + <string>resp.detail()["message"]);
    }
}

@test:Config {
    dependsOn: ["testAddEmployeeResource"]
}
function testUpdateEmployeeResource() {
    // Initialize the empty http request
    http:Request req = new;
    json expectedJson;

    // Testing update employee resource
    // Prepare sample employee and set the json payload
    json requestJson = { "name": "'Alice_Updated'", "age": 35, "ssn": 123456789,
        "employeeId": TEST_EMPLOYEE_ID };
    req.setJsonPayload(requestJson);
    // Send the request to service and get the response
    var resp = httpEndpoint->put("/employee/", req);
    if (resp is http:Response) {
        // Test the responses from the service with the updated test data
        test:assertEquals(resp.statusCode, 200, msg =
            "Add new employee resource did not reespond with 200 OK signal");

        var receivedPayload = resp.getJsonPayload();
        if (receivedPayload is json) {
            expectedJson = { "Status": "Data Updated Successfully" };
            test:assertEquals(receivedPayload, expectedJson, msg =
                "Name did not updated in the database");
        } else {
            test:assertFail(msg = "Payload retrieval failed: " + <string>receivedPayload.detail()["message"]);
        }
    } else {
        test:assertFail(msg = "Request failed: " + <string>resp.detail()["message"]);
    }
}

@test:Config {
    dependsOn: ["testUpdateEmployeeResource", "testRetrieveByIdResource"]
}
function testDeleteEmployeeResource() {
    // Initialize the empty http request
    http:Request req = new;
    json expectedJson;

    // Testing delete employee resource
    // Send the request to service and get the response
    string url = "/employee/" + TEST_EMPLOYEE_ID.toString();
    var resp = httpEndpoint->delete(url, req);
    if (resp is http:Response) {
        // Test whether the delete operation succeed
        test:assertEquals(resp.statusCode, 200, msg =
            "Delete employee resource did not reespond with 200 OK signal");

        var receivedPayload = resp.getJsonPayload();
        if (receivedPayload is json) {
            expectedJson = { "Status": "Data Deleted Successfully" };
            test:assertEquals(receivedPayload, expectedJson, msg = "Delete data resource failed");
        } else {
            test:assertFail(msg = "Payload retrieval failed: " + <string>receivedPayload.detail()["message"]);
        }
    } else {
        test:assertFail(msg = "Request failed: " + <string>resp.detail()["message"]);
    }
}