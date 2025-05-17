class ImageUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::MiniMagick
  include CarrierWave::RMagick
  include CarrierWave::ImageOptimizer

  storage :file

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "/pdf/#{model.id}"
  end

  def default_url
    "/static/img-not-found.png"
  end
  
  version :large do
    process convert: :jpg
    process resize_to_fit: [1920, 1920]
    process optimize: [{ quality: 85, quiet: true }]
    def full_filename (for_file = model.source.file)
      "#{model.id}-lg.jpg"
    end
  end

  version :medium, from_version: :large do
    process resize_to_fit: [1280, 1280]
    process optimize: [{ quality: 85, quiet: true }]
    def full_filename (for_file = model.source.file)
      "#{model.id}-md.jpg"
    end
  end

  version :thumb, from_version: :mobile do 
    process resize_to_limit: [800, 420]
    process optimize: [{ quality: 85, quiet: true }]
    def full_filename (for_file = model.source.file)
      "#{model.id}-sm.jpg"
    end
  end

end