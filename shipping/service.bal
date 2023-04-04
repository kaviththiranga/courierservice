import ballerinax/mysql;
import ballerinax/mysql.driver as _;
import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
@display {
    label: "shipping",
    id: "shipping-1d425e93-7ded-4bb0-88d2-e9cde1f8cb13"
}
service / on new http:Listener(9090) {
    @display {
        label: "tracking",
        id: "tracking-0ffab161-06a3-47c5-86b7-0668811d6c3b"
    }
    http:Client serviceClient;

    @display {
        label: "mysql",
        id: "mysql-8384289e-45be-4bfd-b5f0-481c9346e3b4"
    }
    mysql:Client mysqlEp;

    function init() returns error? {
        self.serviceClient = check new ("");
        self.mysqlEp = check new ();
    }

    # A resource for generating greetings
    # + name - the input string name
    # + return - string name with hello message or error
    resource function get shipping/[string id]() returns string|error {
        // Send a response back to the caller.
        if name is "" {
            return error("name should not be empty!");
        }
        return "Hello, " + name;
    }
}
