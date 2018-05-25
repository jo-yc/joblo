class Blog::Posts::DramaTeamController < Blog::BaseController
  before_action -> { setup_post(:drama_team) }, except: :index
  before_action -> { page_name(:post_index) }, only: :index

  def index
    @category = :drama_team
  end

  def show; end
end
