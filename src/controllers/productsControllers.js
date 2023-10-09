import { db } from "../database/connectionDatabase.js";
import { deleteCategorie, deleteProduct, searchProducts } from "../repository/deletes.js"; 
import { updateProduct } from "../repository/patch.js";
import { addCategorie, addPhoto, findAllProducts, findMyProducts, findProduct, findProductId, findProductbyId, product, searchCategorie } from "../repository/products.js";
import { searchUser } from "../repository/users.js";

export async function getAllproducts(req, res) {

    try {
        const allProducts = await findAllProducts()

        const result = allProducts.rows.map(u => {
            const product = {
                id: u.productsId,
                name: u.name,
                description: u.description,
                price: u.price,
                type: u.type,
                photo: u.photo
            }
            delete product.userId;
            delete product.categorieId;

            return product;
        })
        res.status(200).send(result)
    } catch (err) {
        res.status(500).send(err.message)
    }
}

export async function getProductById(req, res) {
    const { id } = req.params;

    try {
        const product = await findProductbyId(id)
        //fazer um map para ajustar o formato do retorno
        const result = product.rows.map(u => {
            const obj = {
                id: u.productsId,
                name: u.name,
                description: u.description,
                price: u.price,
                type: u.type,
                photo: u.photo
            }
            delete obj.userId;
            delete obj.categorieId;

            return obj;
        })[0]

        if (product.rowCount === 0) {
            return res.sendStatus(404)
        }
        console.log(result)
        res.status(200).send(result)
    } catch (err) {
        res.status(500).send(err.message)
    }
}

export async function getMyProducts(req, res) {
    const session = res.locals.session;

    try {
        //achar o id do usuario
        const userId = await searchUser(session);
        console.log(userId.rows[0]);

        //preciso fazer um join do usuario com todos os seus produtos
        const user_products = await findMyProducts(userId)
        console.log(user_products.rows[0])

        //fazer um map para retornar no formato que eu quero
        const result = user_products.rows.map(u => {
            const product = {
                id: u.productsId,
                name: u.name,
                description: u.description,
                price: u.price,
                type: u.type,
                photo: u.photo
            }
            delete product.userId;
            delete product.categorieId;

            return product;
        })

        res.status(200).send(result)

    } catch (err) {
        res.status(500).send(err.message)
    }
    /*   
    
    */
}

export async function postProduct(req, res) {
    const { name, description, price, type, photo } = req.body
    const session = res.locals.session
    console.log("photo", photo)

    try {
        //buscar o id do usuario para inserir na tabela 
        const userId = await searchUser(session)

        //inserir o id, name, description e price na tabela products
        await product(name, description, price, userId)

        //pegar todos os dados do produto salvo
        const findNewProductId = await findProductId(name);
        console.log("findnewP", findNewProductId.rows[0])


        //salvar a categoria do produto
        //preciso pegar o id da categoria que veio no body e salvar junto com o id do produto na tabela categorie_product 
        const findCategorie = await searchCategorie(type);
        console.log(findCategorie)

        await addCategorie(findNewProductId, findCategorie)

        //adicionar a foto 
        const newphoto = await db.query(`INSERT INTO photos (photo, "productId") VALUES ($1, $2);`, 
        [photo, findNewProductId.rows[0].id]);
        console.log("newphoto", newphoto)


        //buscar os dados para retornar ao front
        const resultPost = await findProduct(findNewProductId)
    
        res.status(201).send(resultPost.rows[0])

    } catch (err) {
        res.status(500).send(err.message)
    }
}


export async function deleteProductById(req, res) {
    const { id } = req.params                 //
    const session = res.locals.session

    try {
        // achar o product do id recebido
        const findProduct = await searchProducts(id)

        if (findProduct.rowCount === 0) return res.sendStatus(404);   // erro se não encontrar o product

        //verificar se o product pertence ao usuario (comparar o id session com "usersId")
        const productUserId = await searchUser(session)

        if (productUserId.rows[0].userId === findProduct.rows[0].userId) {
            //apagar o produto da relação produto-categoria
            await deleteCategorie(id)

            await deleteProduct(id)   // fazer a query para o delete

            res.sendStatus(204)

        } else {
            res.sendStatus(401)
        }

    } catch (err) {
        res.status(500).send(err.message)
    }
}


export async function patchProduct(req, res) {
    const { id } = req.params                 //
    const session = res.locals.session

    try {
        //preciso achar o produto
        const findProduct = await searchProducts(id)

        if (findProduct.rowCount === 0) return res.sendStatus(404);   // erro se não encontrar o product

        //verificar se o product pertence ao usuario (comparar o id session com "usersId")
        const productUserId = await searchUser(session)

        if (productUserId.rows[0].userId === findProduct.rows[0].userId) {
            //fazer a query para alterar status
            await updateProduct(id);

            //retornar o sucesso
            res.sendStatus(204)

        }

        } catch (err) {
            res.status(500).send(err.message)
        }
    }