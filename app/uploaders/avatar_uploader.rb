class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  include CarrierWave::ImageOptimizer if Rails.env.production?
  include WebPConverter if Rails.env.production?

  storage :file

  def store_dir
    "images/avatars"
  end

  def extension_allowlist
    %w(webp jpeg gif png jpg)
  end

  def cache_dir
    "#{Rails.root}/tmp/uploads"
  end

  def default_url(*args)
    "/juafuent.es.c-symbol.svg"
  end

  #
  version :large do
    process :convert => "jpg"
    process resize_to_fill: [640, 640]

    def full_filename(for_file = model.source.file)
      "#{model.id}.jpg"
    end
  end

  version :preview_webp, from_version: :large do
    process convert_to_webp: [{ quality: 65, method: 3 }] if Rails.env.production?

    def full_filename(for_file = model.source.file)
      "#{model.id}.webp"
    end
  end

  version :preview, from: :large do
    process resize_to_fill: [240, 240]

    def full_filename(for_file = model.source.file)
      "#{model.id}.preview.jpg"
    end
  end

  version :preview_webp, from_version: :preview do
    process convert_to_webp: [{ quality: 65, method: 3 }] if Rails.env.production?

    def full_filename(for_file = model.source.file)
      "#{model.id}.preview.webp"
    end
  end
end
