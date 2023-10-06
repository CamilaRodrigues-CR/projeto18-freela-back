import { Router } from "express";
import { authValidate } from "../middlewares/authValidate.js";
import { deleteProductById, getProductById, postProduct } from "../controllers/productsControllers.js";

const productsRouter = Router();

productsRouter.get('/products/:id', authValidate, getProductById)
productsRouter.post('/products', authValidate, postProduct);
productsRouter.delete('/products/:id', authValidate, deleteProductById);

export default productsRouter;