import { db } from "../database/connectionDatabase.js";
// ---------------- rota get productsById --------------------
export function findProductbyId(id) {
    const productResult = db.query(`
    SELECT products.*, categorie_product.*, categories.type
    FROM products
    JOIN categorie_product ON products.id = categorie_product."productsId"
    JOIN categories ON categories.id = categorie_product."categorieId"
    WHERE products.id = $1;`, [id])

    return productResult
}


// -------------------- rota post product -------------------

export function product(name, description, price, userId){
    const product = db.query(`INSERT INTO products (name, description, price, "userId") VALUES ($1, $2, $3, $4);`, 
    [name, description, price, userId.rows[0].userId]);
    
    return product;
}

export function findProductId(name){
    const productId = db.query(`SELECT * FROM products WHERE name = $1;`, [name])
    return productId;
}

export function searchCategorie(type){
    const resultCategorie = db.query(`SELECT id FROM categories WHERE type = $1;` , [type])

    return resultCategorie;
}

export function addCategorie(findNewProductId, findCategorie) {
    const insertCategorie = db.query(`INSERT INTO categorie_product ("categorieId", "productsId") VALUES ($1, $2);`,
    [findCategorie.rows[0].id, findNewProductId.rows[0].id])
    
    return insertCategorie;   
}

export function findProduct(findNewProductId) {
    const productResult = db.query(`
    SELECT products.*, categorie_product.*, categories.type
    FROM products
    JOIN categorie_product ON products.id = categorie_product."productsId"
    JOIN categories ON categories.id = categorie_product."categorieId"
    WHERE products.id = $1;`, [findNewProductId.rows[0].id])

    return productResult
}

export function addPhoto(photo, findNewProductId) {
    const insertPhoto = db.query(`INSERT INTO photos (photo, "productsId") VALUES ($1, $2);`, 
    [photo, findNewProductId.rows[0].id]);
    console.log("photo" , insertPhoto)
    return insertPhoto;   
}

