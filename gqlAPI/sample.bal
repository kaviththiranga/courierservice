import ballerina/http;
import ballerina/graphql;

# A service representing a network-accessible GraphQL API
@display {
    label: "gqlAPI",
    id: "gqlAPI-f98f146e-781e-417d-a927-8ef75fca5ba4"
}
service / on new graphql:Listener(8090) {
    @display {
        label: "shippingAPI",
        id: "shippingAPI-80573ceb-e42a-467f-a5d4-0dce2afe65c3"
    }
    http:Client shippingApiClient;

    @display {
        label: "BillingAPI",
        id: "BillingAPI-4a797555-30e5-4e29-9e4c-8387b1926808"
    }
    http:Client billingApiClient;

    function init() returns error? {
        self.shippingApiClient = check new ("");
        self.billingApiClient = check new ("");
    }

    # A resource for generating greetings
    # Example query:
    # query GreetWorld{ 
    # greeting(name: "World") 
    # }
    # Curl command: 
    # curl -X POST -H "Content-Type: application/json" -d '{"query": "query GreetWorld{ greeting(name:\"World\") }"}' http://localhost:8090
    #
    # + name - the input string name
    # + return - string name with greeting message or error
    resource function get greeting(string name) returns string|error {
        if name is "" {
            return error("name should not be empty!");
        }
        return "Hello, " + name;
    }
}
