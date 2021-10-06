class Movie < ApplicationRecord
  # relation
  belongs_to :user

  # validation 
  has_one_attached :image
  validates :user_id, presence: true
  validates :memo, length: { maximum: 255 }
  validates :only_user_id, presence: true
  validate :validate_image

  def resize_image
    return self.image.variant(resize: '150x150').processed
  end

  private
    def only_user_id
      time.presence or memo.presence or image.attached?
    end

    def validate_image
      if image.attached?
        if !image.content_type.in?(%('image/jpeg image/jpg image/png image/gif'))
          errors.add(:image, 'はjpeg, jpg, png, gif以外の投稿ができません')
        elsif image.blob.byte_size > 5.megabytes
          errors.add(:image, "のサイズが5MBを超えています")
        end
      end
    end
end
