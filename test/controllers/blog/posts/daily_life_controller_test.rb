require 'test_helper'

class Blog::Posts::DailyLifeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get blog_posts_daily_life_index_url
    assert_response :success
  end

  test "should get show" do
    get blog_posts_daily_life_show_url
    assert_response :success
  end

end
