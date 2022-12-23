import { connectionDB } from "../database/db.js";

export async function getRanking(req, res){

    try{
        const ranking = await connectionDB.query('SELECT * FROM urls LIMIT 10');
        res.send(ranking.rows)
    }catch (err) {
        res.status(500).send(err.message);
    }
}