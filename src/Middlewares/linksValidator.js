import { linksSchema } from "../Schemas/linksSchema.js";

export function validateLinks (req, res, next) {

    const validation = linksSchema.validate(req.body, {
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