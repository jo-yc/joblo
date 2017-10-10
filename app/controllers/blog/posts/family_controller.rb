class Blog::Posts::FamilyController < Blog::BaseController
  before_action :setup_post, except: [:index]

  def index
    @category = :family
  end

  def show; end

  private

  def setup_post
    @post = Post.find params[:id]
  end
end
