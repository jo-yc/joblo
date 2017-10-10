class Blog::Posts::KoreanMinistryController < Blog::BaseController
  before_action :setup_post, except: [:index]

  def index
    @category = :korean_ministry
  end

  def show; end

  private

  def setup_post
    @post = Post.find params[:id]
  end
end
