module Postoss
  class ImageUploader < CarrierWave::Uploader::Base
    include CarrierWave::RMagick

    storage Global.carrierwave.storage.to_sym
  
    def store_dir
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}"
    end

    def filename
      "#{model.unique_id}.#{file.extension}" if original_filename.present?
    end

    version :small do
      process resize_to_limit: [150, 150]
    end
    version :medium do
      process resize_to_limit: [400, 400]
    end
    version :large do
      process resize_to_limit: [1024, 1024]
    end
  
    def extension_white_list
      %w(jpg jpeg png)
    end
  end
end
