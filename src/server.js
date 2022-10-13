import express from "express";
import cors from "cors";
import dotenv from "dotenv";

dotenv.config();

import signupRouter from "./Routes/signupRouter.js";

const app = express();
app.use(cors());
app.use(express.json());

app.use(signupRouter);

app.listen(5000, () => {
    console.log("Servidor rodando.")}
);