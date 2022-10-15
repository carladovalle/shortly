import express from "express";
import * as linksControllers from '../Controllers/links.controller.js';
import { authToken } from '../Middlewares/authToken.js';
import { validateLinks } from '../Middlewares/linksValidator.js';

const router = express.Router();

router.post('/urls/shorten', authToken, validateLinks, linksControllers.urlsShorten);
router.get('/urls/:id', linksControllers.getUrl);

export default router;