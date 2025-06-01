class Theme < ApplicationRecord
    belongs_to :program
    has_many :topics, dependent: :destroy
    has_many :blocks, as: :blockable, dependent: :destroy
    
    validates :title, presence: true
    
    # Scopes
    scope :ordered, -> { order(created_at: :desc) }
end