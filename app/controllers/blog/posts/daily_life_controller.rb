class Blog::Posts::DailyLifeController < Blog::BaseController
  before_action :setup_post, except: [:index]

  def index
    @category = :daily_life
  end

  def show; end

  private

  def setup_post
    @post = Post.find params[:id]
  end
end
