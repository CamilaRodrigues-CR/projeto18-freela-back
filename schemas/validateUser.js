import Joi from "joi";

export const userSchema = Joi.object({
    name: Joi.string().required(),
    email: Joi.string().email().trim().required(),
    phone: Joi.string().pattern(/^\d{10}|\d{11}$/).required(),
    cpf: Joi.string().pattern(/^\d{3}\d{3}\d{3}\d{2}$/).required(),
    password:Joi.string().min(3).required(),
    confirmPassword:Joi.string().min(3).required()

});
