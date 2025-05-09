class Theme < ApplicationRecord
    belongs_to :program
    has_many :topics, dependent: :destroy
end