module Postoss
  class Image < ActiveRecord::Base
    mount_uploader :file, Postoss::ImageUploader

    before_validation :set_unique_id!

    validates :file, presence: true

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
