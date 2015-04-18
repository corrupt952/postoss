Global.configure do |config|
  config.environment = Rails.env
  config.config_directory  = Postoss::Engine.root.join('config', 'global')
end
