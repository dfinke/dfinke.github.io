---
layout: default
title: Archive
permalink: /archive/
---

<section class="magazine-archive-page" aria-labelledby="archive-title">
  <p class="magazine-kicker">Archive</p>
  <h1 id="archive-title">All Posts</h1>
  <ol class="magazine-archive__list">
    {% for post in site.posts %}
    <li>
      <time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%Y.%m.%d" }}</time>
      <a href="{{ post.url | relative_url }}">{{ post.title | escape }}</a>
    </li>
    {% endfor %}
  </ol>
</section>
