module Postoss
  class ThumbnailUploader < CarrierWave::Uploader::Base
    include CarrierWave::RMagick
  
    storage Global.carrierwave.storage.to_sym
  
    def store_dir
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}"
    end

    def filename
      "#{model.unique_id}.#{file.extension}" if original_filename.present?
    end

    version :small do
      process resize_to_limit: [640, 360]
    end
    version :medium do
      process resize_to_limit: [1024, 576]
    end
    version :large do
      process resize_to_limit: [1920, 1080]
    end
    version :masthead do
      process resize_to_fill: [970, 250]
    end
  
    def extension_white_list
      %w(jpg jpeg png)
    end
  end
end
