class Blog::Posts::TagsController < Blog::BaseController
  def create
    redirect_to blog_posts_tag_path(params[:tag_name])
  end

  def show
    @tag_name = params[:id]
  end
end
