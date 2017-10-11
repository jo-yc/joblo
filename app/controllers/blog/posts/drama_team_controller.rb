class Blog::Posts::DramaTeamController < Blog::BaseController
  before_action :setup_post, except: [:index]

  def index
    @category = :drama_team
  end

  def show; end

  private

  def setup_post
    @post = Post.find params[:id]
  end
end
