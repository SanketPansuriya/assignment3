class Book < ApplicationRecord
  belongs_to :auther
  has_many_attached :cover_photos do |attachable|
    attachable.variant :thumb, resize_to_limit: [150, 150]
    attachable.variant :medium, resize_to_limit: [350, 350]
  end
  validate :acceptable_image
  validates :cover_photos, aspect_ratio: :square

  private
  def acceptable_image
    return unless cover_photos.attached?
    cover_photos.each do |cover_photo|
      unless cover_photo.byte_size <= 1.megabyte
        errors.add(:cover_photos, "is greater then 1MB")
      end

      acceptable_types = ["image/png"]
      unless acceptable_types.include?(cover_photo.content_type)
        errors.add(:cover_photos, "must be a PNG")
      end  
    end
  end
end
