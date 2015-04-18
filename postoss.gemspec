$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "postoss/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "postoss"
  s.version     = Postoss::VERSION
  s.authors     = ["Kazuki Hasegawa"]
  s.email       = ["hasegawa@khasegawa.net"]
  s.homepage    = "https://github.com/corrupt952/postoss"
  s.summary     = "TODO: Summary of Postoss."
  s.description = "TODO: Description of Postoss."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'rails', '~> 4.2.1'
  s.add_dependency 'jquery-rails'
  s.add_dependency 'coffee-rails'
  s.add_dependency 'therubyracer'
  s.add_dependency 'sass-rails'
  s.add_dependency 'bootstrap-sass'
  s.add_dependency 'summernote-rails'
  s.add_dependency 'font-awesome-rails'
  s.add_dependency 'kaminari'
  s.add_dependency 'simple_form'
  s.add_dependency 'carrierwave'
  s.add_dependency 'rmagick'
  s.add_dependency 'fog-aws'
  s.add_dependency 'global'

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'pry-rails'
end
