class Program < ApplicationRecord
    belongs_to :user
    has_many :themes, dependent: :destroy
    has_many :visits, as: :visitable, dependent: :destroy
    validates :title, presence: true
    validates :year, numericality: { only_integer: true, greater_than_or_equal_to: 2000, less_than_or_equal_to: Date.today.year + 10 }
    validates :number, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end