import { getDatabase } from "./database.js";

export async function getArticles() {
  const db = await getDatabase();
  const articles = await db.all("SELECT * FROM Articles");
  return articles;
}

export async function addArticles(article) {
  const db = await getDatabase();
  const response = await db.run(
    "INSERT INTO Articles (title, description, content, image, userId, username, userAvatar, date) VALUES (?, ?, ?, ?, ?, ?, ?, ?)",
    [
      article.title, 
      article.description, 
      article.content, 
      article.image,
      article.userId,
      article.username,
      article.userAvatar,
      article.date
    ]
  );
  return {
    id: response.lastID,
    title: article.title,
    description: article.description,
    content: article.content,
    image: article.image,
    userId: article.userId,
    username: article.username,
    userAvatar: article.userAvatar,
    date: article.date
  };
}

export async function getArticleById(id) {
  const db = await getDatabase();
  const article = await db.get("SELECT * FROM Articles WHERE id = ?", id);
  return article;
}