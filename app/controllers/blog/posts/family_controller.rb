class Blog::Posts::FamilyController < Blog::BaseController
  before_action -> { setup_post(:family) }, except: :index
  before_action -> { page_name(:post_index) }, only: :index

  def index
    @category = :family
  end

  def show; end
end
