import connection from "../Database/database.js";
import bcrypt from 'bcrypt';
import { v4 as uuid } from 'uuid';

async function login (req, res) {

    const { email, password } = req.body;

    try {

        const { rows: users } = await connection.query(`SELECT * FROM users WHERE email = $1;`, [email]);
        const [user] = users;
        console.log(user);
        console.log(user.password);
        console.log(password);
        const decryptedPassword = bcrypt.compareSync(password, user.password);

        if (decryptedPassword) {

            const token = uuid();

            await connection.query(
            `INSERT INTO sessions ("userId", token) VALUES ($1, $2);`, [userId, token]
        );
        
        console.log(user.id);
        console.log(token);

        }

        return res.status(200).send(token);

    } catch (error) {
        return res.status(422).send(error.message);
    }

}

export { login };