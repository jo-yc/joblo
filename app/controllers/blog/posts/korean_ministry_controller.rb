class Blog::Posts::KoreanMinistryController < Blog::BaseController
  def index
    @posts = Post.category_on :korean_ministry
  end

  def show
  end
end
