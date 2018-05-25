class Blog::Posts::DailyLifeController < Blog::BaseController
  before_action -> { setup_post(:thoughts) }, except: :index
  before_action -> { page_name(:post_index) }, only: :index

  def index
    @category = :thoughts
  end

  def show; end
end
