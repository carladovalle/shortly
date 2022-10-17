import express from "express";
import cors from "cors";
import dotenv from "dotenv";

dotenv.config();

import signupRouter from "./Routes/signupRouter.js";
import loginRouter from "./Routes/loginRouter.js";
import linksRouter from "./Routes/linksRouter.js";

const app = express();
app.use(cors());
app.use(express.json());

app.use(signupRouter);
app.use(loginRouter);
app.use(linksRouter);

app.listen(process.env.PORT, () => {
    console.log("Servidor rodando.")}
);