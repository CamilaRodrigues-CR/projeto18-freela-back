import { Router } from "express";
import { authValidate } from "../middlewares/authValidate.js";
import { deleteProductById, getAllproducts, getMyProducts, getProductById, patchProduct, postProduct } from "../controllers/productsControllers.js";

const productsRouter = Router();

productsRouter.get('/products', authValidate, getAllproducts)
productsRouter.get('/products/:id', authValidate, getProductById);
productsRouter.get ('/myProducts', authValidate, getMyProducts);
productsRouter.post('/products', authValidate, postProduct);
productsRouter.delete('/products/:id', authValidate, deleteProductById);
productsRouter.patch('/products/:id', authValidate, patchProduct);

export default productsRouter;