import connection from "../Database/database.js";
import { nanoid } from 'nanoid'

async function urlsShorten (req, res) {

    const { id } = res.locals.user;
    console.log(id)
    const { url } = req.body;

    try {

        const NUM_OF_CHARS = 8;
        const shortUrl = nanoid(NUM_OF_CHARS);

        await connection.query(
            `INSERT INTO urls ("userId", url, "shortUrl") VALUES ($1, $2, $3);`, [id, url, shortUrl]
        );

        res.sendStatus(200);

    } catch (error) {
        return res.status(422).send(error.message);
    }

}

export { urlsShorten };