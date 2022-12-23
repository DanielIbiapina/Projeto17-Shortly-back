import express from 'express';
import cors from 'cors';
import urlRoutes from "./routes/url.routes.js"
import usersRoutes from "./routes/users.routes.js"
import rankingRoutes from "./routes/ranking.routes.js"

const app = express();
app.use(express.json());
app.use(cors());
app.use(urlRoutes);
app.use(usersRoutes);
app.use(rankingRoutes);

const port = process.env.PORT || 4000;
app.listen(port, () => console.log(`Server running in port ${port}`));