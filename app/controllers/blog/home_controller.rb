class Blog::HomeController < Blog::BaseController
  def index
    @posts = Post.on_posting.latest
  end
end
