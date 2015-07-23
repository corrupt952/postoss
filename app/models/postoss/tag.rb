module Postoss
  class Tag < ActiveRecord::Base
    has_many :tag_posts, inverse_of: :tag
    has_many :posts, through: :tag_posts
  end
end
