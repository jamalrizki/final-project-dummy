import express from "express";
import { getArticles, addArticles, getArticleById} from "../../data/articles-dao.js";

const router = express.Router();

router.get("/", async (req, res) => {
  const articles = await getArticles();

  const callCountCookie = req.cookies.callCount;
  const callCount = callCountCookie ? parseInt(callCountCookie) + 1 : 1;

  return res.cookie("callCount", callCount.toString(), { httpOnly: true }).json(articles);
});

router.post("/", async (req, res) => {
  const { article } = req.body;
  const dbMessage = await addArticles(article);
  return res.status(201).location(`/api/articles/${article.id}`).json(dbMessage);
})

router.get("/:id", async (req, res) => {
    const articleId = req.params.id;
      const article = await getArticleById(articleId);
      if (article) {
        res.json(article);
      } else {
        return res.sendStatus(404);
      }
  });

export default router;