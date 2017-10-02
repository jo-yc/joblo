class Blog::Posts::DevotionController < Blog::BaseController
  def index
    @posts = Post.category_on :devotion
  end

  def show
  end
end
