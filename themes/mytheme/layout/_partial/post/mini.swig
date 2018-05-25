<article itemscope itemtype="http://schema.org/Article" class="page__mini-article">
    <a itemprop="url" href="{{ url_for(post.path) }}">
      <div class="mini-article__cover">
          {% if not post.cover %}
              <img itemprop="image" src="{{ get_setting('default_cover') }}" alt="{{ post.title }}"/>
          {% endif %}
          {% if post.cover %}
              <img itemprop="image" src="{{ post.cover }}" alt="{{ post.title }}"/>
          {% endif %}
          <div itemprop="datePublished" content="{{ data_xml(post.date || post.update) }}" class="mini-article__date">
              <span class="date__day">{{ date(post.date || post.update, 'D') }}</span>
              {% if config.language == 'zh-cn' %}
                  <span class="date__month">{{ date(post.date || post.update, 'MMMM') }}</span>
              {% else %}
                  <span class="date__month">{{ date(post.date || post.update, 'MMM') }}</span>
              {% endif %}
          </div>
          <span class="iconfont icon-enter"></span>
      </div>
    </a>
    <div class="mini-article__info">
        <h3 itemprop="name" class="mini-article__title">
            <a itemprop="url" href="{{ url_for(post.path) }}" title="{{ post.title }}">{{ post.title }}</a>
        </h3>
        <p itemprop="articleSection" class="min-article__desc">
            {{ post.subtitle }}
        </p>
        <p itemprop="dateSection" class="min-date__desc">
            {{ moment(post.date).format("YYYY-MM-DD HH:mm:ss") }}
        </p>
        <div class="min-article__tags">
            <i class="iconfont icon-tab"></i>
            <ul class="tags__list clearfix">
                {% for tag in post.tags %}
                    <li class="tags__item">
                        <a href="{{ url_for(tag.path) }}">{{ tag.name }}</a>
                    </li>
                {% endfor %}
            </ul>
        </div>
    </div>
</article>
