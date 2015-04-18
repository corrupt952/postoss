module Postoss
  class Category < ActiveRecord::Base
    has_many :posts

    validates :name, presence: true, uniqueness: true
    validates :slug, presence: true, uniqueness: true, format: { with: Global.regexp.slug }
    validates :use_layout, presence: true
  end
end
