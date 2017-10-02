require 'test_helper'

class Blog::HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get blog_home_index_url
    assert_response :success
  end

end
