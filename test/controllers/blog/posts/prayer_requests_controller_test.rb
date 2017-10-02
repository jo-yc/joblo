require 'test_helper'

class Blog::Posts::PrayerRequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get blog_posts_prayer_requests_index_url
    assert_response :success
  end

  test "should get show" do
    get blog_posts_prayer_requests_show_url
    assert_response :success
  end

end
