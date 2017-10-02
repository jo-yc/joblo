class Blog::Posts::DramaTeamController < Blog::BaseController
  def index
    @posts = Post.category_on :drama_team
  end

  def show
  end
end
