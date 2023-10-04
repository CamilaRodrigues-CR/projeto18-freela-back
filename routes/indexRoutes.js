import { Router } from "express";
import signInRouter from "./signInRoutes.js";
import signUpRouter from "./signUpRoutes.js";


const router = Router();

router.use(signInRouter);
router.use(signUpRouter);


export default router;