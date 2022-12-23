import { connectionDB } from "../database/db.js";

export default async function authVerification(req, res, next) {
    try {
      const { authorization } = req.headers;
      const token = authorization?.replace("Bearer ", "");
      console.log(token)

      if (!token) {
        return res.sendStatus(401);
      }
      
      const userSession = await connectionDB.query('SELECT * FROM sessions WHERE token = $1;', [token]);
  
      
  
     console.log(userSession.rows[0].userId)
      next();
    } catch (error) {
      console.log(error.message);
      res.sendStatus(500);
    }
  }