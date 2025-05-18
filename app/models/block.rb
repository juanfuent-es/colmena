class Block < ApplicationRecord
  BLOCK_TYPES = {
    img: "Imagen",
    text: "Texto"
  }.freeze

  enum block_type: BLOCK_TYPES.keys
  
  validates :title, presence: true
  validates :number, presence: true
  validates :description, presence: true
  validates :block_type, presence: true, inclusion: { in: block_types.keys }
  # relations  
  belongs_to :topic, optional: false
  belongs_to :image, optional: true

end