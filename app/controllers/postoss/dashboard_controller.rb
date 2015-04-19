module Postoss
  class DashboardController < Postoss::ApplicationController
    def index
      @categories = Category
        .preload(:posts)
    end
  end
end
