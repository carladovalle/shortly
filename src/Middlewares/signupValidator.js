import { signupSchema } from "../Schemas/signupSchema.js";

export function validateSignup(req, res, next) {

    const validation = signupSchema.validate(req.body, {
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