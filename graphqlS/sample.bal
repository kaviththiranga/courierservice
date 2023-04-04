import ballerina/http;
import ballerina/graphql;

# A service representing a network-accessible GraphQL API
@display {
    label: "graphqlS",
    id: "graphqlS-eef339ab-534a-4435-8669-7bca9e0947f0"
}
service / on new graphql:Listener(8090) {
    @display {
        label: "tracking",
        id: "tracking-0ffab161-06a3-47c5-86b7-0668811d6c3b"
    }
    http:Client serviceClient1;

    @display {
        label: "shipping",
        id: "shipping-1d425e93-7ded-4bb0-88d2-e9cde1f8cb13"
    }
    http:Client serviceClient;

    function init() returns error? {
        self.serviceClient1 = check new ("");
        self.serviceClient = check new ("");
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
