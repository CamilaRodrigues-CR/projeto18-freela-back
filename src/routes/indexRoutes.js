import { Router } from "express";
import signInRouter from "./signInRoutes.js";
import signUpRouter from "./signUpRoutes.js";
import productsRouter from "./productsRoutes.js";


const router = Router();

router.use(signInRouter);
router.use(signUpRouter);
router.use(productsRouter);


export default router;