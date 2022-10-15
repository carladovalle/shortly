import connection from "../Database/database.js";
import bcrypt from 'bcrypt';

async function register (req, res) {

    const { name, email, password, confirmPassword } = req.body;

    const hashPassword = bcrypt.hashSync(password, 10);

    try {

        await connection.query(
            'INSERT INTO users (name, email, password, "confirmPassword") VALUES ($1, $2, $3, $4);', [name, email, hashPassword, hashPassword]
        );

        return res.sendStatus(201);

    } catch (error) {
        return res.status(422).send(error.message);
    }

}

export { register };