class Blog::Posts::PrayerRequestsController < Blog::BaseController
  before_action -> { setup_post(:prayer_requests) }, except: :index
  before_action -> { page_name(:post_index) }, only: :index

  def index
    @category = :prayer_requests
  end

  def show; end
end
