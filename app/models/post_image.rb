# == Schema Information
#
# Table name: post_images
#
#  id         :integer          not null, primary key
#  post_id    :integer
#  image      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PostImage < ApplicationRecord
  belongs_to :post, optional: true
  acts_as_list scope: :post

  mount_uploader :image, ImageUploader
  validates :image, file_size: { less_than_or_equal_to: 10.megabytes }

  before_destroy :remove_cloud_image

  def thumb_url
    image.thumb.url
  end

  private

  def remove_cloud_image
    self.remove_image!
  end
end
