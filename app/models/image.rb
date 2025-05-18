class Image < ApplicationRecord
  has_many :blocks, dependent: :nullify
  # uploaders
  mount_uploader :file, ImageUploader
end