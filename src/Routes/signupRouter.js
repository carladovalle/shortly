import express from "express";
import * as signupControllers from '../Controllers/signup.controller.js';

const router = express.Router();

router.post('/signup', signupControllers.register);

export default router;