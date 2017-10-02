require 'test_helper'

class Blog::Posts::FamilyControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get blog_posts_family_index_url
    assert_response :success
  end

  test "should get show" do
    get blog_posts_family_show_url
    assert_response :success
  end

end
