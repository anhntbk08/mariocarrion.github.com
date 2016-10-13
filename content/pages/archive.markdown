---
layout: default
title: Archive
url: /archive.html
---

<div id="home">
  <h2><i class="icon-bookmark"></i>Archive<h2>

  {% for post in site.posts %}
    {% unless post.next %}
      <h3><a name="{{ post.date | date: '%Y' }}">{{ post.date | date: '%Y' }}</a></h3>
      <ul class="posts">
    {% else %}
      {% capture year %}{{ post.date | date: '%Y' }}{% endcapture %}
      {% capture nyear %}{{ post.next.date | date: '%Y' }}{% endcapture %}
      {% if year != nyear %}
	</ul>
	<h3><a name="{{ post.date | date: '%Y' }}">{{ post.date | date: '%Y' }}</a></h3>
	<ul class="posts">
      {% endif %}
    {% endunless %}

    <li>
      <span>{{ post.date | date: '%b %d, %Y' }}</span> <a href="{{ post.url }}">{{ post.title }}</a>
    </li>
  {% endfor %}

</div>
