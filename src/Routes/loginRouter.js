import express from "express";
import * as loginControllers from '../Controllers/login.controller.js';
import { validateLogin } from '../Middlewares/loginValidator.js';

const router = express.Router();

router.post('/login', validateLogin, loginControllers.login);

export default router;