class Blog::Posts::PrayerRequestsController < Blog::BaseController
  before_action :setup_post, except: [:index]
  def index
    @posts = Post.category_on :prayer_requests
  end

  def show; end

  private

  def setup_post
    @post = Post.find params[:id]
  end
end
