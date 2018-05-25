class Blog::Posts::KoreanMinistryController < Blog::BaseController
  before_action -> { setup_post(:korean_ministry) }, except: :index
  before_action -> { page_name(:post_index) }, only: :index

  def index
    @category = :korean_ministry
  end

  def show; end
end
