module ApplicationHelper
  def blog_posts_category_index_path(category_name)
    category_name += '_index' unless %w[prayer_requests thoughts].include?(category_name)
    url_components = []
    url_components << ["blog_posts_#{category_name}", { only_path: true }]
    url_for(url_components.flatten)
  end

  def blog_posts_category_show_path(post, category_name)
    # binding.pry_remote
    category_name = category_name.chop if %w[prayer_requests thoughts].include?(category_name)
    url_components = []
    url_components << ["blog_posts_#{category_name}", { id: post.id, only_path: true }]
    url_for(url_components.flatten)
  end

  def main_row_class(page_name)
    case page_name
    when :home
      'multi-columns-row post-columns'
    when :post_index
      'multi-columns-row'
    else
      ''
    end
  end
end
