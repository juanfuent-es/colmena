class Block < ApplicationRecord
  BLOCK_TYPES = {
    img: "Imagen",
    text: "Texto",
    code: "Código"
  }.freeze

  enum block_type: BLOCK_TYPES.keys
  
  validates :title, presence: true
  validates :block_type, presence: true, inclusion: { in: block_types.keys }
  validates :language, presence: true, if: :code?

  # Polymorphic association
  belongs_to :page
  belongs_to :image, optional: true

  # Scopes
  scope :ordered, -> { order(position: :asc) }
  
  # Callbacks
  before_validation :set_default_position, on: :create
  
  private

  def set_default_position
    return if position.present?
    max_position = page.blocks.maximum(:position) || 0
    self.position = max_position + 1
  end
end