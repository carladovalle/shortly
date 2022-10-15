import { loginSchema } from "../Schemas/loginSchema.js";

export function validateLogin(req, res, next) {

    const validation = loginSchema.validate(req.body, {
        abortEarly: false,
    });

    if (validation.error) {
        const errorList = validation.error.details
          .map((err) => err.message)
          .join('\n');
        return res.status(400).send(errorList);
    }

    next();
    
}