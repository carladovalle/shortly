import express from "express";
import * as linksControllers from '../Controllers/links.controller.js';
import { authToken } from '../Middlewares/authToken.js';

const router = express.Router();

router.post('/urls/shorten', authToken, linksControllers.urlsShorten);

export default router;