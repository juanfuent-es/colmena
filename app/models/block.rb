class Block < ApplicationRecord
  BLOCK_TYPES = %w[text image]

  belongs_to :topic

  validates :title, presence: true
  validates :number, presence: true
  validates :description, presence: true

  validates :block_type, presence: true, inclusion: { in: BLOCK_TYPES }

  def block_types
    BLOCK_TYPES
  end

end