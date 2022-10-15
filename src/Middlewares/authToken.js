import connection from "../Database/database.js";

async function authToken (req, res, next) {

    const token = req.headers.authorization?.replace('Bearer ', '');

    if (!token) {
        return res.status(401).send('Você não está logado. Faça login para continuar.');
    }

    try {
         
        const { rows: sessions } = await connection.query(`SELECT * FROM sessions WHERE token = $1;`, [token]);
        const [session] = sessions;

        if (!session) {
            return res.status(401).send('Você não está logado. Faça login para continuar.');
        }

        const { rows: users } = await connection.query(`SELECT * FROM users WHERE id = $1;`, [session.userId]);
        const [user] = users;

        res.locals.user = user;

        next();

    } catch (error) {
        return res.status(422).send(error.message);
        next();
    }

}

export { authToken }