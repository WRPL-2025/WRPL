import supertokens from "supertokens-node";
import Session from "supertokens-node/recipe/session";
import EmailPassword from "supertokens-node/recipe/emailpassword";

supertokens.init({
    framework: "express",
    supertokens: {
        // changed to use local SuperTokens core instance
        connectionURI: "http://localhost:3567",
        // apiKey: <YOUR_API_KEY> // if using an apiKey locally, add it here
    },
    appInfo: {
        appName: "Anycademy", // changed for local deployment
        apiDomain: "http://localhost:3001", // local backend endpoint
        websiteDomain: "http://localhost:3000", // local frontend endpoint
        apiBasePath: "/auth",
        websiteBasePath: "/auth",
    },
    recipeList: [
        EmailPassword.init(), // initializes signin / sign up features
        Session.init() // initializes session features
    ]
});
