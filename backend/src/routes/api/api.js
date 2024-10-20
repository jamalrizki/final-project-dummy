import express from "express";

const router = express.Router();

// import child routes
import tempRoutes from "./api-temp.js";
router.use("/messages", tempRoutes);

import articleRoutes from './articles.js';
router.use("/articles", articleRoutes)

export default router;
