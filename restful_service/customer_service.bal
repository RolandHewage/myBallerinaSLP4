import ballerina/http;
import ballerina/io;

listener http:Listener httpListener = new(9090);

// Customer management is done using an in-memory map.
// Add some sample customers to 'customersMap' at startup
map<json> customersMap = {};

// RESTful service.
@http:ServiceConfig {
    basePath: "/customer"
}
service customerMgt on httpListener{

    // Resources that handles the HTTP GET requests that are directed to a specific
    // customer using path '/customer/<customerId>'
    @http:ResourceConfig {
        methods: ["GET"],
        path: "/{customerId}"
    }
    resource function findCustomer(http:Caller caller, http:Request req, string customerId) returns error?{
        // check caller->respond("Hello");
        // Find the requested customer from the map and retrieve it in JSON format
        json? payload = customersMap[customerId];

        http:Response response = new;
        if(payload == ()){
            payload = "Customer : " + customerId + " cannot be found.";
        }

        // Set the JSON payload in the outgoing response message.
        response.setJsonPayload(<@untainted> payload);

        // Send response to the client.
        var result = caller->respond(response);
        if(result is error){
            io:println("Error sending response", result);
        }
    }

    // Resource that handles the HTTP POST requests that are directed to the path
    // '/customer' to create a new Customer.
    @http:ResourceConfig {
        methods: ["POST"],
        path: "/"
    }
    resource function addCustomer(http:Caller caller, http:Request req){
        http:Response response = new;
        var customerReq = req.getJsonPayload();
        if(customerReq is json) {
            string customerId = customerReq.Customer.ID.toString();
            customersMap[customerId] = <@untainted> customerReq;

            // Create response message.
            json payload = {status: "Customer created.", customerId: customerId};
            response.setJsonPayload(payload);

            // Set 201 Created status code in the response message.
            response.statusCode = 201;
            // Set 'Location' header in the response message.
            // This can be used by the client to locate the newly added customer.
            response.setHeader("Location","http://localhost:9090/customer/"+customerId);

            // Send response to the client.
            var result = caller->respond(response);
            if(result is error){
                io:println("Error sending response",result);
            }
        } else {
            response.statusCode = 400;
            response.setPayload("Invalid payload received");
            var result = caller->respond(response);
            if(result is error){
                io:println("Error sending response", result);
            }
        }
    }

    // Resource that handles the HTTP PUT requests that are directed to the path
    // '/customer/<customerId>' to update an existing Customer.
    @http:ResourceConfig {
        methods: ["PUT"],
        path: "/{customerId}"
    }
    resource function updateCustomer(http:Caller caller, http:Request req,string customerId){
        var updatedCustomer = req.getJsonPayload();
        http:Response response = new;
        if(updatedCustomer is json){
            // Find the customer that needs to be updated and retrieve it in JSON format.
            json existingCustomer = customersMap[customerId];

            // Updating existing customer with the attributes of the updated customer.
            if(existingCustomer != null){
                // existingCustomer.Customer.Name = updateCustomer.Customer.Name;
                // existingCustomer.Customer.Description = updateCustomer.Customer.Description;
                existingCustomer = updatedCustomer;
                customersMap[customerId] = <@untainted> existingCustomer;
            } else {
                existingCustomer = "Customer : " + customerId + " cannot be found.";
            }

            // Set the JSON payload to the outgoing response message to the client.
            response.setJsonPayload(<@untainted> existingCustomer);

            // Send response to the client.
            var result = caller->respond(response);
            if(result is error){
                io:println("Error sending response",result);
            }
        } else {
            response.statusCode = 400;
            response.setPayload("Invalid payload received");
            var result = caller->respond(response);
            if(result is error){
                io:println("Error sending response",result);
            }
        }
    }

    @http:ResourceConfig {
        methods: ["DELETE"],
        path: "/{customerId}"
    }
    resource function deleteCustomer(http:Caller caller, http:Request req, string customerId){
        http:Response response = new;

        // Remove the requested customer from the map.
        _ = customersMap.remove(customerId);

        json payload = "Customer : " + customerId + " removed.";
        response.setJsonPayload(<@untainted> payload);

        var result = caller->respond(response);
        if(result is error){
            io:println("Error sending response",result);
        }
    }
}