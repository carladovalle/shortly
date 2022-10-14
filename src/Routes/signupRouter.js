import express from "express";
import * as signupControllers from '../Controllers/signup.controller.js';
import { validateSignup } from '../Middlewares/signupValidator.js';

const router = express.Router();

router.post('/signup', validateSignup, signupControllers.register);

export default router;