class PostImageSerializer < ActiveModel::Serializer
  attributes :id, :image_url, :thumb_url, :main_image, :image_id

  def image_url
    object.image_url
  end

  def thumb_url
    object.thumb_url
  end

  def main_image
    object.id == object.post.main_image.id
  end

  def image_id
    object.id == object.post.main_image.id ? "main-image" : ""
  end
end
