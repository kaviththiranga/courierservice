import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
@display {
    label: "shippingAPI",
    id: "shippingAPI-80573ceb-e42a-467f-a5d4-0dce2afe65c3"
}
service / on new http:Listener(9090) {

    function init() returns error? {

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
