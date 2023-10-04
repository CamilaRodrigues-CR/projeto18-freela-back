import { Router } from "express";
import { postSignUp } from "../controllers/signUpControllers.js";
import { userSchema } from "../schemas/validateUser.js";
import { validateSchema } from "../middlewares/schemaValidate.js";


const signUpRouter = Router();

signUpRouter.post('/signup',validateSchema(userSchema), postSignUp);

export default signUpRouter;