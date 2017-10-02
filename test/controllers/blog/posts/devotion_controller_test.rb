require 'test_helper'

class Blog::Posts::DevotionControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get blog_posts_devotion_index_url
    assert_response :success
  end

  test "should get show" do
    get blog_posts_devotion_show_url
    assert_response :success
  end

end
