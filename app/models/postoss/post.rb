module Postoss
  class Post < ActiveRecord::Base
    extend ActiveHash::Associations::ActiveRecordExtensions

    has_many :tag_posts, inverse_of: :post
    has_many :tags, through: :tag_posts
    belongs_to :category

    belongs_to_active_hash :status, class_name: Postoss::Status.name

    mount_uploader :thumbnail, Postoss::ThumbnailUploader

    before_validation :set_unique_id!
    before_validation :set_published_date!

    validates :unique_id, presence: true, uniqueness: true, length: { maximum: 16 }
    validates :category_id, presence: true
    validates :status_id, presence: true, inclusion: { in: Postoss::Status.all.map(&:id) }
    validates :title, presence: true, length: { maximum: 255 }
    validates :body, presence: true

    delegate :name, to: :category, prefix: true
    delegate :name, to: :status, prefix: true

    scope :published, -> do
      where(status_id: Postoss::Status::PUBLISHED.id)
    end

    scope :draft, -> do
      where(status_id: Postoss::Status::DRAFT.id)
    end

    def published?
      status == Postoss::Status::PUBLISHED
    end

    def draft?
      status == Postoss::Status::DRAFT
    end

    private

    def set_unique_id!
      return if self.unique_id.present?
      loop do
        self.unique_id = SecureRandom.hex(8)
        break unless self.class.exists?(unique_id: self.unique_id)
      end
    end

    def set_published_date!
      self.published_date ||= Date.current if published? && published_date.blank?
    end
  end
end
