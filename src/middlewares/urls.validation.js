import { connectionDB } from "../database/db.js";
import { urlSchema } from "../schemas/urls.schema.js";


export async function postUrlValidation(req, res, next) {
    try {
      
      const { error, value } = urlSchema.validate(req.body);
  
      if (error !== undefined) {
        res.sendStatus(400);
        return;
      }
  
     
      next();
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  }