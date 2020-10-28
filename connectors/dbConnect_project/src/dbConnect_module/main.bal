import ballerina/http;
import ballerina/io;

public class DBClient{
    public string dbHost;
    public string dbName;
    public string dbPassword;
    public string dbUrl;
    public http:Client basicClient;

    function init(MySqlConfiguration msConf){
        self.dbHost = msConf.dbHost;
        self.dbName = msConf.dbName;
        self.dbPassword = msConf.dbPassword;
        self.dbUrl = msConf.dbUrl;

        self.basicClient = new (self.dbUrl);
    }

    public function getEmployees() returns @tainted json|error{
        http:Response? result = new;

        result = <http:Response> self.basicClient->get("/data/employees");

        if result is http:Response{
            if (result.statusCode == http:STATUS_OK) {

                json payload = <json>result.getJsonPayload();
            
                return payload;

            } else {
                error err = error("error occurred while sending GET request");
                io:println(err.message(),", status code: ", result.statusCode,", reason: ", result);
                return err;
            }
        }else{

            error err = error("no parameters are provided");
            return err;
        }
    }

    public function getEmployeeById(int employeeId) returns @tainted json|error {
        http:Response? result = new;

        result = <http:Response> self.basicClient->get(string `/data/employees/${employeeId}`);

        if result is http:Response{
            if (result.statusCode == http:STATUS_OK) {

                json payload = <json>result.getJsonPayload();
            
                return payload;

            } else {
                error err = error("error occurred while sending GET request");
                io:println(err.message(),", status code: ", result.statusCode,", reason: ", result);
                return err;
            }
        }else{

            error err = error("no parameters are provided");
            return err;
        }
    }

    public function addEmployee(Employee employee) returns @tainted json|error {
        http:Response? result = new;

        result = <http:Response> self.basicClient->post(string `/data/employees/`,<@untainted> check employee.cloneWithType(json));

        if result is http:Response{
            if (result.statusCode == http:STATUS_OK) {

                // json payload = <json>result.getJsonPayload();
                json payload = {};
            
                return payload;

            } else {
                error err = error("error occurred while sending GET request");
                io:println(err.message(),", status code: ", result.statusCode,", reason: ", result);
                return err;
            }
        }else{

            error err = error("no parameters are provided");
            return err;
        }
    }

    public function addEmployeeBatch(Employee[] employee) returns @tainted json|error {
        http:Response? result = new;

        result = <http:Response> self.basicClient->post(string `/data/employees_batch/`,<@untainted> check employee.cloneWithType(json));

        if result is http:Response{
            if (result.statusCode == http:STATUS_OK) {

                // json payload = <json>result.getJsonPayload();
                json payload = {};
            
                return payload;

            } else {
                error err = error("error occurred while sending GET request");
                io:println(err.message(),", status code: ", result.statusCode,", reason: ", result);
                return err;
            }
        }else{

            error err = error("no parameters are provided");
            return err;
        }
    }      

    public function updateEmployee(Employee employee) returns @tainted json|error {
        http:Response? result = new;

        result = <http:Response> self.basicClient->put(string `/data/employees/`,<@untainted> check employee.cloneWithType(json));

        if result is http:Response{
            if (result.statusCode == http:STATUS_OK) {

                // json payload = <json>result.getJsonPayload();
                json payload = {};
            
                return payload;

            } else {
                error err = error("error occurred while sending GET request");
                io:println(err.message(),", status code: ", result.statusCode,", reason: ", result);
                return err;
            }
        }else{

            error err = error("no parameters are provided");
            return err;
        }
    } 
    
    public function deleteEmployee(int employeeId) returns @tainted json|error {
        http:Response? result = new;

        result = <http:Response> self.basicClient->delete(string `/data/employees/${employeeId}`);

        if result is http:Response{
            if (result.statusCode == http:STATUS_OK) {

                // json payload = <json>result.getJsonPayload();
                json payload = {};
            
                return payload;

            } else {
                error err = error("error occurred while sending GET request");
                io:println(err.message(),", status code: ", result.statusCode,", reason: ", result);
                return err;
            }
        }else{

            error err = error("no parameters are provided");
            return err;
        }
    }

    public function swapEmployeeTeams(int employeeId1, int employeeId2) returns @tainted json|error {
        http:Response? result = new;

        result = <http:Response> self.basicClient->post(string `/data/employee_team_swap/${employeeId1}/${employeeId2}`,"hello");

        if result is http:Response{
            if (result.statusCode == http:STATUS_OK) {

                // json payload = <json>result.getJsonPayload();
                json payload = {};
            
                return payload;

            } else {
                error err = error("error occurred while sending GET request");
                io:println(err.message(),", status code: ", result.statusCode,", reason: ", result);
                return err;
            }
        }else{

            error err = error("no parameters are provided");
            return err;
        }
    }                
}

public type MySqlConfiguration record {
    string dbHost;
    string dbName;
    string dbPassword;
    string dbUrl;
};

public type Employee record {|
    int id;
    string name;
    int age;
    string team;
|};