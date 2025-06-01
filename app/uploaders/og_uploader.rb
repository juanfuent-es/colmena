class OgUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "#{model.category.pluralize}/og"
  end

  def filename
    "#{model.id}.png" if original_filename.present?
  end

  def default_url(*args)
    "/static/share-default.png"
  end

  def cache_dir
    "#{Rails.root}/tmp/uploads"
  end
  
  def extension_allowlist
    %w(jpg jpeg gif png)
  end

end