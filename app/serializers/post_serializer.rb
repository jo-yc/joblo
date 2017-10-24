class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :category, :tag_list, :refined_body, :refined_body_for_home, :refined_date, :main_image_url, :object_show_path

  has_many :images, serializer: PostImageSerializer

  def refined_body
    object.truncate_body
  end

  def refined_body_for_home
    object.truncate_body 200
  end

  def refined_date
    object.refined_date
  end

  def main_image_url
    object.main_image_url
  end

  def object_show_path
    "/posts/#{object.category}/#{object.id}"
  end
end
