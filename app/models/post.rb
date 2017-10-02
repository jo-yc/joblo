# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  category   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  include AASM

  belongs_to :main_image, class_name: "PostImage", foreign_key: "main_image_id", optional: true
  has_many :images, class_name: "PostImage", foreign_key: "post_id", dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  scope :on_posting, -> { where(aasm_state: :posting).order(id: :desc)}
  scope :latest, -> { order(id: :desc).limit(10) }
  scope :category_on, ->(category) { where(category: category) }

  enum category: { prayer_requests: 0, drama_team: 1, korean_ministry: 2, devotion: 3, family: 4, daily_life: 5 }

  aasm do
    state :draft, initial: true
    state :posting

    event :posting do
      transitions from: [:draft], to: :posting
    end

    event :undo do
      transitions from: [:posting], to: :draft
    end
  end

  class << self
    def posts_count(category)
      category_num = case category
                     when "prayer_requests"
                       0
                     when "drama_team"
                       1
                     when "korean_ministry"
                       2
                     when "devotion"
                       3
                     when "family"
                       4
                     when "daily_life"
                       5
                     else
                       5
                     end
      Post.category_on(category_num).on_posting.count
    end
  end

  def images_build
    images.build
  end

  def refined_date
    created_at.strftime("%b %d, %Y")
  end

  def remove_images(ids)
    self.images.find(ids).map{ |img| img.destroy! }
  end

  def main_image_url
    main_image.present? ? main_image.image_url : ""
  end
end
