import ballerinax/mysql;
import ballerinax/mysql.driver as _;
import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
@display {
    label: "BillingAPI",
    id: "BillingAPI-4a797555-30e5-4e29-9e4c-8387b1926808"
}
service / on new http:Listener(9090) {
    @display {
        label: "mysql",
        id: "mysql-fc9307ac-8a37-4493-abc8-027113726bfa"
    }
    mysql:Client mysqlEp;

    @display {
        label: "shippingAPI",
        id: "shippingAPI-80573ceb-e42a-467f-a5d4-0dce2afe65c3"
    }
    http:Client shippingApiClient;

    function init() returns error? {
        self.mysqlEp = check new ();
        self.shippingApiClient = check new ("");
    }

    # A resource for generating greetings
    # + name - the input string name
    # + return - string name with hello message or error
    resource function get greeting(string name) returns string|error {
        // Send a response back to the caller.
        if name is "" {
            return error("name should not be empty!");
        }
        return "Hello, " + name;
    }
}
