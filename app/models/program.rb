class Program < ApplicationRecord
    belongs_to :user
    has_many :themes, dependent: :destroy
    has_many :visits, as: :visitable, dependent: :destroy
    validates :title, presence: true

end