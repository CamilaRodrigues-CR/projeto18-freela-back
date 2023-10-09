import { db } from "../database/connectionDatabase.js";

//---------------------------------------------------------- token --------------------------------------------------------------------------------------
export function getToken(token) {
    const resultToken = db.query(`SELECT token FROM sessions WHERE token = $1;`, [token])

    return resultToken;
}

export function searchUser (session){
    const resultCompare = db.query(`SELECT "userId" FROM sessions WHERE token = $1;`, [session.rows[0].token])
    
    return resultCompare;
}


// ------------------------------------------------------- rotas signIn ----------------------------------------------------------------------------------
export function findEmail(email) {
    const resultEmail = db.query(`SELECT email FROM users WHERE email = $1`, [email])

    return resultEmail;
}

export function insertUser(body, passwordHash) {
    const { name, email, phone, cpf } = body;

    const resultInsertUser = db.query(`INSERT INTO users (name, email, password, phone, cpf) VALUES ($1, $2, $3, $4, $5);`,
        [name, email, passwordHash, phone, cpf]);

    return resultInsertUser;
}


//--------------------------------------------------------- rotas signUp --------------------------------------------------------------------------------- 
export function findUser(email) {
    const resultUser = db.query(`SELECT id, email, password FROM users WHERE email = $1;`, [email])
    
    return resultUser
}

export function insertToken(user, token) {
    const insertedToken = db.query(`INSERT INTO sessions (token, "userId") VALUES ($1, $2);`, [token, user.rows[0].id])

    return insertedToken
}