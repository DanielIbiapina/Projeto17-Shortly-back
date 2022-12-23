import {Router} from "express";
import { deleteURL, getURLS, postURL, redirectURL } from "../controllers/url.controller.js";
import authVerification from "../middlewares/auth.verification.js";
const router = Router();

router.get("/urls/:id", getURLS)
router.get("/urls/open/:shortUrl", redirectURL)
router.post("/urls/shorten", authVerification,  postURL)
router.delete("/urls/:id", authVerification, deleteURL)


export default router;
