class Blog::Posts::DevotionController < Blog::BaseController
  before_action -> { setup_post(:devotion) }, except: :index
  before_action -> { page_name(:post_index) }, only: :index

  def index
    @category = :devotion
  end

  def show; end
end
