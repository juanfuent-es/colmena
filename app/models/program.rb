class Program < ApplicationRecord
    has_many :themes, dependent: :destroy
    has_many :visits, as: :visitable, dependent: :destroy
end