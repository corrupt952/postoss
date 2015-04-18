module Postoss
  class Post < ActiveRecord::Base
    belongs_to :category

    mount_uploader :thumbnail, Postoss::ThumbnailUploader

    before_validation :set_unique_id!

    validates :unique_id, presence: true, uniqueness: true, length: { maximum: 16 }
    validates :category_id, presence: true
    validates :title, presence: true, length: { maximum: 255 }
    validates :body, presence: true

    delegate :name, to: :category, prefix: true

    private

    def set_unique_id!
      return if self.unique_id.present?
      loop do
        self.unique_id = SecureRandom.hex(8)
        break unless self.class.exists?(unique_id: self.unique_id)
      end
    end
  end
end
