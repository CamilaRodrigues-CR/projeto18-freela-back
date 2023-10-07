import { db } from "../database/connectionDatabase.js";

export function updateProduct(id) {
    const updateProduct = db.query(`UPDATE products SET status = false WHERE id = $1 ;` , [id])

    return updateProduct;
}