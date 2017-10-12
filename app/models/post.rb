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
  has_many :images, -> { order(position: :asc) }, class_name: "PostImage", foreign_key: "post_id", dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  scope :on_posting, -> { where(aasm_state: :posting).order(id: :desc)}
  scope :latest, -> { on_posting.limit(4) }
  scope :category_on, ->(category) { on_posting.where(category: category) }

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
      Post.category_on(category).on_posting.count
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

  def truncate_body(max=500)
    self.body.length > max ? "#{self.body[0...max]}..." : self.body
  end

  def truncate_title(max=25)
    self.title.length > max ? "#{self.title[0...max]}..." : self.title
  end
end
