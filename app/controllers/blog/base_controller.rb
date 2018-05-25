class Blog::BaseController < ApplicationController
  before_action :subdomain_name
  before_action :header_name
  before_action :footer_name

  def subdomain_name
    @subdomain_name = :blog
  end

  def header_name
    @header_name = "common/partials/blog_header"
  end

  def footer_name
    @footer_name = "common/partials/blog_footer"
  end

  def page_name(name)
    @page_name = name
  end

  protected

  def setup_post(category)
    @post = Post.category_on(category).find params[:id]
  end
end
