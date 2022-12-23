import {Router} from "express";
import { getUsersMe, signIn, signUp } from "../controllers/users.controller.js";
import authVerification from "../middlewares/auth.verification.js";
import { signInValidation, signUpValidation } from "../middlewares/users.validation.js";

const router = Router();

router.post("/signup", signUpValidation ,signUp)
router.post("/signin", signInValidation ,signIn)
router.get("/users/me",  getUsersMe)

export default router;