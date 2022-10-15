import express from "express";
import cors from "cors";
import dotenv from "dotenv";

dotenv.config();

import signupRouter from "./Routes/signupRouter.js";
import loginRouter from "./Routes/loginRouter.js";

const app = express();
app.use(cors());
app.use(express.json());

app.use(signupRouter);
app.use(loginRouter);

app.listen(5000, () => {
    console.log("Servidor rodando.")}
);