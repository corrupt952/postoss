module Postoss
  class DashboardController < ApplicationController
    def index
      @categories = Category
        .preload(:posts)
    end
  end
end
