require 'test_helper'

class Blog::Posts::DramaTeamControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get blog_posts_drama_team_index_url
    assert_response :success
  end

  test "should get show" do
    get blog_posts_drama_team_show_url
    assert_response :success
  end

end
