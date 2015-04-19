require 'global'
require 'bootstrap-sass'
require 'summernote-rails'
require 'font-awesome-rails'
require 'simple_form'
require 'jquery-rails'
require 'kaminari'
require 'carrierwave'
require 'active_hash'

module Postoss
  class Engine < ::Rails::Engine
    isolate_namespace Postoss

    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
