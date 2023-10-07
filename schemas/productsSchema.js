import Joi from "joi";

export const productSchema = Joi.object({
    name: Joi.string().required(),
    description:Joi.string().required(),
    price: Joi.string().required(),
    type:Joi.string().required()
});