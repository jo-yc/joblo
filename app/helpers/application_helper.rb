module ApplicationHelper
  def blog_posts_category_index_path(category_name)
    category_name = category_name + "_index" unless category_name == "prayer_requests"
    url_components = []
    url_components << ["blog_posts_#{category_name}", { only_path: true }]
    url_for(url_components.flatten)
  end

  def blog_posts_category_show_path(post, category_name)
    category_name = category_name.chop if category_name == "prayer_requests"
    url_components = []
    url_components << ["blog_posts_#{category_name}", { id: post.id, only_path: true }]
    url_for(url_components.flatten)
  end
end
