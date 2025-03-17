import express from "express";
import cors from "cors";
import supertokens from "supertokens-node";
import { errorHandler } from "supertokens-node/framework/express";

// Import SuperTokens configuration
import "./supernode";
import { middleware } from "supertokens-node/lib/build/framework/express";

const app = express();

app.use(
  cors({
    origin: "http://localhost:3000", // allow local frontend
    allowedHeaders: ["Content-Type", ...supertokens.getAllCORSHeaders()],
    credentials: true,
  })
);

// Mount SuperTokens APIs on /auth/*
app.use(middleware());

// ...existing code and other routes...

app.use(errorHandler());

const port = 3001;
app.listen(port, () =>
  console.log(`Server listening on port ${port}`)
);
