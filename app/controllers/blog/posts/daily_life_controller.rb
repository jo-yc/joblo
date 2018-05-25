class Blog::Posts::DailyLifeController < Blog::BaseController
  before_action -> { setup_post(:daily_life) }, except: :index
  before_action -> { page_name(:post_index) }, only: :index

  def index
    @category = :daily_life
  end

  def show; end
end
