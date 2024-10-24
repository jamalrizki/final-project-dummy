

<script>
  import ArticleCard from '$lib/components/ArticleCard.svelte';
  import MessageView from "$lib/components/MessageView.svelte";
  export let data;
  $: articles = data.articles || [];
  $: userArticles = data.isLoggedIn ? articles.filter(article => article.userId === data.user.id) : [];
  $: otherArticles = data.isLoggedIn ? articles.filter(article => article.userId !== data.user.id) : articles;
  $: featuredArticle = otherArticles.length > 0 ? otherArticles[Math.floor(Math.random() * otherArticles.length)] : null;
  $: displayArticles = featuredArticle ? otherArticles.filter(article => article.id !== featuredArticle.id) : otherArticles;
</script>

<svelte:head>
  <title>Travel Blog</title>
</svelte:head>

<main>
  {#if data.isLoggedIn}
    <div class="welcome">
      <h1>Welcome back, {data.user.firstName}!</h1>
      <div class="info">
        <img src={data.user.selectedAvatar}  class="avatar"/>
        <div class="details">
          <p class="username">@{data.user.username}</p>
          <p class="blurb">{data.user.blurb}</p>
        </div>
      </div>
      
      {#if userArticles.length > 0}
        <section class="articles">
          <h2>My Travel Stories</h2>
          <div class="grid">
            {#each userArticles as article (article.id)}
              <ArticleCard {article} />
            {/each}
          </div>
        </section>
      {/if}
      
      <div class="actions">
        <a href="/create" class="article-btn">Write New Travel Article</a>
      </div>
    </div>
  {/if}

  <section class="all-articles">
    <h2>{data.isLoggedIn ? 'Explore Other Travel Stories' : 'Explore Travel Stories'}</h2>
    
    {#if articles.length === 0}
      <p>Loading articles...</p>
    {:else}
      {#if featuredArticle}
        <section class="featured">
          <ArticleCard article={featuredArticle} featured={true} />
        </section>
      {/if}

      <section class="article-grid">
        {#each displayArticles as article (article.id)}
          <ArticleCard {article} />
        {/each}
      </section>
    {/if}
  </section>
</main>

<style>
  main {
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
  }

  .welcome {
    margin-bottom: 40px;
    padding: 20px;
    background-color: #f8f9fa;
    border-radius: 8px;
  }

  h1 {
    margin: 0 0 20px 0;
    color: #333;
  }

  h2 {
    margin: 20px 0;
    color: #444;
  }

  .info {
    display: flex;
    align-items: center;
    margin-bottom: 20px;
  }

  .avatar {
    width: 60px;
    height: 60px;
    border-radius: 50%;
    margin-right: 15px;
  }

  .details {
    flex: 1;
  }

  .username {
    font-weight: bold;
    color: #666;
    margin: 0;
  }

  .blurb {
    color: #777;
    margin: 5px 0 0 0;
  }

  .actions {
    margin: 20px 0;
  }

  .article-btn {
    display: inline-block;
    padding: 10px 20px;
    background-color: #007bff;
    color: white;
    text-decoration: none;
    border-radius: 4px;
    transition: background-color 0.2s;
  }

  .article-btn:hover {
    background-color: #0056b3;
  }

  .articles {
    margin: 30px 0;
  }

  .featured {
    margin-bottom: 40px;
  }

  .article-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
    gap: 24px;
    margin-top: 24px;
  }

  .all-articles {
    margin-top: 40px;
  }
</style>