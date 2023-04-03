---
title: Home
permalink: /
layout: page
---

{% for post in site.posts %}
  <article class="post-item row mb-5">
    {% if post.image.feature %}
      <div class="post-item--image">
        <a href="{{ site.url }}{{ post.url }}" title="{{ post.title }}"><img src="{{ site.url }}/images/{{ post.image.feature }}" alt="{{ post.title }}"></a>
      </div>
    {% endif %}
    <div class="post-item--meta">
      <span class="post-item--date date badge text-bg-secondary">
        <time datetime="{{ post.date | date_to_xmlschema }}">
          {{ post.date | date: "%B %d, %Y" }}
        </time>
      </span>
      <span class="author vcard">
        <span class="fn">
          <a href="{{ site.url }}/about/" title="About {{ site.owner.name }}">{{ site.owner.name }}</a>
        </span>
      </span>
    </div>

    <a href="{{ site.url }}{{ post.url }}" class="text-decoration-none h3" title="{{ post.title }}">
      {{ post.title }}
    </a>

    {% if post.description %}
      <p class="post-item--description text-muted">
        {{ post.description }}
      </p>
    {% endif %}
  </article>
{% endfor %}
