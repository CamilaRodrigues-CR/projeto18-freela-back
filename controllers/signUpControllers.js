import bcrypt from 'bcrypt';
import { findEmail, insertUser } from "../repository/users.js";

export async function postSignUp(req, res) {
    const { name, email, password, phone, cpf } = req.body;
    const senha = password;

    const passwordHash = bcrypt.hashSync(senha, 10);

    try {

        const search = await findEmail(email);

        if (search.rowCount > 0) return res.status(409).send('email já cadastrado');

        const user = await insertUser(req.body, passwordHash)

        res.sendStatus(201)

    } catch (err) {
        res.status(500).send(err.message)
    }
}