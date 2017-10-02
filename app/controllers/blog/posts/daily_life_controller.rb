class Blog::Posts::DailyLifeController < Blog::BaseController
  def index
    @posts = Post.category_on :daily_life
  end

  def show
  end
end
