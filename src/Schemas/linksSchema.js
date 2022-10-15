import joi from 'joi';

const linksSchema = joi.object({
    url: joi.string().uri().required()
});

export { linksSchema };