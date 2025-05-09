class Program < ApplicationRecord
    has_many :themes, dependent: :destroy
end