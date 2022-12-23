import { connectionDB } from "../database/db.js";
import { signInSchema, signUpSchema } from "../schemas/users.schema.js";


export async function signUpValidation(req, res, next) {
  try {
    
    const { error, value } = signUpSchema.validate(req.body);

    if (error !== undefined) {
      res.sendStatus(400);
      return;
    }

    
    const emailExiste = await connectionDB.query(
        "SELECT id FROM users WHERE email=$1",
        [email]
      );
      console.log(emailExiste.rowCount)
      if(emailExiste.rowCount > 0){
        res.status(409).send("Esse usuário já existe!")
        return
      }

   
    next();
  } catch (err) {
    console.log(err);
    res.sendStatus(500);
  }
}

export async function signInValidation(req, res, next) {
    try {
      
      const { error, value } = signInSchema.validate(req.body);
  
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