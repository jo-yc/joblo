class Blog::Posts::DevotionController < Blog::BaseController
  before_action :setup_post, except: [:index]

  def index
    @posts = Post.category_on :devotion
  end

  def show; end

  private

  def setup_post
    @post = Post.find params[:id]
  end
end
