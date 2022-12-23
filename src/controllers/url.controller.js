import { connectionDB } from "../database/db.js";
import {nanoid} from "nanoid";


export async function redirectURL(req, res){
    const {shortUrl} = req.params
   
    try{
        const urlOriginal = await connectionDB.query('SELECT link FROM urls WHERE "linkShorten" = $1', [shortUrl])
        console.log(urlOriginal.rows[0].link)
        const linkId = await connectionDB.query('SELECT id FROM urls WHERE "linkShorten" = $1;', [shortUrl])
        await connectionDB.query('INSERT INTO views (contador, "linkId") VALUES ($1, $2);', [1, linkId.rows[0].id])
        const contador = await connectionDB.query('SELECT * FROM views;')
        console.log(contador.rowCount)
        res.redirect(urlOriginal.rows[0].link)
        
    }catch (err) {
        res.status(500).send(err.message);
    }
}


export async function getURLS(req, res){
    const {id} = req.params

try{
    const urls = await connectionDB.query('SELECT * FROM urls WHERE id = $1', [id])
    res.send(urls.rows[0])
}catch (err) {
    res.status(500).send(err.message);
}
}


export async function postURL(req, res){
    const {url} = req.body
    const { authorization } = req.headers;
      const token = authorization?.replace("Bearer ", "");
    const shortUrl = nanoid()

try{
    const usuarioId = await connectionDB.query('SELECT "userId" FROM sessions WHERE token = $1;', [token])
    console.log(usuarioId.rows[0].userId)

    await connectionDB.query('INSERT INTO urls (link, "linkShorten", "userId") VALUES ($1, $2, $3);', [url, shortUrl, usuarioId.rows[0].userId])
    res.send({
        "shortUrl": shortUrl // aqui o identificador que for gerado
    })
}catch (err) {
    res.status(500).send(err.message);
}
}


export async function deleteURL(req, res){
    const {id} = req.params

try{
    await connectionDB.query('DELETE FROM urls WHERE id = $1;', [id])
    res.sendStatus(201)
}catch (err) {
    res.status(500).send(err.message);
}
}