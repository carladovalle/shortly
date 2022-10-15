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

async function getUrl (req, res) {

    const { id } = req.params;

    if (id) {

        try {

            const { rows: urls } = await connection.query(`SELECT * FROM urls WHERE id = $1;`, [id]);
 
            if (urls.length === 0) {
                return res.sendStatus(404);
            }

            return res.status(200).send({id: urls[0].id, shortUrl: urls[0].shortUrl, url: urls[0].url});

        } catch (error) {
            return res.send(error.message);
        }

    } else {
        return res.status(404).status('ID nulo');
    }

}

export { urlsShorten, getUrl };