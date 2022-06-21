class Micropost < ApplicationRecord

  belongs_to :user
  has_one_attached :image
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validates :image,
    content_type: {
      in: %w[image/jpeg image/gif image/png],
      message: 'Image must be of format jpeg, gif or png'
    },
    size: {
      less_than: 5.megabytes,
      message: 'Image size must be less than 5MB'
    }

end

