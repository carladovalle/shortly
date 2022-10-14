import connection from "../Database/database.js";

async function register (req, res) {

    const { name, email, password, confirmPassword } = req.body;

    try {

        await connection.query(
            'INSERT INTO users (name, email, password, "confirmPassword") VALUES ($1, $2, $3, $4);', [name, email, password, confirmPassword]
        );

        return res.sendStatus(201);

    } catch (error) {
        return res.status(422).send(error.message);
    }

}

export { register };