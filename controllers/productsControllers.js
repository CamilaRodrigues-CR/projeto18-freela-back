import { db } from "../database/connectionDatabase.js";
import { deleteProduct, searchProducts } from "../repository/deletes.js";
import { addCategorie, findProduct, findProductId, findProductbyId, product, searchCategorie } from "../repository/products.js";
import { searchUser } from "../repository/users.js";

export async function getAllproducts(req, res) {
   

    try {

    } catch (err) {
        res.status(500).send(err.message)
    }
}

export async function getProductById(req, res) {
    const { id } = req.params;   

    try {
       const product = await findProductbyId(id)
console.log(product)
        //fazer um map para ajustar o formato do retorno
    
        if (product.rowCount === 0) {
                return res.sendStatus(404)
        }
    
        res.status(200).send(product.rows[0])
    } catch (err) {
        res.status(500).send(err.message)
    }
}

export async function getMyProducts (req, res) {
    const session = res.locals.session;

    try{
                
    } catch (err) {
        res.status(500).send(err.message)
    }
    /*   
    
     //achar o id do usuario
        const userId = await db.query(`SELECT "userId" FROM sessions WHERE token = $1;`, [session.rows[0].token]);

        //preciso fazer um join do usuario com todos os seus links
        const user_url = await db.query(`SELECT users.id AS "userId", users.name, urls.id AS "urlId", urls.url, urls."shortUrl", urls.visits 
        FROM users JOIN urls ON users.id = urls."createdByUserId" WHERE users.id = $1;`, [userId.rows[0].userId])

        // preciso somar quantas visitas totais esse usuario tem
        const TotalvisitCount = await db.query(`SELECT SUM(visits) AS "visitCount" FROM urls WHERE "createdByUserId" = $1 GROUP BY "createdByUserId";`, [userId.rows[0].userId])

        //fazer o retorno das 2 tabelas no formato desejado: 
        //(usar o reduce ou invés de map para ter o retorno no formato de objeto e não de array!!!)

        const result = user_url.rows.reduce((acc, u) => {
                const shortenedUrl = {
                    id: u.urlId,
                    shortUrl: u.shortUrl,
                    url: u.url,
                    visitCount: u.visits
                };
        
                acc.shortenedUrls.push(shortenedUrl);
                return acc;
            }, {
                id: userId.rows[0].userId,
                name: user_url.rows[0].name,
                visitCount: TotalvisitCount.rows[0].visitCount,
                shortenedUrls: []
            });
            res.status(200).send(result);


    
    */
}

export async function postProduct(req, res) {
   const {name, description, price, type} = req.body
   const session = res.locals.session

    try { 
         //buscar o id do usuario para inserir na tabela 
         const userId = await searchUser(session)

         //inserir o id, name, description e price na tabela products
         await product(name, description, price, userId)

        //pegar todos os dados do produto salvo
        const findNewProductId = await findProductId(name);
        console.log(findNewProductId.rows[0])


        //salvar a categoria do produto
         //preciso pegar o id da categoria que veio no body e salvar junto com o id do produto na tabela categorie_product 
        const findCategorie = await searchCategorie(type);
        console.log(findCategorie)


        await addCategorie(findNewProductId, findCategorie)
        
        //adicionar uma foto e deixar uma opção de adc novas fotos em outra req??
       
       
        //buscar os dados para retornar ao front
        const resultPost = await findProduct(findNewProductId)
        console.log(resultPost)
        res.status(201).send(resultPost.rows[0])

    } catch (err) {
        res.status(500).send(err.message)
    }
}









        /* 
        //inserir o type na tabela categories    
        const newCategorie = await db.query(`INSERT INTO categories (type, "productsId") VALUES ($1, $2);`, 
        [type, findNewProductId.rows[0].id]);  

        //inserir a photo na tabela photos   
        const newphoto = await db.query(`INSERT INTO photos (photo, "productsId") VALUES ($1, $2);`, 
    [photo, findNewProductId.rows[0].id]);
        //buscando os dados para mandar na resposta
        //const product = await findProduct(findNewProductId.rows[0].id)
         //console.log(product)
         */
export async function deleteProductById(req, res) {  
    const { id } = req.params                 //
    const session = res.locals.session

    if (!session) return res.status(401).send({ message: "envie um token na requisição!!" })   // verificar o token

    try {
        // achar o product do id recebido
        const findProduct = await searchProducts(id)

        if (findProduct.rowCount === 0) return res.sendStatus(404);   // erro se não encontrar o product

        //verificar se o product pertence ao usuario (comparar o id session com "usersId")
        const productUserId = await searchUser(session)
        
        if (productUserId.rows[0].userId === findProduct.rows[0].userId) {
            await deleteProduct(id)   // fazer a query para o delete

            res.sendStatus(204)

        } else {
            res.sendStatus(401)
        }

    } catch (err) {
        res.status(500).send(err.message)
    }
}