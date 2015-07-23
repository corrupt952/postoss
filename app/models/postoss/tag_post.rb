module Postoss
  class TagPost < ActiveRecord::Base
    belongs_to :post
    belongs_to :tag
  end
end
