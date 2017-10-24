module Admin::Blog::PostsHelper
  def refined_tag_list(post)
    post.tag_list.present? ? post.tag_list.map { |tag| "##{tag}" }.to_s.delete("\"|,|[|]") : ""
  end
end
