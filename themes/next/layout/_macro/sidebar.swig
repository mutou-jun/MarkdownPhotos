{% macro render(is_post) %}
<script async src="https://dn-lbstatics.qbox.me/busuanzi/2.3/busuanzi.pure.mini.js"></script>
  <div class="sidebar-toggle">
    <div class="sidebar-toggle-line-wrap">
      <span class="sidebar-toggle-line sidebar-toggle-line-first"></span>
      <span class="sidebar-toggle-line sidebar-toggle-line-middle"></span>
      <span class="sidebar-toggle-line sidebar-toggle-line-last"></span>
    </div>
  </div>

  <aside id="sidebar" class="sidebar">
    <div class="sidebar-inner">

      {% set display_toc = is_post and theme.toc.enable %}

      {% if display_toc %}
        <ul class="sidebar-nav motion-element">
          <li class="sidebar-nav-toc sidebar-nav-active" data-target="post-toc-wrap" >
            {{ __('sidebar.toc') }}
          </li>
          <li class="sidebar-nav-overview" data-target="site-overview">
            {{ __('sidebar.overview') }}
          </li>
        </ul>
      {% endif %}

      <section class="site-overview sidebar-panel {% if not display_toc %} sidebar-panel-active {% endif %}">
        <div class="site-author motion-element" itemprop="author" itemscope itemtype="http://schema.org/Person">
          <img class="site-author-image" itemprop="image"
               src="{{ url_for( theme.avatar | default(theme.images + '/avatar.gif') ) }}"
               alt="{{ theme.author }}" />
          <p class="site-author-name" itemprop="name">{{ theme.author }}</p>
          <p class="site-description motion-element" itemprop="description">{{ theme.description }}</p>
        </div>
        <nav class="site-state motion-element">
          <div class="site-state-item site-state-posts">
            <a href="{{ url_for(theme.menu.archives) }}">
              <span class="site-state-item-count">{{ site.posts.length }}</span>
              <span class="site-state-item-name">{{ __('state.posts') }}</span>
            </a>
          </div>

          {% if site.categories.length > 0 %}
            <div class="site-state-item site-state-categories">
              {% if theme.menu.categories %}<a href="{{ url_for(theme.menu.categories) }}">{% endif %}
                <span class="site-state-item-count">{{ site.categories.length }}</span>
                <span class="site-state-item-name">{{ __('state.categories') }}</span>
              {% if theme.menu.categories %}</a>{% endif %}
            </div>
          {% endif %}

          {% if site.tags.length > 0 %}
            <div class="site-state-item site-state-tags">
              {% if theme.menu.tags %}<a href="{{ url_for(theme.menu.tags) }}">{% endif %}
                <span class="site-state-item-count">{{ site.tags.length }}</span>
                <span class="site-state-item-name">{{ __('state.tags') }}</span>
              {% if theme.menu.tags %}</a>{% endif %}
            </div>
          {% endif %}
		  <br>
		  <span id="busuanzi_container_site_uv">
			<b><span id="busuanzi_value_site_uv"></span></b><br>
			<span class="site-state-item-name">{{ __('访客') }}</span>
			</span>


        </nav>

        {% if theme.rss %}
          <div class="feed-link motion-element">
            <a href="{{ url_for(theme.rss) }}" rel="alternate">
              <i class="fa fa-rss"></i>
              RSS
            </a>
          </div>
        {% endif %}
		
		<iframe frameborder="no" border="0" marginwidth="0" marginheight="0" width=330 height=86 src="//music.163.com/outchain/player?type=2&id=33911781&auto=0&height=66"></iframe>
		
		<br>
		<div align="left" font-family: "Arial","Microsoft YaHei","黑体","宋体",sans-serif>
		<b><h1>个人简介</h1></b>
		<p >姓名：木头<br>
		性别：x<br>
		星座：xxx<br>
		爱好：xxxx<br>
		主要奖项： xxx</p>
		</div>
		<br>

        <div class="links-of-author motion-element">
          {% if theme.social %}
            {% for name, link in theme.social %}
              <span class="links-of-author-item">
                <a href="{{ link }}" target="_blank" title="{{ name }}">
                  {% if theme.social_icons.enable %}
                    <i class="fa fa-fw fa-{{ theme.social_icons[name] | default('globe') | lower }}"></i>
                  {% endif %}
                  {{ name }}
                </a>
              </span>
            {% endfor %}
          {% endif %}
        </div>

        {% set cc = {'by': 1, 'by-nc': 1, 'by-nc-nd': 1, 'by-nc-sa': 1, 'by-nd': 1, 'by-sa': 1, 'zero': 1} %}
        {% if theme.creative_commons in cc %}
          <div class="cc-license motion-element" itemprop="license">
            <a href="http://creativecommons.org/licenses/{{ theme.creative_commons }}/4.0" class="cc-opacity" target="_blank">
              <img src="{{ url_for(theme.images) }}/cc-{{ theme.creative_commons }}.svg" alt="Creative Commons" />
            </a>
          </div>
        {% endif %}

        {# Blogroll #}
        {% if theme.links %}
          <div class="links-of-blogroll motion-element {{ "links-of-blogroll-" + theme.links_layout | default('inline') }}">
            <div class="links-of-blogroll-title">
              <i class="fa  fa-fw fa-{{ theme.links_icon | default('globe') | lower }}"></i>
              {{ theme.links_title }}
            </div>
            <ul class="links-of-blogroll-list">
              {% for name, link in theme.links %}
                <li class="links-of-blogroll-item">
                  <a href="{{ link }}" title="{{ name }}" target="_blank">{{ name }}</a>
                </li>
              {% endfor %}
            </ul>
          </div>
        {% endif %}

      </section>

      {% if display_toc %}
        <section class="post-toc-wrap motion-element sidebar-panel sidebar-panel-active">
          <div class="post-toc">
            {% if page.toc_number === undefine %}
              {% set toc = toc(page.content, { "class": "nav", list_number: theme.toc.number }) %}
            {% else %}
              {% set toc = toc(page.content, {"class": "nav", list_number: page.toc_number}) %}
            {% endif %}
            {% if toc.length <= 1 %}
              <p class="post-toc-empty">{{ __('post.toc_empty') }}</p>
            {% else %}
              <div class="post-toc-content">{{ toc }}</div>
            {% endif %}
          </div>
        </section>
      {% endif %}

    </div>
  </aside>
{% endmacro %}
