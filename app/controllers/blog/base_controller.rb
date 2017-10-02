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
end
