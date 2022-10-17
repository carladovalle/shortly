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

async function getShortUrl (req, res) {

    const { shortUrl } = req.params;

    if (shortUrl) {

        try {

            const { rows: urls } = await connection.query(`SELECT * FROM urls WHERE "shortUrl" = $1;`, [shortUrl]);
 
            if (urls.length === 0) {
                return res.sendStatus(404);
            }

            const [url] = urls;
            
            await connection.query(
                `UPDATE urls SET "visitCount" = "visitCount" + 1 WHERE id = $1;`, [url.id]
            )

            res.redirect(url.url);

        } catch (error) {
            return res.send(error.message);
        }

    } else {
        return res.status(404).status('A url não existe.');
    }
}

async function deleteUrl (req, res) {

    const { id } = req.params;

    const { user } = res.locals;

    if (id) {

        try {

            const { rows: urls } = await connection.query(`SELECT * FROM urls WHERE id = $1;`, [id]);
            const [url] = urls;
            
            if (urls.length === 0) {
                return res.sendStatus(404);
            }

            if (url.userId !== user.id) {
                return res.sendStatus(401);
            }
        
            await connection.query(`
                DELETE FROM urls WHERE id = $1;`, [id]
            );

            return res.sendStatus(200);

        } catch (error) {
            return res.send(error.message);
        }

    } else {
        return res.status(404).status('ID nulo');
    }

}

async function getUsersMe (req, res) {

    const { user } = res.locals;
  
    try {

        const visit = await connection.query(`
            SELECT SUM(u."visitCount") 
            FROM urls u 
            WHERE u."userId" = $1`, 
        [user.id]);

        const [visitCount] = visit.rows;

        const url = await connection.query(`
            SELECT * 
            FROM urls 
            WHERE urls."userId" = $1`, 
        [user.id]);

        const userUrls = url.rows;

        res.send({
            id: user.id,
            name: user.name,
            visitCount: visitCount.sum,
            shortenedUrls: userUrls
          });

    } catch (error) {
        return res.status(422).send(error.message);
    }

}

export { urlsShorten, getUrl, getShortUrl, deleteUrl, getUsersMe };