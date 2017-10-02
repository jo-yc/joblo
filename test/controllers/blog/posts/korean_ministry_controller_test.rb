require 'test_helper'

class Blog::Posts::KoreanMinistryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get blog_posts_korean_ministry_index_url
    assert_response :success
  end

  test "should get show" do
    get blog_posts_korean_ministry_show_url
    assert_response :success
  end

end
