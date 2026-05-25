--- 
layout: page
title: Home
id: home
permalink: /
---

{% if site.quotes %}
<section id="weekly-quotes">
<h4>Weekly Quotes</h4>
<div class="quote-box">
{% assign recent_quotes = site.quotes | sort: "date" | reverse %}
{% for quote in recent_quotes limit:2 %}"{{ quote.content | strip | strip_html }}" - {{ quote.author }}{% unless forloop.last %}<br>{% endunless %}{% endfor %}
</div>
</section>
{% endif %}


<p style="padding: 3em 1em; background: transparent; border-radius: 4px;">
  Take a look at <span style="font-weight: bold">[[Your first note]]</span> to get started on your exploration.
</p>


<strong>Recently updated notes</strong>
<ul>
  {% assign all_notes = "" | split: "" %}
  {% for c in site.graph_collections %}
    {% assign all_notes = all_notes | concat: site[c] %}
  {% endfor %}
  {% assign recent_notes = all_notes | sort: "last_modified_at_timestamp" | reverse %}
  {% for note in recent_notes limit: 5 %}
    <li>
      {{ note.last_modified_at | date: "%Y-%m-%d" }} — <a class="internal-link" href="{{ site.baseurl }}{{ note.url }}">{{ note.title }}</a>
    </li>
  {% endfor %}
</ul>

<style>
  .wrapper {
    max-width: 46em;
  }
</style>
