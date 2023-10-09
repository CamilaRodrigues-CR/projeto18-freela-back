import { Router } from "express";
import { postSignIn } from "../controllers/signInControllers.js";
import { signInSchema } from "../schemas/signInSchema.js";
import { validateSchema } from "../middlewares/schemaValidate.js";

const signInRouter = Router();

signInRouter.post('/signin',validateSchema(signInSchema), postSignIn);

export default signInRouter;