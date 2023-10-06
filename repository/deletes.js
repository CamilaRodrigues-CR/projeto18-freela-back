
// -------- rota delete product by id ------------------
export function searchProducts (id){
    const resultSearch = db.query(`SELECT product, "userId" FROM products WHERE id =  $1;`, [id])
    
    return resultSearch;
}

export function deleteProduct (id){
    const resultDelete = db.query(`DELETE FROM products WHERE "id" = $1;`, [id])
    
    return resultDelete;
}