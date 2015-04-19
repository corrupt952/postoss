module Postoss
  class Status < ActiveYaml::Base
    include ActiveHash::Enum
  
    set_root_path Postoss::Engine.root.join('config/active_hash')
    set_filename 'status'
  
    enum_accessor :state
  end
end
