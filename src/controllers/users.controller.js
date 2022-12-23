import { connectionDB } from "../database/db.js";
import bcrypt from "bcryptjs"
import { v4 as uuid } from "uuid";
import { useResolvedPath } from "react-router-dom";

export async function signUp(req, res){
    const {email, name, password} = req.body
    try{
        

        await connectionDB.query('INSERT INTO users (name, email, password) VALUES ($1, $2, $3)', [name, email, bcrypt.hashSync(password, 10)])
     }catch (err) {
         res.status(500).send(err.message);
     }
}


export async function signIn(req, res){
    const {email, password} = req.body
    try{
        const dadosUserPeloEmail = await connectionDB.query('SELECT * FROM users WHERE email = $1', [email]) 

        if (bcrypt.compareSync(password, dadosUserPeloEmail.rows[0].password)) {
            const token = uuid();
            const create_session = await connectionDB.query('INSERT INTO sessions ("userId", token) VALUES ($1, $2);', [dadosUserPeloEmail.rows[0].id, token]) 
      
            res.send({
              token: token,
            });
      
            return;
          }
    }catch (err) {
         res.status(500).send(err.message);
     }
}





export async function getUsersMe(req, res){

    try{
        const { authorization } = req.headers;
        const token = authorization?.replace("Bearer ", "");
        const user = await connectionDB.query('SELECT users.*, sessions.token FROM sessions JOIN users ON users.id = sessions."userId" WHERE token = $1;', [token]);
       const dadosUrls = await connectionDB.query('SELECT urls.*, users.name FROM urls JOIN users ON urls."userId" = users.id WHERE "userId" = $1;', [user.rows[0].id]);
       const contador = await connectionDB.query('SELECT COUNT("linkId") FROM views WHERE "linkId" = 11;')
      
       console.log(dadosUrls.rows)
       
      
       const dadosUser = 
        
             {
                "id": user.rows[0].id ,
                  "name": user.rows[0].name,
                  "visitCount": 30,
                  "shortenedUrls": [
                        dadosUrls.rows.map((item, index) =>{
                            
                            return {
                                "id": item.id,
                                "shortUrl": item.linkShorten,
                                "url": item.link,
                                "visitCount": contador.rows[0].count
                            }
                        })
                  ]
              
            }
        
            res.send(dadosUser)
        
    }catch (err) {
        res.status(500).send(err.message);
    }
}