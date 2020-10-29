import ballerina/io;
import ballerina/test;
//import ballerina/config;
//import ballerina/log;

MySqlConfiguration config = {
        dbHost: "<host>",
        dbName: "<name>",
        dbPassword: "<password>",
        dbUrl: "http://localhost:8080"
    };

@test:Config{}
function testGetEmployees(){
    // MySqlConfiguration config = {
    //     dbHost: "localhost",
    //     dbName: "roly",
    //     dbPassword: "alianza2",
    //     dbUrl: "http://localhost:8080"
    // };

    DBClient dbClient = new(config);

    io:println("\n ---------------------------------------------------------------------------");

    json|error result = dbClient.getEmployees();

    if result is json{
            io:println(result);

    }else{
        test:assertFail(result.message());
    }
}

@test:Config{}
function testGetEmployeeById(){

    DBClient dbClient = new(config);

    io:println("\n ---------------------------------------------------------------------------");

    json|error result = dbClient.getEmployeeById(3);

    if result is json{
            io:println(result);

    }else{
        test:assertFail(result.message());
    }
}

@test:Config{}
function testAddEmployee(){

    DBClient dbClient = new(config);

    io:println("\n ---------------------------------------------------------------------------");

    Employee e = {id:6, name:"sachi", age:25, team: "Engineering"};

    json|error result = dbClient.addEmployee(e);

    if result is json{
            io:println(result);

    }else{
        test:assertFail(result.message());
    }
}

@test:Config{}
function testAddEmployeeBatch(){

    DBClient dbClient = new(config);

    io:println("\n ---------------------------------------------------------------------------");

    Employee[] e = [{id:7, name:"kavi",age:25, team: "Marketing"}, {id:8, name:"merl",age:25, team: "Support"}];

    json|error result = dbClient.addEmployeeBatch(e);

    if result is json{
            io:println(result);

    }else{
        test:assertFail(result.message());
    }
}

@test:Config{}
function testUpdateEmployee(){

    DBClient dbClient = new(config);

    io:println("\n ---------------------------------------------------------------------------");

    Employee e = {id:6, name:"sachi updated", age:26, team: "Engineering"};

    json|error result = dbClient.updateEmployee(e);

    if result is json{
            io:println(result);

    }else{
        test:assertFail(result.message());
    }
}

@test:Config{}
function testDeleteEmployee(){

    DBClient dbClient = new(config);

    io:println("\n ---------------------------------------------------------------------------");

    json|error result = dbClient.deleteEmployee(8);

    if result is json{
            io:println(result);

    }else{
        test:assertFail(result.message());
    }
}

@test:Config{}
function testSwapEmployeeTeams(){

    DBClient dbClient = new(config);

    io:println("\n ---------------------------------------------------------------------------");

    json|error result = dbClient.swapEmployeeTeams(1,2);

    if result is json{
            io:println(result);

    }else{
        test:assertFail(result.message());
    }
}