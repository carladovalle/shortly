import express from "express";
import * as loginControllers from '../Controllers/login.controller.js';

const router = express.Router();

router.post('/login', loginControllers.login);

export default router;