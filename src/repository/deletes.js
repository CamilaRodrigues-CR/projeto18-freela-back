import { db } from "../database/connectionDatabase.js";

// -------- rota delete product by id ------------------
export function searchProducts (id){
    const resultSearch = db.query(`SELECT name , "userId" FROM products WHERE id =  $1;`, [id])
    
    return resultSearch;
}


export function deleteCategorie(id){
    const resultDelete = db.query(`DELETE FROM categorie_product WHERE "productsId" = $1;`, [id])
    
    return resultDelete;
}


export function deleteProduct (id){
    const resultDelete = db.query(`DELETE FROM products WHERE "id" = $1;`, [id])
    
    return resultDelete;
}