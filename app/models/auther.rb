class Auther < ApplicationRecord
  has_one_attached :profile_picture do |attachable|
    attachable.variant :thumb, resize_to_limit: [150, 150]
    attachable.variant :medium, resize_to_limit: [350, 350]
  end
  validate :acceptable_image
  validates :profile_picture, aspect_ratio: :square

  private
  def acceptable_image
    return unless profile_picture.attached?

    unless profile_picture.byte_size <= 1.megabyte
      errors.add(:profile_picture, "is greater then 1MB")
    end

    acceptable_types = ["image/png"]
    unless acceptable_types.include?(profile_picture.content_type)
      errors.add(:profile_picture, "must be a PNG")
    end  
  end
end
