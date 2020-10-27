import ballerina/io;
import ballerina/sql;
import ballerinax/mysql;

string dbUser = "roly";
string dbPassword = "alianza2";

function initializeClients() returns sql:Error? {

    mysql:Client|sql:Error mysqlClient1 = new ();
    if (mysqlClient1 is sql:Error) {
        io:println("Error when initializing the MySQL client without any " +
            "params. ", mysqlClient1.message());
    } else {
        io:println("Simple MySQL client created successfully");
        check mysqlClient1.close();
    }


    mysql:Client mysqlClient2 = check new ("localhost", dbUser, dbPassword);
    io:println("MySQL client with user and password created.");


    mysql:Client mysqlClient3 = check new (user = dbUser,
        password = dbPassword);
    io:println("MySQL client with user and password created " +
        "with default host.");



    mysql:Client mysqlClient4 = check new ("localhost", dbUser, dbPassword,
        "information_schema", 3306);
    io:println("MySQL client with host, user, password, database and " +
        "port created.");


    mysql:Options mysqlOptions = {
        ssl: {
            mode: mysql:SSL_PREFERRED        },
        connectTimeoutInSeconds: 10
    };


    mysql:Client mysqlClient5 = check new (user = dbUser, password = dbPassword,
        options = mysqlOptions);
    io:println("MySQL client with database options created.");


    sql:ConnectionPool connPool = {
        maxOpenConnections: 5,
        maxConnectionLifeTimeInSeconds: 2000.0,
        minIdleConnections: 5    };


    mysql:Client mysqlClient6 = check new (user = dbUser, password = dbPassword,
        options = mysqlOptions, connectionPool = connPool);
    io:println("MySQL client with connection pool created.");


    mysql:Client mysqlClient7 = check new ("localhost", dbUser, dbPassword,
        "information_schema", 3306, mysqlOptions, connPool);


    mysql:Client mysqlClient8 = check new (host = "localhost",
        user = dbUser, password = dbPassword, database =
        "information_schema", port = 3306, options = mysqlOptions,
        connectionPool = connPool);


    check mysqlClient2.close();
    check mysqlClient3.close();
    check mysqlClient4.close();
    check mysqlClient5.close();
    check mysqlClient6.close();
    check mysqlClient7.close();
    check mysqlClient8.close();
    
}
    
public function main() {
    sql:Error? err = initializeClients();    
    if (err is sql:Error) {
        io:println("Error occurred, initialization failed! ", err);
    } else {
        io:println("Sample executed successfully!");
    }
}
